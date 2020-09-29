/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK
import SwiftCOM
import ArgumentParser
import Foundation

private func LoadTypeLibEx(_ path: String, _ regkind: REGKIND)
    throws -> SwiftCOM.ITypeLib {
  var pointer: UnsafeMutablePointer<WinSDK.ITypeLib>?
  let hr: HRESULT = path.withCString(encodedAs: UTF16.self) {
    LoadTypeLibEx($0, regkind, &pointer)
  }
  guard hr == S_OK else { throw COMError(hr: hr) }
  return SwiftCOM.ITypeLib(pUnk: pointer)
}

extension _GUID {
  fileprivate var uuidString: String {
    return String(format: "%08x-%04x-%04x-%02x%02x%02x%02x%02x%02x%02x%02x",
                  self.Data1, self.Data2, self.Data3, self.Data4.0,
                  self.Data4.1, self.Data4.2, self.Data4.3, self.Data4.4,
                  self.Data4.5, self.Data4.6, self.Data4.7)
  }
}

#if false
extension TYPEDESC {
  fileprivate var string: String {
    switch VARENUM(CInt(self.vt)) {
    case VT_BSTR: return "BSTR"
    case VT_VARIANT: return "X"
    case VT_UNKNOWN: return "IUnknown"
    case VT_I4: return "DWORD"
    case VT_UI1: return "CHAR"
    case VT_UI2: return "SHORT"
    case VT_UI4: return "DWORD"
    case VT_INT: return "INT"
    case VT_UINT: return "UINT"
    case VT_VOID: return "VOID"
    case VT_HRESULT: return "HRESULT"
    case VT_PTR: return "\(self.lptdesc.pointee.string) *"
    case VT_USERDEFINED: return "?"
    case VT_LPWSTR: return "LPWSTR"
    default: fatalError("unhandled type \(self.vt)")
    }
  }
}
#endif

private struct Interface {
  let name: String
  let iid: IID
  var interfaces: [String]
  var functions: [(String, [(Direction, String, TYPEDESC)])]
}

extension Interface: CustomStringConvertible {
  private func describe(argument: (Direction, String, TYPEDESC)) -> String {
    return """
    /*__\(argument.0)*/ _ \(argument.1): ?
    """
  }

  private func describe(function: (String, [(Direction, String, TYPEDESC)])) -> String {
    return """
      public func \(function.0)(\(function.1.map(self.describe(argument:)).joined(separator: ", "))) throws {
        guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
          throw COMError(hr: E_INVALIDARG)
        }
        let pThis = pUnk.bindMemory(to: WinSDK.\(self.name).self, capacity: 1)

        let hr: HRESULT =
            pThis.pointee.lpVtbl.pointee.\(function.0)(pThis, \(function.1.map { $0.1 }.joined(separator: ", ")))
        guard hr == S_OK else { throw COMError(hr: hr) }
      }
    """
  }

  fileprivate var description: String {
    return """
    public class \(self.name): \(interfaces.joined(separator: ", ")) {
      override public class var IID: IID { \(self.iid) }

    \(functions.map(self.describe(function:)).joined(separator: "\n\n"))
    }
    """
  }
}

private enum Direction {
case `in`, out, `inout`
}

extension PARAMDESC {
  fileprivate var direction: Direction {
    if self.wParamFlags & USHORT(PARAMFLAG_FIN | PARAMFLAG_FOUT) == USHORT(PARAMFLAG_FIN | PARAMFLAG_FOUT) {
      return .inout
    }
    if self.wParamFlags & USHORT(PARAMFLAG_FIN) == USHORT(PARAMFLAG_FIN) {
      return .in
    }
    if self.wParamFlags & USHORT(PARAMFLAG_FOUT) == USHORT(PARAMFLAG_FOUT) {
      return .out
    }
    fatalError("unable to map wParamFlags: 0x\(String(self.wParamFlags, radix: 16))")
  }
}

private func process(interface typeinfo: SwiftCOM.ITypeInfo,
                     _ typeattr: UnsafeMutablePointer<TYPEATTR>,
                     _ typedocs: (name: String, docstring: String,
                                  help: (context: DWORD, file: String))) -> Interface? {
  let name: String = typedocs.name
  let iid: IID = typeattr.pointee.guid
  var interfaces: [String] = []
  var functions: [(String, [(Direction, String, TYPEDESC)])] = []

  for interface in 0 ..< typeattr.pointee.cImplTypes {
    guard let hRefType = try? typeinfo.GetRefTypeOfImplType(UINT(interface)),
        let tiType = try? typeinfo.GetRefTypeInfo(hRefType),
        let docs = try? tiType.GetDocumentation(MEMBERID_NIL) else {
      print("unable to reflect '\(typedocs.name)' interface \(interface)")
      return nil
    }
    interfaces.append(docs.name)
  }

  for function in 0 ..< typeattr.pointee.cFuncs {
    guard let funcdesc = try? typeinfo.GetFuncDesc(UINT(function)) else {
      print("unable to reflect '\(typedocs.name)' function \(function)'")
      return nil
    }
    defer { do { try? typeinfo.ReleaseFuncDesc(funcdesc) } }

    guard let docs = try? typeinfo.GetDocumentation(funcdesc.pointee.memid) else {
      print("unable to reflect '\(typedocs.name)' function \(function)")
      return nil
    }

    let name: String = docs.name
    var arguments: [(Direction, String, TYPEDESC)] = []

    guard let names: [String] =
        try? typeinfo.GetNames(funcdesc.pointee.memid,
                               count: UINT(funcdesc.pointee.cParams)) else {
      print("unable to reflect '\(typedocs.name)' function \(function) parameters")
      return nil
    }
    for parameter in 0 ..< Int(funcdesc.pointee.cParams) {
      let elemdesc = funcdesc.pointee.lprgelemdescParam[parameter]

      let direction = elemdesc.paramdesc.direction
      let name: String = names[parameter + 1]
      let type = elemdesc.tdesc

      arguments.append((direction, name, type))
    }

    functions.append((name, arguments))
  }

  return Interface(name: name, iid: iid, interfaces: interfaces, functions: functions)
}

@main
struct TLBGen: ParsableCommand {
  @Argument
  var tlb: String

  func run() {
    guard let tlb = try? LoadTypeLibEx(self.tlb, REGKIND_NONE) else {
      print("unable to load typelib '\(self.tlb)'")
      return
    }

    guard let entries = try? tlb.GetTypeInfoCount() else {
      print("unable to process typelib '\(self.tlb)'")
      return
    }

    for entry in 0 ..< entries {
      guard let typeinfo = try? tlb.GetTypeInfo(entry) else { continue }

      guard let typeattr = try? typeinfo.GetTypeAttr() else { continue }
      defer { do { try? typeinfo.ReleaseTypeAttr(typeattr) } }

      guard let typedocs = try? typeinfo.GetDocumentation(MEMBERID_NIL) else {
        continue
      }

      switch typeattr.pointee.typekind {
      case TKIND_ENUM:    // enum
        continue

      case TKIND_RECORD:  // struct
        continue

      case TKIND_MODULE:  //
        print("module \(typedocs.name)")

      case TKIND_INTERFACE:
        if let interface = process(interface: typeinfo, typeattr, typedocs) {
          print(interface)
        }

      case TKIND_DISPATCH:
        print("dispatch \(typedocs.name)")

      case TKIND_COCLASS:
        print("coclass \(typedocs.name)")

      case TKIND_ALIAS:   // typedef
        continue

      case TKIND_UNION:   // union
        continue

      case TKIND_MAX: fallthrough
      default:
        fatalError("invalid type kind '\(typeattr.pointee.typekind)'")
      }
    }
  }
}

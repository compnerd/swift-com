/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

open class ITypeLib: IUnknown {
  public override class var IID: IID { IID_ITypeLib }

  /// Provides the number of type descriptions that are in a type library.
  public func GetTypeInfoCount() throws -> UINT {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ITypeLib.self, capacity: 1)

    return pThis.pointee.lpVtbl.pointee.GetTypeInfoCount(pThis)
  }

  /// Retrieves the specified type description in the library.
  public func GetTypeInfo(_ index: UINT) throws -> ITypeInfo {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ITypeLib.self, capacity: 1)

    var info: UnsafeMutablePointer<WinSDK.ITypeInfo>?
    let hr: HRESULT =
       pThis.pointee.lpVtbl.pointee.GetTypeInfo(pThis, index, &info)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return ITypeInfo(pUnk: info)
  }

  /// Retrieves the type of a type description.
  public func GetTypeInfoType(_ index: UINT) throws -> TYPEKIND {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ITypeLib.self, capacity: 1)

    var kind: TYPEKIND = TKIND_MAX
    let hr: HRESULT =
       pThis.pointee.lpVtbl.pointee.GetTypeInfoType(pThis, index, &kind)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return kind
  }

  /// Retrieves the type description that corresponds to the specified GUID.
  public func GetTypeInfoOfGuid(_ guid: GUID) throws -> ITypeInfo {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ITypeLib.self, capacity: 1)

    var guid: GUID = guid
    var pTinfo: UnsafeMutablePointer<WinSDK.ITypeInfo>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetTypeInfoOfGuid(pThis, &guid, &pTinfo)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return ITypeInfo(pUnk: pTinfo)
  }

  /// Retrieves the structure that contains the library's attributes.
  public func GetLibAttr() throws -> UnsafeMutablePointer<TLIBATTR> {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ITypeLib.self, capacity: 1)

    var pTLibAttr: UnsafeMutablePointer<TLIBATTR>?
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetLibAttr(pThis, &pTLibAttr)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return pTLibAttr!
  }

  /// Enables a client compiler to bind to the types, variables, constants, and
  /// global functions for a library.
  public func GetTypeComp() throws -> ITypeComp {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ITypeLib.self, capacity: 1)

    var pTComp: UnsafeMutablePointer<WinSDK.ITypeComp>?
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetTypeComp(pThis, &pTComp)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return ITypeComp(pUnk: pTComp)
  }

  /// Retrieves the documentation string for the library, the complete Help file
  /// name and path, and the context identifier for the library Help topic in
  /// the Help file.
  public func GetDocumentation(_ index: INT)
      throws -> (name: String, docstring: String,
                 help: (context: DWORD, file: String)) {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ITypeLib.self, capacity: 1)

    var bstrName: BSTR!
    var bstrDocString: BSTR!
    var dwHelpContext: DWORD = DWORD.max
    var bstrHelpFile: BSTR!

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee
        .GetDocumentation(pThis, index, &bstrName, &bstrDocString,
                          &dwHelpContext, &bstrHelpFile)
    guard hr == S_OK else { throw COMError(hr: hr) }
    defer {
      SysFreeString(bstrName)
      SysFreeString(bstrDocString)
      SysFreeString(bstrHelpFile)
    }
    return (name: String(from: bstrName), docstring: String(from: bstrDocString),
            help: (context: dwHelpContext, file: String(from: bstrHelpFile)))
  }

  /// Indicates whether a passed-in string contains the name of a type or member
  /// described in the library.
  public func IsName(_ name: String, _ hash: ULONG) throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ITypeLib.self, capacity: 1)

    var szNameBuf: [OLECHAR] = Array<OLECHAR>(from: name)
    var fName: WindowsBool = false
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.IsName(pThis, &szNameBuf, hash, &fName)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return fName == true
  }

  /// Finds occurrences of a type description in a type library.  This may be
  /// used to quickly verify that a name exists in a type library.
  public func FindName(_ name: String, _ lHashVal: ULONG = 0)
      throws -> [(ITypeInfo, MEMBERID)] {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ITypeLib.self, capacity: 1)

    var szNameBuf: [OLECHAR] = Array<OLECHAR>(from: name)
    var pTInfo: [UnsafeMutablePointer<WinSDK.ITypeInfo>?] = []
    var rgMemId: [MEMBERID] = []
    var cFound: USHORT = 0
    var hr: HRESULT = S_OK

    hr = pThis.pointee.lpVtbl.pointee.FindName(pThis, &szNameBuf, lHashVal,
                                               &pTInfo, &rgMemId, &cFound)
    guard hr == S_OK else { throw COMError(hr: hr) }

    pTInfo = Array<UnsafeMutablePointer<WinSDK.ITypeInfo>?>(repeating: nil,
                                                            count: Int(cFound))
    rgMemId = Array<MEMBERID>(repeating: MEMBERID_NIL, count: Int(cFound))

    hr = pThis.pointee.lpVtbl.pointee.FindName(pThis, &szNameBuf, lHashVal,
                                               &pTInfo, &rgMemId, &cFound)
    guard hr == S_OK else { throw COMError(hr: hr) }

    return (0 ..< cFound).map {
      (ITypeInfo(pUnk: pTInfo[Int($0)]), rgMemId[Int($0)])
    }
  }

  /// Releases the TLIBATTR originally obtained from `GetLibAttr`.
  public func ReleaseTLibAttr(_ pTLibAttr: UnsafeMutablePointer<TLIBATTR>)
      throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ITypeLib.self, capacity: 1)

    pThis.pointee.lpVtbl.pointee.ReleaseTLibAttr(pThis, pTLibAttr)
  }
}

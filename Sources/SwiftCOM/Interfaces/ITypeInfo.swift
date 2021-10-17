// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

open class ITypeInfo: IUnknown {
  public override class var IID: IID { IID_ITypeInfo }

  // TODO(compnerd) create a managed copy of TYPEATTR
  /// Retrieves a `TYPEATTR` structure that contains the attributes of the type
  /// description.
  public func GetTypeAttr() throws -> UnsafeMutablePointer<TYPEATTR>? {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var pTypeAttr: UnsafeMutablePointer<TYPEATTR>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetTypeAttr(pThis, &pTypeAttr))
      return pTypeAttr
    }
  }

  /// Retrieves the ITypeComp interface for the type description, which enables a
  /// client compiler to bind to the type description's members.
  public func GetTypeComp() throws -> ITypeComp {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var pTComp: UnsafeMutablePointer<WinSDK.ITypeComp>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetTypeComp(pThis, &pTComp))
      return ITypeComp(pUnk: pTComp)
    }
  }

  // TODO(compnerd) create a managed copy of FUNCDESC
  /// Retrieves the `FUNCDESC` structure that contains information about a
  /// specified function.
  public func GetFuncDesc(_ index: UINT) throws -> UnsafeMutablePointer<FUNCDESC>?{
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var pFuncDesc: UnsafeMutablePointer<FUNCDESC>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetFuncDesc(pThis, index, &pFuncDesc))
      return pFuncDesc
    }
  }

  // TODO(compnerd) create a managed copy of VARDESC
  /// Retrieves a `VARDESC` structure that describes the specified variable.
  public func GetVarDesc(_ index: UINT) throws -> UnsafeMutablePointer<VARDESC>? {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var pVarDesc: UnsafeMutablePointer<VARDESC>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetVarDesc(pThis, index, &pVarDesc))
      return pVarDesc
    }
  }

  /// Retrieves the variable with the specified member ID or the name of the
  /// property or method and the parameters that correspond to the specified
  /// function ID.
  public func GetNames(_ member: MEMBERID, count cMaxNames: UINT)
      throws -> [String] {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      let rgBstrNames: UnsafeMutablePointer<BSTR?> =
          UnsafeMutablePointer.allocate(capacity: Int(cMaxNames) + 1)
      defer { rgBstrNames.deallocate() }

      var cNames: UINT = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetNames(pThis, member, rgBstrNames, cMaxNames + 1, &cNames))

      var names: [String] = Array<String>()
      names.reserveCapacity(Int(cNames))
      for i in 0 ..< cNames {
        names.append(String(from: rgBstrNames[Int(i)]!))
      }
      return names
    }
  }

  /// If a type description describes a COM class, it retrieves the type
  /// description of the implemented interface types. For an interface,
  /// GetRefTypeOfImplType returns the type information for inherited interfaces,
  /// if any exist.
  public func GetRefTypeOfImplType(_ index: UINT) throws -> HREFTYPE {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var pRefType: HREFTYPE = HREFTYPE()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetRefTypeOfImplType(pThis, index, &pRefType))
      return pRefType
    }
  }

  /// Retrieves the `IMPLTYPEFLAGS` enumeration for one implemented interface or
  /// base interface in a type description.
  public func GetImplTypeFlags(_ index: UINT) throws -> INT {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var ImplTypeFlags: INT = INT()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetImplTypeFlags(pThis, index, &ImplTypeFlags))
      return ImplTypeFlags
    }
  }

  /// Maps between member names and member IDs, and parameter names and parameter
  /// IDs.
  public func GetIDsOfNames(_ names: [String]) throws -> [MEMBERID] {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var rgszNames: [LPOLESTR?] = names.map {
        $0.withCString(encodedAs: UTF16.self, _wcsdup)
      }
      defer { rgszNames.forEach { free($0) } }

      var MemId: [MEMBERID] =
          Array<MEMBERID>(repeating: MEMBERID_NIL, count: names.count)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetIDsOfNames(pThis, &rgszNames, UINT(names.count), &MemId))
      return MemId
    }
  }

  public func Invoke(_ pInstance: UnsafeMutableRawPointer, _ member: MEMBERID,
                     _ wFlags: WORD, _ pDispParams: inout [DISPPARAMS])
      throws -> (result: VARIANT, exception: EXCEPINFO, error: UINT) {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var VarResult: VARIANT = VARIANT()
      var ExcepInfo: EXCEPINFO = EXCEPINFO()
      var uArgError: UINT = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.Invoke(pThis, pInstance, member, wFlags, &pDispParams, &VarResult, &ExcepInfo, &uArgError))
      return (result: VarResult, exception: ExcepInfo, error: uArgError)
    }
  }

  /// Retrieves the documentation string, the complete Help file name and path,
  /// and the context ID for the Help topic for a specified type description.
  public func GetDocumentation(_ member: MEMBERID)
      throws -> (name: String, docstring: String,
                 help: (context: DWORD, file: String)) {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var bstrName: BSTR?
      var bstrDocString: BSTR?
      var dwHelpContext: DWORD = DWORD.max
      var bstrHelpFile: BSTR?

      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDocumentation(pThis, member, &bstrName, &bstrDocString, &dwHelpContext, &bstrHelpFile))
      defer {
        SysFreeString(bstrName)
        SysFreeString(bstrDocString)
        SysFreeString(bstrHelpFile)
      }
      return (name: bstrName == nil ? "" : String(from: bstrName!),
              docstring: bstrDocString == nil ? "" : String(from: bstrDocString!),
              help: (context: dwHelpContext,
                     file: bstrHelpFile == nil ? "" : String(from: bstrHelpFile!)))
    }
  }

  /// Retrieves a description or specification of an entry point for a function
  /// in a DLL.
  public func GetDllEntry(_ member: MEMBERID, _ invocation: INVOKEKIND)
      throws -> (dll: String, entry: String, ordinal: WORD) {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var BstrDllName: BSTR?
      var BstrName: BSTR?
      var wOrdianal: WORD = 0

      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDllEntry(pThis, member, invocation, &BstrDllName, &BstrName, &wOrdianal))
      defer {
        SysFreeString(BstrDllName)
        SysFreeString(BstrName)
      }
      return (dll: String(from: BstrDllName!), entry: String(from: BstrName!),
              ordinal: wOrdianal)
    }
  }

  /// If a type description references other type descriptions, it retrieves the
  /// referenced type descriptions.
  public func GetRefTypeInfo(_ hRefType: HREFTYPE) throws -> ITypeInfo {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var pTInfo: UnsafeMutablePointer<WinSDK.ITypeInfo>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetRefTypeInfo(pThis, hRefType, &pTInfo))
      return ITypeInfo(pUnk: pTInfo)
    }
  }

  /// Retrieves the addresses of static functions or variables, such as those
  /// defined in a DLL.
  public func AddressOfMember(_ member: MEMBERID, _ invocation: INVOKEKIND)
      throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var pMember: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.AddressOfMember(pThis, member, invocation, &pMember))
      return pMember
    }
  }

  /// Creates a new instance of a type that describes a component object class
  /// (coclass).
  public func CreateInstance(_ pUnkOuter: IUnknown, _ riid: REFIID)
      throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var pvObj: PVOID?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateInstance(pThis, RawPointer(pUnkOuter), riid, &pvObj))
      return pvObj
    }
  }

  /// Retrieves marshaling information.
  public func GetMops(_ member: MEMBERID) throws -> String {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var BstrMops: BSTR?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetMops(pThis, member, &BstrMops))
      defer { SysFreeString(BstrMops) }

      return BstrMops == nil ? "" : String(from: BstrMops!)
    }
  }

  /// Retrieves the containing type library and the index of the type description
  /// within that type library.
  public func GetContainingTypeLib() throws -> (typelib: ITypeLib, index: UINT) {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      var pTLib: UnsafeMutablePointer<WinSDK.ITypeLib>?
      var Index: UINT = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetContainingTypeLib(pThis, &pTLib, &Index))
      return (typelib: ITypeLib(pUnk: pTLib), index: Index)
    }
  }

  /// Releases a `TYPEATTR` previously returned by `GetTypeAttr`.
  public func ReleaseTypeAttr(_ pTypeAttr: UnsafeMutablePointer<TYPEATTR>) throws {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ReleaseTypeAttr(pThis, pTypeAttr)
    }
  }

  /// Releases a `FUNCDESC` previously returned by `GetFuncDesc`.
  public func ReleaseFuncDesc(_ pFuncDesc: UnsafeMutablePointer<FUNCDESC>) throws {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ReleaseFuncDesc(pThis, pFuncDesc)
    }
  }

  /// Releases a `VARDESC` previously returned by `GetVarDesc`.
  public func ReleaseVarDesc(_ pVarDesc: UnsafeMutablePointer<VARDESC>) throws {
    return try perform(as: WinSDK.ITypeInfo.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ReleaseVarDesc(pThis, pVarDesc)
    }
  }
}

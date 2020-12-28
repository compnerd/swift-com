/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

/// Provides a fast way to access information that compilers need when binding to
/// and instantiating structures and interfaces. Binding is the process of
/// mapping names to types and type members.
open class ITypeComp: IUnknown {
  public override class var IID: IID { IID_ITypeComp }

  /// Maps a name to a member of a type, or binds global variables and functions
  /// contained in a type library.
  public func Bind(_ name: String, _ lHashVal: ULONG, _ wFlags: WORD)
      throws -> (ITypeInfo, DESCKIND, BINDPTR) {
    return try perform(as: WinSDK.ITypeComp.self) { pThis in
      var szName: [OLECHAR] = Array<OLECHAR>(from: name)
      var pTInfo: UnsafeMutablePointer<WinSDK.ITypeInfo>?
      var DescKind: DESCKIND = DESCKIND_MAX
      var BindPtr: BINDPTR = BINDPTR()
      try CHECKED(pThis.pointee.lpVtbl.pointee.Bind(pThis, &szName, lHashVal, wFlags, &pTInfo, &DescKind, &BindPtr))
      return (ITypeInfo(pUnk: pTInfo), DescKind, BindPtr)
    }
  }

  /// Binds to the type descriptions contained within a type library.
  public func BindType(_ name: String, lHashVal: ULONG)
      throws -> (ITypeInfo, ITypeComp) {
    return try perform(as: WinSDK.ITypeComp.self) { pThis in
      var szName: [OLECHAR] = Array<OLECHAR>(from: name)
      var pTInfo: UnsafeMutablePointer<WinSDK.ITypeInfo>?
      var pTComp: UnsafeMutablePointer<WinSDK.ITypeComp>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.BindType(pThis, &szName, lHashVal, &pTInfo, &pTComp))
      return (ITypeInfo(pUnk: pTInfo), ITypeComp(pUnk: pTComp))
    }
  }
}

/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IBindCtx: IUnknown {
  override public class var IID: IID { IID_IBindCtx }

  public func EnumObjectParam() throws -> IEnumString {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      var penum: UnsafeMutablePointer<WinSDK.IEnumString>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.EnumObjectParam(pThis, &penum))
      return IEnumString(pUnk: penum)
    }
  }

  public func GetBindOptions() throws -> BIND_OPTS {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      var bindopts: BIND_OPTS = BIND_OPTS()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetBindOptions(pThis, &bindopts))
      return bindopts
    }
  }

  public func GetObjectParam(_ pszKey: String) throws -> IUnknown {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      var pUnk: UnsafeMutablePointer<WinSDK.IUnknown>?
      var key: [OLECHAR] = pszKey.wide
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetObjectParam(pThis, &key, &pUnk))
      return IUnknown(pUnk: pUnk)
    }
  }

  public func GetRunningObjectTable() throws -> IRunningObjectTable {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      var prot: UnsafeMutablePointer<WinSDK.IRunningObjectTable>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetRunningObjectTable(pThis, &prot))
      return IRunningObjectTable(pUnk: prot)
    }
  }

  public func RegisterObjectBound(_ pUnk: IUnknown) throws {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterObjectBound(pThis, RawPointer(pUnk)))
    }
  }

  public func RegisterObjectParam(_ pszKey: String, _ pUnk: IUnknown)
      throws {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      var key: [OLECHAR] = pszKey.wide
      try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterObjectParam(pThis, &key, RawPointer(pUnk)))
    }
  }

  public func ReleaseBoundObjects() throws {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ReleaseBoundObjects(pThis))
    }
  }

  public func RevokeObjectBound(_ pUnk: IUnknown) throws {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.RevokeObjectBound(pThis, RawPointer(pUnk)))
    }
  }

  public func RevokeObjectParam(_ pszKey: String) throws {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      var key: [OLECHAR] = pszKey.wide
      try CHECKED(pThis.pointee.lpVtbl.pointee.RevokeObjectParam(pThis, &key))
    }
  }

  public func SetBindOptions(_ pbindopts: inout BIND_OPTS) throws {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetBindOptions(pThis, &pbindopts))
    }
  }
}

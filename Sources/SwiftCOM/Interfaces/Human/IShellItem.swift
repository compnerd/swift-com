/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IShellItem: IUnknown {
  override public class var IID: IID { IID_IShellItem }

  public func BindToHandler(_ pbc: IBindCtx, _ bhid: inout GUID,
                            _ riid: inout IID) throws -> IUnknown {
    return try perform(as: WinSDK.IShellItem.self) { pThis in
      var pv: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.BindToHandler(pThis, RawPointer(pbc), &bhid, &riid, &pv))
      return IUnknown(pUnk: pv)
    }
  }

  public func Compare(_ psi: IShellItem, _ hint: SICHINTF) throws -> CInt {
    return try perform(as: WinSDK.IShellItem.self) { pThis in
      var iOrder: CInt = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.Compare(pThis, RawPointer(psi), hint, &iOrder))
      return iOrder
    }
  }

  public func GetAttributes(_ sfgaoMask: SFGAOF) throws -> SFGAOF {
    return try perform(as: WinSDK.IShellItem.self) { pThis in
      var sfgaoAttribs: SFGAOF = SFGAOF()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetAttributes(pThis, sfgaoMask, &sfgaoAttribs))
      return sfgaoAttribs
    }
  }

  public func GetDisplayName(_ sigdnName: SIGDN) throws -> String {
    return try perform(as: WinSDK.IShellItem.self) { pThis in
      var pszName: LPWSTR?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDisplayName(pThis, sigdnName, &pszName))
      defer { CoTaskMemFree(pszName) }
      return String(decodingCString: pszName!, as: UTF16.self)
    }
  }

  public func GetParent() throws -> IShellItem {
    return try perform(as: WinSDK.IShellItem.self) { pThis in
      var psi: UnsafeMutablePointer<WinSDK.IShellItem>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetParent(pThis, &psi))
      return IShellItem(pUnk: psi)
    }
  }
}

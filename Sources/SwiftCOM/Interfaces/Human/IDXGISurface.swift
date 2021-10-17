// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGISurface: IDXGIDeviceSubObject {
  override public class var IID: IID { IID_IDXGISurface }

  public func GetDesc() throws -> DXGI_SURFACE_DESC {
    return try perform(as: WinSDK.IDXGISurface.self) { pThis in
      var Desc: DXGI_SURFACE_DESC = DXGI_SURFACE_DESC()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDesc(pThis, &Desc))
      return Desc
    }
  }

  public func Map(_ pLockedRect: UnsafeMutablePointer<DXGI_MAPPED_RECT>?, _ MapFlags: UINT) throws {
    return try perform(as: WinSDK.IDXGISurface.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Map(pThis, pLockedRect, MapFlags))
    }
  }

  public func Unmap() throws {
    return try perform(as: WinSDK.IDXGISurface.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Unmap(pThis))
    }
  }
}

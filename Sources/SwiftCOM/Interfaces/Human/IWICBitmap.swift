// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IWICBitmap: IWICBitmapSource {
  override public class var IID: IID { IID_IWICBitmap }

  public func Lock(_ rcLock: WICRect, _ flags: DWORD) throws -> IWICBitmapLock {
    return try perform(as: WinSDK.IWICBitmap.self) { pThis in
      var rcLock = rcLock
      var pILock: UnsafeMutablePointer<WinSDK.IWICBitmapLock>?
      try CHECKED {
        withUnsafePointer(to: &rcLock) {
          pThis.pointee.lpVtbl.pointee.Lock(pThis, $0, flags, &pILock)
        }
      }
      return IWICBitmapLock(pUnk: pILock)
    }
  }

  public func SetPalette(_ pIPalette: IWICPalette) throws {
    return try perform(as: WinSDK.IWICBitmap.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetPalette(pThis, RawPointer(pIPalette)))
    }
  }

  public func SetResolution(_ dpiX: Double, _ dpiY: Double) throws {
    return try perform(as: WinSDK.IWICBitmap.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetResolution(pThis, dpiX, dpiY))
    }
  }
}

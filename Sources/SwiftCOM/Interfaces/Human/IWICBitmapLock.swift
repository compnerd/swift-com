// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IWICBitmapLock: IUnknown {
  override public class var IID: IID { IID_IWICBitmapLock }

  public func GetDataPointer() throws -> [BYTE] {
    return try perform(as: WinSDK.IWICBitmapLock.self) { pThis in
      var cbBufferSize: UINT = UINT(0)
      var pbData: WICInProcPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDataPointer(pThis, &cbBufferSize, &pbData))
      return Array<BYTE>(UnsafeBufferPointer<BYTE>(start: pbData,
                                                  count: Int(cbBufferSize)))
    }
  }

  public func GetPixelFormat() throws -> WICPixelFormatGUID {
    return try perform(as: WinSDK.IWICBitmapLock.self) { pThis in
      var PixelFormat: WICPixelFormatGUID = WICPixelFormatGUID()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetPixelFormat(pThis, &PixelFormat))
      return PixelFormat
    }
  }

  public func GetSize() throws -> (UINT, UINT) {
    return try perform(as: WinSDK.IWICBitmapLock.self) { pThis in
      var uiWidth: UINT = UINT(0)
      var uiHeight: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSize(pThis, &uiWidth, &uiHeight))
      return (uiWidth, uiHeight)
    }
  }

  public func GetStride() throws -> UINT {
    return try perform(as: WinSDK.IWICBitmapLock.self) { pThis in
      var cbStride: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetStride(pThis, &cbStride))
      return cbStride
    }
  }
}

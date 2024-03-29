// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IWICBitmapSource: IUnknown {
  override public class var IID: IID { IID_IWICBitmapSource }

  public func CopyPalette(_ pIPalette: IWICPalette) throws {
    return try perform(as: WinSDK.IWICBitmapSource.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.CopyPalette(pThis, RawPointer(pIPalette)))
    }
  }

  public func CopyPixels(_ rc: WICRect?, _ cbStride: UINT,
                         _ pbBuffer: UnsafeMutableBufferPointer<BYTE>) throws {
    return try perform(as: WinSDK.IWICBitmapSource.self) { pThis in
      if var rc = rc {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CopyPixels(pThis, &rc, cbStride, UINT(pbBuffer.count), pbBuffer.baseAddress))
      } else {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CopyPixels(pThis, nil, cbStride, UINT(pbBuffer.count), pbBuffer.baseAddress))
      }
    }
  }

  public func GetPixelFormat() throws -> WICPixelFormatGUID {
    return try perform(as: WinSDK.IWICBitmapSource.self) { pThis in
      var PixelFormat: WICPixelFormatGUID = WICPixelFormatGUID()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetPixelFormat(pThis, &PixelFormat))
      return PixelFormat
    }
  }

  public func GetResolution() throws -> (Double, Double) {
    return try perform(as: WinSDK.IWICBitmapSource.self) { pThis in
      var DpiX: Double = 0.0
      var DpiY: Double = 0.0
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetResolution(pThis, &DpiX, &DpiY))
      return (DpiX, DpiY)
    }
  }

  public func GetSize() throws -> (UINT, UINT) {
    return try perform(as: WinSDK.IWICBitmapSource.self) { pThis in
      var uiWidth: UINT = UINT(0)
      var uiHeight: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSize(pThis, &uiWidth, &uiHeight))
      return (uiWidth, uiHeight)
    }
  }
}

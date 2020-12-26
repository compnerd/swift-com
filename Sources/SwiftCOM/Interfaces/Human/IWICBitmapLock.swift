/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICBitmapLock: IUnknown {
  override public class var IID: IID { IID_IWICBitmapLock }

  public func GetDataPointer() throws -> [BYTE] {
    return try perform(as: WinSDK.IWICBitmapLock.self) { pThis in
      var cbBufferSize: UINT = UINT(0)
      var pbData: WICInProcPointer?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetDataPointer(pThis, &cbBufferSize,
                                                      &pbData)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return Array<BYTE>(UnsafeBufferPointer<BYTE>(start: pbData,
                                                  count: Int(cbBufferSize)))
    }
  }

  public func GetPixelFormat() throws -> WICPixelFormatGUID {
    return try perform(as: WinSDK.IWICBitmapLock.self) { pThis in
      var PixelFormat: WICPixelFormatGUID = WICPixelFormatGUID()
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetPixelFormat(pThis, &PixelFormat)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return PixelFormat
    }
  }

  public func GetSize() throws -> (UINT, UINT) {
    return try perform(as: WinSDK.IWICBitmapLock.self) { pThis in
      var uiWidth: UINT = UINT(0)
      var uiHeight: UINT = UINT(0)
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetSize(pThis, &uiWidth, &uiHeight)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return (uiWidth, uiHeight)
    }
  }

  public func GetStride() throws -> UINT {
    return try perform(as: WinSDK.IWICBitmapLock.self) { pThis in
      var cbStride: UINT = UINT(0)
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetStride(pThis, &cbStride)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return cbStride
    }
  }
}

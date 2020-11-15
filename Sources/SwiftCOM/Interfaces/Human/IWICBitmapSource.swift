/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICBitmapSource: IUnknown {
  override public class var IID: IID { IID_IWICBitmapSource }

  public func CopyPalette(_ pIPalette: IWICPalette) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapSource.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CopyPalette(pThis, RawPointer(pIPalette))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func CopyPixels(_ rc: WICRect?, _ cbStride: UINT,
                         _ pbBuffer: UnsafeMutableBufferPointer<BYTE>) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapSource.self, capacity: 1)

    let hr: HRESULT
    if var rc = rc {
      hr = pThis.pointee.lpVtbl.pointee.CopyPixels(pThis, &rc, cbStride,
                                                   UINT(pbBuffer.count),
                                                   pbBuffer.baseAddress)
    } else {
      hr = pThis.pointee.lpVtbl.pointee.CopyPixels(pThis, nil, cbStride,
                                                   UINT(pbBuffer.count),
                                                   pbBuffer.baseAddress)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func GetPixelFormat() throws -> WICPixelFormatGUID {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapSource.self, capacity: 1)

    var PixelFormat: WICPixelFormatGUID = WICPixelFormatGUID()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetPixelFormat(pThis, &PixelFormat)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return PixelFormat
  }

  public func GetResolution() throws -> (Double, Double) {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapSource.self, capacity: 1)

    var DpiX: Double = 0.0
    var DpiY: Double = 0.0
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetResolution(pThis, &DpiX, &DpiY)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return (DpiX, DpiY)
  }

  public func GetSize() throws -> (UINT, UINT) {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapSource.self, capacity: 1)

    var uiWidth: UINT = UINT(0)
    var uiHeight: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetSize(pThis, &uiWidth, &uiHeight)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return (uiWidth, uiHeight)
  }
}

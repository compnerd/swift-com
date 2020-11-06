/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICFormatConverter: IWICBitmapSource {
  override public class var IID: IID { IID_IWICFormatConverter }

  public func CanConvert(_ srcPixelFormat: REFWICPixelFormatGUID,
                         _ dstPixelFormat: REFWICPixelFormatGUID)
      throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICFormatConverter.self, capacity: 1)

    var fCanConvert: WindowsBool = false
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CanConvert(pThis, srcPixelFormat,
                                                dstPixelFormat,
                                                &fCanConvert)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return fCanConvert == true
  }

  public func Initialize(_ pISource: IWICBitmapSource,
                         _ dstFormat: REFWICPixelFormatGUID,
                         _ dither: WICBitmapDitherType,
                         _ pIPalette: IWICPalette?,
                         _ alphaThresholdPercent: Double,
                         _ paletteTranslate: WICBitmapPaletteType) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICFormatConverter.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Initialize(pThis, RawPointer(pISource),
                                                dstFormat, dither,
                                                RawPointer(pIPalette),
                                                alphaThresholdPercent,
                                                paletteTranslate)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

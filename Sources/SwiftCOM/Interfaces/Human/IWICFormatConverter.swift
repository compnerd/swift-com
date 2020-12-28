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
    return try perform(as: WinSDK.IWICFormatConverter.self) { pThis in
      var fCanConvert: WindowsBool = false
      try CHECKED(pThis.pointee.lpVtbl.pointee.CanConvert(pThis, srcPixelFormat, dstPixelFormat, &fCanConvert))
      return fCanConvert == true
    }
  }

  public func Initialize(_ pISource: IWICBitmapSource,
                         _ dstFormat: REFWICPixelFormatGUID,
                         _ dither: WICBitmapDitherType,
                         _ pIPalette: IWICPalette?,
                         _ alphaThresholdPercent: Double,
                         _ paletteTranslate: WICBitmapPaletteType) throws {
    return try perform(as: WinSDK.IWICFormatConverter.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Initialize(pThis, RawPointer(pISource), dstFormat, dither, RawPointer(pIPalette), alphaThresholdPercent, paletteTranslate))
    }
  }
}

extension IWICFormatConverter {
  public func Initialize(_ pISource: IWICBitmapSource,
                         _ dstFormat: WICPixelFormatGUID,
                         _ dither: WICBitmapDitherType,
                         _ pIPalette: IWICPalette?,
                         _ alphaThresholdPercent: Double,
                         _ paletteTranslate: WICBitmapPaletteType) throws {
    var dstFormat = dstFormat
    return try Initialize(pISource, &dstFormat, dither, pIPalette,
                          alphaThresholdPercent, paletteTranslate)
  }
}

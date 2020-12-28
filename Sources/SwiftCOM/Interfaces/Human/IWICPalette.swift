/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICPalette: IUnknown {
  override public class var IID: IID { IID_IWICPalette }

  public func GetColorCount() throws -> UINT {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      var cCount: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetColorCount(pThis, &cCount))
      return cCount
    }
  }

  public func GetColors() throws -> [WICColor] {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      let cCount: UINT = try GetColorCount()
      return try Array<WICColor>(unsafeUninitializedCapacity: Int(cCount)) {
        var cActualColors: UINT = UINT(0)
        try CHECKED(pThis.pointee.lpVtbl.pointee.GetColors(pThis, cCount, $0.baseAddress, &cActualColors))
        $1 = Int(cActualColors)
      }
    }
  }

  public func GetType() throws -> WICBitmapPaletteType {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      var ePaletteType: WICBitmapPaletteType = WICBitmapPaletteType(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetType(pThis, &ePaletteType))
      return ePaletteType
    }
  }

  public func HasAlpha() throws -> Bool {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      var fHasAlpha: WindowsBool = false
      try CHECKED(pThis.pointee.lpVtbl.pointee.HasAlpha(pThis, &fHasAlpha))
      return fHasAlpha == true
    }
  }

  public func InitializeCustom(_ pColors: [WICColor]) throws {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      var pColors: [WICColor] = pColors
      try CHECKED {
        pColors.withUnsafeMutableBufferPointer {
          pThis.pointee.lpVtbl.pointee.InitializeCustom(pThis, $0.baseAddress, UINT($0.count))
        }
      }
    }
  }

  public func InitializeFromBitmap(_ pISurface: IWICBitmapSource,
                                   _ cCount: UINT,
                                   _ fAddTransparentColor: WindowsBool) throws {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.InitializeFromBitmap(pThis, RawPointer(pISurface), cCount, fAddTransparentColor))
    }
  }

  public func InitializeFromPalette(_ pIPalette: IWICPalette) throws {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.InitializeFromPalette(pThis, RawPointer(pIPalette)))
    }
  }

  public func InitializePredefined(_ ePaletteType: WICBitmapPaletteType,
                                   _ fAddTransparentColor: WindowsBool) throws {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.InitializePredefined(pThis, ePaletteType, fAddTransparentColor))
    }
  }

  public func IsBlackWhite() throws -> Bool {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      var fIsBlackWhite: WindowsBool = false
      try CHECKED(pThis.pointee.lpVtbl.pointee.IsBlackWhite(pThis, &fIsBlackWhite))
      return fIsBlackWhite == true
    }
  }

  public func IsGrayscale() throws -> Bool {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      var fIsGrayscale: WindowsBool = false
      try CHECKED(pThis.pointee.lpVtbl.pointee.IsGrayscale(pThis, &fIsGrayscale))
      return fIsGrayscale == true
    }
  }
}

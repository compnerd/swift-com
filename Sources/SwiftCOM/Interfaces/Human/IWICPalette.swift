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
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetColorCount(pThis, &cCount)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return cCount
    }
  }

  public func GetColors() throws -> [WICColor] {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      let cCount: UINT = try GetColorCount()
      return try Array<WICColor>(unsafeUninitializedCapacity: Int(cCount)) {
        var cActualColors: UINT = UINT(0)
        let hr: HRESULT =
            pThis.pointee.lpVtbl.pointee.GetColors(pThis, cCount, $0.baseAddress,
                                                  &cActualColors)
        guard hr == S_OK else { throw COMError(hr: hr) }
        $1 = Int(cActualColors)
      }
    }
  }

  public func GetType() throws -> WICBitmapPaletteType {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      var ePaletteType: WICBitmapPaletteType = WICBitmapPaletteType(0)
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetType(pThis, &ePaletteType)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return ePaletteType
    }
  }

  public func HasAlpha() throws -> Bool {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      var fHasAlpha: WindowsBool = false
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.HasAlpha(pThis, &fHasAlpha)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return fHasAlpha == true
    }
  }

  public func InitializeCustom(_ pColors: [WICColor]) throws {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      var pColors: [WICColor] = pColors
      let hr: HRESULT = pColors.withUnsafeMutableBufferPointer {
        pThis.pointee.lpVtbl.pointee.InitializeCustom(pThis, $0.baseAddress,
                                                      UINT($0.count))
      }
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func InitializeFromBitmap(_ pISurface: IWICBitmapSource,
                                   _ cCount: UINT,
                                   _ fAddTransparentColor: WindowsBool) throws {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.InitializeFromBitmap(pThis,
                                                            RawPointer(pISurface),
                                                            cCount,
                                                            fAddTransparentColor)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func InitializeFromPalette(_ pIPalette: IWICPalette) throws {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.InitializeFromPalette(pThis,
                                                            RawPointer(pIPalette))
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func InitializePredefined(_ ePaletteType: WICBitmapPaletteType,
                                   _ fAddTransparentColor: WindowsBool) throws {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.InitializePredefined(pThis, ePaletteType,
                                                            fAddTransparentColor)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func IsBlackWhite() throws -> Bool {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      var fIsBlackWhite: WindowsBool = false
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.IsBlackWhite(pThis, &fIsBlackWhite)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return fIsBlackWhite == true
    }
  }

  public func IsGrayscale() throws -> Bool {
    return try perform(as: WinSDK.IWICPalette.self) { pThis in
      var fIsGrayscale: WindowsBool = false
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.IsGrayscale(pThis, &fIsGrayscale)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return fIsGrayscale == true
    }
  }
}

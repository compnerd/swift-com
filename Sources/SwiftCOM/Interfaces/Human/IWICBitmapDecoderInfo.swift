/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICBitmapDecoderInfo: IWICBitmapCodecInfo {
  override public class var IID: IID { IID_IWICBitmapDecoderInfo }

  public func CreateInstance() throws -> IWICBitmapDecoder {
    return try perform(as: WinSDK.IWICBitmapDecoderInfo.self) { pThis in
      var pIBitmapDecoder: UnsafeMutablePointer<WinSDK.IWICBitmapDecoder>?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.CreateInstance(pThis, &pIBitmapDecoder)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IWICBitmapDecoder(pUnk: pIBitmapDecoder)
    }
  }

  public func GetPatterns() throws -> [WICBitmapPattern] {
    return try perform(as: WinSDK.IWICBitmapDecoderInfo.self) { pThis in
      var cPatterns: UINT = UINT(0)
      var cbPatternsActual: UINT = UINT(0)
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetPatterns(pThis, 0, nil, &cPatterns,
                                                  &cbPatternsActual)
      guard hr == S_OK else { throw COMError(hr: hr) }

      return try Array<WICBitmapPattern>(unsafeUninitializedCapacity: Int(cPatterns)) {
        let hr: HRESULT =
            pThis.pointee.lpVtbl.pointee.GetPatterns(pThis, UINT($0.count),
                                                    $0.baseAddress, &cPatterns,
                                                    &cbPatternsActual)
        guard hr == S_OK else { throw COMError(hr: hr) }
        $1 = Int(cPatterns)
      }
    }
  }

  public func MatchesPattern(_ pIStream: IStream) throws -> Bool {
    return try perform(as: WinSDK.IWICBitmapDecoderInfo.self) { pThis in
      var fMatches: WindowsBool = false
      let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.MatchesPattern(pThis, RawPointer(pIStream),
                                                    &fMatches)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return fMatches == true
    }
  }
}

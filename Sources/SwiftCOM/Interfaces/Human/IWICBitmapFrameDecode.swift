/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICBitmapFrameDecode: IWICBitmapSource {
  override public class var IID: IID { IID_IWICBitmapFrameDecode }

  public func GetColorContexts() throws -> [IWICColorContext] {
    return try perform(as: WinSDK.IWICBitmapFrameDecode.self) { pThis in
      var cActualCount: UINT = UINT(0)
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetColorContexts(pThis, 0, nil,
                                                        &cActualCount)
      guard hr == S_OK else { throw COMError(hr: hr) }

      let contexts: [UnsafeMutablePointer<WinSDK.IWICColorContext>?] =
          try .init(unsafeUninitializedCapacity: Int(cActualCount)) {
        let hr: HRESULT =
            pThis.pointee.lpVtbl.pointee.GetColorContexts(pThis, cActualCount,
                                                          $0.baseAddress,
                                                          &cActualCount)
        guard hr == S_OK else { throw COMError(hr: hr) }
        $1 = Int(cActualCount)
      }

      return contexts.map { IWICColorContext(pUnk: $0) }
    }
  }

  public func GetMetadataQueryReader() throws -> IWICMetadataQueryReader {
    return try perform(as: WinSDK.IWICBitmapFrameDecode.self) { pThis in
      var pIMetadataQueryReader: UnsafeMutablePointer<WinSDK.IWICMetadataQueryReader>?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetMetadataQueryReader(pThis,
                                                              &pIMetadataQueryReader)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IWICMetadataQueryReader(pUnk: pIMetadataQueryReader)
    }
  }

  public func GetThumbnail() throws -> IWICBitmapSource {
    return try perform(as: WinSDK.IWICBitmapFrameDecode.self) { pThis in
      var pIBitmapSource: UnsafeMutablePointer<WinSDK.IWICBitmapSource>?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetThumbnail(pThis, &pIBitmapSource)
      guard hr == S_OK else { throw COMError(hr: hr) }

      return IWICBitmapSource(pUnk: pIBitmapSource)
    }
  }
}

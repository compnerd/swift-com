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
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetColorContexts(pThis, 0, nil, &cActualCount))

      let contexts: [UnsafeMutablePointer<WinSDK.IWICColorContext>?] =
          try .init(unsafeUninitializedCapacity: Int(cActualCount)) {
        try CHECKED(pThis.pointee.lpVtbl.pointee.GetColorContexts(pThis, cActualCount, $0.baseAddress, &cActualCount))
        $1 = Int(cActualCount)
      }

      return contexts.map { IWICColorContext(pUnk: $0) }
    }
  }

  public func GetMetadataQueryReader() throws -> IWICMetadataQueryReader {
    return try perform(as: WinSDK.IWICBitmapFrameDecode.self) { pThis in
      var pIMetadataQueryReader: UnsafeMutablePointer<WinSDK.IWICMetadataQueryReader>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetMetadataQueryReader(pThis, &pIMetadataQueryReader))
      return IWICMetadataQueryReader(pUnk: pIMetadataQueryReader)
    }
  }

  public func GetThumbnail() throws -> IWICBitmapSource {
    return try perform(as: WinSDK.IWICBitmapFrameDecode.self) { pThis in
      var pIBitmapSource: UnsafeMutablePointer<WinSDK.IWICBitmapSource>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetThumbnail(pThis, &pIBitmapSource))
      return IWICBitmapSource(pUnk: pIBitmapSource)
    }
  }
}

// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IWICColorTransform: IWICBitmapSource {
  override public class var IID: IID { IID_IWICColorTransform }

  public func Initialize(_ pISource: IWICBitmapSource,
                         _ pIContextSource: IWICColorContext,
                         _ pIContextDest: IWICColorContext,
                         _ pixelFmtDest: REFWICPixelFormatGUID) throws {
    return try perform(as: WinSDK.IWICColorTransform.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Initialize(pThis, RawPointer(pISource), RawPointer(pIContextSource), RawPointer(pIContextDest), pixelFmtDest))
    }
  }
}

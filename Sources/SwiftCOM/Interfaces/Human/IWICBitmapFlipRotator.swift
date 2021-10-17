// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IWICBitmapFlipRotator: IWICBitmapSource {
  override public class var IID: IID { IID_IWICBitmapFlipRotator }

  public func Initialize(_ pISource: IWICBitmapSource,
                         _ options: WICBitmapTransformOptions) throws {
    return try perform(as: WinSDK.IWICBitmapFlipRotator.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Initialize(pThis, RawPointer(pISource), options))
    }
  }
}

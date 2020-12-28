/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICBitmapScaler: IWICBitmapSource {
  override public class var IID: IID { IID_IWICBitmapScaler }

  public func Initialize(_ pISource: IWICBitmapSource, _ uiWidth: UINT,
                         _ uiHeight: UINT,
                         _ mode: WICBitmapInterpolationMode) throws {
    return try perform(as: WinSDK.IWICBitmapScaler.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Initialize(pThis, RawPointer(pISource), uiWidth, uiHeight, mode))
    }
  }
}

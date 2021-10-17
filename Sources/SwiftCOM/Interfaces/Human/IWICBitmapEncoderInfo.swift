// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IWICBitmapEncoderInfo: IWICBitmapCodecInfo {
  override public class var IID: IID { IID_IWICBitmapEncoderInfo }

  public func CreateInstance() throws -> IWICBitmapEncoder {
    return try perform(as: WinSDK.IWICBitmapEncoderInfo.self) { pThis in
      var pIBitmapEncoder: UnsafeMutablePointer<WinSDK.IWICBitmapEncoder>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateInstance(pThis, &pIBitmapEncoder))
      return IWICBitmapEncoder(pUnk: pIBitmapEncoder)
    }
  }
}

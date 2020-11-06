/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICBitmapEncoderInfo: IWICBitmapCodecInfo {
  override public class var IID: IID { IID_IWICBitmapEncoderInfo }

  public func CreateInstance() throws -> IWICBitmapEncoder {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapEncoderInfo.self, capacity: 1)

    var pIBitmapEncoder: UnsafeMutablePointer<WinSDK.IWICBitmapEncoder>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateInstance(pThis, &pIBitmapEncoder)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmapEncoder(pUnk: pIBitmapEncoder)
  }
}

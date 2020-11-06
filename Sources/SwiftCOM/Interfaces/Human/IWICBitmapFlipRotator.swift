/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICBitmapFlipRotator: IWICBitmapSource {
  override public class var IID: IID { IID_IWICBitmapFlipRotator }

  public func Initialize(_ pISource: IWICBitmapSource,
                         _ options: WICBitmapTransformOptions) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapFlipRotator.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Initialize(pThis, RawPointer(pISource),
                                                options)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

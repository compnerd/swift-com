/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICColorTransform: IWICBitmapSource {
  override public class var IID: IID { IID_IWICColorTransform }

  public func Initialize(_ pISource: IWICBitmapSource,
                         _ pIContextSource: IWICColorContext,
                         _ pIContextDest: IWICColorContext,
                         _ pixelFmtDest: REFWICPixelFormatGUID) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICColorTransform.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Initialize(pThis, RawPointer(pISource),
                                                RawPointer(pIContextSource),
                                                RawPointer(pIContextDest),
                                                pixelFmtDest)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICBitmapClipper: IWICBitmapSource {
  override public class var IID: IID { IID_IWICBitmapClipper }

  public func Initialize(_ pISource: IWICBitmapSource, _ rc: WICRect) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapClipper.self, capacity: 1)

    var rc = rc
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Initialize(pThis, RawPointer(pISource),
                                                &rc)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

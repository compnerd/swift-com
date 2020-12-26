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
    return try perform(as: WinSDK.IWICBitmapClipper.self) { pThis in
      var rc = rc
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.Initialize(pThis, RawPointer(pISource),
                                                  &rc)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }
}

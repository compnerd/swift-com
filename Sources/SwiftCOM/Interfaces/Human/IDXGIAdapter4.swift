/**
 * Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IDXGIAdapter4: IDXGIAdapter3 {
  override public class var IID: IID { IID_IDXGIAdapter4 }

  public func GetDesc3() throws -> DXGI_ADAPTER_DESC3 {
    return try perform(as: WinSDK.IDXGIAdapter4.self) { pThis in
      var Desc: DXGI_ADAPTER_DESC3 = DXGI_ADAPTER_DESC3()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDesc3(pThis, &Desc))
      return Desc
    }
  }
}

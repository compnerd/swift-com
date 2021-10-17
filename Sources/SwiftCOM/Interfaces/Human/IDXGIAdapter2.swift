// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGIAdapter2: IDXGIAdapter1 {
  override public class var IID: IID { IID_IDXGIAdapter2 }

  public func GetDesc2() throws -> DXGI_ADAPTER_DESC2 {
    return try perform(as: WinSDK.IDXGIAdapter2.self) { pThis in
      var Desc: DXGI_ADAPTER_DESC2 = DXGI_ADAPTER_DESC2()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDesc2(pThis, &Desc))
      return Desc
    }
  }
}

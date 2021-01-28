/**
 * Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IDXGIAdapter1: IDXGIAdapter {
  override public class var IID: IID { IID_IDXGIAdapter1 }

  public func GetDesc1() throws -> DXGI_ADAPTER_DESC1 {
    return try perform(as: WinSDK.IDXGIAdapter1.self) { pThis in
      var Desc: DXGI_ADAPTER_DESC1 = DXGI_ADAPTER_DESC1()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDesc1(pThis, &Desc))
      return Desc
    }
  }
}

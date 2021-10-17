// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGIFactory3: IDXGIFactory2 {
  override public class var IID: IID { IID_IDXGIFactory3 }

  public func GetCreationFlags() throws -> UINT {
    return try perform(as: WinSDK.IDXGIFactory3.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetCreationFlags(pThis)
    }
  }
}

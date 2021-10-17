// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGISwapChain4: IDXGISwapChain {
  override public class var IID: IID { IID_IDXGISwapChain4 }

  public func SetHDRMetaData(_ Type: DXGI_HDR_METADATA_TYPE, _ Size: UINT, _ pMetaData: UnsafeMutableRawPointer?) throws {
    return try perform(as: WinSDK.IDXGISwapChain4.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetHDRMetaData(pThis, Type, Size, pMetaData))
    }
  }
}

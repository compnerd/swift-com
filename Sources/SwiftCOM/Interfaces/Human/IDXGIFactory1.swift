// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGIFactory1: IDXGIFactory {
  override public class var IID: IID { IID_IDXGIFactory1 }

  public func EnumAdapters1(_ Adapter: UINT) throws -> IDXGIAdapter1 {
    return try perform(as: WinSDK.IDXGIFactory.self) { pThis in
      var pAdapter: UnsafeMutablePointer<WinSDK.IDXGIAdapter>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.EnumAdapters(pThis, Adapter, &pAdapter))
      return IDXGIAdapter1(pUnk: pAdapter)
    }
  }

  public func IsCurrent() throws -> Bool {
    return try perform(as: WinSDK.IDXGIFactory1.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.IsCurrent(pThis) == true
    }
  }
}

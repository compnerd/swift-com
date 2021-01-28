/**
 * Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IDXGIFactory4: IDXGIFactory3 {
  override public class var IID: IID { IID_IDXGIFactory4 }

  public func EnumAdapterByLuid(_ AdapterLuid: LUID, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.IDXGIFactory4.self) { pThis in
      var pvAdapter: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.EnumAdapterByLuid(pThis, AdapterLuid, riid, &pvAdapter))
      return pvAdapter
    }
  }

  public func EnumWarpAdapter(_ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.IDXGIFactory4.self) { pThis in
      var pvAdapter: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.EnumWarpAdapter(pThis, riid, &pvAdapter))
      return pvAdapter
    }
  }
}

extension IDXGIFactory4 {
  public func EnumAdapterByLuid<Interface: IUnknown>(_ AdapterLuid: LUID) throws -> Interface {
    return try perform(as: WinSDK.IDXGIFactory4.self) { pThis in
      var iid: IID = Interface.IID
      return try Interface(pUnk: EnumAdapterByLuid(AdapterLuid, &iid))
    }
  }

  public func EnumWarpAdapter<Interface: IUnknown>() throws -> Interface {
    return try perform(as: WinSDK.IDXGIFactory4.self) { pThis in
      var iid: IID = Interface.IID
      return try Interface(pUnk: EnumWarpAdapter(&iid))
    }
  }
}

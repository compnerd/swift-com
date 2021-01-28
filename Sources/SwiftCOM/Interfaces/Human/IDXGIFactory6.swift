/**
 * Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IDXGIFactory6: IDXGIFactory5 {
  override public class var IID: IID { IID_IDXGIFactory6 }

  public func EnumAdapterByGpuPreference(_ Adapter: UINT, _ GpuPreference: DXGI_GPU_PREFERENCE, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.IDXGIFactory6.self) { pThis in
      var pvAdapter: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.EnumAdapterByGpuPreference(pThis, Adapter, GpuPreference, riid, &pvAdapter))
      return pvAdapter
    }
  }
}

extension IDXGIFactory6 {
  public func EnumAdapterByGpuPreference<IAdapter: IUnknown>(_ Adapter: UINT, _ GpuPreference: DXGI_GPU_PREFERENCE) throws -> IAdapter {
    var iid: IID = IAdapter.IID
    return try IAdapter(pUnk: EnumAdapterByGpuPreference(Adapter, GpuPreference, &iid))
  }
}

// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGIDevice: IDXGIObject {
  override public class var IID: IID { IID_IDXGIDevice }

  public func CreateSurface(_ pDesc: UnsafePointer<DXGI_SURFACE_DESC>?, _ NumSurfaces: UINT, _ Usage: DXGI_USAGE, _ pSharedResource: UnsafePointer<DXGI_SHARED_RESOURCE>?) throws -> IDXGISurface {
    return try perform(as: WinSDK.IDXGIDevice.self) { pThis in
      var pSurface: UnsafeMutablePointer<WinSDK.IDXGISurface>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateSurface(pThis, pDesc, NumSurfaces, Usage, pSharedResource, &pSurface))
      return IDXGISurface(pUnk: pSurface)
    }
  }

  public func GetAdapter() throws -> IDXGIAdapter {
    return try perform(as: WinSDK.IDXGIDevice.self) { pThis in
      var pAdapter: UnsafeMutablePointer<WinSDK.IDXGIAdapter>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetAdapter(pThis, &pAdapter))
      return IDXGIAdapter(pUnk: pAdapter)
    }
  }

  public func GetGPUThreadPriority() throws -> INT {
    return try perform(as: WinSDK.IDXGIDevice.self) { pThis in
      var Priority: INT = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetGPUThreadPriority(pThis, &Priority))
      return Priority
    }
  }

  public func QueryResourceResidency(_ pResources: UnsafePointer<UnsafeMutablePointer<WinSDK.IUnknown>?>?, _ pResidencyStatus: UnsafeMutablePointer<DXGI_RESIDENCY>?, _ NumResources: UINT) throws {
    return try perform(as: WinSDK.IDXGIDevice.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.QueryResourceResidency(pThis, pResources, pResidencyStatus, NumResources))
    }
  }

  public func SetGPUThreadPriority(_ Priority: INT) throws {
    return try perform(as: WinSDK.IDXGIDevice.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetGPUThreadPriority(pThis, Priority))
    }
  }
}

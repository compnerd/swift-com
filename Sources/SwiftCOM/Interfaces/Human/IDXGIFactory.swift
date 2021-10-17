// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGIFactory: IDXGIObject {
  override public class var IID: IID { IID_IDXGIFactory }

  public func CreateSoftwareAdapter(_ Module: HMODULE) throws -> IDXGIAdapter {
    return try perform(as: WinSDK.IDXGIFactory.self) { pThis in
      var pAdapter: UnsafeMutablePointer<WinSDK.IDXGIAdapter>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateSoftwareAdapter(pThis, Module, &pAdapter))
      return IDXGIAdapter(pUnk: pAdapter)
    }
  }

  public func CreateSwapChain(_ pDevice: IUnknown?, _ pDesc: UnsafeMutablePointer<DXGI_SWAP_CHAIN_DESC>?) throws -> IDXGISwapChain {
    return try perform(as: WinSDK.IDXGIFactory.self) { pThis in
      var pSwapChain: UnsafeMutablePointer<WinSDK.IDXGISwapChain>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateSwapChain(pThis, RawPointer(pDevice), pDesc, &pSwapChain))
      return IDXGISwapChain(pUnk: pSwapChain)
    }
  }

  public func EnumAdapters(_ Adapter: UINT) throws -> IDXGIAdapter {
    return try perform(as: WinSDK.IDXGIFactory.self) { pThis in
      var pAdapter: UnsafeMutablePointer<WinSDK.IDXGIAdapter>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.EnumAdapters(pThis, Adapter, &pAdapter))
      return IDXGIAdapter(pUnk: pAdapter)
    }
  }

  public func GetWindowAssociation() throws -> HWND? {
    return try perform(as: WinSDK.IDXGIFactory.self) { pThis in
      var WindowHandle: HWND?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetWindowAssociation(pThis, &WindowHandle))
      return WindowHandle
    }
  }

  public func MakeWindowAssociation(_ WindowHandle: HWND, _ Flags: UINT) throws {
    return try perform(as: WinSDK.IDXGIFactory.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.MakeWindowAssociation(pThis, WindowHandle, Flags))
    }
  }
}

extension IDXGIFactory {
  public func CreateSwapChain(_ pDevice: IUnknown?, _ description: DXGI_SWAP_CHAIN_DESC) throws -> IDXGISwapChain {
    var Desc = description
    return try CreateSwapChain(pDevice, &Desc)
  }
}

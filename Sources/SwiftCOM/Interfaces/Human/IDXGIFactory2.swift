// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGIFactory2: IDXGIFactory1 {
  override public class var IID: IID { IID_IDXGIFactory2 }

  public func CreateSwapChainForComposition(_ pDevice: IUnknown?, _ pDesc: UnsafePointer<DXGI_SWAP_CHAIN_DESC1>?, _ pRestrictToOutput: IDXGIOutput?) throws -> IDXGISwapChain1 {
    return try perform(as: WinSDK.IDXGIFactory2.self) { pThis in
      var pSwapChain: UnsafeMutablePointer<WinSDK.IDXGISwapChain1>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateSwapChainForComposition(pThis, RawPointer(pDevice), pDesc, RawPointer(pRestrictToOutput), &pSwapChain))
      return IDXGISwapChain1(pUnk: pSwapChain)
    }
  }

  public func CreateSwapChainForCoreWindow(_ pDevice: IUnknown?, _ pWindow: IUnknown?, _ pDesc: UnsafePointer<DXGI_SWAP_CHAIN_DESC1>?, _ pRestrictToOutput: IDXGIOutput?) throws -> IDXGISwapChain1 {
    return try perform(as: WinSDK.IDXGIFactory2.self) { pThis in
      var pSwapChain: UnsafeMutablePointer<WinSDK.IDXGISwapChain1>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateSwapChainForCoreWindow(pThis, RawPointer(pDevice), RawPointer(pWindow), pDesc, RawPointer(pRestrictToOutput), &pSwapChain))
      return IDXGISwapChain1(pUnk: pSwapChain)
    }
  }

  public func CreateSwapChainForHwnd(_ pDevice: IUnknown?, _ hWnd: HWND, _ pDesc: UnsafePointer<DXGI_SWAP_CHAIN_DESC1>?, _ pFullscreenDesc: UnsafePointer<DXGI_SWAP_CHAIN_FULLSCREEN_DESC>?, _ pRestrictToOutput: IDXGIOutput?) throws -> IDXGISwapChain1 {
    return try perform(as: WinSDK.IDXGIFactory2.self) { pThis in
      var pSwapChain: UnsafeMutablePointer<WinSDK.IDXGISwapChain1>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateSwapChainForHwnd(pThis, RawPointer(pDevice), hWnd, pDesc, pFullscreenDesc, RawPointer(pRestrictToOutput), &pSwapChain))
      return IDXGISwapChain1(pUnk: pSwapChain)
    }
  }

  public func GetSharedResourceAdapterLuid(_ hResource: HANDLE) throws -> LUID {
    return try perform(as: WinSDK.IDXGIFactory2.self) { pThis in
      var Luid: LUID = LUID()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSharedResourceAdapterLuid(pThis, hResource, &Luid))
      return Luid
    }
  }

  public func IsWindowedStereoEnabled() throws -> Bool {
    return try perform(as: WinSDK.IDXGIFactory2.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.IsWindowedStereoEnabled(pThis) == true
    }
  }

  public func RegisterOcclusionStatusEvent(_ hEvent: HANDLE) throws -> DWORD {
    return try perform(as: WinSDK.IDXGIFactory2.self) { pThis in
      var dwCookie: DWORD = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterOcclusionStatusEvent(pThis, hEvent, &dwCookie))
      return dwCookie
    }
  }

  public func RegisterOcclusionStatusWindow(_ WindowHandle: HWND, _ wMsg: UINT) throws -> DWORD {
    return try perform(as: WinSDK.IDXGIFactory2.self) { pThis in
      var dwCookie: DWORD = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterOcclusionStatusWindow(pThis, WindowHandle, wMsg, &dwCookie))
      return dwCookie
    }
  }

  public func RegisterStereoStausEvent(_ hEvent: HANDLE) throws -> DWORD {
    return try perform(as: WinSDK.IDXGIFactory2.self) { pThis in
      var dwCookie: DWORD = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterOcclusionStatusEvent(pThis, hEvent, &dwCookie))
      return dwCookie
    }
  }

  public func RegisterStereoStatusWindow(_ WindowHandle: HWND, _ wMsg: UINT) throws -> DWORD {
    return try perform(as: WinSDK.IDXGIFactory2.self) { pThis in
      var dwCookie: DWORD = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterStereoStatusWindow(pThis, WindowHandle, wMsg, &dwCookie))
      return dwCookie
    }
  }

  public func UnregisterOcclusionStatus(_ dwCookie: DWORD) throws {
    return try perform(as: WinSDK.IDXGIFactory2.self) { pThis in
      pThis.pointee.lpVtbl.pointee.UnregisterOcclusionStatus(pThis, dwCookie)
    }
  }

  public func UnregisterStereoStatus(_ dwCookie: DWORD) throws {
    return try perform(as: WinSDK.IDXGIFactory2.self) { pThis in
      pThis.pointee.lpVtbl.pointee.UnregisterStereoStatus(pThis, dwCookie)
    }
  }
}

extension IDXGIFactory2 {
  public func CreateSwapChainForHwnd(_ pDevice: IUnknown?, _ hWnd: HWND, _ SCD: DXGI_SWAP_CHAIN_DESC1?, _ FSCD: DXGI_SWAP_CHAIN_FULLSCREEN_DESC?, _ pRestrictToOutput: IDXGIOutput?) throws -> IDXGISwapChain1 {
    return try withUnsafeNullablePointer(to: SCD) { pSCD in
      return try withUnsafeNullablePointer(to: FSCD) { pFSCD in
        return try CreateSwapChainForHwnd(pDevice, hWnd, pSCD ?? nil, pFSCD ?? nil, pRestrictToOutput)
      }
    }
  }
}

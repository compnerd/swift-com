// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGISwapChain1: IDXGISwapChain {
  override public class var IID: IID { IID_IDXGISwapChain1 }

  public func GetBackgroundColor() throws -> DXGI_RGBA {
    return try perform(as: WinSDK.IDXGISwapChain1.self) { pThis in
      var Color: DXGI_RGBA = DXGI_RGBA()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetBackgroundColor(pThis, &Color))
      return Color
    }
  }

  public func GetCoreWindow(_ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.IDXGISwapChain1.self) { pThis in
      var pUnk: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetCoreWindow(pThis, riid, &pUnk))
      return pUnk
    }
  }

  public func GetDesc1() throws -> DXGI_SWAP_CHAIN_DESC1 {
    return try perform(as: WinSDK.IDXGISwapChain1.self) { pThis in
      var Desc: DXGI_SWAP_CHAIN_DESC1 = DXGI_SWAP_CHAIN_DESC1()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDesc1(pThis, &Desc))
      return Desc
    }
  }

  public func GetFullscreenDesc(_ pDesc: UnsafeMutablePointer<DXGI_SWAP_CHAIN_FULLSCREEN_DESC>?) throws {
    return try perform(as: WinSDK.IDXGISwapChain1.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetFullscreenDesc(pThis, pDesc))
    }
  }

  public func GetHwnd() throws -> HWND {
    return try perform(as: WinSDK.IDXGISwapChain1.self) { pThis in
      var Hwnd: HWND!
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetHwnd(pThis, &Hwnd))
      return Hwnd
    }
  }

  public func GetRestrictToOutput() throws -> IDXGIOutput {
    return try perform(as: WinSDK.IDXGISwapChain1.self) { pThis in
      var pRestrictToOutput: UnsafeMutablePointer<WinSDK.IDXGIOutput>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetRestrictToOutput(pThis, &pRestrictToOutput))
      return IDXGIOutput(pUnk: pRestrictToOutput)
    }
  }

  public func GetRotation() throws -> DXGI_MODE_ROTATION {
    return try perform(as: WinSDK.IDXGISwapChain1.self) { pThis in
      var Rotation: DXGI_MODE_ROTATION = DXGI_MODE_ROTATION(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetRotation(pThis, &Rotation))
      return Rotation
    }
  }

  public func IsTemporaryMonoSupported() throws -> WindowsBool {
    return try perform(as: WinSDK.IDXGISwapChain1.self) { pThis in
      pThis.pointee.lpVtbl.pointee.IsTemporaryMonoSupported(pThis)
    }
  }

  public func Present1(_ SyncInterval: UINT, _ PresentFlags: UINT, _ pPresentParameters: UnsafePointer<DXGI_PRESENT_PARAMETERS>?) throws {
    return try perform(as: WinSDK.IDXGISwapChain1.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Present1(pThis, SyncInterval, PresentFlags, pPresentParameters))
    }
  }

  public func SetBackgroundColor(_ pColor: UnsafePointer<DXGI_RGBA>?) throws {
    return try perform(as: WinSDK.IDXGISwapChain1.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetBackgroundColor(pThis, pColor))
    }
  }

  public func SetRotation(_ Rotation: DXGI_MODE_ROTATION) throws {
    return try perform(as: WinSDK.IDXGISwapChain1.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetRotation(pThis, Rotation))
    }
  }
}

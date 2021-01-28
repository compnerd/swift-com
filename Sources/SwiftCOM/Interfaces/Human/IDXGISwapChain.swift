/**
 * Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IDXGISwapChain: IDXGIObject {
  override public class var IID: IID { IID_IDXGISwapChain }

  public func GetBuffer(_ Buffer: UINT, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.IDXGISwapChain.self) { pThis in
      var pSurface: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetBuffer(pThis, Buffer, riid, &pSurface))
      return pSurface
    }
  }

  public func GetContainingOutput() throws -> IDXGIOutput {
    return try perform(as: WinSDK.IDXGISwapChain.self) { pThis in
      var pOutput: UnsafeMutablePointer<WinSDK.IDXGIOutput>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetContainingOutput(pThis, &pOutput))
      return IDXGIOutput(pUnk: pOutput)
    }
  }

  public func GetDesc() throws -> DXGI_SWAP_CHAIN_DESC {
    return try perform(as: WinSDK.IDXGISwapChain.self) { pThis in
      var Desc: DXGI_SWAP_CHAIN_DESC = DXGI_SWAP_CHAIN_DESC()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDesc(pThis, &Desc))
      return Desc
    }
  }

  public func GetFrameStatistics() throws -> DXGI_FRAME_STATISTICS {
    return try perform(as: WinSDK.IDXGISwapChain.self) { pThis in
      var Stats: DXGI_FRAME_STATISTICS = DXGI_FRAME_STATISTICS()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetFrameStatistics(pThis, &Stats))
      return Stats
    }
  }

  public func GetFullscreenState() throws -> (WindowsBool, IDXGIOutput) {
    return try perform(as: WinSDK.IDXGISwapChain.self) { pThis in
      var Fullscreen: WindowsBool = false
      var pTarget: UnsafeMutablePointer<WinSDK.IDXGIOutput>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetFullscreenState(pThis, &Fullscreen, &pTarget))
      return (Fullscreen, IDXGIOutput(pUnk: pTarget)) 
    }
  }

  public func GetLastPresentCount() throws -> UINT {
    return try perform(as: WinSDK.IDXGISwapChain.self) { pThis in
      var LastPresentCount: UINT = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetLastPresentCount(pThis, &LastPresentCount))
      return LastPresentCount
    }
  }

  public func Present(_ SyncInterval: UINT, _ Flags: UINT) throws {
    return try perform(as: WinSDK.IDXGISwapChain.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Present(pThis, SyncInterval, Flags))
    }
  }

  public func ResizeBuffers(_ BufferCount: UINT, _ Width: UINT, _ Height: UINT, _ NewFormat: DXGI_FORMAT, _ SwapChainFlags: UINT) throws {
    return try perform(as: WinSDK.IDXGISwapChain.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ResizeBuffers(pThis, BufferCount, Width, Height, NewFormat, SwapChainFlags))
    }
  }

  public func ResizeTarget(_ pNewTargetParameters: UnsafePointer<DXGI_MODE_DESC>?) throws {
    return try perform(as: WinSDK.IDXGISwapChain.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ResizeTarget(pThis, pNewTargetParameters))
    }
  }

  public func SetFullscreenState(_ Fullscreen: WindowsBool, _ pTarget: IDXGIOutput?) throws {
    return try perform(as: WinSDK.IDXGISwapChain.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetFullscreenState(pThis, Fullscreen, RawPointer(pTarget)))
    }
  }
}

extension IDXGISwapChain {
  public func GetBuffer<Resource: IUnknown>(_ Buffer: UINT) throws -> Resource {
    var iid: IID = Resource.IID
    return try Resource(pUnk: GetBuffer(Buffer, &iid))
  }
}

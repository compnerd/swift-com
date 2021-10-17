// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGISwapChain3: IDXGISwapChain {
  override public class var IID: IID { IID_IDXGISwapChain3 }

  public func CheckColorSpaceSupport(_ ColorSpace: DXGI_COLOR_SPACE_TYPE) throws -> UINT {
    return try perform(as: WinSDK.IDXGISwapChain3.self) { pThis in
      var ColorSpaceSupport: UINT = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.CheckColorSpaceSupport(pThis, ColorSpace, &ColorSpaceSupport))
      return ColorSpaceSupport
    }
  }

  public func GetCurrentBackBufferIndex() throws -> UINT {
    return try perform(as: WinSDK.IDXGISwapChain3.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetCurrentBackBufferIndex(pThis)
    }
  }

  public func ResizeBuffers1(_ BufferCount: UINT, _ Width: UINT, _ Height: UINT, _ Format: DXGI_FORMAT, _ SwapChainFlags: UINT, _ pCreationNodeMask: UnsafePointer<UINT>?, _ ppPresentQueue: UnsafePointer<UnsafeMutablePointer<WinSDK.IUnknown>?>?) throws {
    return try perform(as: WinSDK.IDXGISwapChain3.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ResizeBuffers1(pThis, BufferCount, Width, Height, Format, SwapChainFlags, pCreationNodeMask, ppPresentQueue))
    }
  }

  public func SetColorSpace1(_ ColorSpace: DXGI_COLOR_SPACE_TYPE) throws {
    return try perform(as: WinSDK.IDXGISwapChain3.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetColorSpace1(pThis, ColorSpace))
    }
  }
}

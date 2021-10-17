// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGISwapChain2: IDXGISwapChain {
  override public class var IID: IID { IID_IDXGISwapChain2 }

  public func GetFrameLatencyWaitableObject() throws -> HANDLE? {
    return try perform(as: WinSDK.IDXGISwapChain2.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetFrameLatencyWaitableObject(pThis)
    }
  }

  public func GetMatrixTransform() throws -> DXGI_MATRIX_3X2_F {
    return try perform(as: WinSDK.IDXGISwapChain2.self) { pThis in
      var Matrix: DXGI_MATRIX_3X2_F = DXGI_MATRIX_3X2_F()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetMatrixTransform(pThis, &Matrix))
      return Matrix
    }
  }

  public func GetMaximumFrameLatency() throws -> UINT {
    return try perform(as: WinSDK.IDXGISwapChain2.self) { pThis in
      var MaxLatency: UINT = 1
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetMaximumFrameLatency(pThis, &MaxLatency))
      return MaxLatency
    }
  }

  public func GetSourceSize() throws -> (UINT, UINT) {
    return try perform(as: WinSDK.IDXGISwapChain2.self) { pThis in
      var Width: UINT = 0
      var Height: UINT = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSourceSize(pThis, &Width, &Height))
      return (Width, Height)
    }
  }

  public func SetMatrixTransform(_ pMatrix: UnsafePointer<DXGI_MATRIX_3X2_F>?) throws {
    return try perform(as: WinSDK.IDXGISwapChain2.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetMatrixTransform(pThis, pMatrix))
    }
  }

  public func SetMaximumFrameLatency(_ MaxLatency: UINT) throws {
    return try perform(as: WinSDK.IDXGISwapChain2.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetMaximumFrameLatency(pThis, MaxLatency))
    }
  }

  public func SetSourceSize(_ Width: UINT, _ Height: UINT) throws {
    return try perform(as: WinSDK.IDXGISwapChain2.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetSourceSize(pThis, Width, Height))
    }
  }
}

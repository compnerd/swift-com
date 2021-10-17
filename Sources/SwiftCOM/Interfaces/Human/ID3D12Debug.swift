// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ID3D12Debug: IUnknown {
  public override class var IID: IID { IID_ID3D12Debug }

  public func EnableDebugLayer() throws {
    return try perform(as: WinSDK.ID3D12Debug.self) { pThis in
      pThis.pointee.lpVtbl.pointee.EnableDebugLayer(pThis)
    }
  }
}

// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ID3D12PipelineState: ID3D12Pageable {
  override public class var IID: IID { IID_ID3D12PipelineState }

  public func GetCachedBlob() throws -> ID3DBlob {
    return try perform(as: WinSDK.ID3D12PipelineState.self) { pThis in
      var pBlob: UnsafeMutablePointer<WinSDK.ID3DBlob>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetCachedBlob(pThis, &pBlob))
      return ID3DBlob(pUnk: pBlob)
    }
  }
}

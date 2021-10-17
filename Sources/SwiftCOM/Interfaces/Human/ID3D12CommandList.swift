// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ID3D12CommandList: ID3D12DeviceChild {
  override public class var IID: IID { IID_ID3D12CommandList }

  public func GetType() throws -> D3D12_COMMAND_LIST_TYPE {
    return try perform(as: WinSDK.ID3D12CommandList.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetType(pThis)
    }
  }
}

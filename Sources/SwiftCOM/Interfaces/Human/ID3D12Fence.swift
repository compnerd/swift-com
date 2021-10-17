// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ID3D12Fence: ID3D12Pageable {
  override public class var IID: IID { IID_ID3D12Fence }

  public func GetCompletedValue() throws -> UINT64 {
    return try perform(as: WinSDK.ID3D12Fence.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetCompletedValue(pThis)
    }
  }

  public func SetEventOnCompletion(_ Value: UINT64, _ hEvent: HANDLE) throws {
    return try perform(as: WinSDK.ID3D12Fence.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetEventOnCompletion(pThis, Value, hEvent))
    }
  }

  public func Signal(_ Value: UINT64) throws {
    return try perform(as: WinSDK.ID3D12Fence.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Signal(pThis, Value))
    }
  }
}

/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class ID3D12CommandAllocator: ID3D12Pageable {
  override public class var IID: IID { IID_ID3D12CommandAllocator }

  public func Reset() throws {
    return try perform(as: WinSDK.ID3D12CommandAllocator.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Reset(pThis))
    }
  }
}

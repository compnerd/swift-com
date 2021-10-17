// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ID3D12Heap: ID3D12Pageable {
  override public class var IID: IID { IID_ID3D12Heap }

  public func GetDesc() throws -> D3D12_HEAP_DESC {
    return try perform(as: WinSDK.ID3D12Heap.self) { pThis in
      var desc: D3D12_HEAP_DESC = D3D12_HEAP_DESC()
      let _ = pThis.pointee.lpVtbl.pointee.GetDesc(pThis, &desc)
      return desc
    }
  }
}

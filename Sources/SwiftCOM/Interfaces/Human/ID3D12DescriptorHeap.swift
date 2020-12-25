/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class ID3D12DescriptorHeap: ID3D12Pageable {
  override public class var IID: IID { IID_ID3D12DescriptorHeap }

  public func GetCPUDescriptorHandleForHeapStart() throws
      -> D3D12_CPU_DESCRIPTOR_HANDLE {
    return try perform(as: WinSDK.ID3D12DescriptorHeap.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetCPUDescriptorHandleForHeapStart(pThis)
    }
  }

  public func GetDesc() throws -> D3D12_DESCRIPTOR_HEAP_DESC {
    return try perform(as: WinSDK.ID3D12DescriptorHeap.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetDesc(pThis)
    }
  }

  public func GetGPUDescriptorHandleForHeapStart() throws
      -> D3D12_GPU_DESCRIPTOR_HANDLE {
    return try perform(as: WinSDK.ID3D12DescriptorHeap.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetGPUDescriptorHandleForHeapStart(pThis)
    }
  }
}

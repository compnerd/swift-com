// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ID3D12Resource: ID3D12Pageable {
  public override class var IID: IID { IID_ID3D12Resource }

  public func GetDesc() throws -> D3D12_RESOURCE_DESC {
    return try perform(as: WinSDK.ID3D12Resource.self) { pThis in
      var desc: D3D12_RESOURCE_DESC = D3D12_RESOURCE_DESC()
      desc = pThis.pointee.lpVtbl.pointee.GetDesc(pThis)
      return desc
    }
  }

  public func GetGPUVirtualAddress() throws -> D3D12_GPU_VIRTUAL_ADDRESS {
    return try perform(as: WinSDK.ID3D12Resource.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetGPUVirtualAddress(pThis)
    }
  }

  public func GetHeapProperties() throws
      -> (D3D12_HEAP_PROPERTIES, D3D12_HEAP_FLAGS) {
    return try perform(as: WinSDK.ID3D12Resource.self) { pThis in
      var HeapProperties: D3D12_HEAP_PROPERTIES = D3D12_HEAP_PROPERTIES()
      var HeapFlags: D3D12_HEAP_FLAGS = D3D12_HEAP_FLAG_NONE
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetHeapProperties(pThis, &HeapProperties, &HeapFlags))
      return (HeapProperties, HeapFlags)
    }
  }

  public func Map(_ Subresource: UINT, _ pReadRange: UnsafePointer<D3D12_RANGE>?) throws
      -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Resource.self) { pThis in
      var pData: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.Map(pThis, Subresource, pReadRange, &pData))
      return pData
    }
  }

  public func ReadFromSubresource(_ pDstData: UnsafeMutableRawPointer,
                                  _ DstRowPitch: UINT,
                                  _ DstDepthPitch: UINT,
                                  _ SrcSubresource: UINT,
                                  _ SrcBox: D3D12_BOX) throws {
    return try perform(as: WinSDK.ID3D12Resource.self) { pThis in
      var SrcBox = SrcBox
      try CHECKED(pThis.pointee.lpVtbl.pointee.ReadFromSubresource(pThis, pDstData, DstRowPitch, DstDepthPitch, SrcSubresource, &SrcBox))
    }
  }

  public func Unmap(_ Subresource: UINT, _ pWrittenRange: UnsafePointer<D3D12_RANGE>?) throws {
    return try perform(as: WinSDK.ID3D12Resource.self) { pThis in
      pThis.pointee.lpVtbl.pointee.Unmap(pThis, Subresource, pWrittenRange)
    }
  }

  public func WriteToSubresource(_ DstSubresource: UINT, _ DstBox: D3D12_BOX,
                                 _ pSrcData: UnsafeMutableRawPointer,
                                 _ SrcRowPitch: UINT, _ SrcDepthPitch: UINT)
      throws {
    return try perform(as: WinSDK.ID3D12Resource.self) { pThis in
      var DstBox = DstBox
      try CHECKED(pThis.pointee.lpVtbl.pointee.WriteToSubresource(pThis, DstSubresource, &DstBox, pSrcData, SrcRowPitch, SrcDepthPitch))
    }
  }
}

extension ID3D12Resource {
  public func Map(_ Subresource: UINT, _ ReadRange: D3D12_RANGE) throws
      -> UnsafeMutableRawPointer? {
    var ReadRange = ReadRange
    return try Map(Subresource, &ReadRange)
  }

  public func Unmap(_ Subresource: UINT, _ WrittenRange: D3D12_RANGE) throws {
    var WrittenRange = WrittenRange
    return try Unmap(Subresource, &WrittenRange)
  }
}

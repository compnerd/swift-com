// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ID3D12CommandQueue: ID3D12Pageable {
  override public class var IID: IID { IID_ID3D12CommandQueue }

  public func BeginEvent(_ Metadata: UINT, _ pData: UnsafeRawPointer, _ Size: UINT) throws {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.BeginEvent(pThis, Metadata, pData, Size)
    }
  }

  public func  CopyTileMappings(_ pDstResource: ID3D12Resource?,
                                _ pDstRegionStartCoordinate: UnsafePointer<D3D12_TILED_RESOURCE_COORDINATE>?,
                                _ pSrcResource: ID3D12Resource?,
                                _ pSrcRegionStartCoordinate: UnsafePointer<D3D12_TILED_RESOURCE_COORDINATE>?,
                                _ pRegionSize: UnsafePointer<D3D12_TILE_REGION_SIZE>?,
                                _ Flags: D3D12_TILE_MAPPING_FLAGS) throws {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CopyTileMappings(pThis, RawPointer(pDstResource), pDstRegionStartCoordinate, RawPointer(pSrcResource), pSrcRegionStartCoordinate, pRegionSize, Flags)
    }
  }

  public func EndEvent() throws {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.EndEvent(pThis)
    }
  }

  public func ExecuteCommandLists(_ NumCommandLists: UINT, _ ppCommandLists: UnsafePointer<UnsafeMutablePointer<WinSDK.ID3D12CommandList>?>?) throws {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ExecuteCommandLists(pThis, NumCommandLists, ppCommandLists)
    }
  }

  public func GetClockCalibration() throws -> (UINT64, UINT64) {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      var GPUTimeStamp: UINT64 = UINT64()
      var CPUTimeStamp: UINT64 = UINT64()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetClockCalibration(pThis, &GPUTimeStamp, &CPUTimeStamp))
      return (GPUTimeStamp, CPUTimeStamp)
    }
  }

  public func GetDesc() throws -> D3D12_COMMAND_QUEUE_DESC {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      var desc: D3D12_COMMAND_QUEUE_DESC = D3D12_COMMAND_QUEUE_DESC()
      desc = pThis.pointee.lpVtbl.pointee.GetDesc(pThis)
      return desc
    }
  }

  public func GetTimestampFrequency() throws -> UINT64 {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      var Frequency: UINT64 = UINT64()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetTimestampFrequency(pThis, &Frequency))
      return Frequency
    }
  }

  public func SetMarker(_ Metadata: UINT, _ pData: UnsafeRawPointer?, _ Size: UINT) throws {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetMarker(pThis, Metadata, pData, Size)
    }
  }

  public func Signal(_ pFence: ID3D12Fence, _ Value: UINT64) throws {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Signal(pThis, RawPointer(pFence), Value))
    }
  }

  public func UpdateTileMappings(_ pResource: ID3D12Resource?, _ NumResourceRegions: UINT, _ pResourceRegionStartCoordinates: UnsafePointer<D3D12_TILED_RESOURCE_COORDINATE>?, _ pResourceRegionSizes: UnsafePointer<D3D12_TILE_REGION_SIZE>?, _ pHeap: ID3D12Heap?, _ NumRanges: UINT, _ pRangeFlags: UnsafePointer<D3D12_TILE_RANGE_FLAGS>?, _ pHeapRangeStartOffsets: UnsafePointer<UINT>?, _ pRangeTileCounts: UnsafePointer<UINT>?, _ Flags: D3D12_TILE_MAPPING_FLAGS) throws {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.UpdateTileMappings(pThis, RawPointer(pResource), NumResourceRegions, pResourceRegionStartCoordinates, pResourceRegionSizes, RawPointer(pHeap), NumRanges, pRangeFlags, pHeapRangeStartOffsets, pRangeTileCounts, Flags)
    }
  }

  public func Wait(_ pFence: ID3D12Fence?, _ Value: UINT64) throws {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Wait(pThis, RawPointer(pFence), Value))
    }
  }
}

extension ID3D12CommandQueue {
  public func ExecuteCommandLists(_ lists: [SwiftCOM.ID3D12CommandList]) throws {
    var CommandLists: [UnsafeMutablePointer<WinSDK.ID3D12CommandList>?] =
        lists.map { RawPointer($0) }
    try ExecuteCommandLists(UINT(CommandLists.count), &CommandLists)
  }
}

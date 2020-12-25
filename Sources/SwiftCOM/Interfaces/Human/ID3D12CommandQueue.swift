/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class ID3D12CommandQueue: ID3D12Pageable {
  override public class var IID: IID { IID_ID3D12CommandQueue }

  public func BeginEvent(_ Metadata: UINT, _ pData: UnsafeRawPointer, _ Size: UINT) throws {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.BeginEvent(pThis, Metadata, pData, Size)
    }
  }

  public func  CopyTileMappings(_ pDstResource: ID3D12Resource,
                                _ pDstRegionStartCoordinate: D3D12_TILED_RESOURCE_COORDINATE,
                                _ pSrcResource: ID3D12Resource,
                                _ pSrcRegionStartCoordinate: D3D12_TILED_RESOURCE_COORDINATE,
                                _ pRegionSize: D3D12_TILE_REGION_SIZE,
                                _ Flags: D3D12_TILE_MAPPING_FLAGS) throws {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      var pDstRegionStartCoordinate = pDstRegionStartCoordinate
      var pSrcRegionStartCoordinate = pSrcRegionStartCoordinate
      var pRegionSize = pRegionSize
      pThis.pointee.lpVtbl.pointee.CopyTileMappings(pThis, RawPointer(pDstResource), &pDstRegionStartCoordinate, RawPointer(pSrcResource), &pSrcRegionStartCoordinate, &pRegionSize, Flags)
    }
  }

  public func EndEvent() throws {
    return try perform(as: WinSDK.ID3D12CommandQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.EndEvent(pThis)
    }
  }
}

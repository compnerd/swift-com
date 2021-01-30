/**
 * Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class ID3D12GraphicsCommandList: ID3D12CommandList {
  override public class var IID: IID { IID_ID3D12GraphicsCommandList }

  public func BeginEvent(_ Metadata: UINT, _ pData: UnsafeRawPointer?, _ Size: UINT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.BeginEvent(pThis, Metadata, pData, Size)
    }
  }

  public func BeginQuery(_ pQueryHeap: ID3D12QueryHeap, _ Type: D3D12_QUERY_TYPE, Index: UINT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.BeginQuery(pThis, RawPointer(pQueryHeap), Type, Index)
    }
  }

  public func ClearDepthStencilView(_ DepthStencilView: D3D12_CPU_DESCRIPTOR_HANDLE, _ ClearFlags: D3D12_CLEAR_FLAGS, _ Depth: FLOAT, _ Stencil: UINT8, _ NumRects: UINT, _ pRects: UnsafePointer<D3D12_RECT>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ClearDepthStencilView(pThis, DepthStencilView, ClearFlags, Depth, Stencil, NumRects, pRects)
    }
  }

  public func ClearRenderTargetView(_ RenderTargetView: D3D12_CPU_DESCRIPTOR_HANDLE, _ ColorRGBA: (FLOAT, FLOAT, FLOAT, FLOAT), _ NumRects: UINT, _ pRects: UnsafePointer<D3D12_RECT>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      var ColorRGBA = ColorRGBA
      withUnsafeBytes(of: &ColorRGBA) {
        pThis.pointee.lpVtbl.pointee.ClearRenderTargetView(pThis, RenderTargetView, $0.baseAddress!.assumingMemoryBound(to: FLOAT.self), NumRects, pRects)
      }
    }
  }

  public func ClearState(_ pPipelineState: ID3D12PipelineState) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ClearState(pThis, RawPointer(pPipelineState))
    }
  }

  public func ClearUnorderedAccessViewFloat(_ ViewGPUHandleInCurrentHeap: D3D12_GPU_DESCRIPTOR_HANDLE, _ ViewCPUHandle: D3D12_CPU_DESCRIPTOR_HANDLE, _ pResource: ID3D12Resource, _ Values: (FLOAT, FLOAT, FLOAT, FLOAT), _ NumRects: UINT, _ pRects: UnsafePointer<D3D12_RECT>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      var Values = Values
      withUnsafeBytes(of: &Values) {
        pThis.pointee.lpVtbl.pointee.ClearUnorderedAccessViewFloat(pThis, ViewGPUHandleInCurrentHeap, ViewCPUHandle, RawPointer(pResource), $0.baseAddress?.assumingMemoryBound(to: FLOAT.self), NumRects, pRects)
      }
    }
  }

  public func Close() throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Close(pThis))
    }
  }

  public func CopyBufferRegion(_ pDstBuffer: ID3D12Resource, _ DstOffset: UINT64, _ pSrcBuffer: ID3D12Resource, _ SrcOffset: UINT64, _ NumBytes: UINT64) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CopyBufferRegion(pThis, RawPointer(pDstBuffer), DstOffset, RawPointer(pSrcBuffer), SrcOffset, NumBytes)
    }
  }

  public func CopyResource(_ pDstResource: ID3D12Resource, _ pSrcResource: ID3D12Resource) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CopyResource(pThis, RawPointer(pDstResource), RawPointer(pSrcResource))
    }
  }

  public func CopyTextureRegion(_ pDst: UnsafePointer<D3D12_TEXTURE_COPY_LOCATION>?, _ DstX: UINT, _ DstY: UINT, _ DstZ: UINT, _ pSrc: UnsafePointer<D3D12_TEXTURE_COPY_LOCATION>?, _ pSrcBox: UnsafePointer<D3D12_BOX>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CopyTextureRegion(pThis, pDst, DstX, DstY, DstZ, pSrc, pSrcBox)
    }
  }

  public func CopyTiles(_ pTiledResource: ID3D12Resource, _ pTileRegionStartCoordinate: UnsafePointer<D3D12_TILED_RESOURCE_COORDINATE>, _ pTileRegionSize: UnsafePointer<D3D12_TILE_REGION_SIZE>, _ pBuffer: ID3D12Resource, _ BufferStartOffsetInBytes: UINT64, _ Flags: D3D12_TILE_COPY_FLAGS) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CopyTiles(pThis, RawPointer(pTiledResource), pTileRegionStartCoordinate, pTileRegionSize, RawPointer(pBuffer), BufferStartOffsetInBytes, Flags)
    }
  }

  public func DiscardResource(_ pResource: ID3D12Resource, _ pRegion: UnsafePointer<D3D12_DISCARD_REGION>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.DiscardResource(pThis, RawPointer(pResource), pRegion)
    }
  }

  public func Dispatch(_ ThreadGroupCountX: UINT, _ ThreadGroupCountY: UINT, _ ThreadGroupCountZ: UINT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.Dispatch(pThis, ThreadGroupCountX, ThreadGroupCountY, ThreadGroupCountZ)
    }
  }

  public func DrawIndexedInstanced(_ IndexCountPerInstance: UINT, _ InstanceCount: UINT, _ StartIndexLocation: UINT, _ BaseVertexLocation: INT, _ StartInstanceLocation: UINT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.DrawIndexedInstanced(pThis, IndexCountPerInstance, InstanceCount, StartIndexLocation, BaseVertexLocation, StartInstanceLocation)
    }
  }

  public func DrawInstanced(_ VertexCountPerInstance: UINT, _ InstanceCount: UINT, _ StartVertexLocation: UINT, _ StartInstanceLocation: UINT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.DrawInstanced(pThis, VertexCountPerInstance, InstanceCount, StartVertexLocation, StartInstanceLocation)
    }
  }

  public func EndEvent() throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.EndEvent(pThis)
    }
  }

  public func EndQuery(_ pQueryHeap: ID3D12QueryHeap, _ Type: D3D12_QUERY_TYPE, _ Index: UINT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.EndQuery(pThis, RawPointer(pQueryHeap), Type, Index)
    }
  }

  public func ExecuteBundle(_ pCommandList: ID3D12GraphicsCommandList) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ExecuteBundle(pThis, RawPointer(pCommandList))
    }
  }

  public func ExecuteIndirect(_ pCommandSignature: ID3D12CommandSignature, _ MaxCommandCount: UINT, _ pArgumentBuffer: ID3D12Resource, _ ArgumentBufferOffset: UINT64, _ pCountBuffer: ID3D12Resource, _ CountBufferOffset: UINT64) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ExecuteIndirect(pThis, RawPointer(pCommandSignature), MaxCommandCount, RawPointer(pArgumentBuffer), ArgumentBufferOffset, RawPointer(pCountBuffer), CountBufferOffset)
    }
  }

  public func IASetIndexBuffer(_ pView: UnsafePointer<D3D12_INDEX_BUFFER_VIEW>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.IASetIndexBuffer(pThis, pView)
    }
  }

  public func IASetPrimitiveTopology(_ PrimitiveTopology: D3D12_PRIMITIVE_TOPOLOGY) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.IASetPrimitiveTopology(pThis, PrimitiveTopology)
    }
  }

  public func IASetVertexBuffers(_ StartSlot: UINT, _ NumViews: UINT, _ pViews: UnsafePointer<D3D12_VERTEX_BUFFER_VIEW>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.IASetVertexBuffers(pThis, StartSlot, NumViews, pViews)
    }
  }

  public func OMSetBlendFactor(_ BlendFactor: (FLOAT, FLOAT, FLOAT, FLOAT)) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      var BlendFactor = BlendFactor
      withUnsafeBytes(of: &BlendFactor) {
        pThis.pointee.lpVtbl.pointee.OMSetBlendFactor(pThis, $0.baseAddress?.assumingMemoryBound(to: FLOAT.self))
      }
    }
  }

  public func OMSetRenderTargets(_ NumRenderTargetDescriptors: UINT, _ pRenderTargetDescriptors: UnsafePointer<D3D12_CPU_DESCRIPTOR_HANDLE>?, _ RTsSingleHandleToDescriptorRange: WindowsBool, _ pDepthStencilDescriptor: UnsafePointer<D3D12_CPU_DESCRIPTOR_HANDLE>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.OMSetRenderTargets(pThis, NumRenderTargetDescriptors, pRenderTargetDescriptors, RTsSingleHandleToDescriptorRange, pDepthStencilDescriptor)
    }
  }

  public func OMSetStencilRef(_ StencilRef: UINT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.OMSetStencilRef(pThis, StencilRef)
    }
  }

  public func Reset(_ pAllocator: ID3D12CommandAllocator?, _ pInitialState: ID3D12PipelineState?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Reset(pThis, RawPointer(pAllocator), RawPointer(pInitialState)))
    }
  }

  public func ResolveQueryData(_ pQueryHeap: ID3D12QueryHeap, _ Type: D3D12_QUERY_TYPE, _ StartIndex: UINT, _ NumQueries: UINT, _ pDestinationBuffer: ID3D12Resource, _ AlignedDestinationBufferOffset: UINT64) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ResolveQueryData(pThis, RawPointer(pQueryHeap), Type, StartIndex, NumQueries, RawPointer(pDestinationBuffer), AlignedDestinationBufferOffset)
    }
  }

  public func ResolveSubresource(_ pDstResource: ID3D12Resource, _ DstSubresource: UINT, _ pSrcResource: ID3D12Resource, _ SrcSubresource: UINT, _ Format: DXGI_FORMAT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ResolveSubresource(pThis, RawPointer(pDstResource), DstSubresource, RawPointer(pSrcResource), SrcSubresource, Format)
    }
  }

  public func ResourceBarrier(_ NumBarriers: UINT, _ pBarriers: UnsafePointer<D3D12_RESOURCE_BARRIER>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ResourceBarrier(pThis, NumBarriers, pBarriers)
    }
  }

  public func RSSetScissorRects(_ NumRects: UINT, _ pRects: UnsafePointer<D3D12_RECT>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.RSSetScissorRects(pThis, NumRects, pRects)
    }
  }

  public func RSSetViewports(_ NumViewports: UINT, _ pViewports: UnsafePointer<D3D12_VIEWPORT>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.RSSetViewports(pThis, NumViewports, pViewports)
    }
  }

  public func SetComputeRoot32BitConstant(_ RootParameterIndex: UINT, _ SrcData: UINT, _ DestOffsetIn32BitValues: UINT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetComputeRoot32BitConstant(pThis, RootParameterIndex, SrcData, DestOffsetIn32BitValues)
    }
  }

  public func SetComputeRoot32BitConstants(_ RootParameterIndex: UINT, _ Num32BitValuesToSet: UINT, _ pSrcData: UnsafeRawPointer, _ DestOffsetIn32BitValues: UINT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetComputeRoot32BitConstants(pThis, RootParameterIndex, Num32BitValuesToSet, pSrcData, DestOffsetIn32BitValues)
    }
  }

  public func SetComputeRootConstantBufferView(_ RootParameterIndex: UINT, _ BufferLocation: D3D12_GPU_VIRTUAL_ADDRESS) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetComputeRootConstantBufferView(pThis, RootParameterIndex, BufferLocation)
    }
  }

  public func SetComputeRootDescriptorTable(_ RootParameterIndex: UINT, _ BaseDescriptor: D3D12_GPU_DESCRIPTOR_HANDLE) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetComputeRootDescriptorTable(pThis, RootParameterIndex, BaseDescriptor)
    }
  }

  public func SetComputeRootShaderResourceView(_ RootParameterIndex: UINT, _ BufferLocation: D3D12_GPU_VIRTUAL_ADDRESS) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetComputeRootShaderResourceView(pThis, RootParameterIndex, BufferLocation)
    }
  }

  public func SetComputeRootSignature(_ pRootSignature: ID3D12RootSignature) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetComputeRootSignature(pThis, RawPointer(pRootSignature))
    }
  }

  public func SetComputeRootUnorderedAccessView(_ RootParameterIndex: UINT, _ BufferLocation: D3D12_GPU_VIRTUAL_ADDRESS) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetComputeRootUnorderedAccessView(pThis, RootParameterIndex, BufferLocation)
    }
  }

  public func SetDescriptorHeaps(_ NumDescriptorHeaps: UINT, _ ppDescriptorHeaps: UnsafePointer<UnsafeMutablePointer<WinSDK.ID3D12DescriptorHeap>?>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetDescriptorHeaps(pThis, NumDescriptorHeaps, ppDescriptorHeaps)
    }
  }

  public func SetGraphicsRoot32BitConstant(_ RootParameterIndex: UINT, _ SrcData: UINT, _ DestOffsetIn32BitValues: UINT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetGraphicsRoot32BitConstant(pThis, RootParameterIndex, SrcData, DestOffsetIn32BitValues)
    }
  }

  public func SetGraphicsRoot32BitConstants(_ RootParameterIndex: UINT, _ Num32BitValuesToSet: UINT, _ pSrcData: UnsafeRawPointer, _ DestOffsetIn32BitValues: UINT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetGraphicsRoot32BitConstants(pThis, RootParameterIndex, Num32BitValuesToSet, pSrcData, DestOffsetIn32BitValues)
    }
  }

  public func SetGraphicsRootConstantBufferView(_ RootParameterIndex: UINT, _ BufferLocation: D3D12_GPU_VIRTUAL_ADDRESS) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetGraphicsRootConstantBufferView(pThis, RootParameterIndex, BufferLocation)
    }
  }

  public func SetGraphicsRootDescriptorTable(_ RootParameterIndex: UINT, _ BaseDescriptor: D3D12_GPU_DESCRIPTOR_HANDLE) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetGraphicsRootDescriptorTable(pThis, RootParameterIndex, BaseDescriptor)
    }
  }

  public func SetGraphicsRootShaderResourceView(_ RootParameterIndex: UINT, _ BufferLocation: D3D12_GPU_VIRTUAL_ADDRESS) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetGraphicsRootShaderResourceView(pThis, RootParameterIndex, BufferLocation)
    }
  }

  public func SetGraphicsRootSignature(_ pRootSignature: ID3D12RootSignature) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetGraphicsRootSignature(pThis, RawPointer(pRootSignature))
    }
  }

  public func SetGraphicsRootUnorderedAccessView(_ RootParameterIndex: UINT, _ BufferLocation: D3D12_GPU_VIRTUAL_ADDRESS) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetGraphicsRootUnorderedAccessView(pThis, RootParameterIndex, BufferLocation)
    }
  }

  public func SetMarker(_ Metadata: UINT, _ pData: UnsafeRawPointer?, _ Size: UINT) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetMarker(pThis, Metadata, pData, Size)
    }
  }

  public func SetPipelineState(_ pPipelineState: ID3D12PipelineState) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetPipelineState(pThis, RawPointer(pPipelineState))
    }
  }

  public func SetPredication(_ pBuffer: ID3D12Resource, _ AlignedBufferOffset: UINT64, _ Operation: D3D12_PREDICATION_OP) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetPredication(pThis, RawPointer(pBuffer), AlignedBufferOffset, Operation)
    }
  }

  public func SOSetTargets(_ StartSlot: UINT, _ NumViews: UINT, _ pViews: UnsafePointer<D3D12_STREAM_OUTPUT_BUFFER_VIEW>?) throws {
    return try perform(as: WinSDK.ID3D12GraphicsCommandList.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SOSetTargets(pThis, StartSlot, NumViews, pViews)
    }
  }
}

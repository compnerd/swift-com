// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ID3D12Device: ID3D12Object {
  public override class var IID: IID { IID_ID3D12Device }

  public func CheckFeatureSupport(_ Feature: D3D12_FEATURE, _ pFeatureSupportData: UnsafeMutableRawPointer?, _ FeatureSupportDataSize: UINT) throws {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.CheckFeatureSupport(pThis, Feature, pFeatureSupportData, FeatureSupportDataSize))
    }
  }

  public func CopyDescriptors(_ NumDestDescriptorRanges: UINT, _ pDestDescriptorRangeStarts: UnsafePointer<D3D12_CPU_DESCRIPTOR_HANDLE>?, _ pDestDescriptorRangeSizes: UnsafePointer<UINT>?, _ NumSrcDescriptorRanges: UINT, _ pSrcDescriptorRangeStarts: UnsafePointer<D3D12_CPU_DESCRIPTOR_HANDLE>?, _ pSrcDescriptorRangeSizes: UnsafePointer<UINT>?, _ DescriptorHeapsType: D3D12_DESCRIPTOR_HEAP_TYPE) throws {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CopyDescriptors(pThis, NumDestDescriptorRanges, pDestDescriptorRangeStarts, pDestDescriptorRangeSizes, NumSrcDescriptorRanges, pSrcDescriptorRangeStarts, pSrcDescriptorRangeSizes, DescriptorHeapsType)
    }
  }

  public func CopyDescriptorsSimple(_ NumDescriptors: UINT, _ DestDescriptorRangeStart: D3D12_CPU_DESCRIPTOR_HANDLE, _ SrcDescriptorRangeStart: D3D12_CPU_DESCRIPTOR_HANDLE, _ DescriptorHeapsType: D3D12_DESCRIPTOR_HEAP_TYPE) throws {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CopyDescriptorsSimple(pThis, NumDescriptors, DestDescriptorRangeStart, SrcDescriptorRangeStart, DescriptorHeapsType)
    }
  }

  public func CreateCommandAllocator(_ type: D3D12_COMMAND_LIST_TYPE, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pCommandAllocator: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateCommandAllocator(pThis, type, riid, &pCommandAllocator))
      return pCommandAllocator
    }
  }

  public func CreateCommandList(_ nodeMask: UINT, _ type: D3D12_COMMAND_LIST_TYPE, _ pCommandAllocator: ID3D12CommandAllocator?, _ pInitialState: ID3D12PipelineState?, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pCommandList: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateCommandList(pThis, nodeMask, type, RawPointer(pCommandAllocator), RawPointer(pInitialState), riid, &pCommandList))
      return pCommandList
    }
  }

  public func CreateCommandQueue(_ pDesc: UnsafePointer<D3D12_COMMAND_QUEUE_DESC>?, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pCommandQueue: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateCommandQueue(pThis, pDesc, riid, &pCommandQueue))
      return pCommandQueue
    }
  }

  public func CreateCommandSignature(_ pDesc: UnsafePointer<D3D12_COMMAND_SIGNATURE_DESC>?, _ pRootSignature: ID3D12RootSignature, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pCommandSignature: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateCommandSignature(pThis, pDesc, RawPointer(pRootSignature), riid, &pCommandSignature))
      return pCommandSignature
    }
  }

  public func CreateCommittedResource(_ pHeapProperties: UnsafePointer<D3D12_HEAP_PROPERTIES>?, _ HeapFlags: D3D12_HEAP_FLAGS, _ pDesc: UnsafePointer<D3D12_RESOURCE_DESC>?, _ InitialResourceState: D3D12_RESOURCE_STATES, _ pOptimizedClearValue: UnsafePointer<D3D12_CLEAR_VALUE>?, _ riidResource: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pvResource: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateCommittedResource(pThis, pHeapProperties, HeapFlags, pDesc, InitialResourceState, pOptimizedClearValue, riidResource, &pvResource))
      return pvResource
    }
  }

  public func CreateComputePipelineState(_ pDesc: UnsafePointer<D3D12_COMPUTE_PIPELINE_STATE_DESC>?, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pPipelineState: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateComputePipelineState(pThis, pDesc, riid, &pPipelineState))
      return pPipelineState
    }
  }

  public func CreateConstantBufferView(_ pDesc: UnsafePointer<D3D12_CONSTANT_BUFFER_VIEW_DESC>?, _ DestDescriptor: D3D12_CPU_DESCRIPTOR_HANDLE) throws {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CreateConstantBufferView(pThis, pDesc, DestDescriptor)
    }
  }

  public func CreateDepthStencilView(_ pResource: ID3D12Resource?, _ pDesc: UnsafePointer<D3D12_DEPTH_STENCIL_VIEW_DESC>?, _ DestDescriptor: D3D12_CPU_DESCRIPTOR_HANDLE) throws {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CreateDepthStencilView(pThis, RawPointer(pResource), pDesc, DestDescriptor)
    }
  }

  public func CreateDescriptorHeap(_ pDescriptorHeapDesc: UnsafePointer<D3D12_DESCRIPTOR_HEAP_DESC>?, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pvHeap: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateDescriptorHeap(pThis, pDescriptorHeapDesc, riid, &pvHeap))
      return pvHeap
    }
  }

  public func CreateFence(_ InitialValue: UINT64, _ Flags: D3D12_FENCE_FLAGS, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pFence: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateFence(pThis, InitialValue, Flags, riid, &pFence))
      return pFence
    }
  }

  public func CreateGraphicsPipelineState(_ pDesc: UnsafePointer<D3D12_GRAPHICS_PIPELINE_STATE_DESC>?, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pPipelineState: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateGraphicsPipelineState(pThis, pDesc, riid, &pPipelineState))
      return pPipelineState
    }
  }

  public func CreateHeap(_ pDesc: UnsafePointer<D3D12_HEAP_DESC>?, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pvHeap: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateHeap(pThis, pDesc, riid, &pvHeap))
      return pvHeap
    }
  }

  public func CreatePlacedResource(_ pHeap: ID3D12Heap?, _ HeapOffset: UINT64, _ pDesc: UnsafePointer<D3D12_RESOURCE_DESC>?, _ InitialState: D3D12_RESOURCE_STATES, _ pOptimizedClearValue: UnsafePointer<D3D12_CLEAR_VALUE>?, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pvResource: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreatePlacedResource(pThis, RawPointer(pHeap), HeapOffset, pDesc, InitialState, pOptimizedClearValue, riid, &pvResource))
      return pvResource
    }
  }

  public func CreateQueryHeap(_ pDesc: UnsafePointer<D3D12_QUERY_HEAP_DESC>?, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pvHeap: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateQueryHeap(pThis, pDesc, riid, &pvHeap))
      return pvHeap
    }
  }

  public func CreateRenderTargetView(_ pResource: ID3D12Resource?, _ pDesc: UnsafePointer<D3D12_RENDER_TARGET_VIEW_DESC>?, _ DestDescriptor: D3D12_CPU_DESCRIPTOR_HANDLE) throws {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CreateRenderTargetView(pThis, RawPointer(pResource), pDesc, DestDescriptor)
    }
  }

  public func CreateReservedResource(_ pDesc: UnsafePointer<D3D12_RESOURCE_DESC>?, _ InitialState: D3D12_RESOURCE_STATES, _ pOptimizedClearValue: UnsafePointer<D3D12_CLEAR_VALUE>?, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pvResource: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateReservedResource(pThis, pDesc, InitialState, pOptimizedClearValue, riid, &pvResource))
      return pvResource
    }
  }

  public func CreateRootSignature(_ nodeMask: UINT, _ pBlobWithRootSignature: UnsafeRawPointer?, _ blobLengthInBytes: SIZE_T, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pvRootSignature: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateRootSignature(pThis, nodeMask, pBlobWithRootSignature, blobLengthInBytes, riid, &pvRootSignature))
      return pvRootSignature
    }
  }

  public func CreateSampler(_ pDesc: UnsafePointer<D3D12_SAMPLER_DESC>?, _ DestDescriptor: D3D12_CPU_DESCRIPTOR_HANDLE) throws {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CreateSampler(pThis, pDesc, DestDescriptor)
    }
  }

  public func CreateShaderResourceView(_ pResource: ID3D12Resource?, _ pDesc: UnsafePointer<D3D12_SHADER_RESOURCE_VIEW_DESC>?, _ DestDescriptor: D3D12_CPU_DESCRIPTOR_HANDLE) throws {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CreateShaderResourceView(pThis, RawPointer(pResource), pDesc, DestDescriptor)
    }
  }

  public func CreateSharedHandle(_ pObject: ID3D12DeviceChild?, _ pAttributes: UnsafePointer<SECURITY_ATTRIBUTES>?, _ Access: DWORD, _ Name: [WCHAR]) throws -> HANDLE? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var Handle: HANDLE?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateSharedHandle(pThis, RawPointer(pObject), pAttributes, Access, Name, &Handle))
      return Handle
    }
  }

  public func CreateUnorderedAccessView(_ pResource: ID3D12Resource?, _ pCounterResource: ID3D12Resource?, _ pDesc: UnsafePointer<D3D12_UNORDERED_ACCESS_VIEW_DESC>?, _ DestDescriptor: D3D12_CPU_DESCRIPTOR_HANDLE) throws {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      pThis.pointee.lpVtbl.pointee.CreateUnorderedAccessView(pThis, RawPointer(pResource), RawPointer(pCounterResource), pDesc, DestDescriptor)
    }
  }

  public func Evict(_ NumObjects: UINT, _ pObjects: UnsafePointer<UnsafeMutablePointer<WinSDK.ID3D12Pageable>?>?) throws {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Evict(pThis, NumObjects, pObjects))
    }
  }

  public func GetAdapterLuid() throws -> LUID {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var luid: LUID = LUID()
      luid = pThis.pointee.lpVtbl.pointee.GetAdapterLuid(pThis)
      return luid
    }
  }

  public func GetCopyableFootprints(_ pResourceDesc: UnsafePointer<D3D12_RESOURCE_DESC>?, _ FirstSubresource: UINT, _ NumSubresources: UINT, _ BaseOffset: UINT64) throws -> (D3D12_PLACED_SUBRESOURCE_FOOTPRINT, UINT, UINT64, UINT64) {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var Layouts: D3D12_PLACED_SUBRESOURCE_FOOTPRINT = D3D12_PLACED_SUBRESOURCE_FOOTPRINT()
      var NumRows: UINT = UINT()
      var RowSizeInBytes: UINT64 = UINT64()
      var TotalBytes: UINT64 = UINT64()
      pThis.pointee.lpVtbl.pointee.GetCopyableFootprints(pThis, pResourceDesc, FirstSubresource, NumSubresources, BaseOffset, &Layouts, &NumRows, &RowSizeInBytes, &TotalBytes)
      return (Layouts, NumRows, RowSizeInBytes, TotalBytes)
    }
  }

  public func GetCustomHeapProperties(_ nodeMask: UINT, _ heapType: D3D12_HEAP_TYPE) throws -> D3D12_HEAP_PROPERTIES {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var properties: D3D12_HEAP_PROPERTIES = D3D12_HEAP_PROPERTIES()
      properties = pThis.pointee.lpVtbl.pointee.GetCustomHeapProperties(pThis, nodeMask, heapType)
      return properties
    }
  }

  public func GetDescriptorHandleIncrementSize(_ DescriptorHeapType: D3D12_DESCRIPTOR_HEAP_TYPE) throws -> UINT {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetDescriptorHandleIncrementSize(pThis, DescriptorHeapType)
    }
  }

  public func GetDeviceRemovedReason() throws -> HRESULT {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetDeviceRemovedReason(pThis)
    }
  }

  public func GetNodeCount() throws -> UINT {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetNodeCount(pThis)
    }
  }

  public func GetResourceAllocationInfo(_ visibleMask: UINT, numResourceDescs: UINT, _ pResourceDescs: UnsafePointer<D3D12_RESOURCE_DESC>?) throws -> D3D12_RESOURCE_ALLOCATION_INFO {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var info: D3D12_RESOURCE_ALLOCATION_INFO = D3D12_RESOURCE_ALLOCATION_INFO()
      info = pThis.pointee.lpVtbl.pointee.GetResourceAllocationInfo(pThis, visibleMask, numResourceDescs, pResourceDescs)
      return info
    }
  }

  public func GetResourceTiling(_ pTiledResource: ID3D12Resource?, _ FirstSubresourceTitlingToGet: UINT) throws -> (UINT, D3D12_PACKED_MIP_INFO, D3D12_TILE_SHAPE, UINT, D3D12_SUBRESOURCE_TILING) {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var NumTilesForEntireResource: UINT = UINT()
      var PackedMipDesc: D3D12_PACKED_MIP_INFO = D3D12_PACKED_MIP_INFO()
      var StandardTileShapeForNonPackedMips: D3D12_TILE_SHAPE = D3D12_TILE_SHAPE()
      var NumSubresourceTilings: UINT = UINT()
      var SubresourceTilingsForNonPackedMips: D3D12_SUBRESOURCE_TILING = D3D12_SUBRESOURCE_TILING()
      pThis.pointee.lpVtbl.pointee.GetResourceTiling(pThis, RawPointer(pTiledResource), &NumTilesForEntireResource, &PackedMipDesc, &StandardTileShapeForNonPackedMips, &NumSubresourceTilings, FirstSubresourceTitlingToGet, &SubresourceTilingsForNonPackedMips)
      return (NumTilesForEntireResource, PackedMipDesc, StandardTileShapeForNonPackedMips, NumSubresourceTilings, SubresourceTilingsForNonPackedMips)
    }
  }

  public func MakeResident(_ NumObjects: UINT, _ ppObjects: UnsafePointer<UnsafeMutablePointer<WinSDK.ID3D12Pageable>?>?) throws {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.MakeResident(pThis, NumObjects, ppObjects))
    }
  }

  public func OpenSharedHandle(_ NTHandle: HANDLE, _ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var pvObj: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.OpenSharedHandle(pThis, NTHandle, riid, &pvObj))
      return pvObj
    }
  }

  public func OpenSharedHandleByName(_ Name: [WCHAR], _ Access: DWORD) throws -> HANDLE? {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      var NTHandle: HANDLE?
      try CHECKED(pThis.pointee.lpVtbl.pointee.OpenSharedHandleByName(pThis, Name, Access, &NTHandle))
      return NTHandle
    }
  }

  public func SetStablePowerState(_ Enable: WindowsBool) throws {
    return try perform(as: WinSDK.ID3D12Device.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetStablePowerState(pThis, Enable))
    }
  }
}

extension ID3D12Device {
  public func CreateCommandAllocator<CommandAllocator: IUnknown>(_ type: D3D12_COMMAND_LIST_TYPE) throws -> CommandAllocator {
    var iid: IID = CommandAllocator.IID
    return try CommandAllocator(pUnk: CreateCommandAllocator(type, &iid))
  }

  public func CreateCommandQueue<CommandQueue: IUnknown>(_ description: D3D12_COMMAND_QUEUE_DESC) throws -> CommandQueue {
    var iid: IID = CommandQueue.IID
    var Desc: D3D12_COMMAND_QUEUE_DESC = description
    return try CommandQueue(pUnk: CreateCommandQueue(&Desc, &iid))
  }

  public func CreateDescriptorHeap<DescriptorHeap: IUnknown>(_ description: D3D12_DESCRIPTOR_HEAP_DESC) throws -> DescriptorHeap {
    var iid: IID = DescriptorHeap.IID
    var Desc: D3D12_DESCRIPTOR_HEAP_DESC = description
    return try DescriptorHeap(pUnk: CreateDescriptorHeap(&Desc, &iid))
  }

  public func CreateRootSignature<RootSignature: IUnknown>(_ nodeMask: UINT, _ pBlobWithRootSignature: UnsafeRawPointer?, _ blobLengthInBytes: SIZE_T) throws -> RootSignature {
    var iid: IID = RootSignature.IID
    return try RootSignature(pUnk: CreateRootSignature(nodeMask, pBlobWithRootSignature, blobLengthInBytes, &iid))
  }

  public func CreateCommandList<CommandList: IUnknown>(_ nodeMask: UINT, _ type: D3D12_COMMAND_LIST_TYPE, _ pCommandAllocator: ID3D12CommandAllocator?, _ pInitialState: ID3D12PipelineState?) throws -> CommandList {
    var iid: IID = CommandList.IID
    return try CommandList(pUnk: CreateCommandList(nodeMask, type, pCommandAllocator, pInitialState, &iid))
  }

  public func CreateFence<Fence: IUnknown>(_ InitialValue: UINT64, _ Flags: D3D12_FENCE_FLAGS) throws -> Fence {
    var iid: IID = Fence.IID
    return try Fence(pUnk: CreateFence(InitialValue, Flags, &iid))
  }

  public func CreateCommittedResource<Resource: IUnknown>(_ HeapProperties: D3D12_HEAP_PROPERTIES?,
                                      _ HeapFlags: D3D12_HEAP_FLAGS,
                                      _ Desc: D3D12_RESOURCE_DESC?,
                                      _ InitialResourceState: D3D12_RESOURCE_STATES,
                                      _ OptimizedClearValue: D3D12_CLEAR_VALUE?) throws -> Resource {
    var iid: IID = Resource.IID
    return try withUnsafeNullablePointer(to: HeapProperties) { pHeapProperties in
      return try withUnsafeNullablePointer(to: Desc) { pDesc in
        return try withUnsafeNullablePointer(to: OptimizedClearValue) { pOptimizedClearValue in
          return try Resource(pUnk: CreateCommittedResource(pHeapProperties, HeapFlags, pDesc, InitialResourceState, pOptimizedClearValue, &iid))
        }
      }
    }
  }

  public func CreateDepthStencilView(_ pResource: ID3D12Resource?,
                                     _ Desc: D3D12_DEPTH_STENCIL_VIEW_DESC,
                                     _ DestDescriptor: D3D12_CPU_DESCRIPTOR_HANDLE) throws {
    try withUnsafeNullablePointer(to: Desc) { pDesc in
      try CreateDepthStencilView(pResource, pDesc, DestDescriptor)
    }
  }


  public func CreateGraphicsPipelineState<PSO: IUnknown>(_ Desc: D3D12_GRAPHICS_PIPELINE_STATE_DESC) throws -> PSO {
    var Desc = Desc
    var iid: IID = PSO.IID
    return try PSO(pUnk: CreateGraphicsPipelineState(&Desc, &iid))
  }

  public func CreateConstantBufferView(_ Desc: D3D12_CONSTANT_BUFFER_VIEW_DESC, _ DestDescriptor: D3D12_CPU_DESCRIPTOR_HANDLE) throws {
    var Desc = Desc
    return try CreateConstantBufferView(&Desc, DestDescriptor)
  }

  public func CheckFeatureSupport<ResultType>(_ Feature: D3D12_FEATURE) throws -> ResultType {
    var result: ResultType!
    try CheckFeatureSupport(Feature, &result, UINT(MemoryLayout<ResultType>.size))
    return result
  }

  public func CheckFeatureSupport<ResultType>(_ Feature: D3D12_FEATURE, _ Result: inout ResultType) throws {
    try CheckFeatureSupport(Feature, &Result, UINT(MemoryLayout.size(ofValue: Result)))
  }
}

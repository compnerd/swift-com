// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ID3D12DescriptorHeap: ID3D12Pageable {
  override public class var IID: IID { IID_ID3D12DescriptorHeap }

  public func GetCPUDescriptorHandleForHeapStart() throws
      -> D3D12_CPU_DESCRIPTOR_HANDLE {
    return try perform(as: WinSDK.ID3D12DescriptorHeap.self) { pThis in
      var hDescriptor: D3D12_CPU_DESCRIPTOR_HANDLE = D3D12_CPU_DESCRIPTOR_HANDLE()

      // NOTE(compnerd) workaround the signature mismatch in the header:
      // The headers declares the signature as:
      //
      // D3D12_CPU_DESCRIPTOR_HANDLE (STDMETHODCALLTYPE *GetCPUDescriptorHandleForHeapStart)(ID3D12DescriptorHeap * This);
      //
      // However, this results in a runtime failure, with an unexpected
      // dereference of a second paramter.  The C++ implementation of
      // `ID3D12DescriptionHeap` performs NVRO, and so we must change the
      // signature in order to match the ABI.  The correct signature is:
      //
      // void (STDMETHODCALLTYPE *GetCPUDescriptorHandleForHeapStart)(ID3D12DescriptorHeap *This, D3D12_CPU_DESCRIPTOR_HANDLE *pOut);
      typealias GetCPUDescriptorHandleForHeapStartABI = @convention(c) (UnsafeMutablePointer<WinSDK.ID3D12DescriptorHeap>?, UnsafeMutablePointer<D3D12_CPU_DESCRIPTOR_HANDLE >?) -> Void
      let pGetCPUDescriptorHandleForHeapStart: GetCPUDescriptorHandleForHeapStartABI =
          unsafeBitCast(pThis.pointee.lpVtbl.pointee.GetCPUDescriptorHandleForHeapStart,
                        to: GetCPUDescriptorHandleForHeapStartABI.self)
      pGetCPUDescriptorHandleForHeapStart(pThis, &hDescriptor)

      return hDescriptor
    }
  }

  public func GetDesc() throws -> D3D12_DESCRIPTOR_HEAP_DESC {
    return try perform(as: WinSDK.ID3D12DescriptorHeap.self) { pThis in
      var desc: D3D12_DESCRIPTOR_HEAP_DESC = D3D12_DESCRIPTOR_HEAP_DESC()
      desc = pThis.pointee.lpVtbl.pointee.GetDesc(pThis)
      return desc
    }
  }

  public func GetGPUDescriptorHandleForHeapStart() throws
      -> D3D12_GPU_DESCRIPTOR_HANDLE {
    return try perform(as: WinSDK.ID3D12DescriptorHeap.self) { pThis in
      var hDescriptor: D3D12_GPU_DESCRIPTOR_HANDLE = D3D12_GPU_DESCRIPTOR_HANDLE()

      // NOTE(compnerd) workaround the signature mismatch in the header:
      // The headers declares the signature as:
      //
      // D3D12_GPU_DESCRIPTOR_HANDLE (STDMETHODCALLTYPE *GetGPUDescriptorHandleForHeapStart)(ID3D12DescriptorHeap * This);
      //
      // However, this results in a runtime failure, with an unexpected
      // dereference of a second paramter.  The C++ implementation of
      // `ID3D12DescriptionHeap` performs NVRO, and so we must change the
      // signature in order to match the ABI.  The correct signature is:
      //
      // void (STDMETHODCALLTYPE *GetGPUDescriptorHandleForHeapStart)(ID3D12DescriptorHeap *This, D3D12_GPU_DESCRIPTOR_HANDLE *pOut);
      typealias GetGPUDescriptorHandleForHeapStartABI = @convention(c)
      (UnsafeMutablePointer<WinSDK.ID3D12DescriptorHeap>?, UnsafeMutablePointer<D3D12_GPU_DESCRIPTOR_HANDLE>?) -> Void
      let pGetGPUDescriptorHandleForHeapStart: GetGPUDescriptorHandleForHeapStartABI =
          unsafeBitCast(pThis.pointee.lpVtbl.pointee.GetGPUDescriptorHandleForHeapStart,
                        to: GetGPUDescriptorHandleForHeapStartABI.self)
      pGetGPUDescriptorHandleForHeapStart(pThis, &hDescriptor)

      return hDescriptor
    }
  }
}

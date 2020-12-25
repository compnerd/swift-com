/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK
import WinSDK.DirectX

public class ID3D12VersionedRootSignatureDeserializer: IUnknown {
  override public class var IID: IID { IID_ID3D12VersionedRootSignatureDeserializer }

  public func GetRootSignatureDescAtVersion(_ convertToVersion: D3D_ROOT_SIGNATURE_VERSION)
      throws -> UnsafePointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>? {
    return try perform(as: WinSDK.ID3D12VersionedRootSignatureDeserializer.self) { pThis in
      var pDesc: UnsafePointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetRootSignatureDescAtVersion(pThis, convertToVersion, &pDesc))
      return pDesc
    }
  }

  public func GetUnconvertedRootSignatureDesc() throws
      -> UnsafePointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>? {
    return try perform(as: WinSDK.ID3D12VersionedRootSignatureDeserializer.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetUnconvertedRootSignatureDesc(pThis)
    }
  }
}

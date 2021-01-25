/**
 * Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public func D3D12CreateDevice<Device: IUnknown>(
    _ pAdapter: IUnknown?, _ MinimumFeatureLevel: D3D_FEATURE_LEVEL
) throws -> Device {
  var iid: IID = Device.IID
  var pDevice: UnsafeMutableRawPointer?
  try CHECKED(D3D12CreateDevice(RawPointer(pAdapter), MinimumFeatureLevel, &iid,
                                &pDevice))
  return Device(pUnk: pDevice)
}

public func D3D12GetDebugInterface<DebugInterface: IUnknown>()
    throws -> DebugInterface {
  var iid: IID = DebugInterface.IID
  var pvDebug: UnsafeMutableRawPointer?
  try CHECKED(D3D12GetDebugInterface(&iid, &pvDebug))
  return DebugInterface(pUnk: pvDebug)
}

public func D3D12SerializeRootSignature(
    _ RootSignature: D3D12_ROOT_SIGNATURE_DESC,
    _ Version: D3D_ROOT_SIGNATURE_VERSION
) throws -> (ID3DBlob, ID3DBlob?) {
  var pBlob: UnsafeMutablePointer<WinSDK.ID3DBlob>?
  var pErrorBlob: UnsafeMutablePointer<WinSDK.ID3DBlob>?
  var RootSignature = RootSignature
  try CHECKED(D3D12SerializeRootSignature(&RootSignature, Version,
                                          &pBlob, &pErrorBlob))
  if let pErrorBlob = pErrorBlob {
    return (ID3DBlob(pUnk: pBlob), ID3DBlob(pUnk: pErrorBlob))
  }
  return (ID3DBlob(pUnk: pBlob), nil)
}

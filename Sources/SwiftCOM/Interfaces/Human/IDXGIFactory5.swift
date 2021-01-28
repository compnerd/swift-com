/**
 * Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IDXGIFactory5: IDXGIFactory4 {
  override public class var IID: IID { IID_IDXGIFactory5 }

  public func CheckFeatureSupport(_ Feature: DXGI_FEATURE, _ pFeatureSupportData: UnsafeMutableRawPointer?, _ FeatureSupportDataSize: UINT) throws {
    return try perform(as: WinSDK.IDXGIFactory5.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.CheckFeatureSupport(pThis, Feature, pFeatureSupportData, FeatureSupportDataSize))
    }
  }
}

extension IDXGIFactory5 {
  public func CheckFeatureSupport<ResultType>(_ Feature: DXGI_FEATURE) throws -> ResultType {
    return try perform(as: WinSDK.IDXGIFactory5.self) { pThis in
      var result: ResultType!
      try CheckFeatureSupport(Feature, &result, UINT(MemoryLayout<ResultType>.size))
      return result
    }
  }
}

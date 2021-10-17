// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ID3DBlob: IUnknown {
  override public class var IID: IID { IID_ID3D10Blob }

  public func GetBufferPointer() throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3DBlob.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetBufferPointer(pThis)
    }
  }

  public func GetBufferSize() throws -> SIZE_T {
    return try perform(as: WinSDK.ID3DBlob.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetBufferSize(pThis)
    }
  }
}

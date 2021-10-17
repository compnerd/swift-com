// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ID3D12DeviceChild: ID3D12Object {
  public override class var IID: IID { IID_ID3D12DeviceChild }

  public func GetDevice(_ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.ID3D12DeviceChild.self) { pThis in
      var ppvDevice: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDevice(pThis, riid, &ppvDevice))
      return ppvDevice
    }
  }
}

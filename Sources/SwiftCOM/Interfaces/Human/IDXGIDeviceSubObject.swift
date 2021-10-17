// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGIDeviceSubObject: IDXGIObject {
  override public class var IID: IID { IID_IDXGIDeviceSubObject }

  public func GetDevice(_ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.IDXGIDeviceSubObject.self) { pThis in
      var pDevice: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDevice(pThis, riid, &pDevice))
      return pDevice
    }
  }
}

extension IDXGIDeviceSubObject {
  public func GetDevice<Device: IUnknown>() throws -> Device {
    var iid: IID = Device.IID
    return try Device(pUnk: GetDevice(&iid))
  }
}

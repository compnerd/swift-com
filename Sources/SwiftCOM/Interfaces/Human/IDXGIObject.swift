// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGIObject: IUnknown {
  override public class var IID: IID { IID_IDXGIObject }

  public func GetParent(_ riid: REFIID) throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.IDXGIObject.self) { pThis in
      var pParent: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetParent(pThis, riid, &pParent))
      return pParent
    }
  }

  public func GetPrivateData(_ Name: REFGUID, _ pDataSize: inout UINT, _ pData: inout UnsafeMutableRawPointer) throws {
    return try perform(as: WinSDK.IDXGIObject.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetPrivateData(pThis, Name, &pDataSize, pData))
    }
  }

  public func SetPrivateData(_ Name: REFGUID, _ DataSize: UINT, _ pData: UnsafeRawPointer?) throws {
    return try perform(as: WinSDK.IDXGIObject.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetPrivateData(pThis, Name, DataSize, pData))
    }
  }

  public func SetPrivateDataInterface(_ Name: REFGUID, _ pData: IUnknown?) throws {
    return try perform(as: WinSDK.IDXGIObject.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetPrivateDataInterface(pThis, Name, RawPointer(pData)))
    }
  }
}

extension IDXGIObject {
  public func GetParent<Interface: IUnknown>() throws -> Interface {
    return try perform(as: WinSDK.IDXGIObject.self) { pThis in
      var iid: IID = Interface.IID

      var pParent: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetParent(pThis, &iid, &pParent))
      return Interface(pUnk: pParent)
    }
  }
}

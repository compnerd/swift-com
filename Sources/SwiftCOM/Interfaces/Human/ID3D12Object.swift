/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class ID3D12Object: IUnknown {
  public override class var IID: IID { IID_ID3D12Object }

  public func GetPrivateData(_ guid: REFGUID, _ DataSize: inout UINT,
                             _ pData: inout UnsafeMutableRawPointer) throws {
    return try perform(as: WinSDK.ID3D12Object.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetPrivateData(pThis, guid, &DataSize, &pData))
    }
  }

  public func SetName(_ Name: String) throws {
    _ = try perform(as: WinSDK.ID3D12Object.self) { pThis in
      try Name.withCString(encodedAs: UTF16.self) {
        try CHECKED(pThis.pointee.lpVtbl.pointee.SetName(pThis, $0))
      }
    }
  }

  public func SetPrivateData(_ guid: REFGUID, _ DataSize: UINT,
                             _ pData: UnsafeRawPointer?) throws {
    return try perform(as: WinSDK.ID3D12Object.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetPrivateData(pThis, guid, DataSize, pData))
    }
  }

  public func SetPrivateDataInterface(_ guid: REFGUID,
                                      _ pData: IUnknown?) throws {
    return try perform(as: WinSDK.ID3D12Object.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetPrivateDataInterface(pThis, guid, pData?.pUnk))
    }
  }
}

extension ID3D12Object {
  public func SetPrivateData(_ guid: REFGUID,
                             _ pData: UnsafeRawBufferPointer?) throws {
    try self.SetPrivateData(guid, UINT(pData?.count ?? 0), pData?.baseAddress)
  }
}

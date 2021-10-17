// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IPortableDeviceValuesCollection: IUnknown {
  override public class var IID: IID { IID_IPortableDeviceValuesCollection }

  public func Add(_ pValues: IPortableDeviceValues) throws {
    return try perform(as: WinSDK.IPortableDeviceValuesCollection.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Add(pThis, RawPointer(pValues)))
    }
  }

  public func Clear() throws {
    return try perform(as: WinSDK.IPortableDeviceValuesCollection.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Clear(pThis))
    }
  }

  public func GetAt(_ dwIndex: DWORD) throws -> IPortableDeviceValues {
    return try perform(as: WinSDK.IPortableDeviceValuesCollection.self) { pThis in
      var pValues: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetAt(pThis, dwIndex, &pValues))
      return IPortableDeviceValues(pUnk: pValues)
    }
  }

  public func GetCount() throws -> DWORD {
    return try perform(as: WinSDK.IPortableDeviceValuesCollection.self) { pThis in
      var cElems: DWORD = DWORD(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetCount(pThis, &cElems))
      return cElems
    }
  }

  public func RemoveAt(_ dwIndex: DWORD) throws {
    return try perform(as: WinSDK.IPortableDeviceValuesCollection.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.RemoveAt(pThis, dwIndex))
    }
  }
}

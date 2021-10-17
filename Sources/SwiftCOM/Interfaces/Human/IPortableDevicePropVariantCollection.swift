// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IPortableDevicePropVariantCollection: IUnknown {
  override public class var IID: IID { IID_IPortableDevicePropVariantCollection }

  public func Add(_ value: PROPVARIANT) throws {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      var value = value
      try CHECKED {
        withUnsafePointer(to: &value) {
          pThis.pointee.lpVtbl.pointee.Add(pThis, $0)
        }
      }
    }
  }

  public func ChangeType(_ vt: VARTYPE) throws {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ChangeType(pThis, vt))
    }
  }

  public func Clear() throws {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Clear(pThis))
    }
  }

  public func GetAt(_ dwIndex: DWORD) throws -> PROPVARIANT {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      var Value: PROPVARIANT = PROPVARIANT()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetAt(pThis, dwIndex, &Value))
      return Value
    }
  }

  public func GetCount() throws -> DWORD {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      var cElems: DWORD = DWORD(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetCount(pThis, &cElems))
      return cElems
    }
  }

  public func GetType() throws -> VARTYPE {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      var vt: VARTYPE = VARTYPE()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetType(pThis, &vt))
      return vt
    }
  }

  public func RemoveAt(_ dwIndex: DWORD) throws {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.RemoveAt(pThis, dwIndex))
    }
  }
}

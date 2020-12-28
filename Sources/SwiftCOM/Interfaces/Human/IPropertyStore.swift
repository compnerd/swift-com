/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IPropertyStore: IUnknown {
  override public class var IID: IID { IID_IPropertyStore }

  public func Commit() throws {
    return try perform(as: WinSDK.IPropertyStore.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Commit(pThis))
    }
  }

  public func GetAt(_ iProp: DWORD) throws -> PROPERTYKEY {
    return try perform(as: WinSDK.IPropertyStore.self) { pThis in
      var Key: PROPERTYKEY = PROPERTYKEY()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetAt(pThis, iProp, &Key))
      return Key
    }
  }

  public func GetCount() throws -> DWORD {
    return try perform(as: WinSDK.IPropertyStore.self) { pThis in
      var cProps: DWORD = DWORD(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetCount(pThis, &cProps))
      return cProps
    }
  }

  public func GetValue(_ key: REFPROPERTYKEY) throws -> PROPVARIANT {
    return try perform(as: WinSDK.IPropertyStore.self) { pThis in
      var v: PROPVARIANT = PROPVARIANT()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetValue(pThis, key, &v))
      return v
    }
  }

  public func GetValue(_ key: REFPROPERTYKEY, _ propvar: REFPROPVARIANT) throws {
    return try perform(as: WinSDK.IPropertyStore.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetValue(pThis, key, propvar))
    }
  }
}

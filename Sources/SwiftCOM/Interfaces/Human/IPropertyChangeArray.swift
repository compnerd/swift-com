/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IPropertyChangeArray: IUnknown {
  override public class var IID: IID { IID_IPropertyChangeArray }

  public func Append(_ ppropChange: IPropertyChange) throws {
    return try perform(as: WinSDK.IPropertyChangeArray.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Append(pThis, RawPointer(ppropChange)))
    }
  }

  public func AppendOrReplace(_ ppropChange: IPropertyChange) throws {
    return try perform(as: WinSDK.IPropertyChangeArray.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.AppendOrReplace(pThis, RawPointer(ppropChange)))
    }
  }

  public func GetAt(_ iIndex: UINT, _ riid: inout IID)
      throws -> IUnknown {
    return try perform(as: WinSDK.IPropertyChangeArray.self) { pThis in
      var pv: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetAt(pThis, iIndex, &riid, &pv))
      return IUnknown(pUnk: pv)
    }
  }

  public func GetCount() throws -> UINT {
    return try perform(as: WinSDK.IPropertyChangeArray.self) { pThis in
      var cOperations: UINT = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetCount(pThis, &cOperations))
      return cOperations
    }
  }

  public func InsertAt(_ iIndex: UINT, _ ppropChange: IPropertyChange) throws {
    return try perform(as: WinSDK.IPropertyChangeArray.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.InsertAt(pThis, iIndex, RawPointer(ppropChange)))
    }
  }

  public func IsKeyInArray(_ key: REFPROPERTYKEY) throws -> Bool {
    return try perform(as: WinSDK.IPropertyChangeArray.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.IsKeyInArray(pThis, key)
      switch hr {
      case S_OK: return true
      case E_FAIL: return false
      default: throw COMError(hr: hr)
      }
    }
  }

  public func RemoveAt(_ iIndex: UINT) throws {
    return try perform(as: WinSDK.IPropertyChangeArray.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.RemoveAt(pThis, iIndex))
    }
  }
}

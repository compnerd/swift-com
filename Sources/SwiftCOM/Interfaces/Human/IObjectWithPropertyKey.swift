/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IObjectWithPropertyKey: IUnknown {
  override public class var IID: IID { IID_IObjectWithPropertyKey }

  public func GetPropertyKey() throws -> PROPERTYKEY {
    return try perform(as: WinSDK.IObjectWithPropertyKey.self) { pThis in
      var key: PROPERTYKEY = PROPERTYKEY()
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetPropertyKey(pThis, &key)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return key
    }
  }

  public func SetPropertyKey(_ key: REFPROPERTYKEY) throws {
    return try perform(as: WinSDK.IObjectWithPropertyKey.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.SetPropertyKey(pThis, key)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }
}

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
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IObjectWithPropertyKey.self, capacity: 1)

    var key: PROPERTYKEY = PROPERTYKEY()
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetPropertyKey(pThis, &key)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return key
  }

  public func SetPropertyKey(_ key: REFPROPERTYKEY) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IObjectWithPropertyKey.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.SetPropertyKey(pThis, key)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

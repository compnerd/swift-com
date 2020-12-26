/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IPortableDeviceKeyCollection: IUnknown {
  override public class var IID: IID { IID_IPortableDeviceKeyCollection }

  public func Add(_ Key: REFPROPERTYKEY) throws {
    return try perform(as: WinSDK.IPortableDeviceKeyCollection.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Add(pThis, Key)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func Clear() throws {
    return try perform(as: WinSDK.IPortableDeviceKeyCollection.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Clear(pThis)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func GetAt(_ dwIndex: DWORD) throws -> PROPERTYKEY {
    return try perform(as: WinSDK.IPortableDeviceKeyCollection.self) { pThis in
      var Key: PROPERTYKEY = PROPERTYKEY()
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetAt(pThis, dwIndex, &Key)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return Key
    }
  }

  public func GetCount() throws -> DWORD {
    return try perform(as: WinSDK.IPortableDeviceKeyCollection.self) { pThis in
      var cElems: DWORD = DWORD(0)
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetCount(pThis, &cElems)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return cElems
    }
  }

  public func RemoveAt(_ dwIndex: DWORD) throws {
    return try perform(as: WinSDK.IPortableDeviceKeyCollection.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.RemoveAt(pThis, dwIndex)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }
}

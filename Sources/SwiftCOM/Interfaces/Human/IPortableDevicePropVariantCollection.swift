/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IPortableDevicePropVariantCollection: IUnknown {
  override public class var IID: IID { IID_IPortableDevicePropVariantCollection }

  public func Add(_ value: PROPVARIANT) throws {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      var value = value
      let hr: HRESULT = withUnsafePointer(to: &value) {
        pThis.pointee.lpVtbl.pointee.Add(pThis, $0)
      }
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func ChangeType(_ vt: VARTYPE) throws {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.ChangeType(pThis, vt)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func Clear() throws {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Clear(pThis)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func GetAt(_ dwIndex: DWORD) throws -> PROPVARIANT {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      var Value: PROPVARIANT = PROPVARIANT()
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetAt(pThis, dwIndex, &Value)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return Value
    }
  }

  public func GetCount() throws -> DWORD {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      var cElems: DWORD = DWORD(0)
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetCount(pThis, &cElems)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return cElems
    }
  }

  public func GetType() throws -> VARTYPE {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      var vt: VARTYPE = VARTYPE()
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetType(pThis, &vt)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return vt
    }
  }

  public func RemoveAt(_ dwIndex: DWORD) throws {
    return try perform(as: WinSDK.IPortableDevicePropVariantCollection.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.RemoveAt(pThis, dwIndex)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }
}

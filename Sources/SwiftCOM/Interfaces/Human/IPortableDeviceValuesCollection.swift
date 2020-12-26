/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IPortableDeviceValuesCollection: IUnknown {
  override public class var IID: IID { IID_IPortableDeviceValuesCollection }

  public func Add(_ pValues: IPortableDeviceValues) throws {
    return try perform(as: WinSDK.IPortableDeviceValuesCollection.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.Add(pThis, RawPointer(pValues))
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func Clear() throws {
    return try perform(as: WinSDK.IPortableDeviceValuesCollection.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Clear(pThis)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func GetAt(_ dwIndex: DWORD) throws -> IPortableDeviceValues {
    return try perform(as: WinSDK.IPortableDeviceValuesCollection.self) { pThis in
      var pValues: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetAt(pThis, dwIndex, &pValues)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IPortableDeviceValues(pUnk: pValues)
    }
  }

  public func GetCount() throws -> DWORD {
    return try perform(as: WinSDK.IPortableDeviceValuesCollection.self) { pThis in
      var cElems: DWORD = DWORD(0)
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetCount(pThis, &cElems)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return cElems
    }
  }

  public func RemoveAt(_ dwIndex: DWORD) throws {
    return try perform(as: WinSDK.IPortableDeviceValuesCollection.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.RemoveAt(pThis, dwIndex)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }
}

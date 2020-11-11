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
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPortableDeviceKeyCollection.self,
                                capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Add(pThis, Key)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func Clear() throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPortableDeviceKeyCollection.self,
                                capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Clear(pThis)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func GetAt(_ dwIndex: DWORD) throws -> PROPVARIANT {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDevicePropVariantCollection.self,
                        capacity: 1)

    var Key: PROPVARIANT = PROPVARIANT()
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetAt(pThis, dwIndex, &Key)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Key
  }

  public func GetCount() throws -> DWORD {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPortableDeviceKeyCollection.self,
                                capacity: 1)

    var cElems: DWORD = DWORD(0)
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetCount(pThis, &cElems)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return cElems
  }

  public func RemoveAt(_ dwIndex: DWORD) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPortableDeviceKeyCollection.self,
                                capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.RemoveAt(pThis, dwIndex)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

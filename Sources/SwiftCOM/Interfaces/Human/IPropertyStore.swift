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
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPropertyStore.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Commit(pThis)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func GetAt(_ iProp: DWORD) throws -> PROPERTYKEY {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPropertyStore.self, capacity: 1)

    var Key: PROPERTYKEY = PROPERTYKEY()
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetAt(pThis, iProp, &Key)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Key
  }

  public func GetCount() throws -> DWORD {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPropertyStore.self, capacity: 1)

    var cProps: DWORD = DWORD(0)
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetCount(pThis, &cProps)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return cProps
  }

  public func GetValue(_ key: REFPROPERTYKEY) throws -> PROPVARIANT {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPropertyStore.self, capacity: 1)

    var v: PROPVARIANT = PROPVARIANT()
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetValue(pThis, key, &v)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return v
  }

  public func GetValue(_ key: REFPROPERTYKEY, _ propvar: REFPROPVARIANT) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPropertyStore.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.SetValue(pThis, key, propvar)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

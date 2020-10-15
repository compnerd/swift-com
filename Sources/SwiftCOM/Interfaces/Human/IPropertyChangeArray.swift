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
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPropertyChangeArray.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Append(pThis, ppropChange.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func AppendOrReplace(_ ppropChange: IPropertyChange) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPropertyChangeArray.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.AppendOrReplace(pThis, ppropChange.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func GetAt(_ iIndex: UINT, _ riid: inout IID)
      throws -> IUnknown {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPropertyChangeArray.self, capacity: 1)

    var pv: UnsafeMutableRawPointer?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetAt(pThis, iIndex, &riid, &pv)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IUnknown(pUnk: pv)
  }

  public func GetCount() throws -> UINT {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPropertyChangeArray.self, capacity: 1)

    var cOperations: UINT = 0
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetCount(pThis, &cOperations)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return cOperations
  }

  public func InsertAt(_ iIndex: UINT, _ ppropChange: IPropertyChange) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPropertyChangeArray.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.InsertAt(pThis, iIndex, ppropChange.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func IsKeyInArray(_ key: REFPROPERTYKEY) throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPropertyChangeArray.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.IsKeyInArray(pThis, key)
    switch hr {
    case S_OK: return true
    case E_FAIL: return false
    default: throw COMError(hr: hr)
    }
  }

  public func RemoveAt(_ iIndex: UINT) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPropertyChangeArray.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.RemoveAt(pThis, iIndex)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

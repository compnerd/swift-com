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
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPortableDeviceValuesCollection.self,
                                capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Add(pThis, RawPointer(pValues))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func Clear() throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPortableDeviceValuesCollection.self,
                                capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Clear(pThis)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func GetAt(_ dwIndex: DWORD) throws -> IPortableDeviceValues {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPortableDeviceValuesCollection.self,
                                capacity: 1)

    var pValues: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetAt(pThis, dwIndex, &pValues)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IPortableDeviceValues(pUnk: pValues)
  }

  public func GetCount() throws -> DWORD {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPortableDeviceValuesCollection.self,
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
    let pThis = pUnk.bindMemory(to: WinSDK.IPortableDeviceValuesCollection.self,
                                capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.RemoveAt(pThis, dwIndex)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

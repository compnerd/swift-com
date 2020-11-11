/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class ISensorDataReport: IUnknown {
  override public class var IID: IID { IID_ISensorDataReport }

  public func GetSensorValue(_ pKey: REFPROPERTYKEY) throws -> PROPVARIANT {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensorDataReport.self, capacity: 1)

    var Value: PROPVARIANT = PROPVARIANT()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetSensorValue(pThis, pKey, &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Value
  }

  public func GetSensorValues(_ pKeys: IPortableDeviceKeyCollection?)
      throws -> IPortableDeviceValues {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensorDataReport.self, capacity: 1)

    var pValues: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetSensorValues(pThis, RawPointer(pKeys),
                                                     &pValues)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IPortableDeviceValues(pUnk: pValues)
  }

  public func GetTimestamp() throws -> SYSTEMTIME {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensorDataReport.self, capacity: 1)

    var TimeStamp: SYSTEMTIME = SYSTEMTIME()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetTimestamp(pThis, &TimeStamp)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return TimeStamp
  }
}

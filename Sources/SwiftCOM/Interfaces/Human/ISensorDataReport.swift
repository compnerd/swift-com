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
    return try perform(as: WinSDK.ISensorDataReport.self) { pThis in
      var Value: PROPVARIANT = PROPVARIANT()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSensorValue(pThis, pKey, &Value))
      return Value
    }
  }

  public func GetSensorValues(_ pKeys: IPortableDeviceKeyCollection?)
      throws -> IPortableDeviceValues {
    return try perform(as: WinSDK.ISensorDataReport.self) { pThis in
      var pValues: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSensorValues(pThis, RawPointer(pKeys), &pValues))
      return IPortableDeviceValues(pUnk: pValues)
    }
  }

  public func GetTimestamp() throws -> SYSTEMTIME {
    return try perform(as: WinSDK.ISensorDataReport.self) { pThis in
      var TimeStamp: SYSTEMTIME = SYSTEMTIME()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetTimestamp(pThis, &TimeStamp))
      return TimeStamp
    }
  }
}

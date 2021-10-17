// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ISensor: IUnknown {
  override public class var IID: IID { IID_ISensor }

  public func GetCategory() throws -> SENSOR_CATEGORY_ID {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var SensorCategory: SENSOR_CATEGORY_ID = SENSOR_CATEGORY_ID()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetCategory(pThis, &SensorCategory))
      return SensorCategory
    }
  }

  public func GetData() throws -> ISensorDataReport {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var pDataReport: UnsafeMutablePointer<WinSDK.ISensorDataReport>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetData(pThis, &pDataReport))
      return ISensorDataReport(pUnk: pDataReport)
    }
  }

  public func GetEventInterest() throws -> [GUID] {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var pValues: UnsafeMutablePointer<GUID>?
      var Count: ULONG = ULONG()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetEventInterest(pThis, &pValues, &Count))
      return Array(UnsafeBufferPointer<GUID>(start: pValues, count: Int(Count)))
    }
  }

  public func GetFriendlyName() throws -> String {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var FriendlyName: BSTR?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetFriendlyName(pThis, &FriendlyName))
      defer { SysFreeString(FriendlyName) }
      return FriendlyName == nil ? "" : String(from: FriendlyName!)
    }
  }

  public func GetID() throws -> SENSOR_ID {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var ID: SENSOR_ID = SENSOR_ID()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetID(pThis, &ID))
      return ID
    }
  }

  public func GetProperties(_ Keys: IPortableDeviceKeyCollection?)
      throws -> IPortableDeviceValues {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var pProperties: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetProperties(pThis, RawPointer(Keys), &pProperties))
      return IPortableDeviceValues(pUnk: pProperties)
    }
  }

  public func GetProperty(_ key: REFPROPERTYKEY) throws -> PROPVARIANT {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var Property: PROPVARIANT = PROPVARIANT()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetProperty(pThis, key, &Property))
      return Property
    }
  }

  public func GetState() throws -> SensorState {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var State: SensorState = SensorState(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetState(pThis, &State))
      return State
    }
  }

  public func GetSupportedDataFields() throws -> IPortableDeviceKeyCollection {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var pDataFields: UnsafeMutablePointer<WinSDK.IPortableDeviceKeyCollection>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSupportedDataFields(pThis, &pDataFields))
      return IPortableDeviceKeyCollection(pUnk: pDataFields)
    }
  }

  public func GetType() throws -> SENSOR_TYPE_ID {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var SensorType: SENSOR_TYPE_ID = SENSOR_TYPE_ID()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetType(pThis, &SensorType))
      return SensorType
    }
  }

  public func SetEventInterest(_ Values: [GUID]) throws {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var Values = Values
      try CHECKED {
        Values.withUnsafeMutableBufferPointer {
          pThis.pointee.lpVtbl.pointee.SetEventInterest(pThis, $0.baseAddress, ULONG($0.count))
        }
      }
    }
  }

  public func SetEventSink(_ pEvents: ISensorEvents?) throws {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetEventSink(pThis, RawPointer(pEvents)))
    }
  }

  public func SetProperties(_ pProperties: IPortableDeviceValues)
      throws -> IPortableDeviceValues {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var pResults: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetProperties(pThis, RawPointer(pProperties), &pResults))
      return IPortableDeviceValues(pUnk: pResults)
    }
  }

  public func SupportsDataField(_ key: REFPROPERTYKEY) throws -> Bool {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var IsSupported: VARIANT_BOOL = VARIANT_BOOL()
      try CHECKED(pThis.pointee.lpVtbl.pointee.SupportsDataField(pThis, key, &IsSupported))
      return IsSupported == VARIANT_TRUE
    }
  }

  public func SupportsEvent(_ eventGuid: REFGUID) throws -> Bool {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var IsSupported: VARIANT_BOOL = VARIANT_BOOL()
      try CHECKED(pThis.pointee.lpVtbl.pointee.SupportsEvent(pThis, eventGuid, &IsSupported))
      return IsSupported == VARIANT_TRUE
    }
  }
}

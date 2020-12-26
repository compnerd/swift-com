/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class ISensor: IUnknown {
  override public class var IID: IID { IID_ISensor }

  public func GetCategory() throws -> SENSOR_CATEGORY_ID {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var SensorCategory: SENSOR_CATEGORY_ID = SENSOR_CATEGORY_ID()
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetCategory(pThis, &SensorCategory)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return SensorCategory
    }
  }

  public func GetData() throws -> ISensorDataReport {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var pDataReport: UnsafeMutablePointer<WinSDK.ISensorDataReport>?
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetData(pThis, &pDataReport)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return ISensorDataReport(pUnk: pDataReport)
    }
  }

  public func GetEventInterest() throws -> [GUID] {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var pValues: UnsafeMutablePointer<GUID>?
      var Count: ULONG = ULONG()
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetEventInterest(pThis, &pValues, &Count)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return Array(UnsafeBufferPointer<GUID>(start: pValues, count: Int(Count)))
    }
  }

  public func GetFriendlyName() throws -> String {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var FriendlyName: BSTR?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetFriendlyName(pThis, &FriendlyName)
      guard hr == S_OK else { throw COMError(hr: hr) }
      defer { SysFreeString(FriendlyName) }
      return FriendlyName == nil ? "" : String(from: FriendlyName!)
    }
  }

  public func GetID() throws -> SENSOR_ID {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var ID: SENSOR_ID = SENSOR_ID()
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetID(pThis, &ID)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return ID
    }
  }

  public func GetProperties(_ Keys: IPortableDeviceKeyCollection?)
      throws -> IPortableDeviceValues {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var pProperties: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetProperties(pThis, RawPointer(Keys),
                                                    &pProperties)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IPortableDeviceValues(pUnk: pProperties)
    }
  }

  public func GetProperty(_ key: REFPROPERTYKEY) throws -> PROPVARIANT {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var Property: PROPVARIANT = PROPVARIANT()
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetProperty(pThis, key, &Property)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return Property
    }
  }

  public func GetState() throws -> SensorState {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var State: SensorState = SensorState(0)
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetState(pThis, &State)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return State
    }
  }

  public func GetSupportedDataFields() throws -> IPortableDeviceKeyCollection {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var pDataFields: UnsafeMutablePointer<WinSDK.IPortableDeviceKeyCollection>?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetSupportedDataFields(pThis, &pDataFields)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IPortableDeviceKeyCollection(pUnk: pDataFields)
    }
  }

  public func GetType() throws -> SENSOR_TYPE_ID {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var SensorType: SENSOR_TYPE_ID = SENSOR_TYPE_ID()
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetType(pThis, &SensorType)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return SensorType
    }
  }

  public func SetEventInterest(_ Values: [GUID]) throws {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var Values = Values
      let hr: HRESULT = Values.withUnsafeMutableBufferPointer {
        pThis.pointee.lpVtbl.pointee.SetEventInterest(pThis, $0.baseAddress,
                                                      ULONG($0.count))
      }
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func SetEventSink(_ pEvents: ISensorEvents?) throws {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.SetEventSink(pThis, RawPointer(pEvents))
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func SetProperties(_ pProperties: IPortableDeviceValues)
      throws -> IPortableDeviceValues {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var pResults: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.SetProperties(pThis, RawPointer(pProperties),
                                                    &pResults)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IPortableDeviceValues(pUnk: pResults)
    }
  }

  public func SupportsDataField(_ key: REFPROPERTYKEY) throws -> Bool {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var IsSupported: VARIANT_BOOL = VARIANT_BOOL()
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.SupportsDataField(pThis, key, &IsSupported)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IsSupported == VARIANT_TRUE
    }
  }

  public func SupportsEvent(_ eventGuid: REFGUID) throws -> Bool {
    return try perform(as: WinSDK.ISensor.self) { pThis in
      var IsSupported: VARIANT_BOOL = VARIANT_BOOL()
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.SupportsEvent(pThis, eventGuid,
                                                    &IsSupported)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IsSupported == VARIANT_TRUE
    }
  }
}

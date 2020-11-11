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
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var SensorCategory: SENSOR_CATEGORY_ID = SENSOR_CATEGORY_ID()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetCategory(pThis, &SensorCategory)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return SensorCategory
  }

  public func GetData() throws -> ISensorDataReport {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var pDataReport: UnsafeMutablePointer<WinSDK.ISensorDataReport>?
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetData(pThis, &pDataReport)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return ISensorDataReport(pUnk: pDataReport)
  }

  public func GetEventInterest() throws -> [GUID] {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var pValues: UnsafeMutablePointer<GUID>?
    var Count: ULONG = ULONG()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetEventInterest(pThis, &pValues, &Count)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Array(UnsafeBufferPointer<GUID>(start: pValues, count: Int(Count)))
  }

  public func GetFriendlyName() throws -> String {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var FriendlyName: BSTR?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetFriendlyName(pThis, &FriendlyName)
    guard hr == S_OK else { throw COMError(hr: hr) }
    defer { SysFreeString(FriendlyName) }
    return FriendlyName == nil ? "" : String(from: FriendlyName!)
  }

  public func GetID() throws -> SENSOR_ID {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var ID: SENSOR_ID = SENSOR_ID()
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetID(pThis, &ID)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return ID
  }

  public func GetProperties(_ Keys: IPortableDeviceKeyCollection?)
      throws -> IPortableDeviceValues {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var pProperties: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetProperties(pThis, RawPointer(Keys),
                                                   &pProperties)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IPortableDeviceValues(pUnk: pProperties)
  }

  public func GetProperty(_ key: REFPROPERTYKEY) throws -> PROPVARIANT {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var Property: PROPVARIANT = PROPVARIANT()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetProperty(pThis, key, &Property)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Property
  }

  public func GetState() throws -> SensorState {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var State: SensorState = SensorState(0)
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetState(pThis, &State)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return State
  }

  public func GetSupportedDataFields() throws -> IPortableDeviceKeyCollection {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var pDataFields: UnsafeMutablePointer<WinSDK.IPortableDeviceKeyCollection>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetSupportedDataFields(pThis, &pDataFields)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IPortableDeviceKeyCollection(pUnk: pDataFields)
  }

  public func GetType() throws -> SENSOR_TYPE_ID {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var SensorType: SENSOR_TYPE_ID = SENSOR_TYPE_ID()
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetType(pThis, &SensorType)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return SensorType
  }

  public func SetEventInterest(_ Values: [GUID]) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var Values = Values
    let hr: HRESULT = Values.withUnsafeMutableBufferPointer {
      pThis.pointee.lpVtbl.pointee.SetEventInterest(pThis, $0.baseAddress,
                                                    ULONG($0.count))
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetEventSink(_ pEvents: ISensorEvents?) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetEventSink(pThis, RawPointer(pEvents))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetProperties(_ pProperties: IPortableDeviceValues)
      throws -> IPortableDeviceValues {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var pResults: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetProperties(pThis, RawPointer(pProperties),
                                                   &pResults)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IPortableDeviceValues(pUnk: pResults)
  }

  public func SupportsDataField(_ key: REFPROPERTYKEY) throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var IsSupported: VARIANT_BOOL = VARIANT_BOOL()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SupportsDataField(pThis, key, &IsSupported)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IsSupported == VARIANT_TRUE
  }

  public func SupportsEvent(_ eventGuid: REFGUID) throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensor.self, capacity: 1)

    var IsSupported: VARIANT_BOOL = VARIANT_BOOL()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SupportsEvent(pThis, eventGuid,
                                                   &IsSupported)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IsSupported == VARIANT_TRUE
  }
}

// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class ISensorManager: IUnknown {
  override public class var IID: IID { IID_ISensorManager }

  public func GetSensorByID(_ sensorID: REFSENSOR_ID) throws -> ISensor {
    return try perform(as: WinSDK.ISensorManager.self) { pThis in
      var pSensor: UnsafeMutablePointer<WinSDK.ISensor>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSensorByID(pThis, sensorID, &pSensor))
      return ISensor(pUnk: pSensor)
    }
  }

  public func GetSensorsByCategory(_ sensorCategory: REFSENSOR_CATEGORY_ID)
      throws -> ISensorCollection {
    return try perform(as: WinSDK.ISensorManager.self) { pThis in
      var pSensorsFound: UnsafeMutablePointer<WinSDK.ISensorCollection>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSensorsByCategory(pThis, sensorCategory, &pSensorsFound))
      return ISensorCollection(pUnk: pSensorsFound)
    }
  }

  public func GetSensorsByType(_ sensorType: REFSENSOR_TYPE_ID)
      throws -> ISensorCollection {
    return try perform(as: WinSDK.ISensorManager.self) { pThis in
      var pSensorsFound: UnsafeMutablePointer<WinSDK.ISensorCollection>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSensorsByType(pThis, sensorType, &pSensorsFound))
      return ISensorCollection(pUnk: pSensorsFound)
    }
  }

  public func RequestPermissions(_ hParent: HWND?,
                                 _ pSensors: ISensorCollection?, _ fModal: Bool)
      throws {
    return try perform(as: WinSDK.ISensorManager.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.RequestPermissions(pThis, hParent, RawPointer(pSensors), WindowsBool(fModal)))
    }
  }

  public func SetEventSink(_ pEvents: ISensorManagerEvents?) throws {
    return try perform(as: WinSDK.ISensorManager.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetEventSink(pThis, RawPointer(pEvents)))
    }
  }
}

extension ISensorManager {
  public func GetSensorsByType(_ sensorType: SENSOR_TYPE_ID)
      throws -> ISensorCollection {
    var sensorType = sensorType
    return try GetSensorsByType(&sensorType)
  }
}

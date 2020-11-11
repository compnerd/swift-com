/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class ISensorManager: IUnknown {
  override public class var IID: IID { IID_ISensorManager }

  public func GetSensorByID(_ sensorID: REFSENSOR_ID) throws -> ISensor {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensorManager.self, capacity: 1)

    var pSensor: UnsafeMutablePointer<WinSDK.ISensor>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetSensorByID(pThis, sensorID, &pSensor)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return ISensor(pUnk: pSensor)
  }

  public func GetSensorsByCategory(_ sensorCategory: REFSENSOR_CATEGORY_ID)
      throws -> ISensorCollection {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensorManager.self, capacity: 1)

    var pSensorsFound: UnsafeMutablePointer<WinSDK.ISensorCollection>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetSensorsByCategory(pThis, sensorCategory,
                                                          &pSensorsFound)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return ISensorCollection(pUnk: pSensorsFound)
  }

  public func GetSensorsByType(_ sensorType: REFSENSOR_TYPE_ID)
      throws -> ISensorCollection {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensorManager.self, capacity: 1)

    var pSensorsFound: UnsafeMutablePointer<WinSDK.ISensorCollection>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetSensorsByType(pThis, sensorType,
                                                      &pSensorsFound)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return ISensorCollection(pUnk: pSensorsFound)
  }

  public func RequestPermissions(_ hParent: HWND?,
                                 _ pSensors: ISensorCollection?, _ fModal: Bool)
      throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensorManager.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.RequestPermissions(pThis, hParent,
                                                        RawPointer(pSensors),
                                                        WindowsBool(fModal))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetEventSink(_ pEvents: ISensorManagerEvents?) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.ISensorManager.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetEventSink(pThis, RawPointer(pEvents))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class ISensorCollection: IUnknown {
  override public class var IID: IID { IID_ISensorCollection }

  public func Add(_ pSensor: ISensor) throws {
    return try perform(as: WinSDK.ISensorCollection.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Add(pThis, RawPointer(pSensor)))
    }
  }

  public func Clear() throws {
    return try perform(as: WinSDK.ISensorCollection.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Clear(pThis))
    }
  }

  public func GetAt(_ ulIndex: ULONG) throws -> ISensor {
    return try perform(as: WinSDK.ISensorCollection.self) { pThis in
      var pSensor: UnsafeMutablePointer<WinSDK.ISensor>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetAt(pThis, ulIndex, &pSensor))
      return ISensor(pUnk: pSensor)
    }
  }

  public func GetCount() throws -> ULONG {
    return try perform(as: WinSDK.ISensorCollection.self) { pThis in
      var Count: ULONG = ULONG(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetCount(pThis, &Count))
      return Count
    }
  }

  public func Remove(_ pSensor: ISensor) throws {
    return try perform(as: WinSDK.ISensorCollection.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Remove(pThis, RawPointer(pSensor)))
    }
  }

  public func RemoveByID(_ sensorID: REFSENSOR_ID) throws {
    return try perform(as: WinSDK.ISensorCollection.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.RemoveByID(pThis, sensorID))
    }
  }
}

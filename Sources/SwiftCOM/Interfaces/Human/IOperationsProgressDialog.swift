// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IOperationsProgressDialog: IUnknown {
  override public class var IID: IID { IID_IOperationsProgressDialog }

  public func GetMilliseconds() throws -> (ULONGLONG, ULONGLONG) {
    return try perform(as: WinSDK.IOperationsProgressDialog.self) { pThis in
      var ullElapsed: ULONGLONG = 0
      var ullRemaining: ULONGLONG = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetMilliseconds(pThis, &ullElapsed, &ullRemaining))
      return (ullElapsed, ullRemaining)
    }
  }

  public func GetOperationStatus() throws -> PDOPSTATUS {
    return try perform(as: WinSDK.IOperationsProgressDialog.self) { pThis in
      var opstatus: PDOPSTATUS = PDOPSTATUS(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetOperationStatus(pThis, &opstatus))
      return opstatus
    }
  }

  public func PauseTimer() throws {
    return try perform(as: WinSDK.IOperationsProgressDialog.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.PauseTimer(pThis))
    }
  }

  public func ResetTimer() throws {
    return try perform(as: WinSDK.IOperationsProgressDialog.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ResetTimer(pThis))
    }
  }

  public func ResumeTimer() throws {
    return try perform(as: WinSDK.IOperationsProgressDialog.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ResumeTimer(pThis))
    }
  }

  public func SetMode(_ mode: PDMODE) throws {
    return try perform(as: WinSDK.IOperationsProgressDialog.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetMode(pThis, mode))
    }
  }

  public func SetOperation(_ action: SPACTION) throws {
    return try perform(as: WinSDK.IOperationsProgressDialog.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetOperation(pThis, action))
    }
  }

  public func StartProgressDialog(_ hwnd: HWND, _ flags: OPPROGDLGF) throws {
    return try perform(as: WinSDK.IOperationsProgressDialog.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.StartProgressDialog(pThis, hwnd, flags))
    }
  }

  public func StopProgressDialog() throws {
    return try perform(as: WinSDK.IOperationsProgressDialog.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.StopProgressDialog(pThis))
    }
  }

  public func UpdateLocations(_ psiSource: IShellItem, _ psiTarget: IShellItem,
                              _ psiItem: IShellItem) throws {
    return try perform(as: WinSDK.IOperationsProgressDialog.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.UpdateLocations(pThis, RawPointer(psiSource), RawPointer(psiTarget), RawPointer(psiItem)))
    }
  }

  public func UpdateProgress(_ ullPointsCurrent: ULONGLONG,
                             _ ullPointsTotal: ULONGLONG,
                             _ ullSizeCurrent: ULONGLONG,
                             _ ullSizeTotal: ULONGLONG,
                             _ ullItemsCurrent: ULONGLONG,
                             _ ullItemsTotal: ULONGLONG) throws {
    return try perform(as: WinSDK.IOperationsProgressDialog.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.UpdateProgress(pThis, ullPointsCurrent, ullPointsTotal, ullSizeCurrent, ullSizeTotal, ullItemsCurrent, ullItemsTotal))
    }
  }
}

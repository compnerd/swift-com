/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IOperationsProgressDialog: IUnknown {
  override public class var IID: IID { IID_IOperationsProgressDialog }

  public func GetMilliseconds() throws -> (ULONGLONG, ULONGLONG) {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IOperationsProgressDialog.self,
                                capacity: 1)

    var ullElapsed: ULONGLONG = 0
    var ullRemaining: ULONGLONG = 0
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetMilliseconds(pThis, &ullElapsed,
                                                     &ullRemaining)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return (ullElapsed, ullRemaining)
  }

  public func GetOperationStatus() throws -> PDOPSTATUS {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IOperationsProgressDialog.self,
                                capacity: 1)

    var opstatus: PDOPSTATUS = PDOPSTATUS(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetOperationStatus(pThis, &opstatus)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return opstatus
  }

  public func PauseTimer() throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IOperationsProgressDialog.self,
                                capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.PauseTimer(pThis)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func ResetTimer() throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IOperationsProgressDialog.self,
                                capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.ResetTimer(pThis)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func ResumeTimer() throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IOperationsProgressDialog.self,
                                capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.ResumeTimer(pThis)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetMode(_ mode: PDMODE) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IOperationsProgressDialog.self,
                                capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.SetMode(pThis, mode)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetOperation(_ action: SPACTION) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IOperationsProgressDialog.self,
                                capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.SetOperation(pThis, action)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func StartProgressDialog(_ hwnd: HWND, _ flags: OPPROGDLGF) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IOperationsProgressDialog.self,
                                capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.StartProgressDialog(pThis, hwnd, flags)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func StopProgressDialog() throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IOperationsProgressDialog.self,
                                capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.StopProgressDialog(pThis)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func UpdateLocations(_ psiSource: IShellItem, _ psiTarget: IShellItem,
                              _ psiItem: IShellItem) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IOperationsProgressDialog.self,
                                capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.UpdateLocations(pThis,
                                                     RawPointer(psiSource),
                                                     RawPointer(psiTarget),
                                                     RawPointer(psiItem))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func UpdateProgress(_ ullPointsCurrent: ULONGLONG,
                             _ ullPointsTotal: ULONGLONG,
                             _ ullSizeCurrent: ULONGLONG,
                             _ ullSizeTotal: ULONGLONG,
                             _ ullItemsCurrent: ULONGLONG,
                             _ ullItemsTotal: ULONGLONG) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IOperationsProgressDialog.self,
                                capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.UpdateProgress(pThis, ullPointsCurrent,
                                                    ullPointsTotal,
                                                    ullSizeCurrent,
                                                    ullSizeTotal,
                                                    ullItemsCurrent,
                                                    ullItemsTotal)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

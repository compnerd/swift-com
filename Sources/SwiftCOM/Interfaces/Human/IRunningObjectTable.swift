/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IRunningObjectTable: IUnknown {
  override public class var IID: IID { IID_IRunningObjectTable }

  public func EnumRunning() throws -> IEnumMoniker {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IRunningObjectTable.self, capacity: 1)

    var penumMoniker: UnsafeMutablePointer<WinSDK.IEnumMoniker>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.EnumRunning(pThis, &penumMoniker)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IEnumMoniker(pUnk: penumMoniker)
  }

  public func GetObject(_ pmkObjectName: IMoniker) throws -> IUnknown {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IRunningObjectTable.self, capacity: 1)

    var punkObject: UnsafeMutablePointer<WinSDK.IUnknown>?
    // FIXME(compnerd) GetObject is also a free function which has a unicode and
    // ascii version. As a result, `GetObject` is a macro which happens to
    // expand incorrectly to `GetObjectA` here.
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetObjectA(pThis, pmkObjectName.raw,
                                                &punkObject)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IUnknown(pUnk: punkObject)
  }

  public func GetTimeOfLastChange(_ pmkObjectName: IMoniker) throws -> FILETIME {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IRunningObjectTable.self, capacity: 1)

    var filetime: FILETIME = FILETIME()
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee
                          .GetTimeOfLastChange(pThis, pmkObjectName.raw,
                                               &filetime)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return filetime
  }

  public func IsRunning(_ pmkObjectName: IMoniker) throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IRunningObjectTable.self, capacity: 1)

    return pThis.pointee.lpVtbl.pointee.IsRunning(pThis, pmkObjectName.raw) == S_OK
  }

  public func NoteChangeTime(_ dwRegister: DWORD) throws -> FILETIME {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IRunningObjectTable.self, capacity: 1)

    var filetime: FILETIME = FILETIME()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.NoteChangeTime(pThis, dwRegister, &filetime)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return filetime
  }

  public func Register(_ grfFlags: DWORD, _ punkObject: IUnknown,
                       _ pmkObjectName: IMoniker) throws -> DWORD {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IRunningObjectTable.self, capacity: 1)

    var dwRegister: DWORD = 0
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Register(pThis, grfFlags, punkObject.pUnk,
                                              pmkObjectName.raw, &dwRegister)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return dwRegister
  }

  public func Revoke(_ dwRegister: DWORD) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IRunningObjectTable.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Revoke(pThis, dwRegister)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

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
    return try perform(as: WinSDK.IRunningObjectTable.self) { pThis in
      var penumMoniker: UnsafeMutablePointer<WinSDK.IEnumMoniker>?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.EnumRunning(pThis, &penumMoniker)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IEnumMoniker(pUnk: penumMoniker)
    }
  }

  public func GetObject(_ pmkObjectName: IMoniker) throws -> IUnknown {
    return try perform(as: WinSDK.IRunningObjectTable.self) { pThis in
      var punkObject: UnsafeMutablePointer<WinSDK.IUnknown>?
      // FIXME(compnerd) GetObject is also a free function which has a unicode and
      // ascii version. As a result, `GetObject` is a macro which happens to
      // expand incorrectly to `GetObjectA` here.
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetObjectA(pThis, RawPointer(pmkObjectName),
                                                  &punkObject)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IUnknown(pUnk: punkObject)
    }
  }

  public func GetTimeOfLastChange(_ pmkObjectName: IMoniker) throws -> FILETIME {
    return try perform(as: WinSDK.IRunningObjectTable.self) { pThis in
      var filetime: FILETIME = FILETIME()
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee
                            .GetTimeOfLastChange(pThis, RawPointer(pmkObjectName),
                                                &filetime)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return filetime
    }
  }

  public func IsRunning(_ pmkObjectName: IMoniker) throws -> Bool {
    return try perform(as: WinSDK.IRunningObjectTable.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.IsRunning(pThis,
                                                    RawPointer(pmkObjectName)) == S_OK
    }
  }

  public func NoteChangeTime(_ dwRegister: DWORD) throws -> FILETIME {
    return try perform(as: WinSDK.IRunningObjectTable.self) { pThis in
      var filetime: FILETIME = FILETIME()
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.NoteChangeTime(pThis, dwRegister, &filetime)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return filetime
    }
  }

  public func Register(_ grfFlags: DWORD, _ punkObject: IUnknown,
                       _ pmkObjectName: IMoniker) throws -> DWORD {
    return try perform(as: WinSDK.IRunningObjectTable.self) { pThis in
      var dwRegister: DWORD = 0
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.Register(pThis, grfFlags, punkObject.pUnk,
                                                RawPointer(pmkObjectName),
                                                &dwRegister)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return dwRegister
    }
  }

  public func Revoke(_ dwRegister: DWORD) throws {
    return try perform(as: WinSDK.IRunningObjectTable.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.Revoke(pThis, dwRegister)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }
}

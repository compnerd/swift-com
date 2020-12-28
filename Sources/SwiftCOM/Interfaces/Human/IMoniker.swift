/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IMoniker: IPersistStream {
  override public class var IID: IID { IID_IMoniker }

  public func BindToObject(_ pbc: IBindCtx, _ pmkToLeft: IMoniker,
                           _ riidResult: IID) throws -> IUnknown {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      var iid: IID = riidResult
      var pvResult: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.BindToObject(pThis, RawPointer(pbc), RawPointer(pmkToLeft), &iid, &pvResult))
      return IUnknown(pUnk: pvResult)
    }
  }

  public func BindToStorage(_ pbc: IBindCtx, _ pmkToLeft: IMoniker,
                            _ riid: inout IID) throws -> IUnknown {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      var pvObj: UnsafeMutableRawPointer?
      try CHECKED(pThis.pointee.lpVtbl.pointee.BindToObject(pThis, RawPointer(pbc), RawPointer(pmkToLeft), &riid, &pvObj))
      return IUnknown(pUnk: pvObj)
    }
  }

  public func CommonPrefixWith(_ pmkOther: IMoniker) throws -> IMoniker {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      var pmkPrefix: UnsafeMutablePointer<WinSDK.IMoniker>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CommonPrefixWith(pThis, RawPointer(pmkOther), &pmkPrefix))
      return IMoniker(pUnk: pmkPrefix)
    }
  }

  public func ComposeWith(_ pmkRight: IMoniker, _ fOnlyIfNotGeneric: Bool)
      throws -> IMoniker {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      var pmkComposite: UnsafeMutablePointer<WinSDK.IMoniker>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.ComposeWith(pThis, RawPointer(pmkRight), WindowsBool(fOnlyIfNotGeneric == true), &pmkComposite))
      return IMoniker(pUnk: pmkComposite)
    }
  }

  public func Enum(_ fForward: Bool) throws -> IEnumMoniker {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      var penumMoniker: UnsafeMutablePointer<WinSDK.IEnumMoniker>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.Enum(pThis, WindowsBool(fForward == true), &penumMoniker))
      return IEnumMoniker(pUnk: penumMoniker)
    }
  }

  public func GetDisplayName(_ pbc: IBindCtx, _ pmkToLeft: IMoniker?)
      throws -> String {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      let malloc: IMalloc = try CoGetMalloc()
      defer { _ = try? malloc.Release() }

      var pszDisplayName: LPOLESTR?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDisplayName(pThis, RawPointer(pbc), RawPointer(pmkToLeft), &pszDisplayName))
      defer { try? malloc.Free(pszDisplayName) }
      return String(decodingCString: pszDisplayName!, as: UTF16.self)
    }
  }

  public func GetTimeOfLastChange(_ pbc: IBindCtx, _ pmkToLeft: IMoniker)
      throws -> FILETIME {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      var FileTime: FILETIME = FILETIME()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetTimeOfLastChange(pThis, RawPointer(pbc), RawPointer(pmkToLeft), &FileTime))
      return FileTime
    }
  }

  public func Hash() throws -> DWORD {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      var dwHash: DWORD = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.Hash(pThis, &dwHash))
      return dwHash
    }
  }

  public func Inverse() throws -> IMoniker {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      var pmk: UnsafeMutablePointer<WinSDK.IMoniker>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.Inverse(pThis, &pmk))
      return IMoniker(pUnk: pmk)
    }
  }

  public func IsEqual(_ pmkOtherMoniker: IMoniker) throws -> Bool {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.IsEqual(pThis, RawPointer(pmkOtherMoniker))
      switch hr {
      case S_OK: return true
      case S_FALSE: return false
      default: throw COMError(hr: hr)
      }
    }
  }

  public func IsRunning(_ pbc: IBindCtx, _ pmkToLeft: IMoniker?,
                        _ pmkNewlyRunning: IMoniker?) throws -> Bool {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.IsRunning(pThis, RawPointer(pbc), RawPointer(pmkToLeft), RawPointer(pmkNewlyRunning))
      switch hr {
      case S_OK: return true
      case S_FALSE: return false
      default: throw COMError(hr: hr)
      }
    }
  }

  public func IsSystemMoniker() throws -> DWORD {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      var dwMksys: DWORD = 0
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.IsSystemMoniker(pThis, &dwMksys)
      switch hr {
      case S_OK: return dwMksys
      case S_FALSE: return DWORD(MKSYS_NONE.rawValue)
      default: throw COMError(hr: hr)
      }
    }
  }

  public func ParseDisplayName(_ pbc: IBindCtx, _ pmkToLeft: IMoniker,
                               _ pszDisplayName: String)
      throws -> (Int, IMoniker) {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      var chEaten: ULONG = 0
      var pmkOut: UnsafeMutablePointer<WinSDK.IMoniker>?
      var olestr: [OLECHAR] = pszDisplayName.wide
      try CHECKED {
        olestr.withUnsafeMutableBufferPointer {
          pThis.pointee.lpVtbl.pointee.ParseDisplayName(pThis, RawPointer(pbc), RawPointer(pmkToLeft), $0.baseAddress, &chEaten, &pmkOut)
        }
      }
      return (Int(chEaten), IMoniker(pUnk: pmkOut))
    }
  }

  public func Reduce(_ pbc: IBindCtx, _ dwReduceHowFar: DWORD,
                     _ pmkToLeft: inout IMoniker) throws -> IMoniker {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      var ppmkToLeft: UnsafeMutablePointer<WinSDK.IMoniker>? =
          RawPointer(pmkToLeft)
      var pmkReduced: UnsafeMutablePointer<WinSDK.IMoniker>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.Reduce(pThis, RawPointer(pbc), dwReduceHowFar, &ppmkToLeft, &pmkReduced))
      pmkToLeft = IMoniker(pUnk: ppmkToLeft)
      return IMoniker(pUnk: pmkReduced)
    }
  }

  public func RelativePathTo(_ pmkOther: IMoniker) throws -> IMoniker {
    return try perform(as: WinSDK.IMoniker.self) { pThis in
      var pmkRelPath: UnsafeMutablePointer<WinSDK.IMoniker>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.RelativePathTo(pThis, RawPointer(pmkOther), &pmkRelPath))
      return IMoniker(pUnk: pmkRelPath)
    }
  }
}

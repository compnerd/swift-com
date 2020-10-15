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
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    var iid: IID = riidResult
    var pvResult: UnsafeMutableRawPointer?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.BindToObject(pThis, pbc.raw, pmkToLeft.raw,
                                                  &iid, &pvResult)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IUnknown(pUnk: pvResult)
  }

  public func BindToStorage(_ pbc: IBindCtx, _ pmkToLeft: IMoniker,
                            _ riid: inout IID) throws -> IUnknown {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    var pvObj: UnsafeMutableRawPointer?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.BindToObject(pThis, pbc.raw, pmkToLeft.raw,
                                                  &riid, &pvObj)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IUnknown(pUnk: pvObj)
  }

  public func CommonPrefixWith(_ pmkOther: IMoniker) throws -> IMoniker {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    var pmkPrefix: UnsafeMutablePointer<WinSDK.IMoniker>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CommonPrefixWith(pThis, pmkOther.raw,
                                                      &pmkPrefix)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IMoniker(pUnk: pmkPrefix)
  }

  public func ComposeWith(_ pmkRight: IMoniker, _ fOnlyIfNotGeneric: Bool)
      throws -> IMoniker {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    var pmkComposite: UnsafeMutablePointer<WinSDK.IMoniker>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.ComposeWith(pThis, pmkRight.raw,
                                                 WindowsBool(fOnlyIfNotGeneric == true),
                                                 &pmkComposite)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IMoniker(pUnk: pmkComposite)
  }

  public func Enum(_ fForward: Bool) throws -> IEnumMoniker {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    var penumMoniker: UnsafeMutablePointer<WinSDK.IEnumMoniker>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Enum(pThis, WindowsBool(fForward == true),
                                          &penumMoniker)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IEnumMoniker(pUnk: penumMoniker)
  }

  public func GetDisplayName(_ pbc: IBindCtx, _ pmkToLeft: IMoniker?)
      throws -> String {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    let malloc: IMalloc = try CoGetMalloc()
    defer { _ = try? malloc.Release() }

    var pszDisplayName: LPOLESTR?
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee
                          .GetDisplayName(pThis, pbc.raw, pmkToLeft?.raw,
                                          &pszDisplayName)
    guard hr == S_OK else { throw COMError(hr: hr) }

    defer { try? malloc.Free(pszDisplayName) }
    return String(decodingCString: pszDisplayName!, as: UTF16.self)
  }

  public func GetTimeOfLastChange(_ pbc: IBindCtx, _ pmkToLeft: IMoniker)
      throws -> FILETIME {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    var FileTime: FILETIME = FILETIME()
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee
                          .GetTimeOfLastChange(pThis, pbc.raw, pmkToLeft.raw,
                                               &FileTime)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return FileTime
  }

  public func Hash() throws -> DWORD {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    var dwHash: DWORD = 0
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Hash(pThis, &dwHash)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return dwHash
  }

  public func Inverse() throws -> IMoniker {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    var pmk: UnsafeMutablePointer<WinSDK.IMoniker>?
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Inverse(pThis, &pmk)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IMoniker(pUnk: pmk)
  }

  public func IsEqual(_ pmkOtherMoniker: IMoniker) throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.IsEqual(pThis, pmkOtherMoniker.raw)
    switch hr {
    case S_OK: return true
    case S_FALSE: return false
    default: throw COMError(hr: hr)
    }
  }

  public func IsRunning(_ pbc: IBindCtx, _ pmkToLeft: IMoniker?,
                        _ pmkNewlyRunning: IMoniker?) throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.IsRunning(pThis, pbc.raw, pmkToLeft?.raw,
                                               pmkNewlyRunning?.raw)
    switch hr {
    case S_OK: return true
    case S_FALSE: return false
    default: throw COMError(hr: hr)
    }
  }

  public func IsSystemMoniker() throws -> DWORD {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    var dwMksys: DWORD = 0
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.IsSystemMoniker(pThis, &dwMksys)
    switch hr {
    case S_OK: return dwMksys
    case S_FALSE: return DWORD(MKSYS_NONE.rawValue)
    default: throw COMError(hr: hr)
    }
  }

  public func ParseDisplayName(_ pbc: IBindCtx, _ pmkToLeft: IMoniker,
                               _ pszDisplayName: String)
      throws -> (Int, IMoniker) {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    var chEaten: ULONG = 0
    var pmkOut: UnsafeMutablePointer<WinSDK.IMoniker>?
    var olestr: [OLECHAR] = pszDisplayName.wide
    let hr: HRESULT = olestr.withUnsafeMutableBufferPointer {
      pThis.pointee.lpVtbl.pointee
          .ParseDisplayName(pThis, pbc.raw, pmkToLeft.raw, $0.baseAddress,
                            &chEaten, &pmkOut)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
    return (Int(chEaten), IMoniker(pUnk: pmkOut))
  }

  public func Reduce(_ pbc: IBindCtx, _ dwReduceHowFar: DWORD,
                     _ pmkToLeft: inout IMoniker) throws -> IMoniker {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    var ppmkToLeft: UnsafeMutablePointer<WinSDK.IMoniker>? = pmkToLeft.raw
    var pmkReduced: UnsafeMutablePointer<WinSDK.IMoniker>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Reduce(pThis, pbc.raw, dwReduceHowFar,
                                            &ppmkToLeft, &pmkReduced)
    guard hr == S_OK else { throw COMError(hr: hr) }
    pmkToLeft = IMoniker(pUnk: ppmkToLeft)
    return IMoniker(pUnk: pmkReduced)
  }

  public func RelativePathTo(_ pmkOther: IMoniker) throws -> IMoniker {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)

    var pmkRelPath: UnsafeMutablePointer<WinSDK.IMoniker>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.RelativePathTo(pThis, pmkOther.raw,
                                                    &pmkRelPath)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IMoniker(pUnk: pmkRelPath)
  }
}

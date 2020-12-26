/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IBindCtx: IUnknown {
  override public class var IID: IID { IID_IBindCtx }

  public func EnumObjectParam() throws -> IEnumString {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      var penum: UnsafeMutablePointer<WinSDK.IEnumString>?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.EnumObjectParam(pThis, &penum)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IEnumString(pUnk: penum)
    }
  }

  public func GetBindOptions() throws -> BIND_OPTS {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      var bindopts: BIND_OPTS = BIND_OPTS()
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetBindOptions(pThis, &bindopts)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return bindopts
    }
  }

  public func GetObjectParam(_ pszKey: String) throws -> IUnknown {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      var pUnk: UnsafeMutablePointer<WinSDK.IUnknown>?
      var key: [OLECHAR] = pszKey.wide
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetObjectParam(pThis, &key, &pUnk)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IUnknown(pUnk: pUnk)
    }
  }

  public func GetRunningObjectTable() throws -> IRunningObjectTable {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      var prot: UnsafeMutablePointer<WinSDK.IRunningObjectTable>?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetRunningObjectTable(pThis, &prot)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IRunningObjectTable(pUnk: prot)
    }
  }

  public func RegisterObjectBound(_ pUnk: IUnknown) throws {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.RegisterObjectBound(pThis, pUnk.pUnk)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func RegisterObjectParam(_ pszKey: String, _ pUnk: IUnknown)
      throws {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      var key: [OLECHAR] = pszKey.wide
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.RegisterObjectParam(pThis, &key,
                                                           pUnk.pUnk)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func ReleaseBoundObjects() throws {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.ReleaseBoundObjects(pThis)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func RevokeObjectBound(_ punk: IUnknown) throws {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.RevokeObjectBound(pThis, punk.pUnk)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func RevokeObjectParam(_ pszKey: String) throws {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      var key: [OLECHAR] = pszKey.wide
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.RevokeObjectParam(pThis, &key)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func SetBindOptions(_ pbindopts: inout BIND_OPTS) throws {
    return try perform(as: WinSDK.IBindCtx.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.SetBindOptions(pThis, &pbindopts)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }
}

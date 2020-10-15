/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IPersistStream: IUnknown {
  override public class var IID: IID { IID_IPersistStream }

  public func GetSizeMax() throws -> ULARGE_INTEGER {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPersistStream.self, capacity: 1)

    var cbSize: ULARGE_INTEGER = ULARGE_INTEGER()
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetSizeMax(pThis, &cbSize)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return cbSize
  }

  public func IsDirty() throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPersistStream.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.IsDirty(pThis)
    switch hr {
    case S_OK: return true
    case S_FALSE: return false
    default: throw COMError(hr: hr)
    }
  }

  public func Load(_ pStm: IStream) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPersistStream.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Load(pThis, pStm.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func Save(_ pStm: IStream, _ fClearDirty: Bool) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPersistStream.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Save(pThis, pStm.raw,
                                          WindowsBool(fClearDirty == true))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

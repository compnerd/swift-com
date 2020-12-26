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
    return try perform(as: WinSDK.IPersistStream.self) { pThis in
      var cbSize: ULARGE_INTEGER = ULARGE_INTEGER()
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetSizeMax(pThis, &cbSize)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return cbSize
    }
  }

  public func IsDirty() throws -> Bool {
    return try perform(as: WinSDK.IPersistStream.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.IsDirty(pThis)
      switch hr {
      case S_OK: return true
      case S_FALSE: return false
      default: throw COMError(hr: hr)
      }
    }
  }

  public func Load(_ pStm: IStream) throws {
    return try perform(as: WinSDK.IPersistStream.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Load(pThis, RawPointer(pStm))
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func Save(_ pStm: IStream, _ fClearDirty: Bool) throws {
    return try perform(as: WinSDK.IPersistStream.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.Save(pThis, RawPointer(pStm),
                                            WindowsBool(fClearDirty == true))
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }
}

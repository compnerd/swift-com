/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IStream: IUnknown {
  override public class var IID: IID { IID_IStream }

  public func Clone() throws -> IStream {
    return try perform(as: WinSDK.IStream.self) { pThis in
      var pstm: UnsafeMutablePointer<WinSDK.IStream>?
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Clone(pThis, &pstm)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IStream(pUnk: pstm)
    }
  }

  public func Commit(_ grfCommitFlags: DWORD) throws {
    return try perform(as: WinSDK.IStream.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Commit(pThis, grfCommitFlags)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func CopyTo(_ pstm: IStream, _ cb: ULARGE_INTEGER)
      throws -> (ULARGE_INTEGER, ULARGE_INTEGER) {
    return try perform(as: WinSDK.IStream.self) { pThis in
      var cbRead: ULARGE_INTEGER = ULARGE_INTEGER()
      var cbWritten: ULARGE_INTEGER = ULARGE_INTEGER()
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.CopyTo(pThis, RawPointer(pstm), cb,
                                              &cbRead, &cbWritten)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return (cbRead, cbWritten)
    }
  }

  public func LockRegion(_ libOffset: ULARGE_INTEGER, _ cb: ULARGE_INTEGER,
                         _ dwLockType: DWORD) throws {
    return try perform(as: WinSDK.IStream.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.LockRegion(pThis, libOffset, cb, dwLockType)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func Revert() throws {
    return try perform(as: WinSDK.IStream.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Revert(pThis)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func Seek(_ dlibMove: LARGE_INTEGER, _ dwOrigin: DWORD)
      throws -> ULARGE_INTEGER {
    return try perform(as: WinSDK.IStream.self) { pThis in
      var libNewPosition: ULARGE_INTEGER = ULARGE_INTEGER()
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.Seek(pThis, dlibMove, dwOrigin,
                                            &libNewPosition)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return libNewPosition
    }
  }

  public func SetSize(_ libNewSize: ULARGE_INTEGER) throws {
    return try perform(as: WinSDK.IStream.self) { pThis in
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.SetSize(pThis, libNewSize)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func Stat(_ grfStatFlag: DWORD) throws -> STATSTG {
    return try perform(as: WinSDK.IStream.self) { pThis in
      var statstg: STATSTG = STATSTG()
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.Stat(pThis, &statstg, grfStatFlag)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return statstg
    }
  }

  public func UnlockRegion(_ libOffset: ULARGE_INTEGER, _ cb: ULARGE_INTEGER,
                           _ dwLockType: DWORD) throws {
    return try perform(as: WinSDK.IStream.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.UnlockRegion(pThis, libOffset, cb,
                                                    dwLockType)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }
}

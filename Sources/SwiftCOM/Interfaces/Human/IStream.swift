// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IStream: IUnknown {
  override public class var IID: IID { IID_IStream }

  public func Clone() throws -> IStream {
    return try perform(as: WinSDK.IStream.self) { pThis in
      var pstm: UnsafeMutablePointer<WinSDK.IStream>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.Clone(pThis, &pstm))
      return IStream(pUnk: pstm)
    }
  }

  public func Commit(_ grfCommitFlags: DWORD) throws {
    return try perform(as: WinSDK.IStream.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Commit(pThis, grfCommitFlags))
    }
  }

  public func CopyTo(_ pstm: IStream, _ cb: ULARGE_INTEGER)
      throws -> (ULARGE_INTEGER, ULARGE_INTEGER) {
    return try perform(as: WinSDK.IStream.self) { pThis in
      var cbRead: ULARGE_INTEGER = ULARGE_INTEGER()
      var cbWritten: ULARGE_INTEGER = ULARGE_INTEGER()
      try CHECKED(pThis.pointee.lpVtbl.pointee.CopyTo(pThis, RawPointer(pstm), cb, &cbRead, &cbWritten))
      return (cbRead, cbWritten)
    }
  }

  public func LockRegion(_ libOffset: ULARGE_INTEGER, _ cb: ULARGE_INTEGER,
                         _ dwLockType: DWORD) throws {
    return try perform(as: WinSDK.IStream.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.LockRegion(pThis, libOffset, cb, dwLockType))
    }
  }

  public func Revert() throws {
    return try perform(as: WinSDK.IStream.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Revert(pThis))
    }
  }

  public func Seek(_ dlibMove: LARGE_INTEGER, _ dwOrigin: DWORD)
      throws -> ULARGE_INTEGER {
    return try perform(as: WinSDK.IStream.self) { pThis in
      var libNewPosition: ULARGE_INTEGER = ULARGE_INTEGER()
      try CHECKED(pThis.pointee.lpVtbl.pointee.Seek(pThis, dlibMove, dwOrigin, &libNewPosition))
      return libNewPosition
    }
  }

  public func SetSize(_ libNewSize: ULARGE_INTEGER) throws {
    return try perform(as: WinSDK.IStream.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetSize(pThis, libNewSize))
    }
  }

  public func Stat(_ grfStatFlag: DWORD) throws -> STATSTG {
    return try perform(as: WinSDK.IStream.self) { pThis in
      var statstg: STATSTG = STATSTG()
      try CHECKED(pThis.pointee.lpVtbl.pointee.Stat(pThis, &statstg, grfStatFlag))
      return statstg
    }
  }

  public func UnlockRegion(_ libOffset: ULARGE_INTEGER, _ cb: ULARGE_INTEGER,
                           _ dwLockType: DWORD) throws {
    return try perform(as: WinSDK.IStream.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.UnlockRegion(pThis, libOffset, cb, dwLockType))
    }
  }
}

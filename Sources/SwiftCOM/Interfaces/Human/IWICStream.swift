/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICStream: IStream {
  override public class var IID: IID { IID_IWICStream }

  public func InitializeFromFilename(_ szFileName: String,
                                     _ dwDesiredAccess: DWORD) throws {
    return try perform(as: WinSDK.IWICStream.self) { pThis in
      try CHECKED {
        szFileName.withCString(encodedAs: UTF16.self) {
          pThis.pointee.lpVtbl.pointee.InitializeFromFilename(pThis, $0, dwDesiredAccess)
        }
      }
    }
  }

  public func InitializeFromIStream(_ pIStream: IStream) throws {
    return try perform(as: WinSDK.IWICStream.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.InitializeFromIStream(pThis, RawPointer(pIStream)))
    }
  }

  public func InitializeFromIStreamRegion(_ pIStream: IStream,
                                          _ ulOffset: ULARGE_INTEGER,
                                          _ ulMaxSize: ULARGE_INTEGER) throws {
    return try perform(as: WinSDK.IWICStream.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.InitializeFromIStreamRegion(pThis, RawPointer(pIStream), ulOffset, ulMaxSize))
    }
  }

  public func InitializeFromMemory(_ pbBuffer: UnsafeMutablePointer<BYTE>?,
                                   _ cbBufferSize: DWORD) throws {
    return try perform(as: WinSDK.IWICStream.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.InitializeFromMemory(pThis, pbBuffer, cbBufferSize))
    }
  }
}

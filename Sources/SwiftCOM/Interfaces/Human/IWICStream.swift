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
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICStream.self, capacity: 1)

    let hr: HRESULT = szFileName.withCString(encodedAs: UTF16.self) {
      pThis.pointee.lpVtbl.pointee.InitializeFromFilename(pThis, $0,
                                                          dwDesiredAccess)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func InitializeFromIStream(_ pIStream: IStream) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICStream.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.InitializeFromIStream(pThis,
                                                           RawPointer(pIStream))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func InitializeFromIStreamRegion(_ pIStream: IStream,
                                          _ ulOffset: ULARGE_INTEGER,
                                          _ ulMaxSize: ULARGE_INTEGER) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICStream.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.InitializeFromIStreamRegion(pThis,
                                                                 RawPointer(pIStream),
                                                                 ulOffset,
                                                                 ulMaxSize)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func InitializeFromMemory(_ pbBuffer: UnsafeMutablePointer<BYTE>?,
                                   _ cbBufferSize: DWORD) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICStream.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.InitializeFromMemory(pThis, pbBuffer,
                                                          cbBufferSize)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

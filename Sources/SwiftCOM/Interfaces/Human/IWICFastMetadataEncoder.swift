/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICFastMetadataEncoder: IUnknown {
  override public class var IID: IID { IID_IWICFastMetadataEncoder }

  public func Commit() throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICFastMetadataEncoder.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Commit(pThis)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func GetMetadataQueryWriter() throws -> IWICMetadataQueryWriter {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICFastMetadataEncoder.self, capacity: 1)

    var pIMetadataQueryWriter: UnsafeMutablePointer<WinSDK.IWICMetadataQueryWriter>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetMetadataQueryWriter(pThis,
                                                            &pIMetadataQueryWriter)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICMetadataQueryWriter(pUnk: pIMetadataQueryWriter)
  }
}

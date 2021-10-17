// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IWICFastMetadataEncoder: IUnknown {
  override public class var IID: IID { IID_IWICFastMetadataEncoder }

  public func Commit() throws {
    return try perform(as: WinSDK.IWICFastMetadataEncoder.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Commit(pThis))
    }
  }

  public func GetMetadataQueryWriter() throws -> IWICMetadataQueryWriter {
    return try perform(as: WinSDK.IWICFastMetadataEncoder.self) { pThis in
      var pIMetadataQueryWriter: UnsafeMutablePointer<WinSDK.IWICMetadataQueryWriter>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetMetadataQueryWriter(pThis, &pIMetadataQueryWriter))
      return IWICMetadataQueryWriter(pUnk: pIMetadataQueryWriter)
    }
  }
}

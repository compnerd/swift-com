/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICMetadataQueryWriter: IWICMetadataQueryReader {
  override public class var IID: IID { IID_IWICMetadataQueryWriter }

  public func RemoveMetadataByName(_ szName: String) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICMetadataQueryWriter.self, capacity: 1)

    let hr: HRESULT = szName.withCString(encodedAs: UTF16.self) {
      pThis.pointee.lpVtbl.pointee.RemoveMetadataByName(pThis, $0)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetMetadataByName(_ szName: String, _ varValue: PROPVARIANT) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICMetadataQueryWriter.self, capacity: 1)

    var varValue = varValue
    let hr: HRESULT = szName.withCString(encodedAs: UTF16.self) {
      pThis.pointee.lpVtbl.pointee.SetMetadataByName(pThis, $0, &varValue)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

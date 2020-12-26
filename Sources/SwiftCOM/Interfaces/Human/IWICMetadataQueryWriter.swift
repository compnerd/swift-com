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
    return try perform(as: WinSDK.IWICMetadataQueryWriter.self) { pThis in
      let hr: HRESULT = szName.withCString(encodedAs: UTF16.self) {
        pThis.pointee.lpVtbl.pointee.RemoveMetadataByName(pThis, $0)
      }
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func SetMetadataByName(_ szName: String, _ varValue: PROPVARIANT) throws {
    return try perform(as: WinSDK.IWICMetadataQueryWriter.self) { pThis in
      var varValue = varValue
      let hr: HRESULT = szName.withCString(encodedAs: UTF16.self) {
        pThis.pointee.lpVtbl.pointee.SetMetadataByName(pThis, $0, &varValue)
      }
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }
}

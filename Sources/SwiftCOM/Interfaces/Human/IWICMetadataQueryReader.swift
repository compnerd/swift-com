/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICMetadataQueryReader: IUnknown {
  override public class var IID: IID { IID_IWICMetadataQueryReader }

  public func GetContainerFormat() throws -> GUID {
    return try perform(as: WinSDK.IWICMetadataQueryReader.self) { pThis in
      var guidContainerFormat: GUID = GUID()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetContainerFormat(pThis, &guidContainerFormat))
      return guidContainerFormat
    }
  }

  public func GetEnumerator() throws -> IEnumString {
    return try perform(as: WinSDK.IWICMetadataQueryReader.self) { pThis in
      var pIEnumString: UnsafeMutablePointer<WinSDK.IEnumString>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetEnumerator(pThis, &pIEnumString))
      return IEnumString(pUnk: pIEnumString)
    }
  }

  public func GetLocation() throws -> String {
    return try perform(as: WinSDK.IWICMetadataQueryReader.self) { pThis in
      var cchActualLength: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetLocation(pThis, 0, nil, &cchActualLength))

      let buffer: [WCHAR] =
          try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActualLength)) {
        try CHECKED(pThis.pointee.lpVtbl.pointee.GetLocation(pThis, UINT($0.count), $0.baseAddress, &cchActualLength))
        $1 = Int(cchActualLength)
      }
      return String(decoding: buffer, as: UTF16.self)
    }
  }

  public func GetMetadataByName(_ szName: String) throws -> PROPVARIANT {
    return try perform(as: WinSDK.IWICMetadataQueryReader.self) { pThis in
      var varValue: PROPVARIANT = PROPVARIANT()
      try CHECKED {
        szName.withCString(encodedAs: UTF16.self) {
          pThis.pointee.lpVtbl.pointee.GetMetadataByName(pThis, $0, &varValue)
        }
      }
      return varValue
    }
  }
}

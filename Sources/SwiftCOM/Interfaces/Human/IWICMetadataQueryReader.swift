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
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetContainerFormat(pThis,
                                                          &guidContainerFormat)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return guidContainerFormat
    }
  }

  public func GetEnumerator() throws -> IEnumString {
    return try perform(as: WinSDK.IWICMetadataQueryReader.self) { pThis in
      var pIEnumString: UnsafeMutablePointer<WinSDK.IEnumString>?
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetEnumerator(pThis, &pIEnumString)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return IEnumString(pUnk: pIEnumString)
    }
  }

  public func GetLocation() throws -> String {
    return try perform(as: WinSDK.IWICMetadataQueryReader.self) { pThis in
      var cchActualLength: UINT = UINT(0)
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetLocation(pThis, 0, nil,
                                                   &cchActualLength)
      guard hr == S_OK else { throw COMError(hr: hr) }

      let buffer: [WCHAR] =
          try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActualLength)) {
        let hr: HRESULT =
            pThis.pointee.lpVtbl.pointee.GetLocation(pThis, UINT($0.count),
                                                    $0.baseAddress,
                                                    &cchActualLength)
        guard hr == S_OK else { throw COMError(hr: hr) }
        $1 = Int(cchActualLength)
      }
      return String(decoding: buffer, as: UTF16.self)
    }
  }

  public func GetMetadataByName(_ szName: String) throws -> PROPVARIANT {
    return try perform(as: WinSDK.IWICMetadataQueryReader.self) { pThis in
      var varValue: PROPVARIANT = PROPVARIANT()
      let hr: HRESULT = szName.withCString(encodedAs: UTF16.self) {
        pThis.pointee.lpVtbl.pointee.GetMetadataByName(pThis, $0, &varValue)
      }
      guard hr == S_OK else { throw COMError(hr: hr) }
      return varValue
    }
  }
}

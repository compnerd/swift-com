// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IPropertyBag2: IUnknown {
  override public class var IID: IID { IID_IPropertyBag2 }

  public func CountProperties() throws -> ULONG {
    return try perform(as: WinSDK.IPropertyBag2.self) { pThis in
      var cProperties: ULONG = ULONG(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.CountProperties(pThis, &cProperties))
      return cProperties
    }
  }

  public func GetPropertyInfo(_ iProperty: ULONG, _ cProperties: ULONG)
      throws -> [PROPBAG2] {
    return try perform(as: WinSDK.IPropertyBag2.self) { pThis in
      return try Array<PROPBAG2>(unsafeUninitializedCapacity: Int(cProperties)) {
        var count: ULONG = ULONG(0)
        try CHECKED(pThis.pointee.lpVtbl.pointee.GetPropertyInfo(pThis, iProperty, cProperties, $0.baseAddress, &count))
        $1 = Int(count)
      }
    }
  }

  public func LoadObject(_ strName: String, _ dwHint: DWORD,
                         _ pUnkObject: IUnknown, _ pErrLog: IErrorLog) throws {
    return try perform(as: WinSDK.IPropertyBag2.self) { pThis in
      try CHECKED {
        strName.withCString(encodedAs: UTF16.self) {
          pThis.pointee.lpVtbl.pointee.LoadObject(pThis, $0, dwHint, RawPointer(pUnkObject), RawPointer(pErrLog))
        }
      }
    }
  }

  public func Read(_ pPropBag: [PROPBAG2], _ pErrLog: IErrorLog?)
      throws -> [(VARIANT, HRESULT)] {
    return try perform(as: WinSDK.IPropertyBag2.self) { pThis in
      var pPropBag = pPropBag
      var hrError: [HRESULT] =
          Array<HRESULT>(repeating: S_OK, count: pPropBag.count)
      let varValue: [VARIANT] =
          try Array<VARIANT>(unsafeUninitializedCapacity: pPropBag.count) { pvarValue, count in
        try CHECKED {
          pPropBag.withUnsafeMutableBufferPointer {
            pThis.pointee.lpVtbl.pointee.Read(pThis, ULONG($0.count), $0.baseAddress, RawPointer(pErrLog), pvarValue.baseAddress, &hrError)
          }
        }
        count = pPropBag.count
      }
      return zip(varValue, hrError).map { ($0.0, $0.1) }
    }
  }

  public func Write(_ properties: [PROPBAG2], _ values: [VARIANT]) throws {
    guard properties.count == values.count else {
      throw COMError(hr: E_INVALIDARG)
    }

    return try perform(as: WinSDK.IPropertyBag2.self) { pThis in
      var properties = properties
      var values = values
      try CHECKED {
        properties.withUnsafeMutableBufferPointer { pPropBag in
          values.withUnsafeMutableBufferPointer { pvarValue in
            pThis.pointee.lpVtbl.pointee.Write(pThis, ULONG(pPropBag.count), pPropBag.baseAddress, pvarValue.baseAddress)
          }
        }
      }
    }
  }
}

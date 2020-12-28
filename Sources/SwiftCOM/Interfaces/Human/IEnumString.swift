/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IEnumString: IUnknown {
  override public class var IID: IID { IID_IEnumString }

  public func Clone() throws -> IEnumString {
    return try perform(as: WinSDK.IEnumString.self) { pThis in
      var penum: UnsafeMutablePointer<WinSDK.IEnumString>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.Clone(pThis, &penum))
      return IEnumString(pUnk: penum)
    }
  }

  public func Next(_ celt: ULONG) throws -> [String] {
    return try perform(as: WinSDK.IEnumString.self) { pThis in
      var rgelt: LPOLESTR?
      var celtFetched: ULONG = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.Next(pThis, celt, &rgelt, &celtFetched))
      defer { CoTaskMemFree(rgelt) }

      var result: [String] = []
      result.reserveCapacity(Int(celtFetched))
      _ = rgelt?.withMemoryRebound(to: LPOLESTR?.self,
                                  capacity: Int(celtFetched)) { rgelt in
        for i in 0 ..< Int(celtFetched) {
          result.append(String(decodingCString: rgelt[i]!, as: UTF16.self))
        }
      }
      return result
    }
  }

  public func Reset() throws {
    return try perform(as: WinSDK.IEnumString.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Reset(pThis))
    }
  }

  public func Skip(_ celt: ULONG) throws {
    return try perform(as: WinSDK.IEnumString.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Skip(pThis, celt))
    }
  }
}

// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IEnumUnknown: IUnknown {
  override public class var IID: IID { IID_IEnumUnknown }

  public func Clone() throws -> IEnumUnknown {
    return try perform(as: WinSDK.IEnumUnknown.self) { pThis in
      var penum: UnsafeMutablePointer<WinSDK.IEnumUnknown>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.Clone(pThis, &penum))
      return IEnumUnknown(pUnk: penum)
    }
  }

  public func Next(_ celt: ULONG) throws -> [IUnknown] {
    return try perform(as: WinSDK.IEnumUnknown.self) { pThis in
      var rgelt: UnsafeMutablePointer<WinSDK.IUnknown>?
      var celtFetched: ULONG = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.Next(pThis, celt, &rgelt, &celtFetched))

      var result: [IUnknown] = []
      result.reserveCapacity(Int(celtFetched))
      _ = rgelt?.withMemoryRebound(to: Optional<UnsafeMutablePointer<WinSDK.IUnknown>>.self,
                                  capacity: Int(celtFetched)) { rgelt in
        for i in 0 ..< Int(celtFetched) {
          result.append(IUnknown(pUnk: rgelt[i]))
        }
      }
      return result
    }
  }

  public func Reset() throws {
    return try perform(as: WinSDK.IEnumUnknown.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Reset(pThis))
    }
  }

  public func Skip(_ celt: ULONG) throws {
    return try perform(as: WinSDK.IEnumUnknown.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Skip(pThis, celt))
    }
  }
}

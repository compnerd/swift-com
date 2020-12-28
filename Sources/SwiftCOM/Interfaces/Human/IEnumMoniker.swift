/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IEnumMoniker: IUnknown {
  override public class var IID: IID { IID_IEnumMoniker }

  public func Clone() throws -> IEnumMoniker {
    return try perform(as: WinSDK.IEnumMoniker.self) { pThis in
      var penum: UnsafeMutablePointer<WinSDK.IEnumMoniker>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.Clone(pThis, &penum))
      return IEnumMoniker(pUnk: penum)
    }
  }

  public func Next(_ celt: ULONG) throws -> [IMoniker] {
    return try perform(as: WinSDK.IEnumMoniker.self) { pThis in
      var rgelt: UnsafeMutablePointer<WinSDK.IMoniker>?
      var celtFetched: ULONG = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.Next(pThis, celt, &rgelt, &celtFetched))
      defer { CoTaskMemFree(rgelt) }

      var monikers: [IMoniker] = []
      monikers.reserveCapacity(Int(celtFetched))
      _ = rgelt?.withMemoryRebound(to: UnsafeMutablePointer<WinSDK.IMoniker?>.self,
                                  capacity: Int(celtFetched)) { rgelt in
        for i in 0 ..< Int(celtFetched) {
          monikers.append(IMoniker(pUnk: rgelt[i]))
        }
      }
      return monikers
    }
  }

  public func Reset() throws {
    return try perform(as: WinSDK.IEnumMoniker.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Reset(pThis))
    }
  }

  public func Skip(_ celt: ULONG) throws {
    return try perform(as: WinSDK.IEnumMoniker.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Skip(pThis, celt))
    }
  }
}

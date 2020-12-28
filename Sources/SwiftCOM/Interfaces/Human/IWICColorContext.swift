/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICColorContext: IUnknown {
  override public class var IID: IID { IID_IWICColorContext }

  public func GetExifColorSpace() throws -> UINT {
    return try perform(as: WinSDK.IWICColorContext.self) { pThis in
      var Value: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetExifColorSpace(pThis, &Value))
      return Value
    }
  }

  public func GetProfileBytes() throws -> [BYTE] {
    return try perform(as: WinSDK.IWICColorContext.self) { pThis in
      var cbActual: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetProfileBytes(pThis, 0, nil, &cbActual))

      return try Array<BYTE>(unsafeUninitializedCapacity: Int(cbActual)) {
        try CHECKED(pThis.pointee.lpVtbl.pointee.GetProfileBytes(pThis, UINT($0.count), $0.baseAddress, &cbActual))
        $1 = Int(cbActual)
      }
    }
  }

  public func GetType() throws -> WICColorContextType {
    return try perform(as: WinSDK.IWICColorContext.self) { pThis in
      var Type: WICColorContextType = WICColorContextType(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetType(pThis, &Type))
      return Type
    }
  }

  public func InitializeFromExifColorSpace(_ value: UINT) throws {
    return try perform(as: WinSDK.IWICColorContext.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.InitializeFromExifColorSpace(pThis, value))
    }
  }

  public func InitializeFromFilename(_ filename: String) throws {
    return try perform(as: WinSDK.IWICColorContext.self) { pThis in
      try CHECKED {
        filename.withCString(encodedAs: UTF16.self) {
          pThis.pointee.lpVtbl.pointee.InitializeFromFilename(pThis, $0)
        }
      }
    }
  }

  public func InitializeFromMemory(_ pbBuffer: [BYTE]) throws {
    return try perform(as: WinSDK.IWICColorContext.self) { pThis in
      try CHECKED {
        pbBuffer.withUnsafeBufferPointer {
          pThis.pointee.lpVtbl.pointee.InitializeFromMemory(pThis, $0.baseAddress, UINT($0.count))
        }
      }
    }
  }
}

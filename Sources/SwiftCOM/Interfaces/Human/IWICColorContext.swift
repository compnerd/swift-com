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
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetExifColorSpace(pThis, &Value)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return Value
    }
  }

  public func GetProfileBytes() throws -> [BYTE] {
    return try perform(as: WinSDK.IWICColorContext.self) { pThis in
      var cbActual: UINT = UINT(0)
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetProfileBytes(pThis, 0, nil, &cbActual)
      guard hr == S_OK else { throw COMError(hr: hr) }

      return try Array<BYTE>(unsafeUninitializedCapacity: Int(cbActual)) {
        let hr: HRESULT =
            pThis.pointee.lpVtbl.pointee.GetProfileBytes(pThis, UINT($0.count),
                                                        $0.baseAddress, &cbActual)
        guard hr == S_OK else { throw COMError(hr: hr) }
        $1 = Int(cbActual)
      }
    }
  }

  public func GetType() throws -> WICColorContextType {
    return try perform(as: WinSDK.IWICColorContext.self) { pThis in
      var Type: WICColorContextType = WICColorContextType(0)
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetType(pThis, &Type)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return Type
    }
  }

  public func InitializeFromExifColorSpace(_ value: UINT) throws {
    return try perform(as: WinSDK.IWICColorContext.self) { pThis in
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.InitializeFromExifColorSpace(pThis, value)
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func InitializeFromFilename(_ filename: String) throws {
    return try perform(as: WinSDK.IWICColorContext.self) { pThis in
      let hr: HRESULT = filename.withCString(encodedAs: UTF16.self) {
        pThis.pointee.lpVtbl.pointee.InitializeFromFilename(pThis, $0)
      }
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }

  public func InitializeFromMemory(_ pbBuffer: [BYTE]) throws {
    return try perform(as: WinSDK.IWICColorContext.self) { pThis in
      let hr: HRESULT = pbBuffer.withUnsafeBufferPointer {
        pThis.pointee.lpVtbl.pointee.InitializeFromMemory(pThis, $0.baseAddress,
                                                          UINT($0.count))
      }
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }
}

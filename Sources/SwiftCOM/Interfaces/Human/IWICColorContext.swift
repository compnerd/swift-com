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
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICColorContext.self, capacity: 1)

    var Value: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetExifColorSpace(pThis, &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Value
  }

  public func GetProfileBytes() throws -> [BYTE] {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICColorContext.self, capacity: 1)

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

  public func GetType() throws -> WICColorContextType {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICColorContext.self, capacity: 1)

    var Type: WICColorContextType = WICColorContextType(0)
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetType(pThis, &Type)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Type
  }

  public func InitializeFromExifColorSpace(_ value: UINT) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICColorContext.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.InitializeFromExifColorSpace(pThis, value)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func InitializeFromFilename(_ filename: String) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICColorContext.self, capacity: 1)

    let hr: HRESULT = filename.withCString(encodedAs: UTF16.self) {
      pThis.pointee.lpVtbl.pointee.InitializeFromFilename(pThis, $0)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func InitializeFromMemory(_ pbBuffer: [BYTE]) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICColorContext.self, capacity: 1)

    let hr: HRESULT = pbBuffer.withUnsafeBufferPointer {
      pThis.pointee.lpVtbl.pointee.InitializeFromMemory(pThis, $0.baseAddress,
                                                        UINT($0.count))
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

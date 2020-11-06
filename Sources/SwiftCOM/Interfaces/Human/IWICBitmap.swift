/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICBitmap: IWICBitmapSource {
  override public class var IID: IID { IID_IWICBitmap }

  public func Lock(_ rcLock: WICRect, _ flags: DWORD) throws -> IWICBitmapLock {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmap.self, capacity: 1)

    var rcLock = rcLock
    var pILock: UnsafeMutablePointer<WinSDK.IWICBitmapLock>?
    let hr: HRESULT = withUnsafePointer(to: &rcLock) {
      pThis.pointee.lpVtbl.pointee.Lock(pThis, $0, flags, &pILock)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmapLock(pUnk: pILock)
  }

  public func SetPalette(_ pIPalette: IWICPalette) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmap.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetPalette(pThis, RawPointer(pIPalette))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetResolution(_ dpiX: Double, _ dpiY: Double) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmap.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetResolution(pThis, dpiX, dpiY)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

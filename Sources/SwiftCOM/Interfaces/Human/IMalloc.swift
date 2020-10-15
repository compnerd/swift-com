/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IMalloc: IUnknown {
  override public class var IID: IID { IID_IMalloc }

  public func Alloc(_ cb: SIZE_T) throws -> UnsafeMutableRawPointer? {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMalloc.self, capacity: 1)

    return pThis.pointee.lpVtbl.pointee.Alloc(pThis, cb)
  }

  public func DidAlloc(_ pv: UnsafeMutableRawPointer?) throws -> CInt {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMalloc.self, capacity: 1)

    return pThis.pointee.lpVtbl.pointee.DidAlloc(pThis, pv)
  }

  public func Free(_ pv: UnsafeMutableRawPointer?) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMalloc.self, capacity: 1)

    return pThis.pointee.lpVtbl.pointee.Free(pThis, pv)
  }

  public func GetSize(_ pv: UnsafeMutableRawPointer?) throws -> SIZE_T {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMalloc.self, capacity: 1)

    return pThis.pointee.lpVtbl.pointee.GetSize(pThis, pv)
  }

  public func HeapMinimize() throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMalloc.self, capacity: 1)

    return pThis.pointee.lpVtbl.pointee.HeapMinimize(pThis)
  }

  public func Realloc(_ pv: UnsafeMutableRawPointer?, _ cb: SIZE_T)
      throws -> UnsafeMutableRawPointer? {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IMalloc.self, capacity: 1)

    return pThis.pointee.lpVtbl.pointee.Realloc(pThis, pv, cb)
  }
}

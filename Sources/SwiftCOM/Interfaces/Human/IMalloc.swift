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
    return try perform(as: WinSDK.IMalloc.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.Alloc(pThis, cb)
    }
  }

  public func DidAlloc(_ pv: UnsafeMutableRawPointer?) throws -> CInt {
    return try perform(as: WinSDK.IMalloc.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.DidAlloc(pThis, pv)
    }
  }

  public func Free(_ pv: UnsafeMutableRawPointer?) throws {
    return try perform(as: WinSDK.IMalloc.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.Free(pThis, pv)
    }
  }

  public func GetSize(_ pv: UnsafeMutableRawPointer?) throws -> SIZE_T {
    return try perform(as: WinSDK.IMalloc.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetSize(pThis, pv)
    }
  }

  public func HeapMinimize() throws {
    return try perform(as: WinSDK.IMalloc.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.HeapMinimize(pThis)
    }
  }

  public func Realloc(_ pv: UnsafeMutableRawPointer?, _ cb: SIZE_T)
      throws -> UnsafeMutableRawPointer? {
    return try perform(as: WinSDK.IMalloc.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.Realloc(pThis, pv, cb)
    }
  }
}

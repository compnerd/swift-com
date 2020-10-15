/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

internal var E_INVALIDARG: HRESULT {
  HRESULT(bitPattern: 0x80070057)
}

internal var E_FAIL: HRESULT {
  HRESULT(bitPattern: 0x80004005)
}

// FIXME(compnerd) unfortunately these must be public as they are part of the
// public API.  These really should be vended by WinSDK.
public typealias REFIID = UnsafePointer<IID>
public typealias REFCLSID = UnsafePointer<CLSID>

// winnt.h
@_transparent
public func MAKELANGID(_ p: WORD, _ s: WORD) -> DWORD {
  return DWORD((s << 10) | p)
}

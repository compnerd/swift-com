/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

@discardableResult
func CHECKED(_ body: () -> HRESULT) throws -> HRESULT {
  let hr: HRESULT = body()
  guard hr >= 0 else { throw COMError(hr: hr) }
  return hr
}

@discardableResult
func CHECKED(_ body: @autoclosure () -> HRESULT) throws -> HRESULT {
  let hr: HRESULT = body()
  guard hr >= 0 else { throw COMError(hr: hr) }
  return hr
}

func SUCCEEDED(_ body: @autoclosure () -> HRESULT) -> Bool {
  let hr: HRESULT = body()
  return hr >= 0
}

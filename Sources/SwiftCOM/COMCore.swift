/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public func CoGetMalloc(_ dwMemContext: DWORD = 1) throws -> IMalloc {
  var pMalloc: LPMALLOC?
  let hr: HRESULT = CoGetMalloc(1, &pMalloc)
  guard hr == S_OK else { throw COMError(hr: hr) }
  return IMalloc(pUnk: pMalloc)
}

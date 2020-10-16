/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public func SHCreateItemFromParsingName(_ pszPath: String, _ pbc: IBindCtx,
                                        _ riid: inout IID) throws -> IUnknown {
  var pv: UnsafeMutableRawPointer?
  let hr: HRESULT =
      SHCreateItemFromParsingName(pszPath.wide, pbc.raw, &riid, &pv)
  guard hr == S_OK else { throw COMError(hr: hr) }
  return IUnknown(pUnk: pv)
}

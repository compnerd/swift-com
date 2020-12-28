/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public func SHCreateItemFromParsingName(_ pszPath: String, _ pbc: IBindCtx?,
                                        _ riid: inout IID) throws -> IUnknown {
  var pv: UnsafeMutableRawPointer?
  try CHECKED(SHCreateItemFromParsingName(pszPath.wide, RawPointer(pbc), &riid, &pv))
  return IUnknown(pUnk: pv)
}

public func SHCreateItemFromParsingName<T: IUnknown>(_ pszPath: String,
                                                     _ pbc: IBindCtx?)
    throws -> T {
  var riid: IID = T.IID
  var pv: UnsafeMutableRawPointer?
  try CHECKED(SHCreateItemFromParsingName(pszPath.wide, RawPointer(pbc), &riid, &pv))
  return T(pUnk: pv)
}

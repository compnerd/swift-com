// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public func RawPointer<T: IUnknown, U>(_ pUnk: T?)
    -> UnsafeMutablePointer<U>? {
  guard let pUnk = pUnk else { return nil }
  if let pUnk: UnsafeMutableRawPointer = UnsafeMutableRawPointer(pUnk.pUnk.borrow) {
    return pUnk.bindMemory(to: U.self, capacity: 1)
  }
  return nil
}

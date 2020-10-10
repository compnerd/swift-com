/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

extension String {
  init(from bstr: BSTR) {
    self.init(decodingCString: bstr, as: UTF16.self)
  }
}

extension Array where Array.Element == OLECHAR {
  init(from string: String) {
    self = string.withCString(encodedAs: UTF16.self) { buffer in
      Array<OLECHAR>(unsafeUninitializedCapacity: string.utf16.count + 1) {
        wcscpy_s($0.baseAddress, $0.count, buffer)
        $1 = $0.count
      }
    }
  }
}

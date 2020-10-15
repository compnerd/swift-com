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
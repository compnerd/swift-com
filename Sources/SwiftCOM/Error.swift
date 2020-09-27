/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public struct COMError: Error {
  let hr: HRESULT
}

extension COMError: CustomStringConvertible {
  public var description: String {
    let buffer: UnsafeMutablePointer<WCHAR>? = nil
    let dwResult: DWORD =
        FormatMessageW(DWORD(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS),
                       nil, DWORD(hr),
                       MAKELANGID(WORD(LANG_NEUTRAL), WORD(SUBLANG_DEFAULT)),
                       buffer, 0, nil)
    guard dwResult == 0, let message = buffer else {
      return "HRESULT: 0x\(String(hr, radix: 16))"
    }
    defer { LocalFree(buffer) }
    return "0x\(String(hr, radix: 16)) - \(String(decodingCString: message, as: UTF16.self))"
  }
}

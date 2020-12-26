/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IErrorLog: IUnknown {
  override public class var IID: IID { IID_IErrorLog }

  public func AddError(_ szPropName: String, _ pExcepInfo: [EXCEPINFO]) throws {
    return try perform(as: WinSDK.IErrorLog.self) { pThis in
      var pExcepInfo = pExcepInfo
      let hr: HRESULT = szPropName.withCString(encodedAs: UTF16.self) { pwszPropName in
        pExcepInfo.withUnsafeMutableBufferPointer {
          pThis.pointee.lpVtbl.pointee.AddError(pThis, pwszPropName, $0.baseAddress)
        }
      }
      guard hr == S_OK else { throw COMError(hr: hr) }
    }
  }
}

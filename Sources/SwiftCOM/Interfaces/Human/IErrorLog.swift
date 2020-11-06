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
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IErrorLog.self, capacity: 1)

    var pExcepInfo = pExcepInfo
    let hr: HRESULT = szPropName.withCString(encodedAs: UTF16.self) { pwszPropName in
      pExcepInfo.withUnsafeMutableBufferPointer {
        pThis.pointee.lpVtbl.pointee.AddError(pThis, pwszPropName, $0.baseAddress)
      }
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

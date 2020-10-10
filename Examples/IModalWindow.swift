/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

class IModalWindow: IUnknown {
  override public class var IID: IID { IID_IModalWindow }

  public func Show(_ hWndOwner: HWND?) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IModalWindow.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Show(pThis, hWndOwner)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

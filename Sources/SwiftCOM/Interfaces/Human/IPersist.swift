/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IPersist: IPersistStream {
  override public class var IID: IID { IID_IPersist }

  public func GetClassID() throws -> CLSID {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IPersist.self, capacity: 1)

    var ClassID: CLSID = CLSID()
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetClassID(pThis, &ClassID)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return ClassID
  }
}

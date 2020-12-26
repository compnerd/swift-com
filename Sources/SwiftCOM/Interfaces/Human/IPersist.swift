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
    return try perform(as: WinSDK.IPersist.self) { pThis in
      var ClassID: CLSID = CLSID()
      let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetClassID(pThis, &ClassID)
      guard hr == S_OK else { throw COMError(hr: hr) }
      return ClassID
    }
  }
}

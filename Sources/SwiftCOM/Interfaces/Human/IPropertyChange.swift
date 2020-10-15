/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IPropertyChange: IObjectWithPropertyKey {
  override public class var IID: IID { IID_IPropertyChange }

  public func ApplyToPropVariant(_ propvarIn: REFPROPVARIANT)
      throws -> PROPVARIANT {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPropertyChange.self, capacity: 1)

    var propvarOut: PROPVARIANT = PROPVARIANT()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.ApplyToPropVariant(pThis, propvarIn,
                                                        &propvarOut)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return propvarOut
  }
}

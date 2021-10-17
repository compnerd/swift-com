// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGIDebug: IUnknown {
  public override class var IID: IID { IID_IDXGIDebug }

  public func ReportLiveObjects(_ apiid: GUID, _ flags: DXGI_DEBUG_RLO_FLAGS) throws {
    return try perform(as: WinSDK.IDXGIDebug.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ReportLiveObjects(pThis, apiid, flags))
    }
  }
}

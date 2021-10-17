// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IDXGIAdapter: IDXGIObject {
  override public class var IID: IID { IID_IDXGIAdapter }

  public func CheckInterfaceSupport(_ InterfaceName: REFGUID) throws -> LARGE_INTEGER? {
    return try perform(as: WinSDK.IDXGIAdapter.self) { pThis in
      var UMDVersion: LARGE_INTEGER = LARGE_INTEGER()
      var pUMDVersion: UnsafeMutablePointer<LARGE_INTEGER>?
      try withUnsafeMutablePointer(to: &UMDVersion) {
        pUMDVersion = $0
        try CHECKED(pThis.pointee.lpVtbl.pointee.CheckInterfaceSupport(pThis, InterfaceName, pUMDVersion))
      }
      return pUMDVersion == nil ? nil : UMDVersion
    }
  }

  public func EnumOutputs(_ Output: UINT) throws -> IDXGIOutput {
    return try perform(as: WinSDK.IDXGIAdapter.self) { pThis in
      var pOutput: UnsafeMutablePointer<WinSDK.IDXGIOutput>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.EnumOutputs(pThis, Output, &pOutput))
      return IDXGIOutput(pUnk: pOutput)
    }
  }

  public func GetDesc() throws -> DXGI_ADAPTER_DESC {
    return try perform(as: WinSDK.IDXGIAdapter.self) { pThis in
      var Desc: DXGI_ADAPTER_DESC = DXGI_ADAPTER_DESC()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDesc(pThis, &Desc))
      return Desc
    }
  }
}

/**
 * Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IDXGIOutput: IDXGIObject {
  override public class var IID: IID { IID_IDXGIOutput }

  public func FindClosestMatchingMode(_ pModeToMatch: UnsafePointer<DXGI_MODE_DESC>?, _ pConcernedDevice: IUnknown?) throws -> DXGI_MODE_DESC {
    return try perform(as: WinSDK.IDXGIOutput.self) { pThis in
      var ClosestMatch: DXGI_MODE_DESC = DXGI_MODE_DESC()
      try CHECKED(pThis.pointee.lpVtbl.pointee.FindClosestMatchingMode(pThis, pModeToMatch, &ClosestMatch, RawPointer(pConcernedDevice)))
      return ClosestMatch
    }
  }

  public func GetDesc() throws -> DXGI_OUTPUT_DESC {
    return try perform(as: WinSDK.IDXGIOutput.self) { pThis in
      var Desc: DXGI_OUTPUT_DESC = DXGI_OUTPUT_DESC()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDesc(pThis, &Desc))
      return Desc
    }
  }

  public func GetDisplayModeList(_ EnumFormat: DXGI_FORMAT, _ Flags: UINT) throws -> [DXGI_MODE_DESC] {
    return try perform(as: WinSDK.IDXGIOutput.self) { pThis in
      var NumModes: UINT = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDisplayModeList(pThis, EnumFormat, Flags, &NumModes, nil))
      return try Array<DXGI_MODE_DESC>(unsafeUninitializedCapacity: Int(NumModes)) {
        var NumModes: UINT = 0
        try CHECKED(pThis.pointee.lpVtbl.pointee.GetDisplayModeList(pThis, EnumFormat, Flags, &NumModes, $0.baseAddress))
        $1 = Int(NumModes)
      }
    }
  }

  public func GetDisplaySurfaceData(_ pDestination: IDXGISurface?) throws {
    return try perform(as: WinSDK.IDXGIOutput.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDisplaySurfaceData(pThis, RawPointer(pDestination)))
    }
  }

  public func GetFrameStatistics() throws -> DXGI_FRAME_STATISTICS {
    return try perform(as: WinSDK.IDXGIOutput.self) { pThis in
      var Stats: DXGI_FRAME_STATISTICS = DXGI_FRAME_STATISTICS()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetFrameStatistics(pThis, &Stats))
      return Stats
    }
  }

  public func GetGammaControl(_ pArray: UnsafeMutablePointer<DXGI_GAMMA_CONTROL>?) throws {
    return try perform(as: WinSDK.IDXGIOutput.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetGammaControl(pThis, pArray))
    }
  }

  public func GetGammaControlCapabilities() throws -> DXGI_GAMMA_CONTROL_CAPABILITIES {
    return try perform(as: WinSDK.IDXGIOutput.self) { pThis in
      var GammaCaps: DXGI_GAMMA_CONTROL_CAPABILITIES = DXGI_GAMMA_CONTROL_CAPABILITIES()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetGammaControlCapabilities(pThis, &GammaCaps))
      return GammaCaps
    }
  }

  public func ReleaseOwnership() throws {
    return try perform(as: WinSDK.IDXGIOutput.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ReleaseOwnership(pThis)
    }
  }

  public func SetDisplaySurface(_ pScanoutSurface: IDXGISurface?) throws {
    return try perform(as: WinSDK.IDXGIOutput.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetDisplaySurface(pThis, RawPointer(pScanoutSurface)))
    }
  }

  public func SetGammaControl(_ pArray: UnsafePointer<DXGI_GAMMA_CONTROL>?) throws {
    return try perform(as: WinSDK.IDXGIOutput.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetGammaControl(pThis, pArray))
    }
  }

  public func TakeOwnership(_ pDevice: IUnknown?, _ Exclusive: WindowsBool) throws {
    return try perform(as: WinSDK.IDXGIOutput.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.TakeOwnership(pThis, RawPointer(pDevice), Exclusive))
    }
  }

  public func WaitForVBlank() throws {
    return try perform(as: WinSDK.IDXGIOutput.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.WaitForVBlank(pThis))
    }
  }
}

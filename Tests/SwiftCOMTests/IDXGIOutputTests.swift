// Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3-Clause

import SwiftCOM
import XCTest

import struct WinSDK.UINT
import let WinSDK.DXGI_CREATE_FACTORY_DEBUG
import let WinSDK.DXGI_FORMAT_R8G8B8A8_UNORM

final class IDXGIOutputTests: XCTestCase {
  func testGetDisplayModeList() {
    let pFactory: IDXGIFactory2? =
        try? CreateDXGIFactory2(UINT(DXGI_CREATE_FACTORY_DEBUG))
    guard let pFactory = pFactory else {
      return XCTFail("unable to create DXGIFactory" )
    }

    let pAdapter: IDXGIAdapter4? =
        try? pFactory.EnumAdapters(UINT(0)).QueryInterface()
    guard let pAdapter = pAdapter else {
      return XCTFail("unable to get IDXGIAdapter4")
    }

    let pOutput: IDXGIOutput? = try? pAdapter.EnumOutputs(UINT(0))
    guard let pOutput = pOutput else {
      return XCTFail("unable to get IDXGIOutput")
    }

    let arrDisplayModes =
        try! pOutput.GetDisplayModeList(DXGI_FORMAT_R8G8B8A8_UNORM, 0)
    XCTAssertNotNil(arrDisplayModes)
  }
}

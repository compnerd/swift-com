/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICBitmapCodecInfo: IWICComponentInfo {
  override public class var IID: IID { IID_IWICBitmapCodecInfo }

  public func DoesSupportAnimation() throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapCodecInfo.self, capacity: 1)

    var fSupportAnimation: WindowsBool = false
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.DoesSupportAnimation(pThis,
                                                          &fSupportAnimation)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return fSupportAnimation == true
  }

  public func DoesSupportChromakey() throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapCodecInfo.self, capacity: 1)

    var fSupportChromakey: WindowsBool = false
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.DoesSupportChromakey(pThis,
                                                          &fSupportChromakey)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return fSupportChromakey == true
  }

  public func DoesSupportLossless() throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapCodecInfo.self, capacity: 1)

    var fSupportLossless: WindowsBool = false
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.DoesSupportLossless(pThis,
                                                         &fSupportLossless)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return fSupportLossless == true
  }

  public func DoesSupportMultiframe() throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapCodecInfo.self, capacity: 1)

    var fSupportMultiframe: WindowsBool = false
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.DoesSupportMultiframe(pThis,
                                                           &fSupportMultiframe)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return fSupportMultiframe == true
  }

  public func GetColorManagementVersion() throws -> String {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapCodecInfo.self, capacity: 1)

    var cchActual: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetColorManagementVersion(pThis, 0, nil,
                                                               &cchActual)
    guard hr == S_OK else { throw COMError(hr: hr) }

    let buffer: [WCHAR] =
        try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetColorManagementVersion(pThis,
                                                                 UINT($0.count),
                                                                 $0.baseAddress,
                                                                 &cchActual)
      guard hr == S_OK else { throw COMError(hr: hr) }
      $1 = Int(cchActual)
    }
    return String(decoding: buffer, as: UTF16.self)
  }

  public func GetContainerFormat() throws -> GUID {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapCodecInfo.self, capacity: 1)

    var guidContainerFromat: GUID = GUID()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetContainerFormat(pThis,
                                                        &guidContainerFromat)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return guidContainerFromat
  }

  public func GetDeviceManufacturer() throws -> String {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapCodecInfo.self, capacity: 1)

    var cchActual: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetDeviceManufacturer(pThis, 0, nil,
                                                           &cchActual)
    guard hr == S_OK else { throw COMError(hr: hr) }

    let buffer: [WCHAR] =
        try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetDeviceManufacturer(pThis,
                                                             UINT($0.count),
                                                             $0.baseAddress,
                                                             &cchActual)
      guard hr == S_OK else { throw COMError(hr: hr) }
      $1 = Int(cchActual)
    }
    return String(decoding: buffer, as: UTF16.self)
  }

  public func GetDeviceModels() throws -> String {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapCodecInfo.self, capacity: 1)

    var cchActual: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetDeviceModels(pThis, 0, nil, &cchActual)
    guard hr == S_OK else { throw COMError(hr: hr) }

    let buffer: [WCHAR] =
        try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetDeviceModels(pThis, UINT($0.count),
                                                       $0.baseAddress,
                                                       &cchActual)
      guard hr == S_OK else { throw COMError(hr: hr) }
      $1 = Int(cchActual)
    }
    return String(decoding: buffer, as: UTF16.self)
  }

  public func GetFileExtensions() throws -> String {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapCodecInfo.self, capacity: 1)

    var cchActual: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetFileExtensions(pThis, 0, nil, &cchActual)
    guard hr == S_OK else { throw COMError(hr: hr) }

    let buffer: [WCHAR] =
        try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetFileExtensions(pThis, UINT($0.count),
                                                         $0.baseAddress,
                                                         &cchActual)
      guard hr == S_OK else { throw COMError(hr: hr) }
      $1 = Int(cchActual)
    }
    return String(decoding: buffer, as: UTF16.self)
  }

  public func GetMimeTypes() throws -> String {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapCodecInfo.self, capacity: 1)

    var cchActual: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetMimeTypes(pThis, 0, nil, &cchActual)
    guard hr == S_OK else { throw COMError(hr: hr) }

    let buffer: [WCHAR] =
        try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetMimeTypes(pThis, UINT($0.count),
                                                    $0.baseAddress, &cchActual)
      guard hr == S_OK else { throw COMError(hr: hr) }
      $1 = Int(cchActual)
    }
    return String(decoding: buffer, as: UTF16.self)
  }

  public func GetPixelFormats() throws -> [GUID] {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapCodecInfo.self, capacity: 1)

    var cActual: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetPixelFormats(pThis, 0, nil, &cActual)
    guard hr == S_OK else { throw COMError(hr: hr) }

    return try Array<GUID>(unsafeUninitializedCapacity: Int(cActual)) {
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetPixelFormats(pThis, UINT($0.count),
                                                       $0.baseAddress, &cActual)
      guard hr == S_OK else { throw COMError(hr: hr) }
      $1 = Int(cActual)
    }
  }

  public func MatchesMimeType(_ szMimeType: String) throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapCodecInfo.self, capacity: 1)

    var fMatches: WindowsBool = false
    let hr: HRESULT = szMimeType.withCString(encodedAs: UTF16.self) {
      pThis.pointee.lpVtbl.pointee.MatchesMimeType(pThis, $0, &fMatches)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
    return fMatches == true
  }
}

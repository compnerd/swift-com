// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IWICBitmapCodecInfo: IWICComponentInfo {
  override public class var IID: IID { IID_IWICBitmapCodecInfo }

  public func DoesSupportAnimation() throws -> Bool {
    return try perform(as: WinSDK.IWICBitmapCodecInfo.self) { pThis in
      var fSupportAnimation: WindowsBool = false
      try CHECKED(pThis.pointee.lpVtbl.pointee.DoesSupportAnimation(pThis, &fSupportAnimation))
      return fSupportAnimation == true
    }
  }

  public func DoesSupportChromakey() throws -> Bool {
    return try perform(as: WinSDK.IWICBitmapCodecInfo.self) { pThis in
      var fSupportChromakey: WindowsBool = false
      try CHECKED(pThis.pointee.lpVtbl.pointee.DoesSupportChromakey(pThis, &fSupportChromakey))
      return fSupportChromakey == true
    }
  }

  public func DoesSupportLossless() throws -> Bool {
    return try perform(as: WinSDK.IWICBitmapCodecInfo.self) { pThis in
      var fSupportLossless: WindowsBool = false
      try CHECKED(pThis.pointee.lpVtbl.pointee.DoesSupportLossless(pThis, &fSupportLossless))
      return fSupportLossless == true
    }
  }

  public func DoesSupportMultiframe() throws -> Bool {
    return try perform(as: WinSDK.IWICBitmapCodecInfo.self) { pThis in
      var fSupportMultiframe: WindowsBool = false
      try CHECKED(pThis.pointee.lpVtbl.pointee.DoesSupportMultiframe(pThis, &fSupportMultiframe))
      return fSupportMultiframe == true
    }
  }

  public func GetColorManagementVersion() throws -> String {
    return try perform(as: WinSDK.IWICBitmapCodecInfo.self) { pThis in
      var cchActual: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetColorManagementVersion(pThis, 0, nil, &cchActual))

      let buffer: [WCHAR] =
          try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
        try CHECKED(pThis.pointee.lpVtbl.pointee.GetColorManagementVersion(pThis, UINT($0.count), $0.baseAddress, &cchActual))
        $1 = Int(cchActual)
      }
      return String(decoding: buffer, as: UTF16.self)
    }
  }

  public func GetContainerFormat() throws -> GUID {
    return try perform(as: WinSDK.IWICBitmapCodecInfo.self) { pThis in
      var guidContainerFromat: GUID = GUID()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetContainerFormat(pThis, &guidContainerFromat))
      return guidContainerFromat
    }
  }

  public func GetDeviceManufacturer() throws -> String {
    return try perform(as: WinSDK.IWICBitmapCodecInfo.self) { pThis in
      var cchActual: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDeviceManufacturer(pThis, 0, nil, &cchActual))

      let buffer: [WCHAR] =
          try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
        try CHECKED(pThis.pointee.lpVtbl.pointee.GetDeviceManufacturer(pThis, UINT($0.count), $0.baseAddress, &cchActual))
        $1 = Int(cchActual)
      }
      return String(decoding: buffer, as: UTF16.self)
    }
  }

  public func GetDeviceModels() throws -> String {
    return try perform(as: WinSDK.IWICBitmapCodecInfo.self) { pThis in
      var cchActual: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetDeviceModels(pThis, 0, nil, &cchActual))

      let buffer: [WCHAR] =
          try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
        try CHECKED(pThis.pointee.lpVtbl.pointee.GetDeviceModels(pThis, UINT($0.count), $0.baseAddress, &cchActual))
        $1 = Int(cchActual)
      }
      return String(decoding: buffer, as: UTF16.self)
    }
  }

  public func GetFileExtensions() throws -> String {
    return try perform(as: WinSDK.IWICBitmapCodecInfo.self) { pThis in
      var cchActual: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetFileExtensions(pThis, 0, nil, &cchActual))

      let buffer: [WCHAR] =
          try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
        try CHECKED(pThis.pointee.lpVtbl.pointee.GetFileExtensions(pThis, UINT($0.count), $0.baseAddress, &cchActual))
        $1 = Int(cchActual)
      }
      return String(decoding: buffer, as: UTF16.self)
    }
  }

  public func GetMimeTypes() throws -> String {
    return try perform(as: WinSDK.IWICBitmapCodecInfo.self) { pThis in
      var cchActual: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetMimeTypes(pThis, 0, nil, &cchActual))

      let buffer: [WCHAR] =
          try Array<WCHAR>(unsafeUninitializedCapacity: Int(cchActual)) {
        try CHECKED(pThis.pointee.lpVtbl.pointee.GetMimeTypes(pThis, UINT($0.count), $0.baseAddress, &cchActual))
        $1 = Int(cchActual)
      }
      return String(decoding: buffer, as: UTF16.self)
    }
  }

  public func GetPixelFormats() throws -> [GUID] {
    return try perform(as: WinSDK.IWICBitmapCodecInfo.self) { pThis in
      var cActual: UINT = UINT(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetPixelFormats(pThis, 0, nil, &cActual))

      return try Array<GUID>(unsafeUninitializedCapacity: Int(cActual)) {
        try CHECKED(pThis.pointee.lpVtbl.pointee.GetPixelFormats(pThis, UINT($0.count), $0.baseAddress, &cActual))
        $1 = Int(cActual)
      }
    }
  }

  public func MatchesMimeType(_ szMimeType: String) throws -> Bool {
    return try perform(as: WinSDK.IWICBitmapCodecInfo.self) { pThis in
      var fMatches: WindowsBool = false
      try CHECKED {
        szMimeType.withCString(encodedAs: UTF16.self) {
          pThis.pointee.lpVtbl.pointee.MatchesMimeType(pThis, $0, &fMatches)
        }
      }
      return fMatches == true
    }
  }
}

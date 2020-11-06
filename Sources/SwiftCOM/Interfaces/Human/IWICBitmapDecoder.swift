/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICBitmapDecoder: IUnknown {
  override public class var IID: IID { IID_IWICBitmapDecoder }

  public func CopyPalette(_ pIPalette: IWICPalette) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapDecoder.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CopyPalette(pThis, RawPointer(pIPalette))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func GetColorContexts() throws -> [IWICColorContext] {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapDecoder.self, capacity: 1)

    var cActualCount: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetColorContexts(pThis, 0, nil,
                                                      &cActualCount)
    guard hr == S_OK else { throw COMError(hr: hr) }

    let contexts: [UnsafeMutablePointer<WinSDK.IWICColorContext>?] =
        try .init(unsafeUninitializedCapacity: Int(cActualCount)) {
      let hr: HRESULT =
          pThis.pointee.lpVtbl.pointee.GetColorContexts(pThis, cActualCount,
                                                        $0.baseAddress,
                                                        &cActualCount)
      guard hr == S_OK else { throw COMError(hr: hr) }
      $1 = Int(cActualCount)
    }

    return contexts.map { IWICColorContext(pUnk: $0) }
  }

  public func GetContainerFormat() throws -> GUID {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapDecoder.self, capacity: 1)

    var guidContainerFormat: GUID = GUID()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetContainerFormat(pThis,
                                                        &guidContainerFormat)
    guard hr == S_OK else { throw COMError(hr: hr) }

    return guidContainerFormat
  }

  public func GetDecoderInfo() throws -> IWICBitmapDecoderInfo {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapDecoder.self, capacity: 1)

    var pIDecoderInfo: UnsafeMutablePointer<WinSDK.IWICBitmapDecoderInfo>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetDecoderInfo(pThis, &pIDecoderInfo)
    guard hr == S_OK else { throw COMError(hr: hr) }

    return IWICBitmapDecoderInfo(pUnk: pIDecoderInfo)
  }

  public func GetFrame(_ index: UINT) throws -> IWICBitmapFrameDecode {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapDecoder.self, capacity: 1)

    var pIBitmapFrame: UnsafeMutablePointer<WinSDK.IWICBitmapFrameDecode>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetFrame(pThis, index, &pIBitmapFrame)
    guard hr == S_OK else { throw COMError(hr: hr) }

    return IWICBitmapFrameDecode(pUnk: pIBitmapFrame)
  }

  public func GetFrameCount() throws -> UINT {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapDecoder.self, capacity: 1)

    var Count: UINT = UINT(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetFrameCount(pThis, &Count)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Count
  }

  public func GetMetadataQueryReader() throws -> IWICMetadataQueryReader {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapDecoder.self, capacity: 1)

    var pIMetadataQueryReader: UnsafeMutablePointer<WinSDK.IWICMetadataQueryReader>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetMetadataQueryReader(pThis,
                                                            &pIMetadataQueryReader)
    guard hr == S_OK else { throw COMError(hr: hr) }

    return IWICMetadataQueryReader(pUnk: pIMetadataQueryReader)
  }

  public func GetPreview() throws -> IWICBitmapSource {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapDecoder.self, capacity: 1)

    var pIBitmapSource: UnsafeMutablePointer<WinSDK.IWICBitmapSource>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetPreview(pThis, &pIBitmapSource)
    guard hr == S_OK else { throw COMError(hr: hr) }

    return IWICBitmapSource(pUnk: pIBitmapSource)
  }

  public func GetThumbnail() throws -> IWICBitmapSource {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapDecoder.self, capacity: 1)

    var pIBitmapSource: UnsafeMutablePointer<WinSDK.IWICBitmapSource>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetThumbnail(pThis, &pIBitmapSource)
    guard hr == S_OK else { throw COMError(hr: hr) }

    return IWICBitmapSource(pUnk: pIBitmapSource)
  }

  public func Initialize(_ pStream: IStream,
                         _ cacheOptions: WICDecodeOptions) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapDecoder.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Initialize(pThis, RawPointer(pStream),
                                                cacheOptions)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func QueryCapability(_ pStream: IStream) throws -> DWORD {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapDecoder.self, capacity: 1)

    var dwCapability: DWORD = DWORD(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.QueryCapability(pThis, RawPointer(pStream),
                                                     &dwCapability)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return dwCapability
  }
}

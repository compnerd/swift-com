/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICBitmapEncoder: IUnknown {
  override public class var IID: IID { IID_IWICBitmapEncoder }

  public func Commit() throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapEncoder.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Commit(pThis)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func CreateNewFrame() throws -> (IWICBitmapFrameEncode, IPropertyBag2) {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapEncoder.self, capacity: 1)

    var pIFrameEncode: UnsafeMutablePointer<WinSDK.IWICBitmapFrameEncode>?
    var pIEncoderOptions: UnsafeMutablePointer<WinSDK.IPropertyBag2>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateNewFrame(pThis, &pIFrameEncode,
                                                    &pIEncoderOptions)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return (IWICBitmapFrameEncode(pUnk: pIFrameEncode),
            IPropertyBag2(pUnk: pIEncoderOptions))
  }

  public func GetContainerFormat() throws -> GUID {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapEncoder.self, capacity: 1)

    var guidContainerFormat: GUID = GUID()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetContainerFormat(pThis,
                                                        &guidContainerFormat)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return guidContainerFormat
  }

  public func GetEncoderInfo() throws -> IWICBitmapEncoderInfo {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapEncoder.self, capacity: 1)

    var pIEncoderInfo: UnsafeMutablePointer<WinSDK.IWICBitmapEncoderInfo>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetEncoderInfo(pThis, &pIEncoderInfo)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmapEncoderInfo(pUnk: pIEncoderInfo)
  }

  public func GetMetadataQueryWriter() throws -> IWICMetadataQueryWriter {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapEncoder.self, capacity: 1)

    var pIMetadataQueryWriter: UnsafeMutablePointer<WinSDK.IWICMetadataQueryWriter>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetMetadataQueryWriter(pThis,
                                                            &pIMetadataQueryWriter)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICMetadataQueryWriter(pUnk: pIMetadataQueryWriter)
  }

  public func Initialize(_ pIStream: IStream,
                         _ cacheOption: WICBitmapEncoderCacheOption)
      throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapEncoder.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Initialize(pThis, RawPointer(pIStream),
                                                cacheOption)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetColorContexts(_ contexts: [IWICColorContext]) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapEncoder.self, capacity: 1)

    var pointers: [UnsafeMutablePointer<WinSDK.IWICColorContext>?] =
        contexts.map { RawPointer($0) }
    let hr: HRESULT = pointers.withUnsafeMutableBufferPointer {
      pThis.pointee.lpVtbl.pointee.SetColorContexts(pThis, UINT($0.count),
                                                    $0.baseAddress)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetPalette(_ pIPalette: IWICPalette) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapEncoder.self, capacity: 1)

    let hr: HRESULT =
      pThis.pointee.lpVtbl.pointee.SetPalette(pThis, RawPointer(pIPalette))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetPreview(_ pIPreview: IWICBitmapSource) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapEncoder.self, capacity: 1)

    let hr: HRESULT =
      pThis.pointee.lpVtbl.pointee.SetPreview(pThis, RawPointer(pIPreview))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetThumbnail(_ pIThumbnail: IWICBitmapSource) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICBitmapEncoder.self, capacity: 1)

    let hr: HRESULT =
      pThis.pointee.lpVtbl.pointee.SetThumbnail(pThis, RawPointer(pIThumbnail))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

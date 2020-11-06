/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IWICImagingFactory: IUnknown {
  override public class var IID: IID { IID_IWICImagingFactory }

  public func CreateBitmap(_ uiWidth: UINT, _ uiHeight: UINT,
                           _ pixelFormat: REFWICPixelFormatGUID,
                           _ option: WICBitmapCreateCacheOption)
      throws -> IWICBitmap {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIBitmap: UnsafeMutablePointer<WinSDK.IWICBitmap>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateBitmap(pThis, uiWidth, uiHeight,
                                                  pixelFormat, option, &pIBitmap)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmap(pUnk: pIBitmap)
  }

  public func CreateBitmapClipper() throws -> IWICBitmapClipper {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIBitmapClipper: UnsafeMutablePointer<WinSDK.IWICBitmapClipper>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateBitmapClipper(pThis, &pIBitmapClipper)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmapClipper(pUnk: pIBitmapClipper)
  }

  public func CreateBitmapFlipRotator() throws -> IWICBitmapFlipRotator {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIBitmapFlipRotator: UnsafeMutablePointer<WinSDK.IWICBitmapFlipRotator>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateBitmapFlipRotator(pThis,
                                                             &pIBitmapFlipRotator)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmapFlipRotator(pUnk: pIBitmapFlipRotator)
  }

  public func CreateBitmapFromHBITMAP(_ hBitmap: HBITMAP, _ hPalette: HPALETTE,
                                      _ option: WICBitmapAlphaChannelOption)
      throws -> IWICBitmap {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIBitmap: UnsafeMutablePointer<WinSDK.IWICBitmap>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateBitmapFromHBITMAP(pThis, hBitmap,
                                                             hPalette, option,
                                                             &pIBitmap)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmap(pUnk: pIBitmap)
  }

  public func CreateBitmapFromHICON(_ hIcon: HICON) throws -> IWICBitmap {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIBitmap: UnsafeMutablePointer<WinSDK.IWICBitmap>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateBitmapFromHICON(pThis, hIcon, &pIBitmap)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmap(pUnk: pIBitmap)
  }

  public func CreateBitmapFromMemory(_ uiWidth: UINT, _ uiHeight: UINT,
                                     _ pixelFormat: REFWICPixelFormatGUID,
                                     _ cbStride: UINT, _ pbBuffer: inout [BYTE])
      throws -> IWICBitmap {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIBitmap: UnsafeMutablePointer<WinSDK.IWICBitmap>?
    let hr: HRESULT = pbBuffer.withUnsafeMutableBufferPointer {
      pThis.pointee.lpVtbl.pointee.CreateBitmapFromMemory(pThis, uiWidth, uiHeight,
                                                          pixelFormat, cbStride,
                                                          UINT($0.count),
                                                          $0.baseAddress,
                                                          &pIBitmap)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmap(pUnk: pIBitmap)
  }

  public func CreateBitmapFromSource(_ pIBitmapSource: IWICBitmapSource,
                                     _ option: WICBitmapCreateCacheOption)
      throws -> IWICBitmap {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIBitmap: UnsafeMutablePointer<WinSDK.IWICBitmap>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateBitmapFromSource(pThis,
                                                            RawPointer(pIBitmapSource),
                                                            option, &pIBitmap)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmap(pUnk: pIBitmap)
  }

  public func CreateBitmapFromSourceRect(_ pIBitmapSource: IWICBitmapSource,
                                         _ x: UINT, _ y: UINT, _ width: UINT,
                                         _ height: UINT) throws -> IWICBitmap {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIBitmap: UnsafeMutablePointer<WinSDK.IWICBitmap>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateBitmapFromSourceRect(pThis,
                                                                RawPointer(pIBitmapSource),
                                                                x, y, width,
                                                                height,
                                                                &pIBitmap)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmap(pUnk: pIBitmap)
  }

  public func CreateBitmapScaler() throws -> IWICBitmapScaler {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIBitmapScaler: UnsafeMutablePointer<WinSDK.IWICBitmapScaler>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateBitmapScaler(pThis, &pIBitmapScaler)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmapScaler(pUnk: pIBitmapScaler)
  }

  public func CreateColorContext() throws -> IWICColorContext {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIWICColorContext: UnsafeMutablePointer<WinSDK.IWICColorContext>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateColorContext(pThis,
                                                        &pIWICColorContext)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICColorContext(pUnk: pIWICColorContext)
  }

  public func CreateColorTransformer() throws -> IWICColorTransform {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIWICColorTransform: UnsafeMutablePointer<WinSDK.IWICColorTransform>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateColorTransformer(pThis,
                                                            &pIWICColorTransform)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICColorTransform(pUnk: pIWICColorTransform)
  }

  public func CreateComponentEnumerator(_ componentTypes: DWORD,
                                        _ options: DWORD)
      throws -> IEnumUnknown {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIEnumUnknown: UnsafeMutablePointer<WinSDK.IEnumUnknown>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateComponentEnumerator(pThis,
                                                               componentTypes,
                                                               options,
                                                               &pIEnumUnknown)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IEnumUnknown(pUnk: pIEnumUnknown)
  }

  public func CreateComponentInfo(_ clsidComponent: REFCLSID)
      throws -> IWICComponentInfo {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIInfo: UnsafeMutablePointer<WinSDK.IWICComponentInfo>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateComponentInfo(pThis, clsidComponent,
                                                         &pIInfo)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICComponentInfo(pUnk: pIInfo)
  }

  public func CreateDecoder(_ guidContainerFormat: REFGUID,
                            _ guidVendor: GUID?)
      throws -> IWICBitmapDecoder {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIDecoder: UnsafeMutablePointer<WinSDK.IWICBitmapDecoder>?
    let hr: HRESULT
    if var guidVendor = guidVendor {
      hr = pThis.pointee.lpVtbl.pointee.CreateDecoder(pThis, guidContainerFormat,
                                                      &guidVendor, &pIDecoder)
    } else {
      hr = pThis.pointee.lpVtbl.pointee.CreateDecoder(pThis, guidContainerFormat,
                                                      nil, &pIDecoder)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmapDecoder(pUnk: pIDecoder)
  }

  public func CreateDecoderFromFileHandle(_ hFile: ULONG_PTR,
                                          _ guidVendor: GUID?,
                                          _ metadataOptions: WICDecodeOptions)
      throws -> IWICBitmapDecoder {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIDecoder: UnsafeMutablePointer<WinSDK.IWICBitmapDecoder>?
    let hr: HRESULT
    if var guidVendor = guidVendor {
      hr = pThis.pointee.lpVtbl.pointee
              .CreateDecoderFromFileHandle(pThis, hFile, &guidVendor,
                                           metadataOptions, &pIDecoder)
    } else {
      hr = pThis.pointee.lpVtbl.pointee
              .CreateDecoderFromFileHandle(pThis, hFile, nil, metadataOptions,
                                           &pIDecoder)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmapDecoder(pUnk: pIDecoder)
  }

  public func CreateDecoderFromFilename(_ szFileName: String,
                                        _ guidVendor: GUID?,
                                        _ dwDesiredAccess: DWORD,
                                        _ metadataOptions: WICDecodeOptions)
      throws -> IWICBitmapDecoder {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIDecoder: UnsafeMutablePointer<WinSDK.IWICBitmapDecoder>?
    let hr: HRESULT
    if var guidVendor = guidVendor {
      hr = szFileName.withCString(encodedAs: UTF16.self) {
        pThis.pointee.lpVtbl.pointee.CreateDecoderFromFilename(pThis, $0,
                                                               &guidVendor,
                                                               dwDesiredAccess,
                                                               metadataOptions,
                                                               &pIDecoder)
      }
    } else {
      hr = szFileName.withCString(encodedAs: UTF16.self) {
        pThis.pointee.lpVtbl.pointee.CreateDecoderFromFilename(pThis, $0, nil,
                                                               dwDesiredAccess,
                                                               metadataOptions,
                                                               &pIDecoder)
      }
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmapDecoder(pUnk: pIDecoder)
  }

  public func CreateDecoderFromStream(_ pIStream: IStream, _ guidVendor: GUID?,
                                      _ metadataOptions: WICDecodeOptions)
      throws -> IWICBitmapDecoder {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIDecoder: UnsafeMutablePointer<WinSDK.IWICBitmapDecoder>?
    let hr: HRESULT
    if var guidVendor = guidVendor {
      hr = pThis.pointee.lpVtbl.pointee
              .CreateDecoderFromStream(pThis, RawPointer(pIStream), &guidVendor,
                                       metadataOptions, &pIDecoder)
    } else {
      hr = pThis.pointee.lpVtbl.pointee
              .CreateDecoderFromStream(pThis, RawPointer(pIStream), nil,
                                       metadataOptions, &pIDecoder)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmapDecoder(pUnk: pIDecoder)
  }

  public func CreateEncoder(_ guidContainerFormat: REFGUID,
                            _ guidVendor: GUID?) throws -> IWICBitmapEncoder {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIEncoder: UnsafeMutablePointer<WinSDK.IWICBitmapEncoder>?
    let hr: HRESULT
    if var guidVendor = guidVendor {
      hr = pThis.pointee.lpVtbl.pointee.CreateEncoder(pThis, guidContainerFormat,
                                                      &guidVendor, &pIEncoder)
    } else {
      hr = pThis.pointee.lpVtbl.pointee.CreateEncoder(pThis, guidContainerFormat,
                                                      nil, &pIEncoder)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICBitmapEncoder(pUnk: pIEncoder)
  }

  public func CreateFastMetadataEncoderFromDecoder(_ pIDecoder: IWICBitmapDecoder)
      throws -> IWICFastMetadataEncoder {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIFastEncoder: UnsafeMutablePointer<WinSDK.IWICFastMetadataEncoder>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee
            .CreateFastMetadataEncoderFromDecoder(pThis, RawPointer(pIDecoder),
                                                  &pIFastEncoder)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICFastMetadataEncoder(pUnk: pIFastEncoder)
  }

  public func CreateFastMetadataEncoderFromFrameDecode(_ pIFrameDecoder: IWICBitmapFrameDecode)
      throws -> IWICFastMetadataEncoder {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIFastEncoder: UnsafeMutablePointer<WinSDK.IWICFastMetadataEncoder>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee
            .CreateFastMetadataEncoderFromFrameDecode(pThis,
                                                      RawPointer(pIFrameDecoder),
                                                      &pIFastEncoder)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICFastMetadataEncoder(pUnk: pIFastEncoder)
  }

  public func CreateFormatConverter() throws -> IWICFormatConverter {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIFormatConverter: UnsafeMutablePointer<WinSDK.IWICFormatConverter>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateFormatConverter(pThis, &pIFormatConverter)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICFormatConverter(pUnk: pIFormatConverter)
  }

  public func CreatePalette() throws -> IWICPalette {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIPalette: UnsafeMutablePointer<WinSDK.IWICPalette>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreatePalette(pThis, &pIPalette)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICPalette(pUnk: pIPalette)
  }

  public func CreateQueryWriter(_ guidMetadataFormat: REFGUID,
                                _ guidVendor: GUID?)
      throws -> IWICMetadataQueryWriter {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIQueryWriter: UnsafeMutablePointer<WinSDK.IWICMetadataQueryWriter>?
    let hr: HRESULT
    if var guidVendor = guidVendor {
      hr = pThis.pointee.lpVtbl.pointee
              .CreateQueryWriter(pThis, guidMetadataFormat, &guidVendor,
                                 &pIQueryWriter)
    } else {
      hr = pThis.pointee.lpVtbl.pointee
              .CreateQueryWriter(pThis, guidMetadataFormat, nil, &pIQueryWriter)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICMetadataQueryWriter(pUnk: pIQueryWriter)
  }

  public func CreateQueryWriterFromReader(_ pIQueryReader: IWICMetadataQueryReader,
                                          _ guidVendor: GUID?)
      throws -> IWICMetadataQueryWriter {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIQueryWriter: UnsafeMutablePointer<WinSDK.IWICMetadataQueryWriter>?
    let hr: HRESULT
    if var guidVendor = guidVendor {
      hr = pThis.pointee.lpVtbl.pointee
              .CreateQueryWriterFromReader(pThis, RawPointer(pIQueryReader),
                                           &guidVendor, &pIQueryWriter)
    } else {
      hr = pThis.pointee.lpVtbl.pointee
              .CreateQueryWriterFromReader(pThis, RawPointer(pIQueryReader),
                                           nil, &pIQueryWriter)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICMetadataQueryWriter(pUnk: pIQueryWriter)
  }

  public func CreateStream() throws -> IWICStream {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IWICImagingFactory.self, capacity: 1)

    var pIWICStream: UnsafeMutablePointer<WinSDK.IWICStream>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CreateStream(pThis, &pIWICStream)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IWICStream(pUnk: pIWICStream)
  }
}

// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IWICImagingFactory: IUnknown {
  override public class var IID: IID { IID_IWICImagingFactory }

  public func CreateBitmap(_ uiWidth: UINT, _ uiHeight: UINT,
                           _ pixelFormat: REFWICPixelFormatGUID,
                           _ option: WICBitmapCreateCacheOption)
      throws -> IWICBitmap {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIBitmap: UnsafeMutablePointer<WinSDK.IWICBitmap>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateBitmap(pThis, uiWidth, uiHeight, pixelFormat, option, &pIBitmap))
      return IWICBitmap(pUnk: pIBitmap)
    }
  }

  public func CreateBitmapClipper() throws -> IWICBitmapClipper {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIBitmapClipper: UnsafeMutablePointer<WinSDK.IWICBitmapClipper>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateBitmapClipper(pThis, &pIBitmapClipper))
      return IWICBitmapClipper(pUnk: pIBitmapClipper)
    }
  }

  public func CreateBitmapFlipRotator() throws -> IWICBitmapFlipRotator {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIBitmapFlipRotator: UnsafeMutablePointer<WinSDK.IWICBitmapFlipRotator>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateBitmapFlipRotator(pThis, &pIBitmapFlipRotator))
      return IWICBitmapFlipRotator(pUnk: pIBitmapFlipRotator)
    }
  }

  public func CreateBitmapFromHBITMAP(_ hBitmap: HBITMAP, _ hPalette: HPALETTE,
                                      _ option: WICBitmapAlphaChannelOption)
      throws -> IWICBitmap {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIBitmap: UnsafeMutablePointer<WinSDK.IWICBitmap>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateBitmapFromHBITMAP(pThis, hBitmap, hPalette, option, &pIBitmap))
      return IWICBitmap(pUnk: pIBitmap)
    }
  }

  public func CreateBitmapFromHICON(_ hIcon: HICON) throws -> IWICBitmap {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIBitmap: UnsafeMutablePointer<WinSDK.IWICBitmap>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateBitmapFromHICON(pThis, hIcon, &pIBitmap))
      return IWICBitmap(pUnk: pIBitmap)
    }
  }

  public func CreateBitmapFromMemory(_ uiWidth: UINT, _ uiHeight: UINT,
                                     _ pixelFormat: REFWICPixelFormatGUID,
                                     _ cbStride: UINT, _ pbBuffer: inout [BYTE])
      throws -> IWICBitmap {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIBitmap: UnsafeMutablePointer<WinSDK.IWICBitmap>?
      try CHECKED {
        pbBuffer.withUnsafeMutableBufferPointer {
          pThis.pointee.lpVtbl.pointee.CreateBitmapFromMemory(pThis, uiWidth, uiHeight, pixelFormat, cbStride, UINT($0.count), $0.baseAddress, &pIBitmap)
        }
      }
      return IWICBitmap(pUnk: pIBitmap)
    }
  }

  public func CreateBitmapFromSource(_ pIBitmapSource: IWICBitmapSource,
                                     _ option: WICBitmapCreateCacheOption)
      throws -> IWICBitmap {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIBitmap: UnsafeMutablePointer<WinSDK.IWICBitmap>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateBitmapFromSource(pThis, RawPointer(pIBitmapSource), option, &pIBitmap))
      return IWICBitmap(pUnk: pIBitmap)
    }
  }

  public func CreateBitmapFromSourceRect(_ pIBitmapSource: IWICBitmapSource,
                                         _ x: UINT, _ y: UINT, _ width: UINT,
                                         _ height: UINT) throws -> IWICBitmap {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIBitmap: UnsafeMutablePointer<WinSDK.IWICBitmap>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateBitmapFromSourceRect(pThis, RawPointer(pIBitmapSource), x, y, width, height, &pIBitmap))
      return IWICBitmap(pUnk: pIBitmap)
    }
  }

  public func CreateBitmapScaler() throws -> IWICBitmapScaler {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIBitmapScaler: UnsafeMutablePointer<WinSDK.IWICBitmapScaler>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateBitmapScaler(pThis, &pIBitmapScaler))
      return IWICBitmapScaler(pUnk: pIBitmapScaler)
    }
  }

  public func CreateColorContext() throws -> IWICColorContext {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIWICColorContext: UnsafeMutablePointer<WinSDK.IWICColorContext>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateColorContext(pThis, &pIWICColorContext))
      return IWICColorContext(pUnk: pIWICColorContext)
    }
  }

  public func CreateColorTransformer() throws -> IWICColorTransform {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIWICColorTransform: UnsafeMutablePointer<WinSDK.IWICColorTransform>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateColorTransformer(pThis, &pIWICColorTransform))
      return IWICColorTransform(pUnk: pIWICColorTransform)
    }
  }

  public func CreateComponentEnumerator(_ componentTypes: DWORD,
                                        _ options: DWORD)
      throws -> IEnumUnknown {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIEnumUnknown: UnsafeMutablePointer<WinSDK.IEnumUnknown>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateComponentEnumerator(pThis, componentTypes, options, &pIEnumUnknown))
      return IEnumUnknown(pUnk: pIEnumUnknown)
    }
  }

  public func CreateComponentInfo(_ clsidComponent: REFCLSID)
      throws -> IWICComponentInfo {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIInfo: UnsafeMutablePointer<WinSDK.IWICComponentInfo>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateComponentInfo(pThis, clsidComponent, &pIInfo))
      return IWICComponentInfo(pUnk: pIInfo)
    }
  }

  public func CreateDecoder(_ guidContainerFormat: REFGUID,
                            _ guidVendor: GUID?)
      throws -> IWICBitmapDecoder {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIDecoder: UnsafeMutablePointer<WinSDK.IWICBitmapDecoder>?

      if var guidVendor = guidVendor {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CreateDecoder(pThis, guidContainerFormat, &guidVendor, &pIDecoder))
      } else {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CreateDecoder(pThis, guidContainerFormat, nil, &pIDecoder))
      }

      return IWICBitmapDecoder(pUnk: pIDecoder)
    }
  }

  public func CreateDecoderFromFileHandle(_ hFile: ULONG_PTR,
                                          _ guidVendor: GUID?,
                                          _ metadataOptions: WICDecodeOptions)
      throws -> IWICBitmapDecoder {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIDecoder: UnsafeMutablePointer<WinSDK.IWICBitmapDecoder>?
      if var guidVendor = guidVendor {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CreateDecoderFromFileHandle(pThis, hFile, &guidVendor, metadataOptions, &pIDecoder))
      } else {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CreateDecoderFromFileHandle(pThis, hFile, nil, metadataOptions, &pIDecoder))
      }
      return IWICBitmapDecoder(pUnk: pIDecoder)
    }
  }

  public func CreateDecoderFromFilename(_ szFileName: String,
                                        _ guidVendor: GUID?,
                                        _ dwDesiredAccess: DWORD,
                                        _ metadataOptions: WICDecodeOptions)
      throws -> IWICBitmapDecoder {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIDecoder: UnsafeMutablePointer<WinSDK.IWICBitmapDecoder>?
      if var guidVendor = guidVendor {
        try CHECKED {
          szFileName.withCString(encodedAs: UTF16.self) {
            pThis.pointee.lpVtbl.pointee.CreateDecoderFromFilename(pThis, $0, &guidVendor, dwDesiredAccess, metadataOptions, &pIDecoder)
          }
        }
      } else {
        try CHECKED {
          szFileName.withCString(encodedAs: UTF16.self) {
            pThis.pointee.lpVtbl.pointee.CreateDecoderFromFilename(pThis, $0, nil, dwDesiredAccess, metadataOptions, &pIDecoder)
          }
        }
      }
      return IWICBitmapDecoder(pUnk: pIDecoder)
    }
  }

  public func CreateDecoderFromStream(_ pIStream: IStream, _ guidVendor: GUID?,
                                      _ metadataOptions: WICDecodeOptions)
      throws -> IWICBitmapDecoder {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIDecoder: UnsafeMutablePointer<WinSDK.IWICBitmapDecoder>?
      if var guidVendor = guidVendor {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CreateDecoderFromStream(pThis, RawPointer(pIStream), &guidVendor, metadataOptions, &pIDecoder))
      } else {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CreateDecoderFromStream(pThis, RawPointer(pIStream), nil, metadataOptions, &pIDecoder))
      }
      return IWICBitmapDecoder(pUnk: pIDecoder)
    }
  }

  public func CreateEncoder(_ guidContainerFormat: REFGUID,
                            _ guidVendor: GUID?) throws -> IWICBitmapEncoder {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIEncoder: UnsafeMutablePointer<WinSDK.IWICBitmapEncoder>?
      if var guidVendor = guidVendor {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CreateEncoder(pThis, guidContainerFormat, &guidVendor, &pIEncoder))
      } else {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CreateEncoder(pThis, guidContainerFormat, nil, &pIEncoder))
      }
      return IWICBitmapEncoder(pUnk: pIEncoder)
    }
  }

  public func CreateFastMetadataEncoderFromDecoder(_ pIDecoder: IWICBitmapDecoder)
      throws -> IWICFastMetadataEncoder {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIFastEncoder: UnsafeMutablePointer<WinSDK.IWICFastMetadataEncoder>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateFastMetadataEncoderFromDecoder(pThis, RawPointer(pIDecoder), &pIFastEncoder))
      return IWICFastMetadataEncoder(pUnk: pIFastEncoder)
    }
  }

  public func CreateFastMetadataEncoderFromFrameDecode(_ pIFrameDecoder: IWICBitmapFrameDecode)
      throws -> IWICFastMetadataEncoder {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIFastEncoder: UnsafeMutablePointer<WinSDK.IWICFastMetadataEncoder>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateFastMetadataEncoderFromFrameDecode(pThis, RawPointer(pIFrameDecoder), &pIFastEncoder))
      return IWICFastMetadataEncoder(pUnk: pIFastEncoder)
    }
  }

  public func CreateFormatConverter() throws -> IWICFormatConverter {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIFormatConverter: UnsafeMutablePointer<WinSDK.IWICFormatConverter>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateFormatConverter(pThis, &pIFormatConverter))
      return IWICFormatConverter(pUnk: pIFormatConverter)
    }
  }

  public func CreatePalette() throws -> IWICPalette {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIPalette: UnsafeMutablePointer<WinSDK.IWICPalette>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreatePalette(pThis, &pIPalette))
      return IWICPalette(pUnk: pIPalette)
    }
  }

  public func CreateQueryWriter(_ guidMetadataFormat: REFGUID,
                                _ guidVendor: GUID?)
      throws -> IWICMetadataQueryWriter {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIQueryWriter: UnsafeMutablePointer<WinSDK.IWICMetadataQueryWriter>?
      if var guidVendor = guidVendor {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CreateQueryWriter(pThis, guidMetadataFormat, &guidVendor, &pIQueryWriter))
      } else {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CreateQueryWriter(pThis, guidMetadataFormat, nil, &pIQueryWriter))
      }
      return IWICMetadataQueryWriter(pUnk: pIQueryWriter)
    }
  }

  public func CreateQueryWriterFromReader(_ pIQueryReader: IWICMetadataQueryReader,
                                          _ guidVendor: GUID?)
      throws -> IWICMetadataQueryWriter {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIQueryWriter: UnsafeMutablePointer<WinSDK.IWICMetadataQueryWriter>?
      if var guidVendor = guidVendor {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CreateQueryWriterFromReader(pThis, RawPointer(pIQueryReader), &guidVendor, &pIQueryWriter))
      } else {
        try CHECKED(pThis.pointee.lpVtbl.pointee.CreateQueryWriterFromReader(pThis, RawPointer(pIQueryReader), nil, &pIQueryWriter))
      }
      return IWICMetadataQueryWriter(pUnk: pIQueryWriter)
    }
  }

  public func CreateStream() throws -> IWICStream {
    return try perform(as: WinSDK.IWICImagingFactory.self) { pThis in
      var pIWICStream: UnsafeMutablePointer<WinSDK.IWICStream>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateStream(pThis, &pIWICStream))
      return IWICStream(pUnk: pIWICStream)
    }
  }
}

// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

public class IWICBitmapFrameEncode: IUnknown {
  override public class var IID: IID { IID_IWICBitmapFrameEncode }

  public func Commit() throws {
    return try perform(as: WinSDK.IWICBitmapFrameEncode.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Commit(pThis))
    }
  }

  public func GetMetadataQueryWriter() throws -> IWICMetadataQueryWriter {
    return try perform(as: WinSDK.IWICBitmapFrameEncode.self) { pThis in
      var pIMetadataQueryWriter: UnsafeMutablePointer<WinSDK.IWICMetadataQueryWriter>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetMetadataQueryWriter(pThis, &pIMetadataQueryWriter))
      return IWICMetadataQueryWriter(pUnk: pIMetadataQueryWriter)
    }
  }

  public func Initialize(_ pIEncoderOptions: IPropertyBag2) throws {
    return try perform(as: WinSDK.IWICBitmapFrameEncode.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Initialize(pThis, RawPointer(pIEncoderOptions)))
    }
  }

  public func SetColorContexts(_ contexts: [IWICColorContext]) throws {
    return try perform(as: WinSDK.IWICBitmapFrameEncode.self) { pThis in
      var pointers: [UnsafeMutablePointer<WinSDK.IWICColorContext>?] =
          contexts.map { RawPointer($0) }
      try CHECKED {
        pointers.withUnsafeMutableBufferPointer {
          pThis.pointee.lpVtbl.pointee.SetColorContexts(pThis, UINT($0.count), $0.baseAddress)
        }
      }
    }
  }

  public func SetPalette(_ pIPalette: IWICPalette) throws {
    return try perform(as: WinSDK.IWICBitmapFrameEncode.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetPalette(pThis, RawPointer(pIPalette)))
    }
  }

  public func SetPixelFormat(_ pPixelFormat: inout WICPixelFormatGUID) throws {
    return try perform(as: WinSDK.IWICBitmapFrameEncode.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetPixelFormat(pThis, &pPixelFormat))
    }
  }

  public func SetResolution(_ dpiX: Double, _ dpiY: Double) throws {
    return try perform(as: WinSDK.IWICBitmapFrameEncode.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetResolution(pThis, dpiX, dpiY))
    }
  }

  public func SetSize(_ uiWidth: UINT, _ uiHeight: UINT) throws {
    return try perform(as: WinSDK.IWICBitmapFrameEncode.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetSize(pThis, uiWidth, uiHeight))
    }
  }

  public func SetThumbnail(_ pIThumbnail: IWICBitmapSource) throws {
    return try perform(as: WinSDK.IWICBitmapFrameEncode.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetThumbnail(pThis, RawPointer(pIThumbnail)))
    }
  }

  public func WritePixels(_ lineCount: UINT, _ cbStride: UINT, _ pixels: inout [BYTE]) throws {
    return try perform(as: WinSDK.IWICBitmapFrameEncode.self) { pThis in
      try CHECKED {
        pixels.withUnsafeMutableBufferPointer {
          pThis.pointee.lpVtbl.pointee.WritePixels(pThis, lineCount, cbStride, UINT($0.count), $0.baseAddress)
        }
      }
    }
  }

  public func WriteSource(_ pIBitmapSource: IWICBitmapSource, _ rc: inout WICRect) throws {
    return try perform(as: WinSDK.IWICBitmapFrameEncode.self) { pThis in
      try CHECKED {
        withUnsafeMutablePointer(to: &rc) {
          pThis.pointee.lpVtbl.pointee.WriteSource(pThis, RawPointer(pIBitmapSource), $0)
        }
      }
    }
  }
}

/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IUnknown {
  public var pUnk: UnsafeMutablePointer<WinSDK.IUnknown>?

  public class var IID: IID { IID_IUnknown }

  internal required init(pUnk pointer: UnsafeMutableRawPointer?) {
    self.pUnk = pointer?.bindMemory(to: WinSDK.IUnknown.self, capacity: 1)
  }

  /// Queries a COM object for a pointer to one of its interface; identifying
  /// the interface by a reference to its interface identifier (IID).  If the
  /// COM object implements the interface, then it returns a pointer to that
  /// interface after calling `IUnknown::AddRef` on it.
  public func QueryInterface(iid: IID) throws -> IUnknown {
    guard let pUnk = self.pUnk else { throw COMError(hr: E_INVALIDARG) }

    var iid: IID = iid

    var pointer: UnsafeMutableRawPointer?
    let hr: HRESULT =
        pUnk.pointee.lpVtbl.pointee.QueryInterface(pUnk, &iid, &pointer)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IUnknown(pUnk: pointer)
  }

  /// Increments the reference count for an interface pointer to a COM object.
  /// You should call this method whenever you make a copy of an interface
  /// pointer.
  public func AddRef() throws -> ULONG {
    guard let pUnk = self.pUnk else { throw COMError(hr: E_INVALIDARG) }
    return pUnk.pointee.lpVtbl.pointee.AddRef(pUnk)
  }

  /// Decrements the reference count for an interface on a COM object.
  public func Release() throws -> ULONG {
    guard let pUnk = self.pUnk else { throw COMError(hr: E_INVALIDARG) }
    return pUnk.pointee.lpVtbl.pointee.Release(pUnk)
  }
}

extension IUnknown {
  public static func CreateInstance<T: IUnknown>(`class` clsid: CLSID,
                                                 outer pUnkOuter: IUnknown? = nil,
                                                 context dwClsContext: CLSCTX = CLSCTX_INPROC_SERVER)
      throws -> T {
    var clsid: CLSID = clsid
    var iid: IID = T.IID

    var pointer: UnsafeMutableRawPointer?
    let hr: HRESULT =
        CoCreateInstance(&clsid, pUnkOuter?.pUnk, DWORD(dwClsContext.rawValue),
                         &iid, &pointer)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return T(pUnk: pointer)
  }
}

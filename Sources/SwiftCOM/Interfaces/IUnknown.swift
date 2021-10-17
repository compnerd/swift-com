// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

@_fixed_layout
@usableFromInline
final class IUnknownRef {
  private var pUnk: UnsafeMutablePointer<WinSDK.IUnknown>?

  init(_ pUnk: UnsafeMutablePointer<WinSDK.IUnknown>?) {
    self.pUnk = pUnk
    _ = self.pUnk?.pointee.lpVtbl.pointee.AddRef(self.pUnk)
  }

  init(consuming pUnk: UnsafeMutablePointer<WinSDK.IUnknown>?) {
    self.pUnk = pUnk
  }

  deinit {
    _ = self.pUnk?.pointee.lpVtbl.pointee.Release(self.pUnk)
  }

  var borrow: UnsafeMutablePointer<WinSDK.IUnknown>? {
    return self.pUnk
  }

  var ref: UnsafeMutablePointer<WinSDK.IUnknown>? {
    _ = self.pUnk?.pointee.lpVtbl.pointee.AddRef(self.pUnk)
    return self.pUnk
  }
}

/// Enables clients to get pointers to other interfaces on a given object through
/// the `QueryInterface` method, and manage the existence of the object through
/// the `AddRef` and `Release` methods.
open class IUnknown {
  internal let pUnk: IUnknownRef

  /// Interface ID
  open class var IID: IID { IID_IUnknown }

  /// Converts the unmanaged `IUnknown` pointer to a managed instance.  The pointee
  /// is expected to be passed in with a reference count of 1.
  public required init(pUnk pointer: UnsafeMutableRawPointer?) {
    self.pUnk = IUnknownRef(consuming: pointer?.bindMemory(to: WinSDK.IUnknown.self, capacity: 1))
  }

  /// Queries a COM object for a pointer to one of its interface; identifying
  /// the interface by a reference to its interface identifier (IID).  If the
  /// COM object implements the interface, then it returns a pointer to that
  /// interface after calling `IUnknown::AddRef` on it.
  public func QueryInterface(iid: IID) throws -> UnsafeMutableRawPointer? {
    guard let pUnk = self.pUnk.borrow else { throw COMError(hr: E_INVALIDARG) }

    var iid: IID = iid
    var pointer: UnsafeMutableRawPointer?
    try CHECKED(pUnk.pointee.lpVtbl.pointee.QueryInterface(pUnk, &iid, &pointer))
    return pointer
  }

  /// Increments the reference count for an interface pointer to a COM object.
  /// You should call this method whenever you make a copy of an interface
  /// pointer.
  public func AddRef() throws -> ULONG {
    guard let pUnk = self.pUnk.borrow else { throw COMError(hr: E_INVALIDARG) }
    return pUnk.pointee.lpVtbl.pointee.AddRef(pUnk)
  }

  /// Decrements the reference count for an interface on a COM object.
  public func Release() throws -> ULONG {
    guard let pUnk = self.pUnk.borrow else { throw COMError(hr: E_INVALIDARG) }
    return pUnk.pointee.lpVtbl.pointee.Release(pUnk)
  }
}

extension IUnknown {
  public static func CreateInstance<Interface: IUnknown>(`class` clsid: CLSID,
                                                         outer pUnkOuter: IUnknown? = nil,
                                                         context dwClsContext: CLSCTX = CLSCTX_INPROC_SERVER)
      throws -> Interface {
    var clsid: CLSID = clsid
    var iid: IID = Interface.IID

    var pointer: UnsafeMutableRawPointer?
    try CHECKED(CoCreateInstance(&clsid, RawPointer(pUnkOuter), DWORD(dwClsContext.rawValue), &iid, &pointer))
    return Interface(pUnk: pointer)
  }
}

extension IUnknown {
  func perform<Type, ResultType>(as type: Type.Type,
                                 _ body: (UnsafeMutablePointer<Type>) throws -> ResultType)
      throws -> ResultType {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk.borrow) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: Type.self, capacity: 1)

    return try body(pThis)
  }
}

extension IUnknown {
  public func QueryInterface<Interface: IUnknown>() throws -> Interface {
    guard let pUnk = self.pUnk.borrow else { throw COMError(hr: E_INVALIDARG) }

    var iid: IID = Interface.IID
    var pointer: UnsafeMutableRawPointer?
    try CHECKED(pUnk.pointee.lpVtbl.pointee.QueryInterface(pUnk, &iid, &pointer))
    return Interface(pUnk: pointer)
  }
}

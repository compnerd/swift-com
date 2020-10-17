/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IShellItem: IUnknown {
  override public class var IID: IID { IID_IShellItem }

  public func BindToHandler(_ pbc: IBindCtx, _ bhid: inout GUID,
                            _ riid: inout IID) throws -> IUnknown {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IShellItem.self, capacity: 1)

    var pv: UnsafeMutableRawPointer?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.BindToHandler(pThis, RawPointer(pbc),
                                                   &bhid, &riid, &pv)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IUnknown(pUnk: pv)
  }

  public func Compare(_ psi: IShellItem, _ hint: SICHINTF) throws -> CInt {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IShellItem.self, capacity: 1)

    var iOrder: CInt = 0
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Compare(pThis, RawPointer(psi), hint,
                                             &iOrder)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return iOrder
  }

  public func GetAttributes(_ sfgaoMask: SFGAOF) throws -> SFGAOF {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IShellItem.self, capacity: 1)

    var sfgaoAttribs: SFGAOF = SFGAOF()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetAttributes(pThis, sfgaoMask,
                                                   &sfgaoAttribs)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return sfgaoAttribs
  }

  public func GetDisplayName(_ sigdnName: SIGDN) throws -> String {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IShellItem.self, capacity: 1)

    var pszName: LPWSTR?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetDisplayName(pThis, sigdnName, &pszName)
    guard hr == S_OK else { throw COMError(hr: hr) }
    defer { CoTaskMemFree(pszName) }
    return String(decodingCString: pszName!, as: UTF16.self)
  }

  public func GetParent() throws -> IShellItem {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IShellItem.self, capacity: 1)

    var psi: UnsafeMutablePointer<WinSDK.IShellItem>?
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetParent(pThis, &psi)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IShellItem(pUnk: psi)
  }
}

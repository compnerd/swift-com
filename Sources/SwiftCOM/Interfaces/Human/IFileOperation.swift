/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IFileOperation: IUnknown {
  override public class var IID: IID { IID_IFileOperation }

  public func Advise(_ pfops: IFileOperationProgressSink) throws -> DWORD {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    var dwCookie: DWORD = 0
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.Advise(pThis, pfops.raw, &dwCookie)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return dwCookie
  }

  public func ApplyPropertiesToItem(_ psiItem: IShellItem) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.ApplyPropertiesToItem(pThis, psiItem.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func ApplyPropertiesToItems(_ punkItems: IUnknown) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.ApplyPropertiesToItems(pThis,
                                                            punkItems.pUnk)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func CopyItem(_ psiItem: IShellItem,
                       _ psiDestinationFolder: IShellItem,
                       _ pszCopyName: String?,
                       _ pfopsItem: IFileOperationProgressSink?) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CopyItem(pThis, psiItem.raw,
                                              psiDestinationFolder.raw,
                                              pszCopyName?.wide, pfopsItem?.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func CopyItems(_ punkItems: IUnknown,
                        _ psiDestinationFolder: IShellItem) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CopyItems(pThis, punkItems.pUnk,
                                               psiDestinationFolder.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func DeleteItem(_ psiItem: IShellItem,
                         _ pfopsItem: IFileOperationProgressSink?) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.DeleteItem(pThis, psiItem.raw,
                                                pfopsItem?.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func DeleteItems(_ punkItems: IUnknown) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.DeleteItems(pThis, punkItems.pUnk)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func GetAnyOperationsAborted() throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    var fAnyOperationsAborted: WindowsBool = false
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee
                          .GetAnyOperationsAborted(pThis, &fAnyOperationsAborted)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return fAnyOperationsAborted == true
  }

  public func MoveItem(_ psiItem: IShellItem,
                       _ psiDestinationFolder: IShellItem,
                       _ pszNewName: String?,
                       _ pfopsItem: IFileOperationProgressSink?) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.MoveItem(pThis, psiItem.raw,
                                              psiDestinationFolder.raw,
                                              pszNewName?.wide, pfopsItem?.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func MoveItems(_ punkItems: IUnknown,
                        _ psiDestinationFolder: IShellItem) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.MoveItems(pThis, punkItems.pUnk,
                                               psiDestinationFolder.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func NewItem(_ psiDestinationFolder: IShellItem,
                      _ dwFileAttributes: DWORD, _ pszName: String,
                      _ pszTemplateName: String?,
                      _ pfopsItem: IFileOperationProgressSink?) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.NewItem(pThis, psiDestinationFolder.raw,
                                             dwFileAttributes, pszName.wide,
                                             pszTemplateName?.wide,
                                             pfopsItem?.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func PerformOperations() throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.PerformOperations(pThis)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func RenameItem(_ psiItem: IShellItem, _ pszNewName: String,
                         _ pfopsItem: IFileOperationProgressSink?) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.RenameItem(pThis, psiItem.raw,
                                                pszNewName.wide, pfopsItem?.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func RenameItems(_ pUnkItems: IUnknown,
                          _ pszNewName: String) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.RenameItems(pThis, pUnkItems.pUnk,
                                                 pszNewName.wide)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetOperationFlags(_ dwOperationFlags: DWORD) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetOperationFlags(pThis, dwOperationFlags)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetOwnerWindow(_ hwndOwner: HWND) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetOwnerWindow(pThis, hwndOwner)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetProgressDialog(_ popd: IOperationsProgressDialog) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetProgressDialog(pThis, popd.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetProgressMessage(_ pszMessage: String) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetProgressMessage(pThis, pszMessage.wide)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetProperties(_ ppropArray: IPropertyChangeArray) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetProperties(pThis, ppropArray.raw)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func Unadvise(_ dwCookie: DWORD) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis = pUnk.bindMemory(to: WinSDK.IFileOperation.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Unadvise(pThis, dwCookie)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

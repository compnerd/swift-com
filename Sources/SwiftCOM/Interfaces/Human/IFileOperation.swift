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
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      var dwCookie: DWORD = 0
      try CHECKED(pThis.pointee.lpVtbl.pointee.Advise(pThis, RawPointer(pfops), &dwCookie))
      return dwCookie
    }
  }

  public func ApplyPropertiesToItem(_ psiItem: IShellItem) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ApplyPropertiesToItem(pThis, RawPointer(psiItem)))
    }
  }

  public func ApplyPropertiesToItems(_ punkItems: IUnknown) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.ApplyPropertiesToItems(pThis, RawPointer(punkItems)))
    }
  }

  public func CopyItem(_ psiItem: IShellItem,
                       _ psiDestinationFolder: IShellItem,
                       _ pszCopyName: String?,
                       _ pfopsItem: IFileOperationProgressSink?) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.CopyItem(pThis, RawPointer(psiItem), RawPointer(psiDestinationFolder), pszCopyName?.wide, RawPointer(pfopsItem)))
    }
  }

  public func CopyItems(_ punkItems: IUnknown,
                        _ psiDestinationFolder: IShellItem) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.CopyItems(pThis, RawPointer(punkItems), RawPointer(psiDestinationFolder)))
    }
  }

  public func DeleteItem(_ psiItem: IShellItem,
                         _ pfopsItem: IFileOperationProgressSink?) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.DeleteItem(pThis, RawPointer(psiItem), RawPointer(pfopsItem)))
    }
  }

  public func DeleteItems(_ punkItems: IUnknown) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.DeleteItems(pThis, punkItems.pUnk))
    }
  }

  public func GetAnyOperationsAborted() throws -> Bool {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      var fAnyOperationsAborted: WindowsBool = false
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetAnyOperationsAborted(pThis, &fAnyOperationsAborted))
      return fAnyOperationsAborted == true
    }
  }

  public func MoveItem(_ psiItem: IShellItem,
                       _ psiDestinationFolder: IShellItem,
                       _ pszNewName: String?,
                       _ pfopsItem: IFileOperationProgressSink?) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.MoveItem(pThis, RawPointer(psiItem), RawPointer(psiDestinationFolder), pszNewName?.wide, RawPointer(pfopsItem)))
    }
  }

  public func MoveItems(_ punkItems: IUnknown,
                        _ psiDestinationFolder: IShellItem) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.MoveItems(pThis, RawPointer(punkItems), RawPointer(psiDestinationFolder)))
    }
  }

  public func NewItem(_ psiDestinationFolder: IShellItem,
                      _ dwFileAttributes: DWORD, _ pszName: String,
                      _ pszTemplateName: String?,
                      _ pfopsItem: IFileOperationProgressSink?) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.NewItem(pThis, RawPointer(psiDestinationFolder), dwFileAttributes, pszName.wide, pszTemplateName?.wide, RawPointer(pfopsItem)))
    }
  }

  public func PerformOperations() throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.PerformOperations(pThis))
    }
  }

  public func RenameItem(_ psiItem: IShellItem, _ pszNewName: String,
                         _ pfopsItem: IFileOperationProgressSink?) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.RenameItem(pThis, RawPointer(psiItem), pszNewName.wide, RawPointer(pfopsItem)))
    }
  }

  public func RenameItems(_ pUnkItems: IUnknown,
                          _ pszNewName: String) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.RenameItems(pThis, RawPointer(pUnkItems), pszNewName.wide))
    }
  }

  public func SetOperationFlags(_ dwOperationFlags: DWORD) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetOperationFlags(pThis, dwOperationFlags))
    }
  }

  public func SetOwnerWindow(_ hwndOwner: HWND) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetOwnerWindow(pThis, hwndOwner))
    }
  }

  public func SetProgressDialog(_ popd: IOperationsProgressDialog) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetProgressDialog(pThis, RawPointer(popd)))
    }
  }

  public func SetProgressMessage(_ pszMessage: String) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetProgressMessage(pThis, pszMessage.wide))
    }
  }

  public func SetProperties(_ ppropArray: IPropertyChangeArray) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetProperties(pThis, RawPointer(ppropArray)))
    }
  }

  public func Unadvise(_ dwCookie: DWORD) throws {
    return try perform(as: WinSDK.IFileOperation.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Unadvise(pThis, dwCookie))
    }
  }
}

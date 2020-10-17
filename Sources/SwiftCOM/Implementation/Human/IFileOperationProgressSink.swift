/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

extension IFileOperationProgressSink {
  fileprivate static func from(_ pUnk: UnsafeMutableRawPointer?) -> IFileOperationProgressSink? {
    return (unsafeBitCast(pUnk, to: AnyObject?.self) as? IFileOperationProgressSink)?.instance.instance
  }
}

private var vtable: WinSDK.IFileOperationProgressSinkVtbl = .init(
  QueryInterface: {
    guard let pUnk = $0, let riid = $1, let ppvObject = $2 else {
      return E_INVALIDARG
    }
    guard riid.pointee == IFileOperationProgressSink.IID else {
      ppvObject.pointee = nil
      return E_NOINTERFACE
    }
    ppvObject.pointee = UnsafeMutableRawPointer(pUnk)
    _ = pUnk.pointee.lpVtbl.pointee.AddRef(pUnk)
    return S_OK
  },
  AddRef: {
    let _ = Unmanaged<IFileOperationProgressSink>.fromOpaque($0!).retain()
    // TODO(compnerd) return new reference count
    return 0
  },
  Release: {
    Unmanaged<IFileOperationProgressSink>.fromOpaque($0!).release()
    // TODO(compnerd) return old reference count
    return 0
  },
  StartOperations: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.StartOperations()
  },
  FinishOperations: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.FinishOperations($1)
  },
  PreRenameItem: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.PreRenameItem($1, IShellItem(pUnk: $2),
                              String(decodingCString: $3!, as: UTF16.self))
  },
  PostRenameItem: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.PostRenameItem($1, IShellItem(pUnk: $2),
                               String(decodingCString: $3!, as: UTF16.self),
                               $4, IShellItem(pUnk: $5))
  },
  PreMoveItem: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.PreMoveItem($1, IShellItem(pUnk: $2), IShellItem(pUnk: $3),
                            String(decodingCString: $4!, as: UTF16.self))
  },
  PostMoveItem: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.PostMoveItem($1, IShellItem(pUnk: $2), IShellItem(pUnk: $3),
                             String(decodingCString: $4!, as: UTF16.self),
                             $5, IShellItem(pUnk: $6))
  },
  PreCopyItem: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.PreCopyItem($1, IShellItem(pUnk: $2), IShellItem(pUnk: $3),
                            String(decodingCString: $4!, as: UTF16.self))
  },
  PostCopyItem: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.PostCopyItem($1, IShellItem(pUnk: $2), IShellItem(pUnk: $3),
                             String(decodingCString: $4!, as: UTF16.self),
                             $5, IShellItem(pUnk: $6))
  },
  PreDeleteItem: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.PreDeleteItem($1, IShellItem(pUnk: $2))
  },
  PostDeleteItem: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.PostDeleteItem($1, IShellItem(pUnk: $2), $3,
                               IShellItem(pUnk: $4))
  },
  PreNewItem: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.PreNewItem($1, IShellItem(pUnk: $2),
                           String(decodingCString: $3!, as: UTF16.self))
  },
  PostNewItem: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.PostNewItem($1, IShellItem(pUnk: $2),
                            String(decodingCString: $3!, as: UTF16.self),
                            String(decodingCString: $4!, as: UTF16.self),
                            $5, $6, IShellItem(pUnk: $7))
  },
  UpdateProgress: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.UpdateProgress($1, $2)
  },
  ResetTimer: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.ResetTimer()
  },
  PauseTimer: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.PauseTimer()
  },
  ResumeTimer: {
    guard let self = IFileOperationProgressSink.from($0) else {
      return E_INVALIDARG
    }
    return self.ResumeTimer()
  }
)

open class IFileOperationProgressSink: IUnknown {
  override public class var IID: IID { IID_IFileOperationProgressSink }

  fileprivate struct Storage {
    var `class`: WinSDK.IFileOperationProgressSink
    unowned var instance: IFileOperationProgressSink?
  }
  fileprivate var instance: Storage

  required public init(pUnk pointer: UnsafeMutableRawPointer? = nil) {
    self.instance = withUnsafeMutablePointer(to: &vtable) {
      Storage(class: WinSDK.IFileOperationProgressSink(lpVtbl: $0))
    }
    super.init(pUnk: withUnsafeMutablePointer(to: &instance) { $0 })
    self.instance.instance = self
  }

  open func FinishOperations(_ hrResult: HRESULT) -> HRESULT {
    return S_OK
  }

  open func PauseTimer() -> HRESULT {
    return S_OK
  }

  open func PostCopyItem(_ dwFlags: DWORD, _ psiItem: IShellItem,
                         _ psiDestinationFolder: IShellItem,
                         _ pszNewName: String, _ hrCopy: HRESULT,
                         _ psiNewlyCreated: IShellItem) -> HRESULT {
    return S_OK
  }

  open func PostDeleteItem(_ dwFlags: DWORD, _ psiItem: IShellItem,
                           _ hrDelete: HRESULT, _ psiNewlyCreated: IShellItem)
      -> HRESULT {
    return S_OK
  }

  open func PostMoveItem(_ dwFlags: DWORD, _ psiItem: IShellItem,
                         _ psiDestinationFolder: IShellItem,
                         _ pszNewName: String, _ hrMove: HRESULT,
                         _ psiNewlyCreated: IShellItem) -> HRESULT {
    return S_OK
  }

  open func PostNewItem(_ dwFlags: DWORD, _ psiDestinationFolder: IShellItem,
                        _ pszNewName: String, _ pszTemplateName: String,
                        _ dwFileAttributes: DWORD, _ hrNew: HRESULT,
                        _ psiNewItem: IShellItem) -> HRESULT {
    return S_OK
  }

  open func PostRenameItem(_ dwFlags: DWORD, _ psiItem: IShellItem,
                           _ pszNewName: String, _ hrRename: HRESULT,
                           _ psiNewlyCreated: IShellItem) -> HRESULT {
    return S_OK
  }

  open func PreCopyItem(_ dwFlags: DWORD, _ psiItem: IShellItem,
                        _ psiDestinationFolder: IShellItem,
                        _ pszNewName: String) -> HRESULT {
    return S_OK
  }

  open func PreDeleteItem(_ dwFlags: DWORD, _ psiItem: IShellItem) -> HRESULT {
    return S_OK
  }

  open func PreMoveItem(_ dwFlags: DWORD, _ psiItem: IShellItem,
                        _ psiDestinationFolder: IShellItem,
                        _ pszNewName: String) -> HRESULT {
    return S_OK
  }

  open func PreNewItem(_ dwFlags: DWORD, _ psiDestinationFolder: IShellItem,
                       _ pszNewName: String) -> HRESULT {
    return S_OK
  }

  open func PreRenameItem(_ dwFlags: DWORD, _ psiItem: IShellItem,
                          _ pszNewName: String) -> HRESULT {
    return S_OK
  }

  open func ResetTimer() -> HRESULT {
    return S_OK
  }

  open func ResumeTimer() -> HRESULT {
    return S_OK
  }

  open func StartOperations() -> HRESULT {
    return S_OK
  }

  open func UpdateProgress(_ iWorkTotal: UINT, _ iWorkSoFar: UINT) -> HRESULT {
    return S_OK
  }
}

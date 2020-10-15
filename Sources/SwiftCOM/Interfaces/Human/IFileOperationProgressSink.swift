/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IFileOperationProgressSink: IUnknown {
  override public class var IID: IID { IID_IFileOperationProgressSink }

  required public init(pUnk pointer: UnsafeMutableRawPointer?) {
    super.init(pUnk: pointer)

    guard let pThis =
        pointer?.bindMemory(to: WinSDK.IFileOperationProgressSink.self,
                            capacity: 1) else {
      return
    }
    pThis.pointee.lpVtbl.pointee.FinishOperations = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.FinishOperations($1)
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.PauseTimer = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.PauseTimer()
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.PostCopyItem = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.PostCopyItem($1, IShellItem(pUnk: $2),
                                     IShellItem(pUnk: $3),
                                     String(decodingCString: $4!,
                                            as: UTF16.self),
                                     $5, IShellItem(pUnk: $6))
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.PostDeleteItem = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.PostDeleteItem($1, IShellItem(pUnk: $2), $3,
                                       IShellItem(pUnk: $4))
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.PostMoveItem = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.PostMoveItem($1, IShellItem(pUnk: $2),
                                     IShellItem(pUnk: $3),
                                     String(decodingCString: $4!,
                                            as: UTF16.self),
                                     $5, IShellItem(pUnk: $6))
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.PostNewItem = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.PostNewItem($1, IShellItem(pUnk: $2),
                                    String(decodingCString: $3!, as: UTF16.self),
                                    String(decodingCString: $4!, as: UTF16.self),
                                    $5, $6, IShellItem(pUnk: $7))
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.PostRenameItem = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.PostRenameItem($1, IShellItem(pUnk: $2),
                                       String(decodingCString: $3!,
                                              as: UTF16.self),
                                       $4, IShellItem(pUnk: $5))
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.PreCopyItem = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.PreCopyItem($1, IShellItem(pUnk: $2),
                                    IShellItem(pUnk: $3),
                                    String(decodingCString: $4!,
                                           as: UTF16.self))
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.PreDeleteItem = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.PreDeleteItem($1, IShellItem(pUnk: $2))
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.PreMoveItem = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.PreMoveItem($1, IShellItem(pUnk: $2),
                                    IShellItem(pUnk: $3),
                                    String(decodingCString: $4!,
                                           as: UTF16.self))
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.PreNewItem = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.PreNewItem($1, IShellItem(pUnk: $2),
                                   String(decodingCString: $3!, as: UTF16.self))
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.PreRenameItem = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.PreRenameItem($1, IShellItem(pUnk: $2),
                                      String(decodingCString: $3!,
                                             as: UTF16.self))
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.ResetTimer = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.ResetTimer()
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.ResumeTimer = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.ResumeTimer()
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.StartOperations = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.StartOperations()
      }
      return E_INVALIDARG
    }
    pThis.pointee.lpVtbl.pointee.UpdateProgress = {
      if let instance =
          unsafeBitCast($0, to: AnyObject?.self) as? IFileOperationProgressSink {
        return instance.UpdateProgress($1, $2)
      }
      return E_INVALIDARG
    }
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

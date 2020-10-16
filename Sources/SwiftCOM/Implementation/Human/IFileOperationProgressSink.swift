/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

open class IFileOperationProgressSink: IUnknown {
  override public class var IID: IID { IID_IFileOperationProgressSink }

  private let pThis: UnsafeMutablePointer<WinSDK.IFileOperationProgressSink>

  static func from(_ pUnk: UnsafeMutableRawPointer?) -> IFileOperationProgressSink? {
    return unsafeBitCast(pUnk, to: AnyObject?.self) as? IFileOperationProgressSink
  }

  required public init(pUnk pointer: UnsafeMutableRawPointer? = nil) {
    self.pThis =
        UnsafeMutablePointer<WinSDK.IFileOperationProgressSink>.allocate(capacity: 1)
    self.pThis.pointee.lpVtbl =
        UnsafeMutablePointer<WinSDK.IFileOperationProgressSinkVtbl>.allocate(capacity: 1)
    self.pThis.pointee.lpVtbl.pointee = WinSDK.IFileOperationProgressSinkVtbl(
      QueryInterface: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        guard let iid = $1?.pointee, let ppv = $2 else { return E_INVALIDARG }
        guard iid == IFileOperationProgressSink.IID else {
          ppv.pointee = nil
          return E_NOINTERFACE
        }
        ppv.pointee =
            Unmanaged<IFileOperationProgressSink>.passRetained(instance)
                .toOpaque()
        return S_OK
      },
      AddRef: {
        guard let pUnk = $0 else { return ULONG(E_INVALIDARG) }
        _ = Unmanaged<IFileOperationProgressSink>.fromOpaque(pUnk).retain()
        return ULONG(_getRetainCount(unsafeBitCast(pUnk, to: IFileOperationProgressSink.self)))
      },
      Release: {
        guard let pUnk = $0 else { return ULONG(E_INVALIDARG) }
        Unmanaged<IFileOperationProgressSink>.fromOpaque(pUnk).release()
        return ULONG(_getRetainCount(unsafeBitCast(pUnk, to: IFileOperationProgressSink.self)))
      },
      StartOperations: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.StartOperations()
      },
      FinishOperations: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.FinishOperations($1)
      },
      PreRenameItem: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.PreRenameItem($1, IShellItem(pUnk: $2),
                                      String(decodingCString: $3!,
                                             as: UTF16.self))
      },
      PostRenameItem: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.PostRenameItem($1, IShellItem(pUnk: $2),
                                       String(decodingCString: $3!,
                                              as: UTF16.self),
                                       $4, IShellItem(pUnk: $5))
      },
      PreMoveItem: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.PreMoveItem($1, IShellItem(pUnk: $2),
                                    IShellItem(pUnk: $3),
                                    String(decodingCString: $4!, as: UTF16.self))
      },
      PostMoveItem: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.PostMoveItem($1, IShellItem(pUnk: $2),
                                     IShellItem(pUnk: $3),
                                     String(decodingCString: $4!,
                                            as: UTF16.self),
                                     $5, IShellItem(pUnk: $6))
      },
      PreCopyItem: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.PreCopyItem($1, IShellItem(pUnk: $2),
                                    IShellItem(pUnk: $3),
                                    String(decodingCString: $4!, as: UTF16.self))
      },
      PostCopyItem: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.PostCopyItem($1, IShellItem(pUnk: $2),
                                     IShellItem(pUnk: $3),
                                     String(decodingCString: $4!,
                                            as: UTF16.self),
                                     $5, IShellItem(pUnk: $6))
      },
      PreDeleteItem: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.PreDeleteItem($1, IShellItem(pUnk: $2))
      },
      PostDeleteItem: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.PostDeleteItem($1, IShellItem(pUnk: $2), $3,
                                       IShellItem(pUnk: $4))
      },
      PreNewItem: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.PreNewItem($1, IShellItem(pUnk: $2),
                                   String(decodingCString: $3!, as: UTF16.self))
      },
      PostNewItem: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.PostNewItem($1, IShellItem(pUnk: $2),
                                    String(decodingCString: $3!, as: UTF16.self),
                                    String(decodingCString: $4!, as: UTF16.self),
                                    $5, $6, IShellItem(pUnk: $7))
      },
      UpdateProgress: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.UpdateProgress($1, $2)
      },
      ResetTimer: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.ResetTimer()
      },
      PauseTimer: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.PauseTimer()
      },
      ResumeTimer: {
        guard let instance = IFileOperationProgressSink.from($0) else {
          return E_INVALIDARG
        }
        return instance.ResumeTimer()
      }
    )

    super.init(pUnk: self.pThis)
  }

  deinit {
    self.pThis.pointee.lpVtbl.deallocate()
    self.pThis.deallocate()
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

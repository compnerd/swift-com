/**
 * Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class ID3D12InfoQueue: IUnknown {
  public override class var IID: IID { IID_ID3D12InfoQueue }

  public func AddApplicationMessage(_ Severity: D3D12_MESSAGE_SEVERITY, _ pDescription: String) throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.AddApplicationMessage(pThis, Severity, pDescription))
    }
  }

  public func AddMessage(_ Category: D3D12_MESSAGE_CATEGORY, _ Severity: D3D12_MESSAGE_SEVERITY, _ ID: D3D12_MESSAGE_ID, _ pDescription: String) throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.AddMessage(pThis, Category, Severity, ID, pDescription))
    }
  }

  public func AddRetrievalFilterEntries(_ pFilter: UnsafeMutablePointer<D3D12_INFO_QUEUE_FILTER>?) throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.AddRetrievalFilterEntries(pThis, pFilter))
    }
  }

  public func AddStorageFilterEntries(_ pFilter: UnsafeMutablePointer<D3D12_INFO_QUEUE_FILTER>?) throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.AddStorageFilterEntries(pThis, pFilter))
    }
  }

  public func ClearRetrievalFilter() throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ClearRetrievalFilter(pThis)
    }
  }

  public func ClearStorageFilter() throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ClearStorageFilter(pThis)
    }
  }

  public func ClearStoredMessages() throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.ClearStoredMessages(pThis)
    }
  }

  public func GetBreakOnCategory(_ Category: D3D12_MESSAGE_CATEGORY) throws -> Bool {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetBreakOnCategory(pThis, Category) == true
    }
  }

  public func GetBreakOnID(_ ID: D3D12_MESSAGE_ID) throws -> Bool {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetBreakOnID(pThis, ID) == true
    }
  }

  public func GetBreakOnSeverity(_ Severity: D3D12_MESSAGE_SEVERITY) throws -> Bool {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetBreakOnSeverity(pThis, Severity) == true
    }
  }

  public func GetMessage(_ MessageIndex: UINT64) throws -> (D3D12_MESSAGE, SIZE_T) {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      var pMessage: D3D12_MESSAGE = D3D12_MESSAGE()
      var pMessageByteLength: SIZE_T = SIZE_T()
      // FIXME(compnerd) GetMessage is also a free function which has a unicode
      // and ascii version.  As a result, `GetMessage` is a macro which happens
      // to expand incorrectly to `GetMessageA` here.
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetMessageA(pThis, MessageIndex, &pMessage, &pMessageByteLength))
      return (pMessage, pMessageByteLength)
    }
  }

  public func GetMessageCountLimit() throws -> UINT64 {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetMessageCountLimit(pThis)
    }
  }

  public func GetMuteDebugOutput() throws -> Bool {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetMuteDebugOutput(pThis) == true
    }
  }

  public func GetNumMessagesAllowedByStorageFilter() throws -> UINT64 {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetNumMessagesAllowedByStorageFilter(pThis)
    }
  }

  public func GetNumMessagesDeniedByStorageFilter() throws -> UINT64 {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetNumMessagesDeniedByStorageFilter(pThis)
    }
  }

  public func GetNumMessagesDiscardedByMessageCountLimit() throws -> UINT64 {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetNumMessagesDiscardedByMessageCountLimit(pThis)
    }
  }

  public func GetNumStoredMessages() throws -> UINT64 {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetNumStoredMessages(pThis)
    }
  }

  public func GetNumStoredMessagesAllowedByRetrievalFilter() throws -> UINT64 {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetNumStoredMessagesAllowedByRetrievalFilter(pThis)
    }
  }

  public func GetRetrievalFilter() throws -> (D3D12_INFO_QUEUE_FILTER, SIZE_T) {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      var pFilter: D3D12_INFO_QUEUE_FILTER = D3D12_INFO_QUEUE_FILTER()
      var pFilterByteLength: SIZE_T = SIZE_T()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetRetrievalFilter(pThis, &pFilter, &pFilterByteLength))
      return (pFilter, pFilterByteLength)
    }
  }

  public func GetRetrievalFilterStackSize() throws -> UINT {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetRetrievalFilterStackSize(pThis)
    }
  }

  public func GetStorageFilter() throws -> (D3D12_INFO_QUEUE_FILTER, SIZE_T) {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      var pFilter: D3D12_INFO_QUEUE_FILTER = D3D12_INFO_QUEUE_FILTER()
      var pFilterByteLength: SIZE_T = SIZE_T()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetStorageFilter(pThis, &pFilter, &pFilterByteLength))
      return (pFilter, pFilterByteLength)
    }
  }

  public func GetStorageFilterStackSize() throws -> UINT {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      return pThis.pointee.lpVtbl.pointee.GetStorageFilterStackSize(pThis)
    }
  }

  public func PopRetrievalFilter() throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.PopRetrievalFilter(pThis)
    }
  }

  public func PopStorageFilter() throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.PopStorageFilter(pThis)
    }
  }

  public func PushCopyOfRetrievalFilter() throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.PushCopyOfRetrievalFilter(pThis))
    }
  }

  public func PushCopyOfStorageFilter() throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.PushCopyOfStorageFilter(pThis))
    }
  }

  public func PushEmptyRetrievalFilter() throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.PushEmptyRetrievalFilter(pThis))
    }
  }

  public func PushEmptyStorageFilter() throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.PushEmptyStorageFilter(pThis))
    }
  }

  public func PushRetrievalFilter(_ pFilter: UnsafeMutablePointer<D3D12_INFO_QUEUE_FILTER>) throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.PushRetrievalFilter(pThis, pFilter))
    }
  }

  public func PushStorageFilter(_ pFilter: UnsafeMutablePointer<D3D12_INFO_QUEUE_FILTER>) throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.PushStorageFilter(pThis, pFilter))
    }
  }

  public func SetBreakOnCategory(_ Category: D3D12_MESSAGE_CATEGORY, _ bEnabled: WindowsBool) throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetBreakOnCategory(pThis, Category, bEnabled))
    }
  }

  public func SetBreakOnID(_ ID: D3D12_MESSAGE_ID, _ bEnabled: WindowsBool) throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetBreakOnID(pThis, ID, bEnabled))
    }
  }

  public func SetBreakOnSeverity(_ Severity: D3D12_MESSAGE_SEVERITY, _ bEnabled: WindowsBool) throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetBreakOnSeverity(pThis, Severity, bEnabled))
    }
  }

  public func SetMessageCountLimit(_ MessageCountLimit: UINT64) throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetMessageCountLimit(pThis, MessageCountLimit))
    }
  }

  public func SetMuteDebugOutput(_ bMute: WindowsBool) throws {
    return try perform(as: WinSDK.ID3D12InfoQueue.self) { pThis in
      pThis.pointee.lpVtbl.pointee.SetMuteDebugOutput(pThis, bMute)
    }
  }
}

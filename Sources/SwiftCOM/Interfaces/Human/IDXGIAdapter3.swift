/**
 * Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IDXGIAdapter3: IDXGIAdapter2 {
  override public class var IID: IID { IID_IDXGIAdapter3 }

  public func QueryVideoMemoryInfo(_ NodeIndex: UINT, _ MemorySegmentGroup: DXGI_MEMORY_SEGMENT_GROUP) throws -> DXGI_QUERY_VIDEO_MEMORY_INFO {
    return try perform(as: WinSDK.IDXGIAdapter3.self) { pThis in
      var VideoMemoryInfo: DXGI_QUERY_VIDEO_MEMORY_INFO = DXGI_QUERY_VIDEO_MEMORY_INFO()
      try CHECKED(pThis.pointee.lpVtbl.pointee.QueryVideoMemoryInfo(pThis, NodeIndex, MemorySegmentGroup, &VideoMemoryInfo))
      return VideoMemoryInfo
    }
  }

  public func RegisterHardwareContentProtectionTeardownStatusEvent(_ hEvent: HANDLE) throws -> DWORD {
    return try perform(as: WinSDK.IDXGIAdapter3.self) { pThis in
      var dwCookie: DWORD = DWORD()
      try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterHardwareContentProtectionTeardownStatusEvent(pThis, hEvent, &dwCookie))
      return dwCookie
    }
  }

  public func RegisterVideoMemoryBudgetChangeNotificationEvent(_ hEvent: HANDLE) throws -> DWORD {
    return try perform(as: WinSDK.IDXGIAdapter3.self) { pThis in
      var dwCookie: DWORD = DWORD()
      try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterVideoMemoryBudgetChangeNotificationEvent(pThis, hEvent, &dwCookie))
      return dwCookie
    }
  }

  public func SetVideoMemoryReservation(_ NodeIndex: UINT, _ MemorySegmentGroup: DXGI_MEMORY_SEGMENT_GROUP, _ Reservation: UINT64) throws {
    return try perform(as: WinSDK.IDXGIAdapter3.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetVideoMemoryReservation(pThis, NodeIndex, MemorySegmentGroup, Reservation))
    }
  }

  public func UnregisterHardwareContentProtectionTeardownStatus(_ dwCookie: DWORD) throws {
    return try perform(as: WinSDK.IDXGIAdapter3.self) { pThis in
      pThis.pointee.lpVtbl.pointee.UnregisterHardwareContentProtectionTeardownStatus(pThis, dwCookie)
    }
  }

  public func UnregisterVideoMemoryBudgetChangeNotification(_ dwCookie: DWORD) throws {
    return try perform(as: WinSDK.IDXGIAdapter3.self) { pThis in
      pThis.pointee.lpVtbl.pointee.UnregisterVideoMemoryBudgetChangeNotification(pThis, dwCookie)
    }
  }
}

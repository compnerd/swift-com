/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

extension IBindCtx {
  internal var raw: UnsafeMutablePointer<WinSDK.IBindCtx>? {
    let pUnk: UnsafeMutableRawPointer = UnsafeMutableRawPointer(self.pUnk)!
    return pUnk.bindMemory(to: WinSDK.IBindCtx.self, capacity: 1)
  }
}

extension IFileOperationProgressSink {
  internal var raw: UnsafeMutablePointer<WinSDK.IFileOperationProgressSink>? {
    let pUnk: UnsafeMutableRawPointer = UnsafeMutableRawPointer(self.pUnk)!
    return pUnk.bindMemory(to: WinSDK.IFileOperationProgressSink.self,
                           capacity: 1)
  }
}

extension IMoniker {
  internal var raw: UnsafeMutablePointer<WinSDK.IMoniker>? {
    let pUnk: UnsafeMutableRawPointer = UnsafeMutableRawPointer(self.pUnk)!
    return pUnk.bindMemory(to: WinSDK.IMoniker.self, capacity: 1)
  }
}

extension IOperationsProgressDialog {
  internal var raw: UnsafeMutablePointer<WinSDK.IOperationsProgressDialog>? {
    let pUnk: UnsafeMutableRawPointer = UnsafeMutableRawPointer(self.pUnk)!
    return pUnk.bindMemory(to: WinSDK.IOperationsProgressDialog.self,
                           capacity: 1)
  }
}

extension IPropertyChange {
  internal var raw: UnsafeMutablePointer<WinSDK.IPropertyChange>? {
    let pUnk: UnsafeMutableRawPointer = UnsafeMutableRawPointer(self.pUnk)!
    return pUnk.bindMemory(to: WinSDK.IPropertyChange.self, capacity: 1)
  }
}

extension IPropertyChangeArray {
  internal var raw: UnsafeMutablePointer<WinSDK.IPropertyChangeArray>? {
    let pUnk: UnsafeMutableRawPointer = UnsafeMutableRawPointer(self.pUnk)!
    return pUnk.bindMemory(to: WinSDK.IPropertyChangeArray.self, capacity: 1)
  }
}

extension IShellItem {
  internal var raw: UnsafeMutablePointer<WinSDK.IShellItem>? {
    let pUnk: UnsafeMutableRawPointer = UnsafeMutableRawPointer(self.pUnk)!
    return pUnk.bindMemory(to: WinSDK.IShellItem.self, capacity: 1)
  }
}

extension IStream {
  internal var raw: UnsafeMutablePointer<WinSDK.IStream>? {
    let pUnk: UnsafeMutableRawPointer = UnsafeMutableRawPointer(self.pUnk)!
    return pUnk.bindMemory(to: WinSDK.IStream.self, capacity: 1)
  }
}

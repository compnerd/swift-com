// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

extension ISensorManagerEvents {
  fileprivate static func from(_ pUnk: UnsafeMutableRawPointer?)
      -> Unmanaged<ISensorManagerEvents>? {
    return pUnk?.assumingMemoryBound(to: ISensorManagerEvents.Object.self)
              .pointee.wrapper
  }
}

private var vtable: WinSDK.ISensorManagerEventsVtbl = .init(
  // MARK - IUnknown Methods

  QueryInterface: {
    guard let pUnk = $0, let riid = $1, let ppvObject = $2 else {
      return E_INVALIDARG
    }
    guard riid.pointee == ISensorManagerEvents.IID else {
      ppvObject.pointee = nil
      return E_NOINTERFACE
    }
    _ = pUnk.pointee.lpVtbl.pointee.AddRef(pUnk)
    ppvObject.pointee = UnsafeMutableRawPointer(pUnk)
    return S_OK
  },
  AddRef: {
    var instance = ISensorManagerEvents.from($0)!
    _ = instance.retain()
    return ULONG(_getRetainCount(instance.takeUnretainedValue()))
  },
  Release: {
    var instance = ISensorManagerEvents.from($0)!
    return ULONG(_getRetainCount(instance.takeRetainedValue()))
  },

  // MARK - ISensorManagerEvents Methods

  OnSensorEnter: {
    guard let self = ISensorManagerEvents.from($0)?.takeUnretainedValue() else {
      return E_INVALIDARG
    }
    return self.OnSensorEnter(ISensor(pUnk: $1), $2)
  }
)

public class ISensorManagerEvents: IUnknown {
  override public class var IID: IID { IID_ISensorManagerEvents }

  fileprivate struct Object {
    var `class`: WinSDK.ISensorManagerEvents
    var wrapper: Unmanaged<ISensorManagerEvents>?
  }
  fileprivate var instance: Object

  required public init(pUnk pointer: UnsafeMutableRawPointer? = nil) {
    self.instance = withUnsafeMutablePointer(to: &vtable) {
      Object(class: WinSDK.ISensorManagerEvents(lpVtbl: $0))
    }
    super.init(pUnk: withUnsafeMutablePointer(to: &instance) { $0 })
    self.instance.wrapper = Unmanaged<ISensorManagerEvents>.passUnretained(self)
  }

  open func OnSensorEnter(_ pSensor: ISensor, _ state: SensorState) -> HRESULT {
    return S_OK
  }
}

/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

extension ISensorEvents {
  fileprivate static func from(_ pUnk: UnsafeMutableRawPointer?)
      -> Unmanaged<ISensorEvents>? {
    return pUnk?.assumingMemoryBound(to: ISensorEvents.Object.self)
              .pointee.wrapper
  }
}

private var vtable: WinSDK.ISensorEventsVtbl = .init(
  // MARK - IUnknown Methods

  QueryInterface: {
    guard let pUnk = $0, let riid = $1, let ppvObject = $2 else {
      return E_INVALIDARG
    }
    guard riid.pointee == ISensorEvents.IID else {
      ppvObject.pointee = nil
      return E_NOINTERFACE
    }
    _ = pUnk.pointee.lpVtbl.pointee.AddRef(pUnk)
    ppvObject.pointee = UnsafeMutableRawPointer(pUnk)
    return S_OK
  },
  AddRef: {
    var instance = ISensorEvents.from($0)!
    _ = instance.retain()
    return ULONG(_getRetainCount(instance.takeUnretainedValue()))
  },
  Release: {
    var instance = ISensorEvents.from($0)!
    return ULONG(_getRetainCount(instance.takeRetainedValue()))
  },

  // MARK - ISensorEvents Methods

  OnStateChanged: {
    guard let self = ISensorEvents.from($0)?.takeUnretainedValue() else {
      return E_INVALIDARG
    }
    return self.OnStateChanged(ISensor(pUnk: $1), $2)
  },
  OnDataUpdated: {
    guard let self = ISensorEvents.from($0)?.takeUnretainedValue() else {
      return E_INVALIDARG
    }
    return self.OnDataUpdated(ISensor(pUnk: $1), ISensorDataReport(pUnk: $2))
  },
  OnEvent: {
    guard let self = ISensorEvents.from($0)?.takeUnretainedValue() else {
      return E_INVALIDARG
    }
    return self.OnEvent(ISensor(pUnk: $1), $2, IPortableDeviceValues(pUnk: $3))
  },
  OnLeave: {
    guard let self = ISensorEvents.from($0)?.takeUnretainedValue() else {
      return E_INVALIDARG
    }
    return self.OnLeave($1)
  }
)

public class ISensorEvents: IUnknown {
  override public class var IID: IID { IID_ISensorManagerEvents }

  fileprivate struct Object {
    var `class`: WinSDK.ISensorEvents
    var wrapper: Unmanaged<ISensorEvents>?
  }
  fileprivate var instance: Object

  required public init(pUnk pointer: UnsafeMutableRawPointer? = nil) {
    self.instance = withUnsafeMutablePointer(to: &vtable) {
      Object(class: WinSDK.ISensorEvents(lpVtbl: $0))
    }
    super.init(pUnk: withUnsafeMutablePointer(to: &instance) { $0 })
    self.instance.wrapper = Unmanaged<ISensorEvents>.passUnretained(self)
  }

  open func OnDataUpdated(_ pSensor: ISensor, _ pNewData: ISensorDataReport)
      -> HRESULT {
    return S_OK
  }

  open func OnEvent(_ pSensor: ISensor, _ eventID: REFGUID?,
                    _ pEventData: IPortableDeviceValues) -> HRESULT {
    return S_OK
  }

  open func OnLeave(_ ID: REFSENSOR_ID?) -> HRESULT {
    return S_OK
  }

  open func OnStateChanged(_ pSensor: ISensor, _ state: SensorState) -> HRESULT {
    return S_OK
  }
}

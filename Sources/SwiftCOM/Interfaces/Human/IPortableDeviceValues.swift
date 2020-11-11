/**
 * Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

import WinSDK

public class IPortableDeviceValues: IUnknown {
  override public class var IID: IID { IID_IPortableDeviceValues }

  public func Clear() throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.Clear(pThis)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func CopyValuesFromPropertyStore(_ pStore: IPropertyStore) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CopyValuesFromPropertyStore(pThis,
                                                                 RawPointer(pStore))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func CopyValuesToPropertyStore(_ pStore: IPropertyStore) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.CopyValuesToPropertyStore(pThis,
                                                               RawPointer(pStore))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func GetAt(_ index: DWORD) throws -> (PROPERTYKEY, PROPVARIANT) {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var Key: PROPERTYKEY = PROPERTYKEY()
    var Value: PROPVARIANT = PROPVARIANT()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetAt(pThis, index, &Key, &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return (Key, Value)
  }

  public func GetBoolValue(_ key: REFPROPERTYKEY) throws -> Bool {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var Value: WindowsBool = false
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetBoolValue(pThis, key, &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Value == true
  }

  public func GetBufferValue(_ key: REFPROPERTYKEY) throws -> [BYTE] {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var pValue: UnsafeMutablePointer<BYTE>?
    var cbValue: DWORD = DWORD(0)
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetBufferValue(pThis, key, &pValue,
                                                    &cbValue)
    guard hr == S_OK else { throw COMError(hr: hr) }

    defer { CoTaskMemFree(pValue) }
    return Array(UnsafeBufferPointer<BYTE>(start: pValue, count: Int(cbValue)))
  }

  public func GetCount() throws -> DWORD {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var celt: DWORD = DWORD(0)
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetCount(pThis, &celt)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return celt
  }

  public func GetErrorValue(_ key: REFPROPERTYKEY) throws -> HRESULT {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var Value: HRESULT = S_OK
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetErrorValue(pThis, key, &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Value
  }

  public func GetFloatValue(_ key: REFPROPERTYKEY) throws -> FLOAT {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var Value: FLOAT = FLOAT()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetFloatValue(pThis, key, &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Value
  }

  public func GetGuidValue(_ key: REFPROPERTYKEY) throws -> GUID {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var Value: GUID = GUID()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetGuidValue(pThis, key, &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Value
  }

  public func GetIPortableDeviceKeyCollectionValue(_ key: REFPROPERTYKEY)
      throws -> IPortableDeviceKeyCollection {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var pValue: UnsafeMutablePointer<WinSDK.IPortableDeviceKeyCollection>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetIPortableDeviceKeyCollectionValue(pThis,
                                                                          key,
                                                                          &pValue)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IPortableDeviceKeyCollection(pUnk: pValue)
  }

  public func GetIPortableDevicePropVariantCollectionValue(_ key: REFPROPERTYKEY)
      throws -> IPortableDevicePropVariantCollection {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var pValue: UnsafeMutablePointer<WinSDK.IPortableDevicePropVariantCollection>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetIPortableDevicePropVariantCollectionValue(pThis,
                                                                                  key,
                                                                                  &pValue)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IPortableDevicePropVariantCollection(pUnk: pValue)
  }

  public func GetIPortableDeviceValuesCollectionValue(_ key: REFPROPERTYKEY)
      throws -> IPortableDeviceValuesCollection {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var pValue: UnsafeMutablePointer<WinSDK.IPortableDeviceValuesCollection>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetIPortableDeviceValuesCollectionValue(pThis,
                                                                             key,
                                                                             &pValue)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IPortableDeviceValuesCollection(pUnk: pValue)
  }

  public func GetIPortableDeviceValuesValue(_ key: REFPROPERTYKEY)
      throws -> IPortableDeviceValues {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var pValue: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetIPortableDeviceValuesValue(pThis, key,
                                                                   &pValue)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IPortableDeviceValues(pUnk: pValue)
  }

  public func GetIUnknownValue(_ key: REFPROPERTYKEY) throws -> IUnknown {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var pValue: UnsafeMutablePointer<WinSDK.IUnknown>?
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetIUnknownValue(pThis, key, &pValue)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return IUnknown(pUnk: pValue)
  }

  public func GetKeyValue(_ key: REFPROPERTYKEY) throws -> PROPERTYKEY {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var Value: PROPERTYKEY = PROPERTYKEY()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetKeyValue(pThis, key, &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Value
  }

  public func GetSignedIntegerValue(_ key: REFPROPERTYKEY) throws -> LONG {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var Value: LONG = LONG()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetSignedIntegerValue(pThis, key, &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Value
  }

  public func GetSignedLargeIntegerValue(_ key: REFPROPERTYKEY)
      throws -> LONGLONG {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var Value: LONGLONG = LONGLONG()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetSignedLargeIntegerValue(pThis, key,
                                                                &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Value
  }

  public func GetStringValue(_ key: REFPROPERTYKEY) throws -> String {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var Value: UnsafeMutablePointer<WCHAR>?
    let hr: HRESULT =
      pThis.pointee.lpVtbl.pointee.GetStringValue(pThis, key, &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }

    defer { CoTaskMemFree(Value) }
    return String(decodingCString: Value!, as: UTF16.self)
  }

  public func GetUnsignedIntegerValue(_ key: REFPROPERTYKEY) throws -> ULONG {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var Value: ULONG = ULONG()
    let hr: HRESULT =
      pThis.pointee.lpVtbl.pointee.GetUnsignedIntegerValue(pThis, key, &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Value
  }

  public func GetUnsignedLargeIntegerValue(_ key: REFPROPERTYKEY)
      throws -> ULONGLONG {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var Value: ULONGLONG = ULONGLONG()
    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.GetUnsignedLargeIntegerValue(pThis, key,
                                                                  &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Value
  }

  public func GetValue(_ key: REFPROPERTYKEY) throws -> PROPVARIANT {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var Value: PROPVARIANT = PROPVARIANT()
    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.GetValue(pThis, key, &Value)
    guard hr == S_OK else { throw COMError(hr: hr) }
    return Value
  }

  public func RemoveValue(_ key: REFPROPERTYKEY) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.RemoveValue(pThis, key)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetBoolValue(_ key: REFPROPERTYKEY, _ value: WindowsBool) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetBoolValue(pThis, key, value)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetBufferValue(_ key: REFPROPERTYKEY, _ value: [BYTE]) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var value = value
    let hr: HRESULT = value.withUnsafeMutableBufferPointer {
      pThis.pointee.lpVtbl.pointee.SetBufferValue(pThis, key, $0.baseAddress,
                                                  DWORD($0.count))
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetErrorValue(_ key: REFPROPERTYKEY, _ value: HRESULT) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetErrorValue(pThis, key, value)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetFloatValue(_ key: REFPROPERTYKEY, _ value: FLOAT) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetFloatValue(pThis, key, value)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetGuidValue(_ key: REFPROPERTYKEY, _ value: REFGUID) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetGuidValue(pThis, key, value)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetIPortableDeviceKeyCollectionValue(_ key: REFPROPERTYKEY,
                                                   _ value: IPortableDeviceKeyCollection)
      throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetIPortableDeviceKeyCollectionValue(pThis,
                                                                          key,
                                                                          RawPointer(value))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetIPortableDevicePropVariantCollectionValue(_ key: REFPROPERTYKEY,
                                                           _ value: IPortableDevicePropVariantCollection)
      throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetIPortableDevicePropVariantCollectionValue(pThis,
                                                                                  key,
                                                                                  RawPointer(value))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetIPortableDeviceValuesCollectionValue(_ key: REFPROPERTYKEY,
                                                      _ value: IPortableDeviceValuesCollection)
      throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetIPortableDeviceValuesCollectionValue(pThis,
                                                                             key,
                                                                             RawPointer(value))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetIPortableDeviceValuesValue(_ key: REFPROPERTYKEY,
                                            _ value: IPortableDeviceValues)
      throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetIPortableDeviceValuesValue(pThis,
                                                                   key,
                                                                   RawPointer(value))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetIUnknownValue(_ key: REFPROPERTYKEY, _ value: IUnknown) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetIUnknownValue(pThis, key,
                                                      RawPointer(value))
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetKeyValue(_ key: REFPROPERTYKEY, _ value: REFPROPERTYKEY)
      throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT = pThis.pointee.lpVtbl.pointee.SetKeyValue(pThis, key, value)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetSignedIntegerValue(_ key: REFPROPERTYKEY, _ value: LONG)
      throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetSignedIntegerValue(pThis, key, value)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetSignedLargeIntegerValue(_ key: REFPROPERTYKEY,
                                         _ value: LONGLONG) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetSignedLargeIntegerValue(pThis, key,
                                                                value)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetStringValue(_ key: REFPROPERTYKEY, _ value: String) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT = value.withCString(encodedAs: UTF16.self) {
      pThis.pointee.lpVtbl.pointee.SetStringValue(pThis, key, $0)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetUnsignedIntegerValue(_ key: REFPROPERTYKEY, _ value: ULONG)
      throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetUnsignedIntegerValue(pThis, key, value)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetUnsignedLargeIntegerValue(_ key: REFPROPERTYKEY,
                                           _ value: ULONGLONG) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    let hr: HRESULT =
        pThis.pointee.lpVtbl.pointee.SetUnsignedLargeIntegerValue(pThis, key,
                                                                  value)
    guard hr == S_OK else { throw COMError(hr: hr) }
  }

  public func SetValue(_ key: REFPROPERTYKEY, _ value: PROPVARIANT) throws {
    guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
      throw COMError(hr: E_INVALIDARG)
    }
    let pThis =
        pUnk.bindMemory(to: WinSDK.IPortableDeviceValues.self, capacity: 1)

    var value = value
    let hr: HRESULT = withUnsafePointer(to: &value) {
      pThis.pointee.lpVtbl.pointee.SetValue(pThis, key, $0)
    }
    guard hr == S_OK else { throw COMError(hr: hr) }
  }
}

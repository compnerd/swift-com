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
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.Clear(pThis))
    }
  }

  public func CopyValuesFromPropertyStore(_ pStore: IPropertyStore) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.CopyValuesFromPropertyStore(pThis, RawPointer(pStore)))
    }
  }

  public func CopyValuesToPropertyStore(_ pStore: IPropertyStore) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.CopyValuesToPropertyStore(pThis, RawPointer(pStore)))
    }
  }

  public func GetAt(_ index: DWORD) throws -> (PROPERTYKEY, PROPVARIANT) {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var Key: PROPERTYKEY = PROPERTYKEY()
      var Value: PROPVARIANT = PROPVARIANT()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetAt(pThis, index, &Key, &Value))
      return (Key, Value)
    }
  }

  public func GetBoolValue(_ key: REFPROPERTYKEY) throws -> Bool {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var Value: WindowsBool = false
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetBoolValue(pThis, key, &Value))
      return Value == true
    }
  }

  public func GetBufferValue(_ key: REFPROPERTYKEY) throws -> [BYTE] {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var pValue: UnsafeMutablePointer<BYTE>?
      var cbValue: DWORD = DWORD(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetBufferValue(pThis, key, &pValue, &cbValue))
      defer { CoTaskMemFree(pValue) }
      return Array(UnsafeBufferPointer<BYTE>(start: pValue, count: Int(cbValue)))
    }
  }

  public func GetCount() throws -> DWORD {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var celt: DWORD = DWORD(0)
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetCount(pThis, &celt))
      return celt
    }
  }

  public func GetErrorValue(_ key: REFPROPERTYKEY) throws -> HRESULT {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var Value: HRESULT = S_OK
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetErrorValue(pThis, key, &Value))
      return Value
    }
  }

  public func GetFloatValue(_ key: REFPROPERTYKEY) throws -> FLOAT {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var Value: FLOAT = FLOAT()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetFloatValue(pThis, key, &Value))
      return Value
    }
  }

  public func GetGuidValue(_ key: REFPROPERTYKEY) throws -> GUID {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var Value: GUID = GUID()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetGuidValue(pThis, key, &Value))
      return Value
    }
  }

  public func GetIPortableDeviceKeyCollectionValue(_ key: REFPROPERTYKEY)
      throws -> IPortableDeviceKeyCollection {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var pValue: UnsafeMutablePointer<WinSDK.IPortableDeviceKeyCollection>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetIPortableDeviceKeyCollectionValue(pThis, key, &pValue))
      return IPortableDeviceKeyCollection(pUnk: pValue)
    }
  }

  public func GetIPortableDevicePropVariantCollectionValue(_ key: REFPROPERTYKEY)
      throws -> IPortableDevicePropVariantCollection {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var pValue: UnsafeMutablePointer<WinSDK.IPortableDevicePropVariantCollection>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetIPortableDevicePropVariantCollectionValue(pThis, key, &pValue))
      return IPortableDevicePropVariantCollection(pUnk: pValue)
    }
  }

  public func GetIPortableDeviceValuesCollectionValue(_ key: REFPROPERTYKEY)
      throws -> IPortableDeviceValuesCollection {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var pValue: UnsafeMutablePointer<WinSDK.IPortableDeviceValuesCollection>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetIPortableDeviceValuesCollectionValue(pThis, key, &pValue))
      return IPortableDeviceValuesCollection(pUnk: pValue)
    }
  }

  public func GetIPortableDeviceValuesValue(_ key: REFPROPERTYKEY)
      throws -> IPortableDeviceValues {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var pValue: UnsafeMutablePointer<WinSDK.IPortableDeviceValues>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetIPortableDeviceValuesValue(pThis, key, &pValue))
      return IPortableDeviceValues(pUnk: pValue)
    }
  }

  public func GetIUnknownValue(_ key: REFPROPERTYKEY) throws -> IUnknown {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var pValue: UnsafeMutablePointer<WinSDK.IUnknown>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetIUnknownValue(pThis, key, &pValue))
      return IUnknown(pUnk: pValue)
    }
  }

  public func GetKeyValue(_ key: REFPROPERTYKEY) throws -> PROPERTYKEY {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var Value: PROPERTYKEY = PROPERTYKEY()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetKeyValue(pThis, key, &Value))
      return Value
    }
  }

  public func GetSignedIntegerValue(_ key: REFPROPERTYKEY) throws -> LONG {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var Value: LONG = LONG()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSignedIntegerValue(pThis, key, &Value))
      return Value
    }
  }

  public func GetSignedLargeIntegerValue(_ key: REFPROPERTYKEY)
      throws -> LONGLONG {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var Value: LONGLONG = LONGLONG()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetSignedLargeIntegerValue(pThis, key, &Value))
      return Value
    }
  }

  public func GetStringValue(_ key: REFPROPERTYKEY) throws -> String {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var Value: UnsafeMutablePointer<WCHAR>?
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetStringValue(pThis, key, &Value))
      defer { CoTaskMemFree(Value) }
      return String(decodingCString: Value!, as: UTF16.self)
    }
  }

  public func GetUnsignedIntegerValue(_ key: REFPROPERTYKEY) throws -> ULONG {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var Value: ULONG = ULONG()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetUnsignedIntegerValue(pThis, key, &Value))
      return Value
    }
  }

  public func GetUnsignedLargeIntegerValue(_ key: REFPROPERTYKEY)
      throws -> ULONGLONG {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var Value: ULONGLONG = ULONGLONG()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetUnsignedLargeIntegerValue(pThis, key, &Value))
      return Value
    }
  }

  public func GetValue(_ key: REFPROPERTYKEY) throws -> PROPVARIANT {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var Value: PROPVARIANT = PROPVARIANT()
      try CHECKED(pThis.pointee.lpVtbl.pointee.GetValue(pThis, key, &Value))
      return Value
    }
  }

  public func RemoveValue(_ key: REFPROPERTYKEY) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.RemoveValue(pThis, key))
    }
  }

  public func SetBoolValue(_ key: REFPROPERTYKEY, _ value: WindowsBool) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetBoolValue(pThis, key, value))
    }
  }

  public func SetBufferValue(_ key: REFPROPERTYKEY, _ value: [BYTE]) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var value = value
      try CHECKED {
        value.withUnsafeMutableBufferPointer {
          pThis.pointee.lpVtbl.pointee.SetBufferValue(pThis, key, $0.baseAddress, DWORD($0.count))
        }
      }
    }
  }

  public func SetErrorValue(_ key: REFPROPERTYKEY, _ value: HRESULT) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetErrorValue(pThis, key, value))
    }
  }

  public func SetFloatValue(_ key: REFPROPERTYKEY, _ value: FLOAT) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetFloatValue(pThis, key, value))
    }
  }

  public func SetGuidValue(_ key: REFPROPERTYKEY, _ value: REFGUID) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetGuidValue(pThis, key, value))
    }
  }

  public func SetIPortableDeviceKeyCollectionValue(_ key: REFPROPERTYKEY,
                                                   _ value: IPortableDeviceKeyCollection)
      throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetIPortableDeviceKeyCollectionValue(pThis, key, RawPointer(value)))
    }
  }

  public func SetIPortableDevicePropVariantCollectionValue(_ key: REFPROPERTYKEY,
                                                           _ value: IPortableDevicePropVariantCollection)
      throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetIPortableDevicePropVariantCollectionValue(pThis, key, RawPointer(value)))
    }
  }

  public func SetIPortableDeviceValuesCollectionValue(_ key: REFPROPERTYKEY,
                                                      _ value: IPortableDeviceValuesCollection)
      throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetIPortableDeviceValuesCollectionValue(pThis, key, RawPointer(value)))
    }
  }

  public func SetIPortableDeviceValuesValue(_ key: REFPROPERTYKEY,
                                            _ value: IPortableDeviceValues)
      throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetIPortableDeviceValuesValue(pThis, key, RawPointer(value)))
    }
  }

  public func SetIUnknownValue(_ key: REFPROPERTYKEY, _ value: IUnknown) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetIUnknownValue(pThis, key, RawPointer(value)))
    }
  }

  public func SetKeyValue(_ key: REFPROPERTYKEY, _ value: REFPROPERTYKEY)
      throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetKeyValue(pThis, key, value))
    }
  }

  public func SetSignedIntegerValue(_ key: REFPROPERTYKEY, _ value: LONG)
      throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetSignedIntegerValue(pThis, key, value))
    }
  }

  public func SetSignedLargeIntegerValue(_ key: REFPROPERTYKEY,
                                         _ value: LONGLONG) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetSignedLargeIntegerValue(pThis, key, value))
    }
  }

  public func SetStringValue(_ key: REFPROPERTYKEY, _ value: String) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED {
        value.withCString(encodedAs: UTF16.self) {
          pThis.pointee.lpVtbl.pointee.SetStringValue(pThis, key, $0)
        }
      }
    }
  }

  public func SetUnsignedIntegerValue(_ key: REFPROPERTYKEY, _ value: ULONG)
      throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetUnsignedIntegerValue(pThis, key, value))
    }
  }

  public func SetUnsignedLargeIntegerValue(_ key: REFPROPERTYKEY,
                                           _ value: ULONGLONG) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.SetUnsignedLargeIntegerValue(pThis, key, value))
    }
  }

  public func SetValue(_ key: REFPROPERTYKEY, _ value: PROPVARIANT) throws {
    return try perform(as: WinSDK.IPortableDeviceValues.self) { pThis in
      var value = value
      try CHECKED {
        withUnsafePointer(to: &value) {
          pThis.pointee.lpVtbl.pointee.SetValue(pThis, key, $0)
        }
      }
    }
  }
}

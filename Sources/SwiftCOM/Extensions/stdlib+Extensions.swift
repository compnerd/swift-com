/**
 * Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>
 * All Rights Reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

internal func withUnsafeNullablePointer<T, Result>(to value: T?, _ body: (UnsafePointer<T>?) throws -> Result) rethrows -> Result {
  guard let value = value else { return try body(nil) }
  return try withUnsafePointer(to: value, body)
}

internal func withUnsafeNullablePointer<T, Result>(to value: inout T?, _ body: (UnsafePointer<T>?) throws -> Result) rethrows -> Result {
  guard var value = value else { return try body(nil) }
  return try withUnsafePointer(to: &value, body)
}

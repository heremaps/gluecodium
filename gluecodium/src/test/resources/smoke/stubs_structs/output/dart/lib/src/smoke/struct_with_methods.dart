import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class StructWithMethods {
  String field;
  StructWithMethods(this.field);
  voidFunction();
  bool boolFunction();
  int intFunction();
  String stringFunction();
  StructWithMethods structFunction();
  static staticFunction() => $class.staticFunction();
  static var $class = StructWithMethods$Impl();
}
class StructWithMethods$Impl {
  String field;
  StructWithMethods(this.field);
  voidFunction() {
    final _voidFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_StructWithMethods_voidFunction'));
    final _handle = smoke_StructWithMethods_toFfi(this);
    final __resultHandle = _voidFunctionFfi(_handle, __lib.LibraryContext.isolateId);
    smoke_StructWithMethods_releaseFfiHandle(_handle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  bool boolFunction() {
    final _boolFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_StructWithMethods_boolFunction'));
    final _handle = smoke_StructWithMethods_toFfi(this);
    final __resultHandle = _boolFunctionFfi(_handle, __lib.LibraryContext.isolateId);
    smoke_StructWithMethods_releaseFfiHandle(_handle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  int intFunction() {
    final _intFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_StructWithMethods_intFunction'));
    final _handle = smoke_StructWithMethods_toFfi(this);
    final __resultHandle = _intFunctionFfi(_handle, __lib.LibraryContext.isolateId);
    smoke_StructWithMethods_releaseFfiHandle(_handle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  String stringFunction() {
    final _stringFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_StructWithMethods_stringFunction'));
    final _handle = smoke_StructWithMethods_toFfi(this);
    final __resultHandle = _stringFunctionFfi(_handle, __lib.LibraryContext.isolateId);
    smoke_StructWithMethods_releaseFfiHandle(_handle);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
  StructWithMethods structFunction() {
    final _structFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_StructWithMethods_structFunction'));
    final _handle = smoke_StructWithMethods_toFfi(this);
    final __resultHandle = _structFunctionFfi(_handle, __lib.LibraryContext.isolateId);
    smoke_StructWithMethods_releaseFfiHandle(_handle);
    try {
      return smoke_StructWithMethods_fromFfi(__resultHandle);
    } finally {
      smoke_StructWithMethods_releaseFfiHandle(__resultHandle);
    }
  }
  staticFunction() {
    final _staticFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_StructWithMethods_staticFunction'));
    final __resultHandle = _staticFunctionFfi(__lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
// StructWithMethods "private" section, not exported.
final _smokeStructwithmethodsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithMethods_create_handle'));
final _smokeStructwithmethodsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithMethods_release_handle'));
final _smokeStructwithmethodsGetFieldfield = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithMethods_get_field_field'));
Pointer<Void> smoke_StructWithMethods_toFfi(StructWithMethods value) {
  final _fieldHandle = String_toFfi(value.field);
  final _result = _smokeStructwithmethodsCreateHandle(_fieldHandle);
  String_releaseFfiHandle(_fieldHandle);
  return _result;
}
StructWithMethods smoke_StructWithMethods_fromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeStructwithmethodsGetFieldfield(handle);
  try {
    return StructWithMethods(
      String_fromFfi(_fieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_fieldHandle);
  }
}
void smoke_StructWithMethods_releaseFfiHandle(Pointer<Void> handle) => _smokeStructwithmethodsReleaseHandle(handle);
// Nullable StructWithMethods
final _smoke_StructWithMethodsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithMethods_create_handle_nullable'));
final _smoke_StructWithMethodsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithMethods_release_handle_nullable'));
final _smoke_StructWithMethodsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithMethods_get_value_nullable'));
Pointer<Void> smoke_StructWithMethods_toFfi_nullable(StructWithMethods value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithMethods_toFfi(value);
  final result = _smoke_StructWithMethodsCreateHandleNullable(_handle);
  smoke_StructWithMethods_releaseFfiHandle(_handle);
  return result;
}
StructWithMethods smoke_StructWithMethods_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithMethodsGetValueNullable(handle);
  final result = smoke_StructWithMethods_fromFfi(_handle);
  smoke_StructWithMethods_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithMethods_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithMethodsReleaseHandleNullable(handle);
// End of StructWithMethods "private" section.

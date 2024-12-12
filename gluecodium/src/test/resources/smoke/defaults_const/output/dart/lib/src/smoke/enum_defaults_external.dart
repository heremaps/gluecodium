

import 'dart:ffi';
import 'package:foo/alien_enum1.dart' as alien_enum1;
import 'package:foo/alien_enum2.dart' as alien_enum2;
import 'package:foo/alien_enum3.dart' as alien_enum3;
import 'package:foo/alien_enum4.dart' as alien_enum4;
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/fire/external_enum1.dart';
import 'package:library/src/fire/external_enum2.dart';
import 'package:library/src/fire/external_enum3.dart';
import 'package:library/src/smoke/enum_wrapper.dart';

abstract class EnumDefaultsExternal implements Finalizable {

}


class EnumDefaultsExternal_SimpleEnum {
  alien_enum1.ExternalEnum1 enumField;

  EnumDefaultsExternal_SimpleEnum._(this.enumField);
  EnumDefaultsExternal_SimpleEnum()
    : enumField = alien_enum1.ExternalEnum1.disabled;
}


// EnumDefaultsExternal_SimpleEnum "private" section, not exported.

final _smokeEnumdefaultsexternalSimpleenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_EnumDefaultsExternal_SimpleEnum_create_handle'));
final _smokeEnumdefaultsexternalSimpleenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_SimpleEnum_release_handle'));
final _smokeEnumdefaultsexternalSimpleenumGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_SimpleEnum_get_field_enumField'));



Pointer<Void> smokeEnumdefaultsexternalSimpleenumToFfi(EnumDefaultsExternal_SimpleEnum value) {
  final _enumFieldHandle = fireExternalenum1ToFfi(value.enumField);
  final _result = _smokeEnumdefaultsexternalSimpleenumCreateHandle(_enumFieldHandle);
  fireExternalenum1ReleaseFfiHandle(_enumFieldHandle);
  return _result;
}

EnumDefaultsExternal_SimpleEnum smokeEnumdefaultsexternalSimpleenumFromFfi(Pointer<Void> handle) {
  final _enumFieldHandle = _smokeEnumdefaultsexternalSimpleenumGetFieldenumField(handle);
  try {
    return EnumDefaultsExternal_SimpleEnum._(
      fireExternalenum1FromFfi(_enumFieldHandle)
    );
  } finally {
    fireExternalenum1ReleaseFfiHandle(_enumFieldHandle);
  }
}

void smokeEnumdefaultsexternalSimpleenumReleaseFfiHandle(Pointer<Void> handle) => _smokeEnumdefaultsexternalSimpleenumReleaseHandle(handle);

// Nullable EnumDefaultsExternal_SimpleEnum

final _smokeEnumdefaultsexternalSimpleenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_SimpleEnum_create_handle_nullable'));
final _smokeEnumdefaultsexternalSimpleenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_SimpleEnum_release_handle_nullable'));
final _smokeEnumdefaultsexternalSimpleenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_SimpleEnum_get_value_nullable'));

Pointer<Void> smokeEnumdefaultsexternalSimpleenumToFfiNullable(EnumDefaultsExternal_SimpleEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumdefaultsexternalSimpleenumToFfi(value);
  final result = _smokeEnumdefaultsexternalSimpleenumCreateHandleNullable(_handle);
  smokeEnumdefaultsexternalSimpleenumReleaseFfiHandle(_handle);
  return result;
}

EnumDefaultsExternal_SimpleEnum? smokeEnumdefaultsexternalSimpleenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumdefaultsexternalSimpleenumGetValueNullable(handle);
  final result = smokeEnumdefaultsexternalSimpleenumFromFfi(_handle);
  smokeEnumdefaultsexternalSimpleenumReleaseFfiHandle(_handle);
  return result;
}

void smokeEnumdefaultsexternalSimpleenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumdefaultsexternalSimpleenumReleaseHandleNullable(handle);

// End of EnumDefaultsExternal_SimpleEnum "private" section.

class EnumDefaultsExternal_NullableEnum {
  alien_enum2.ExternalEnum2? enumField1;

  alien_enum2.ExternalEnum2? enumField1;

  EnumDefaultsExternal_NullableEnum._(this.enumField1, this.enumField1);
  EnumDefaultsExternal_NullableEnum()
    : enumField1 = null, enumField1 = alien_enum2.ExternalEnum2.disabled;
}


// EnumDefaultsExternal_NullableEnum "private" section, not exported.

final _smokeEnumdefaultsexternalNullableenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_NullableEnum_create_handle'));
final _smokeEnumdefaultsexternalNullableenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_NullableEnum_release_handle'));
final _smokeEnumdefaultsexternalNullableenumGetFieldenumField1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_NullableEnum_get_field_enumField1'));
final _smokeEnumdefaultsexternalNullableenumGetFieldenumField1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_NullableEnum_get_field_enumField1'));



Pointer<Void> smokeEnumdefaultsexternalNullableenumToFfi(EnumDefaultsExternal_NullableEnum value) {
  final _enumField1Handle = fireExternalenum2ToFfiNullable(value.enumField1);
  final _enumField1Handle = fireExternalenum2ToFfiNullable(value.enumField1);
  final _result = _smokeEnumdefaultsexternalNullableenumCreateHandle(_enumField1Handle, _enumField1Handle);
  fireExternalenum2ReleaseFfiHandleNullable(_enumField1Handle);
  fireExternalenum2ReleaseFfiHandleNullable(_enumField1Handle);
  return _result;
}

EnumDefaultsExternal_NullableEnum smokeEnumdefaultsexternalNullableenumFromFfi(Pointer<Void> handle) {
  final _enumField1Handle = _smokeEnumdefaultsexternalNullableenumGetFieldenumField1(handle);
  final _enumField1Handle = _smokeEnumdefaultsexternalNullableenumGetFieldenumField1(handle);
  try {
    return EnumDefaultsExternal_NullableEnum._(
      fireExternalenum2FromFfiNullable(_enumField1Handle), 
      fireExternalenum2FromFfiNullable(_enumField1Handle)
    );
  } finally {
    fireExternalenum2ReleaseFfiHandleNullable(_enumField1Handle);
    fireExternalenum2ReleaseFfiHandleNullable(_enumField1Handle);
  }
}

void smokeEnumdefaultsexternalNullableenumReleaseFfiHandle(Pointer<Void> handle) => _smokeEnumdefaultsexternalNullableenumReleaseHandle(handle);

// Nullable EnumDefaultsExternal_NullableEnum

final _smokeEnumdefaultsexternalNullableenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_NullableEnum_create_handle_nullable'));
final _smokeEnumdefaultsexternalNullableenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_NullableEnum_release_handle_nullable'));
final _smokeEnumdefaultsexternalNullableenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_NullableEnum_get_value_nullable'));

Pointer<Void> smokeEnumdefaultsexternalNullableenumToFfiNullable(EnumDefaultsExternal_NullableEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumdefaultsexternalNullableenumToFfi(value);
  final result = _smokeEnumdefaultsexternalNullableenumCreateHandleNullable(_handle);
  smokeEnumdefaultsexternalNullableenumReleaseFfiHandle(_handle);
  return result;
}

EnumDefaultsExternal_NullableEnum? smokeEnumdefaultsexternalNullableenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumdefaultsexternalNullableenumGetValueNullable(handle);
  final result = smokeEnumdefaultsexternalNullableenumFromFfi(_handle);
  smokeEnumdefaultsexternalNullableenumReleaseFfiHandle(_handle);
  return result;
}

void smokeEnumdefaultsexternalNullableenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumdefaultsexternalNullableenumReleaseHandleNullable(handle);

// End of EnumDefaultsExternal_NullableEnum "private" section.

class EnumDefaultsExternal_AliasEnum {
  alien_enum3.alien_enum3.ExternalEnum3 enumField;

  EnumDefaultsExternal_AliasEnum._(this.enumField);
  EnumDefaultsExternal_AliasEnum()
    : enumField = alien_enum3.ExternalEnum3.disabled;
}


// EnumDefaultsExternal_AliasEnum "private" section, not exported.

final _smokeEnumdefaultsexternalAliasenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_EnumDefaultsExternal_AliasEnum_create_handle'));
final _smokeEnumdefaultsexternalAliasenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_AliasEnum_release_handle'));
final _smokeEnumdefaultsexternalAliasenumGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_AliasEnum_get_field_enumField'));



Pointer<Void> smokeEnumdefaultsexternalAliasenumToFfi(EnumDefaultsExternal_AliasEnum value) {
  final _enumFieldHandle = fireExternalenum3ToFfi(value.enumField);
  final _result = _smokeEnumdefaultsexternalAliasenumCreateHandle(_enumFieldHandle);
  fireExternalenum3ReleaseFfiHandle(_enumFieldHandle);
  return _result;
}

EnumDefaultsExternal_AliasEnum smokeEnumdefaultsexternalAliasenumFromFfi(Pointer<Void> handle) {
  final _enumFieldHandle = _smokeEnumdefaultsexternalAliasenumGetFieldenumField(handle);
  try {
    return EnumDefaultsExternal_AliasEnum._(
      fireExternalenum3FromFfi(_enumFieldHandle)
    );
  } finally {
    fireExternalenum3ReleaseFfiHandle(_enumFieldHandle);
  }
}

void smokeEnumdefaultsexternalAliasenumReleaseFfiHandle(Pointer<Void> handle) => _smokeEnumdefaultsexternalAliasenumReleaseHandle(handle);

// Nullable EnumDefaultsExternal_AliasEnum

final _smokeEnumdefaultsexternalAliasenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_AliasEnum_create_handle_nullable'));
final _smokeEnumdefaultsexternalAliasenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_AliasEnum_release_handle_nullable'));
final _smokeEnumdefaultsexternalAliasenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_AliasEnum_get_value_nullable'));

Pointer<Void> smokeEnumdefaultsexternalAliasenumToFfiNullable(EnumDefaultsExternal_AliasEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumdefaultsexternalAliasenumToFfi(value);
  final result = _smokeEnumdefaultsexternalAliasenumCreateHandleNullable(_handle);
  smokeEnumdefaultsexternalAliasenumReleaseFfiHandle(_handle);
  return result;
}

EnumDefaultsExternal_AliasEnum? smokeEnumdefaultsexternalAliasenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumdefaultsexternalAliasenumGetValueNullable(handle);
  final result = smokeEnumdefaultsexternalAliasenumFromFfi(_handle);
  smokeEnumdefaultsexternalAliasenumReleaseFfiHandle(_handle);
  return result;
}

void smokeEnumdefaultsexternalAliasenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumdefaultsexternalAliasenumReleaseHandleNullable(handle);

// End of EnumDefaultsExternal_AliasEnum "private" section.

class EnumDefaultsExternal_WrappedEnum {
  EnumWrapper structField;

  EnumDefaultsExternal_WrappedEnum._(this.structField);
  EnumDefaultsExternal_WrappedEnum()
    : structField = EnumWrapper(alien_enum4.ExternalEnum4.disabled);
}


// EnumDefaultsExternal_WrappedEnum "private" section, not exported.

final _smokeEnumdefaultsexternalWrappedenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_WrappedEnum_create_handle'));
final _smokeEnumdefaultsexternalWrappedenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_WrappedEnum_release_handle'));
final _smokeEnumdefaultsexternalWrappedenumGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_WrappedEnum_get_field_structField'));



Pointer<Void> smokeEnumdefaultsexternalWrappedenumToFfi(EnumDefaultsExternal_WrappedEnum value) {
  final _structFieldHandle = smokeEnumwrapperToFfi(value.structField);
  final _result = _smokeEnumdefaultsexternalWrappedenumCreateHandle(_structFieldHandle);
  smokeEnumwrapperReleaseFfiHandle(_structFieldHandle);
  return _result;
}

EnumDefaultsExternal_WrappedEnum smokeEnumdefaultsexternalWrappedenumFromFfi(Pointer<Void> handle) {
  final _structFieldHandle = _smokeEnumdefaultsexternalWrappedenumGetFieldstructField(handle);
  try {
    return EnumDefaultsExternal_WrappedEnum._(
      smokeEnumwrapperFromFfi(_structFieldHandle)
    );
  } finally {
    smokeEnumwrapperReleaseFfiHandle(_structFieldHandle);
  }
}

void smokeEnumdefaultsexternalWrappedenumReleaseFfiHandle(Pointer<Void> handle) => _smokeEnumdefaultsexternalWrappedenumReleaseHandle(handle);

// Nullable EnumDefaultsExternal_WrappedEnum

final _smokeEnumdefaultsexternalWrappedenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_WrappedEnum_create_handle_nullable'));
final _smokeEnumdefaultsexternalWrappedenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_WrappedEnum_release_handle_nullable'));
final _smokeEnumdefaultsexternalWrappedenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_WrappedEnum_get_value_nullable'));

Pointer<Void> smokeEnumdefaultsexternalWrappedenumToFfiNullable(EnumDefaultsExternal_WrappedEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumdefaultsexternalWrappedenumToFfi(value);
  final result = _smokeEnumdefaultsexternalWrappedenumCreateHandleNullable(_handle);
  smokeEnumdefaultsexternalWrappedenumReleaseFfiHandle(_handle);
  return result;
}

EnumDefaultsExternal_WrappedEnum? smokeEnumdefaultsexternalWrappedenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumdefaultsexternalWrappedenumGetValueNullable(handle);
  final result = smokeEnumdefaultsexternalWrappedenumFromFfi(_handle);
  smokeEnumdefaultsexternalWrappedenumReleaseFfiHandle(_handle);
  return result;
}

void smokeEnumdefaultsexternalWrappedenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumdefaultsexternalWrappedenumReleaseHandleNullable(handle);

// End of EnumDefaultsExternal_WrappedEnum "private" section.

// EnumDefaultsExternal "private" section, not exported.

final _smokeEnumdefaultsexternalRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_EnumDefaultsExternal_register_finalizer'));
final _smokeEnumdefaultsexternalCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_copy_handle'));
final _smokeEnumdefaultsexternalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaultsExternal_release_handle'));


class EnumDefaultsExternal$Impl extends __lib.NativeBase implements EnumDefaultsExternal {

  EnumDefaultsExternal$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> smokeEnumdefaultsexternalToFfi(EnumDefaultsExternal value) =>
  _smokeEnumdefaultsexternalCopyHandle((value as __lib.NativeBase).handle);

EnumDefaultsExternal smokeEnumdefaultsexternalFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is EnumDefaultsExternal) return instance;

  final _copiedHandle = _smokeEnumdefaultsexternalCopyHandle(handle);
  final result = EnumDefaultsExternal$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeEnumdefaultsexternalRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeEnumdefaultsexternalReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeEnumdefaultsexternalReleaseHandle(handle);

Pointer<Void> smokeEnumdefaultsexternalToFfiNullable(EnumDefaultsExternal? value) =>
  value != null ? smokeEnumdefaultsexternalToFfi(value) : Pointer<Void>.fromAddress(0);

EnumDefaultsExternal? smokeEnumdefaultsexternalFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeEnumdefaultsexternalFromFfi(handle) : null;

void smokeEnumdefaultsexternalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumdefaultsexternalReleaseHandle(handle);

// End of EnumDefaultsExternal "private" section.



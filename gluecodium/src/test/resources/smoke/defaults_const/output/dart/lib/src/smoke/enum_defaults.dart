import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/fire/enum1.dart';
import 'package:library/src/fire/enum2.dart';
import 'package:library/src/fire/enum3.dart';
import 'package:library/src/fire/enum4.dart';
import 'package:library/src/smoke/enum_wrapper.dart';
abstract class EnumDefaults {
}
typedef EnumDefaults_EnumAlias = Enum3;
class EnumDefaults_SimpleEnum {
  Enum1 enumField;
  EnumDefaults_SimpleEnum._(this.enumField);
  EnumDefaults_SimpleEnum()
    : enumField = Enum1.disabled;
}
// EnumDefaults_SimpleEnum "private" section, not exported.
final _smokeEnumdefaultsSimpleenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_EnumDefaults_SimpleEnum_create_handle'));
final _smokeEnumdefaultsSimpleenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_SimpleEnum_release_handle'));
final _smokeEnumdefaultsSimpleenumGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_SimpleEnum_get_field_enumField'));
Pointer<Void> smokeEnumdefaultsSimpleenumToFfi(EnumDefaults_SimpleEnum value) {
  final _enumFieldHandle = fireEnum1ToFfi(value.enumField);
  final _result = _smokeEnumdefaultsSimpleenumCreateHandle(_enumFieldHandle);
  fireEnum1ReleaseFfiHandle(_enumFieldHandle);
  return _result;
}
EnumDefaults_SimpleEnum smokeEnumdefaultsSimpleenumFromFfi(Pointer<Void> handle) {
  final _enumFieldHandle = _smokeEnumdefaultsSimpleenumGetFieldenumField(handle);
  try {
    return EnumDefaults_SimpleEnum._(
      fireEnum1FromFfi(_enumFieldHandle)
    );
  } finally {
    fireEnum1ReleaseFfiHandle(_enumFieldHandle);
  }
}
void smokeEnumdefaultsSimpleenumReleaseFfiHandle(Pointer<Void> handle) => _smokeEnumdefaultsSimpleenumReleaseHandle(handle);
// Nullable EnumDefaults_SimpleEnum
final _smokeEnumdefaultsSimpleenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_SimpleEnum_create_handle_nullable'));
final _smokeEnumdefaultsSimpleenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_SimpleEnum_release_handle_nullable'));
final _smokeEnumdefaultsSimpleenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_SimpleEnum_get_value_nullable'));
Pointer<Void> smokeEnumdefaultsSimpleenumToFfiNullable(EnumDefaults_SimpleEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumdefaultsSimpleenumToFfi(value);
  final result = _smokeEnumdefaultsSimpleenumCreateHandleNullable(_handle);
  smokeEnumdefaultsSimpleenumReleaseFfiHandle(_handle);
  return result;
}
EnumDefaults_SimpleEnum? smokeEnumdefaultsSimpleenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumdefaultsSimpleenumGetValueNullable(handle);
  final result = smokeEnumdefaultsSimpleenumFromFfi(_handle);
  smokeEnumdefaultsSimpleenumReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumdefaultsSimpleenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumdefaultsSimpleenumReleaseHandleNullable(handle);
// End of EnumDefaults_SimpleEnum "private" section.
class EnumDefaults_NullableEnum {
  Enum2? enumField1;
  Enum2? enumField1;
  EnumDefaults_NullableEnum._(this.enumField1, this.enumField1);
  EnumDefaults_NullableEnum()
    : enumField1 = null, enumField1 = Enum2.disabled;
}
// EnumDefaults_NullableEnum "private" section, not exported.
final _smokeEnumdefaultsNullableenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_EnumDefaults_NullableEnum_create_handle'));
final _smokeEnumdefaultsNullableenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_NullableEnum_release_handle'));
final _smokeEnumdefaultsNullableenumGetFieldenumField1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_NullableEnum_get_field_enumField1'));
final _smokeEnumdefaultsNullableenumGetFieldenumField1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_NullableEnum_get_field_enumField1'));
Pointer<Void> smokeEnumdefaultsNullableenumToFfi(EnumDefaults_NullableEnum value) {
  final _enumField1Handle = fireEnum2ToFfiNullable(value.enumField1);
  final _enumField1Handle = fireEnum2ToFfiNullable(value.enumField1);
  final _result = _smokeEnumdefaultsNullableenumCreateHandle(_enumField1Handle, _enumField1Handle);
  fireEnum2ReleaseFfiHandleNullable(_enumField1Handle);
  fireEnum2ReleaseFfiHandleNullable(_enumField1Handle);
  return _result;
}
EnumDefaults_NullableEnum smokeEnumdefaultsNullableenumFromFfi(Pointer<Void> handle) {
  final _enumField1Handle = _smokeEnumdefaultsNullableenumGetFieldenumField1(handle);
  final _enumField1Handle = _smokeEnumdefaultsNullableenumGetFieldenumField1(handle);
  try {
    return EnumDefaults_NullableEnum._(
      fireEnum2FromFfiNullable(_enumField1Handle),
      fireEnum2FromFfiNullable(_enumField1Handle)
    );
  } finally {
    fireEnum2ReleaseFfiHandleNullable(_enumField1Handle);
    fireEnum2ReleaseFfiHandleNullable(_enumField1Handle);
  }
}
void smokeEnumdefaultsNullableenumReleaseFfiHandle(Pointer<Void> handle) => _smokeEnumdefaultsNullableenumReleaseHandle(handle);
// Nullable EnumDefaults_NullableEnum
final _smokeEnumdefaultsNullableenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_NullableEnum_create_handle_nullable'));
final _smokeEnumdefaultsNullableenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_NullableEnum_release_handle_nullable'));
final _smokeEnumdefaultsNullableenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_NullableEnum_get_value_nullable'));
Pointer<Void> smokeEnumdefaultsNullableenumToFfiNullable(EnumDefaults_NullableEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumdefaultsNullableenumToFfi(value);
  final result = _smokeEnumdefaultsNullableenumCreateHandleNullable(_handle);
  smokeEnumdefaultsNullableenumReleaseFfiHandle(_handle);
  return result;
}
EnumDefaults_NullableEnum? smokeEnumdefaultsNullableenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumdefaultsNullableenumGetValueNullable(handle);
  final result = smokeEnumdefaultsNullableenumFromFfi(_handle);
  smokeEnumdefaultsNullableenumReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumdefaultsNullableenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumdefaultsNullableenumReleaseHandleNullable(handle);
// End of EnumDefaults_NullableEnum "private" section.
class EnumDefaults_AliasEnum {
  EnumDefaults_EnumAlias enumField;
  EnumDefaults_AliasEnum._(this.enumField);
  EnumDefaults_AliasEnum()
    : enumField = Enum3.disabled;
}
// EnumDefaults_AliasEnum "private" section, not exported.
final _smokeEnumdefaultsAliasenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_EnumDefaults_AliasEnum_create_handle'));
final _smokeEnumdefaultsAliasenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_AliasEnum_release_handle'));
final _smokeEnumdefaultsAliasenumGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_AliasEnum_get_field_enumField'));
Pointer<Void> smokeEnumdefaultsAliasenumToFfi(EnumDefaults_AliasEnum value) {
  final _enumFieldHandle = fireEnum3ToFfi(value.enumField);
  final _result = _smokeEnumdefaultsAliasenumCreateHandle(_enumFieldHandle);
  fireEnum3ReleaseFfiHandle(_enumFieldHandle);
  return _result;
}
EnumDefaults_AliasEnum smokeEnumdefaultsAliasenumFromFfi(Pointer<Void> handle) {
  final _enumFieldHandle = _smokeEnumdefaultsAliasenumGetFieldenumField(handle);
  try {
    return EnumDefaults_AliasEnum._(
      fireEnum3FromFfi(_enumFieldHandle)
    );
  } finally {
    fireEnum3ReleaseFfiHandle(_enumFieldHandle);
  }
}
void smokeEnumdefaultsAliasenumReleaseFfiHandle(Pointer<Void> handle) => _smokeEnumdefaultsAliasenumReleaseHandle(handle);
// Nullable EnumDefaults_AliasEnum
final _smokeEnumdefaultsAliasenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_AliasEnum_create_handle_nullable'));
final _smokeEnumdefaultsAliasenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_AliasEnum_release_handle_nullable'));
final _smokeEnumdefaultsAliasenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_AliasEnum_get_value_nullable'));
Pointer<Void> smokeEnumdefaultsAliasenumToFfiNullable(EnumDefaults_AliasEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumdefaultsAliasenumToFfi(value);
  final result = _smokeEnumdefaultsAliasenumCreateHandleNullable(_handle);
  smokeEnumdefaultsAliasenumReleaseFfiHandle(_handle);
  return result;
}
EnumDefaults_AliasEnum? smokeEnumdefaultsAliasenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumdefaultsAliasenumGetValueNullable(handle);
  final result = smokeEnumdefaultsAliasenumFromFfi(_handle);
  smokeEnumdefaultsAliasenumReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumdefaultsAliasenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumdefaultsAliasenumReleaseHandleNullable(handle);
// End of EnumDefaults_AliasEnum "private" section.
class EnumDefaults_WrappedEnum {
  EnumWrapper structField;
  EnumDefaults_WrappedEnum._(this.structField);
  EnumDefaults_WrappedEnum()
    : structField = EnumWrapper(Enum4.disabled);
}
// EnumDefaults_WrappedEnum "private" section, not exported.
final _smokeEnumdefaultsWrappedenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_WrappedEnum_create_handle'));
final _smokeEnumdefaultsWrappedenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_WrappedEnum_release_handle'));
final _smokeEnumdefaultsWrappedenumGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_WrappedEnum_get_field_structField'));
Pointer<Void> smokeEnumdefaultsWrappedenumToFfi(EnumDefaults_WrappedEnum value) {
  final _structFieldHandle = smokeEnumwrapperToFfi(value.structField);
  final _result = _smokeEnumdefaultsWrappedenumCreateHandle(_structFieldHandle);
  smokeEnumwrapperReleaseFfiHandle(_structFieldHandle);
  return _result;
}
EnumDefaults_WrappedEnum smokeEnumdefaultsWrappedenumFromFfi(Pointer<Void> handle) {
  final _structFieldHandle = _smokeEnumdefaultsWrappedenumGetFieldstructField(handle);
  try {
    return EnumDefaults_WrappedEnum._(
      smokeEnumwrapperFromFfi(_structFieldHandle)
    );
  } finally {
    smokeEnumwrapperReleaseFfiHandle(_structFieldHandle);
  }
}
void smokeEnumdefaultsWrappedenumReleaseFfiHandle(Pointer<Void> handle) => _smokeEnumdefaultsWrappedenumReleaseHandle(handle);
// Nullable EnumDefaults_WrappedEnum
final _smokeEnumdefaultsWrappedenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_WrappedEnum_create_handle_nullable'));
final _smokeEnumdefaultsWrappedenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_WrappedEnum_release_handle_nullable'));
final _smokeEnumdefaultsWrappedenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_WrappedEnum_get_value_nullable'));
Pointer<Void> smokeEnumdefaultsWrappedenumToFfiNullable(EnumDefaults_WrappedEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumdefaultsWrappedenumToFfi(value);
  final result = _smokeEnumdefaultsWrappedenumCreateHandleNullable(_handle);
  smokeEnumdefaultsWrappedenumReleaseFfiHandle(_handle);
  return result;
}
EnumDefaults_WrappedEnum? smokeEnumdefaultsWrappedenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumdefaultsWrappedenumGetValueNullable(handle);
  final result = smokeEnumdefaultsWrappedenumFromFfi(_handle);
  smokeEnumdefaultsWrappedenumReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumdefaultsWrappedenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumdefaultsWrappedenumReleaseHandleNullable(handle);
// End of EnumDefaults_WrappedEnum "private" section.
// EnumDefaults "private" section, not exported.
final _smokeEnumdefaultsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_EnumDefaults_register_finalizer'));
final _smokeEnumdefaultsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_copy_handle'));
final _smokeEnumdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumDefaults_release_handle'));
class EnumDefaults$Impl extends __lib.NativeBase implements EnumDefaults {
  EnumDefaults$Impl(Pointer<Void> handle) : super(handle);
}
Pointer<Void> smokeEnumdefaultsToFfi(EnumDefaults value) =>
  _smokeEnumdefaultsCopyHandle((value as __lib.NativeBase).handle);
EnumDefaults smokeEnumdefaultsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is EnumDefaults) return instance;
  final _copiedHandle = _smokeEnumdefaultsCopyHandle(handle);
  final result = EnumDefaults$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeEnumdefaultsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeEnumdefaultsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeEnumdefaultsReleaseHandle(handle);
Pointer<Void> smokeEnumdefaultsToFfiNullable(EnumDefaults? value) =>
  value != null ? smokeEnumdefaultsToFfi(value) : Pointer<Void>.fromAddress(0);
EnumDefaults? smokeEnumdefaultsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeEnumdefaultsFromFfi(handle) : null;
void smokeEnumdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumdefaultsReleaseHandle(handle);
// End of EnumDefaults "private" section.

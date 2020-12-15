import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class PublicClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// @nodoc
  PublicClass_InternalStruct internal_internalMethod(PublicClass_InternalStruct input);
  /// @nodoc
  PublicClass_InternalStruct get internal_internalStructProperty;
  /// @nodoc
  set internal_internalStructProperty(PublicClass_InternalStruct value);
  String get internalSetterProperty;
  /// @nodoc
  set internal_internalSetterProperty(String value);
}
/// @nodoc
enum PublicClass_InternalEnum {
    foo,
    bar
}
// PublicClass_InternalEnum "private" section, not exported.
int smoke_PublicClass_InternalEnum_toFfi(PublicClass_InternalEnum value) {
  switch (value) {
  case PublicClass_InternalEnum.foo:
    return 0;
  break;
  case PublicClass_InternalEnum.bar:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for PublicClass_InternalEnum enum.");
  }
}
PublicClass_InternalEnum smoke_PublicClass_InternalEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return PublicClass_InternalEnum.foo;
  break;
  case 1:
    return PublicClass_InternalEnum.bar;
  break;
  default:
    throw StateError("Invalid numeric value $handle for PublicClass_InternalEnum enum.");
  }
}
void smoke_PublicClass_InternalEnum_releaseFfiHandle(int handle) {}
final _smoke_PublicClass_InternalEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_PublicClass_InternalEnum_create_handle_nullable'));
final _smoke_PublicClass_InternalEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalEnum_release_handle_nullable'));
final _smoke_PublicClass_InternalEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalEnum_get_value_nullable'));
Pointer<Void> smoke_PublicClass_InternalEnum_toFfi_nullable(PublicClass_InternalEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicClass_InternalEnum_toFfi(value);
  final result = _smoke_PublicClass_InternalEnum_create_handle_nullable(_handle);
  smoke_PublicClass_InternalEnum_releaseFfiHandle(_handle);
  return result;
}
PublicClass_InternalEnum smoke_PublicClass_InternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicClass_InternalEnum_get_value_nullable(handle);
  final result = smoke_PublicClass_InternalEnum_fromFfi(_handle);
  smoke_PublicClass_InternalEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicClass_InternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicClass_InternalEnum_release_handle_nullable(handle);
// End of PublicClass_InternalEnum "private" section.
/// @nodoc
class PublicClass_InternalStruct {
  /// @nodoc
  String internal_stringField;
  PublicClass_InternalStruct(this.internal_stringField);
}
// PublicClass_InternalStruct "private" section, not exported.
final _smoke_PublicClass_InternalStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalStruct_create_handle'));
final _smoke_PublicClass_InternalStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalStruct_release_handle'));
final _smoke_PublicClass_InternalStruct_get_field_stringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalStruct_get_field_stringField'));
Pointer<Void> smoke_PublicClass_InternalStruct_toFfi(PublicClass_InternalStruct value) {
  final _stringField_handle = String_toFfi(value.internal_stringField);
  final _result = _smoke_PublicClass_InternalStruct_create_handle(_stringField_handle);
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
PublicClass_InternalStruct smoke_PublicClass_InternalStruct_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_PublicClass_InternalStruct_get_field_stringField(handle);
  try {
    return PublicClass_InternalStruct(
      String_fromFfi(_stringField_handle)
    );
  } finally {
    String_releaseFfiHandle(_stringField_handle);
  }
}
void smoke_PublicClass_InternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_PublicClass_InternalStruct_release_handle(handle);
// Nullable PublicClass_InternalStruct
final _smoke_PublicClass_InternalStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalStruct_create_handle_nullable'));
final _smoke_PublicClass_InternalStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalStruct_release_handle_nullable'));
final _smoke_PublicClass_InternalStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalStruct_get_value_nullable'));
Pointer<Void> smoke_PublicClass_InternalStruct_toFfi_nullable(PublicClass_InternalStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicClass_InternalStruct_toFfi(value);
  final result = _smoke_PublicClass_InternalStruct_create_handle_nullable(_handle);
  smoke_PublicClass_InternalStruct_releaseFfiHandle(_handle);
  return result;
}
PublicClass_InternalStruct smoke_PublicClass_InternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicClass_InternalStruct_get_value_nullable(handle);
  final result = smoke_PublicClass_InternalStruct_fromFfi(_handle);
  smoke_PublicClass_InternalStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicClass_InternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicClass_InternalStruct_release_handle_nullable(handle);
// End of PublicClass_InternalStruct "private" section.
class PublicClass_PublicStruct {
  /// @nodoc
  PublicClass_InternalStruct internal_internalField;
  PublicClass_PublicStruct(this.internal_internalField);
}
// PublicClass_PublicStruct "private" section, not exported.
final _smoke_PublicClass_PublicStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStruct_create_handle'));
final _smoke_PublicClass_PublicStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStruct_release_handle'));
final _smoke_PublicClass_PublicStruct_get_field_internalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStruct_get_field_internalField'));
Pointer<Void> smoke_PublicClass_PublicStruct_toFfi(PublicClass_PublicStruct value) {
  final _internalField_handle = smoke_PublicClass_InternalStruct_toFfi(value.internal_internalField);
  final _result = _smoke_PublicClass_PublicStruct_create_handle(_internalField_handle);
  smoke_PublicClass_InternalStruct_releaseFfiHandle(_internalField_handle);
  return _result;
}
PublicClass_PublicStruct smoke_PublicClass_PublicStruct_fromFfi(Pointer<Void> handle) {
  final _internalField_handle = _smoke_PublicClass_PublicStruct_get_field_internalField(handle);
  try {
    return PublicClass_PublicStruct(
      smoke_PublicClass_InternalStruct_fromFfi(_internalField_handle)
    );
  } finally {
    smoke_PublicClass_InternalStruct_releaseFfiHandle(_internalField_handle);
  }
}
void smoke_PublicClass_PublicStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_PublicClass_PublicStruct_release_handle(handle);
// Nullable PublicClass_PublicStruct
final _smoke_PublicClass_PublicStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStruct_create_handle_nullable'));
final _smoke_PublicClass_PublicStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStruct_release_handle_nullable'));
final _smoke_PublicClass_PublicStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStruct_get_value_nullable'));
Pointer<Void> smoke_PublicClass_PublicStruct_toFfi_nullable(PublicClass_PublicStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicClass_PublicStruct_toFfi(value);
  final result = _smoke_PublicClass_PublicStruct_create_handle_nullable(_handle);
  smoke_PublicClass_PublicStruct_releaseFfiHandle(_handle);
  return result;
}
PublicClass_PublicStruct smoke_PublicClass_PublicStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicClass_PublicStruct_get_value_nullable(handle);
  final result = smoke_PublicClass_PublicStruct_fromFfi(_handle);
  smoke_PublicClass_PublicStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicClass_PublicStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicClass_PublicStruct_release_handle_nullable(handle);
// End of PublicClass_PublicStruct "private" section.
class PublicClass_PublicStructWithInternalDefaults {
  /// @nodoc
  String internal_internalField;
  double publicField;
  PublicClass_PublicStructWithInternalDefaults(this.internal_internalField, this.publicField);
  PublicClass_PublicStructWithInternalDefaults.withDefaults(double publicField)
    : internal_internalField = "foo", publicField = publicField;
}
// PublicClass_PublicStructWithInternalDefaults "private" section, not exported.
final _smoke_PublicClass_PublicStructWithInternalDefaults_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Float),
    Pointer<Void> Function(Pointer<Void>, double)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_create_handle'));
final _smoke_PublicClass_PublicStructWithInternalDefaults_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_release_handle'));
final _smoke_PublicClass_PublicStructWithInternalDefaults_get_field_internalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_get_field_internalField'));
final _smoke_PublicClass_PublicStructWithInternalDefaults_get_field_publicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_get_field_publicField'));
Pointer<Void> smoke_PublicClass_PublicStructWithInternalDefaults_toFfi(PublicClass_PublicStructWithInternalDefaults value) {
  final _internalField_handle = String_toFfi(value.internal_internalField);
  final _publicField_handle = (value.publicField);
  final _result = _smoke_PublicClass_PublicStructWithInternalDefaults_create_handle(_internalField_handle, _publicField_handle);
  String_releaseFfiHandle(_internalField_handle);
  (_publicField_handle);
  return _result;
}
PublicClass_PublicStructWithInternalDefaults smoke_PublicClass_PublicStructWithInternalDefaults_fromFfi(Pointer<Void> handle) {
  final _internalField_handle = _smoke_PublicClass_PublicStructWithInternalDefaults_get_field_internalField(handle);
  final _publicField_handle = _smoke_PublicClass_PublicStructWithInternalDefaults_get_field_publicField(handle);
  try {
    return PublicClass_PublicStructWithInternalDefaults(
      String_fromFfi(_internalField_handle),
      (_publicField_handle)
    );
  } finally {
    String_releaseFfiHandle(_internalField_handle);
    (_publicField_handle);
  }
}
void smoke_PublicClass_PublicStructWithInternalDefaults_releaseFfiHandle(Pointer<Void> handle) => _smoke_PublicClass_PublicStructWithInternalDefaults_release_handle(handle);
// Nullable PublicClass_PublicStructWithInternalDefaults
final _smoke_PublicClass_PublicStructWithInternalDefaults_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_create_handle_nullable'));
final _smoke_PublicClass_PublicStructWithInternalDefaults_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_release_handle_nullable'));
final _smoke_PublicClass_PublicStructWithInternalDefaults_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_get_value_nullable'));
Pointer<Void> smoke_PublicClass_PublicStructWithInternalDefaults_toFfi_nullable(PublicClass_PublicStructWithInternalDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicClass_PublicStructWithInternalDefaults_toFfi(value);
  final result = _smoke_PublicClass_PublicStructWithInternalDefaults_create_handle_nullable(_handle);
  smoke_PublicClass_PublicStructWithInternalDefaults_releaseFfiHandle(_handle);
  return result;
}
PublicClass_PublicStructWithInternalDefaults smoke_PublicClass_PublicStructWithInternalDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicClass_PublicStructWithInternalDefaults_get_value_nullable(handle);
  final result = smoke_PublicClass_PublicStructWithInternalDefaults_fromFfi(_handle);
  smoke_PublicClass_PublicStructWithInternalDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicClass_PublicStructWithInternalDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicClass_PublicStructWithInternalDefaults_release_handle_nullable(handle);
// End of PublicClass_PublicStructWithInternalDefaults "private" section.
// PublicClass "private" section, not exported.
final _smoke_PublicClass_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_copy_handle'));
final _smoke_PublicClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_release_handle'));
class PublicClass$Impl implements PublicClass {
  @protected
  Pointer<Void> handle;
  PublicClass$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_PublicClass_release_handle(handle);
    handle = null;
  }
  @override
  PublicClass_InternalStruct internal_internalMethod(PublicClass_InternalStruct input) {
    final _internalMethod_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PublicClass_internalMethod__InternalStruct'));
    final _input_handle = smoke_PublicClass_InternalStruct_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _internalMethod_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    smoke_PublicClass_InternalStruct_releaseFfiHandle(_input_handle);
    try {
      return smoke_PublicClass_InternalStruct_fromFfi(__result_handle);
    } finally {
      smoke_PublicClass_InternalStruct_releaseFfiHandle(__result_handle);
    }
  }
  @override
  PublicClass_InternalStruct get internal_internalStructProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_PublicClass_internalStructProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_PublicClass_InternalStruct_fromFfi(__result_handle);
    } finally {
      smoke_PublicClass_InternalStruct_releaseFfiHandle(__result_handle);
    }
  }
  @override
  set internal_internalStructProperty(PublicClass_InternalStruct value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PublicClass_internalStructProperty_set__InternalStruct'));
    final _value_handle = smoke_PublicClass_InternalStruct_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    smoke_PublicClass_InternalStruct_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  String get internalSetterProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_PublicClass_internalSetterProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  @override
  set internal_internalSetterProperty(String value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PublicClass_internalSetterProperty_set__String'));
    final _value_handle = String_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    String_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_PublicClass_toFfi(PublicClass value) =>
  _smoke_PublicClass_copy_handle((value as PublicClass$Impl).handle);
PublicClass smoke_PublicClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as PublicClass;
  if (instance != null) return instance;
  final _copied_handle = _smoke_PublicClass_copy_handle(handle);
  final result = PublicClass$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_PublicClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_PublicClass_release_handle(handle);
Pointer<Void> smoke_PublicClass_toFfi_nullable(PublicClass value) =>
  value != null ? smoke_PublicClass_toFfi(value) : Pointer<Void>.fromAddress(0);
PublicClass smoke_PublicClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_PublicClass_fromFfi(handle) : null;
void smoke_PublicClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicClass_release_handle(handle);
// End of PublicClass "private" section.

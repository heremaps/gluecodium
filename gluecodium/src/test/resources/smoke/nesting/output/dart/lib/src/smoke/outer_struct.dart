import 'dart:typed_data';
import 'package:intl/locale.dart';
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
final _doNothing_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_doNothing_return_release_handle'));
final _doNothing_return_get_result = (Pointer) {};
final _doNothing_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_OuterStruct_doNothing_return_get_error'));
final _doNothing_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_OuterStruct_doNothing_return_has_error'));
class OuterStruct {
  String field;
  OuterStruct(this.field);
  doNothing() {
    final _doNothing_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_OuterStruct_doNothing'));
    final _handle = smoke_OuterStruct_toFfi(this);
    final __call_result_handle = _doNothing_ffi(_handle, __lib.LibraryContext.isolateId);
    smoke_OuterStruct_releaseFfiHandle(_handle);
    if (_doNothing_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _doNothing_return_get_error(__call_result_handle);
        _doNothing_return_release_handle(__call_result_handle);
        try {
          throw OuterStruct_InstantiationException(smoke_OuterStruct_InnerEnum_fromFfi(__error_handle));
        } finally {
          smoke_OuterStruct_InnerEnum_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _doNothing_return_get_result(__call_result_handle);
    _doNothing_return_release_handle(__call_result_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
enum OuterStruct_InnerEnum {
    foo,
    bar
}
// OuterStruct_InnerEnum "private" section, not exported.
int smoke_OuterStruct_InnerEnum_toFfi(OuterStruct_InnerEnum value) {
  switch (value) {
  case OuterStruct_InnerEnum.foo:
    return 0;
  break;
  case OuterStruct_InnerEnum.bar:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for OuterStruct_InnerEnum enum.");
  }
}
OuterStruct_InnerEnum smoke_OuterStruct_InnerEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return OuterStruct_InnerEnum.foo;
  break;
  case 1:
    return OuterStruct_InnerEnum.bar;
  break;
  default:
    throw StateError("Invalid numeric value $handle for OuterStruct_InnerEnum enum.");
  }
}
void smoke_OuterStruct_InnerEnum_releaseFfiHandle(int handle) {}
final _smoke_OuterStruct_InnerEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_OuterStruct_InnerEnum_create_handle_nullable'));
final _smoke_OuterStruct_InnerEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerEnum_release_handle_nullable'));
final _smoke_OuterStruct_InnerEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerEnum_get_value_nullable'));
Pointer<Void> smoke_OuterStruct_InnerEnum_toFfi_nullable(OuterStruct_InnerEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_OuterStruct_InnerEnum_toFfi(value);
  final result = _smoke_OuterStruct_InnerEnum_create_handle_nullable(_handle);
  smoke_OuterStruct_InnerEnum_releaseFfiHandle(_handle);
  return result;
}
OuterStruct_InnerEnum smoke_OuterStruct_InnerEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_OuterStruct_InnerEnum_get_value_nullable(handle);
  final result = smoke_OuterStruct_InnerEnum_fromFfi(_handle);
  smoke_OuterStruct_InnerEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_OuterStruct_InnerEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterStruct_InnerEnum_release_handle_nullable(handle);
// End of OuterStruct_InnerEnum "private" section.
class OuterStruct_InstantiationException implements Exception {
  final OuterStruct_InnerEnum error;
  OuterStruct_InstantiationException(this.error);
}
class OuterStruct_InnerStruct {
  List<DateTime> otherField;
  OuterStruct_InnerStruct(this.otherField);
  doSomething() {
    final _doSomething_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_OuterStruct_InnerStruct_doSomething'));
    final _handle = smoke_OuterStruct_InnerStruct_toFfi(this);
    final __result_handle = _doSomething_ffi(_handle, __lib.LibraryContext.isolateId);
    smoke_OuterStruct_InnerStruct_releaseFfiHandle(_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
// OuterStruct_InnerStruct "private" section, not exported.
final _smoke_OuterStruct_InnerStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerStruct_create_handle'));
final _smoke_OuterStruct_InnerStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerStruct_release_handle'));
final _smoke_OuterStruct_InnerStruct_get_field_otherField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerStruct_get_field_otherField'));
Pointer<Void> smoke_OuterStruct_InnerStruct_toFfi(OuterStruct_InnerStruct value) {
  final _otherField_handle = foobar_ListOf_Date_toFfi(value.otherField);
  final _result = _smoke_OuterStruct_InnerStruct_create_handle(_otherField_handle);
  foobar_ListOf_Date_releaseFfiHandle(_otherField_handle);
  return _result;
}
OuterStruct_InnerStruct smoke_OuterStruct_InnerStruct_fromFfi(Pointer<Void> handle) {
  final _otherField_handle = _smoke_OuterStruct_InnerStruct_get_field_otherField(handle);
  try {
    return OuterStruct_InnerStruct(
      foobar_ListOf_Date_fromFfi(_otherField_handle)
    );
  } finally {
    foobar_ListOf_Date_releaseFfiHandle(_otherField_handle);
  }
}
void smoke_OuterStruct_InnerStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_OuterStruct_InnerStruct_release_handle(handle);
// Nullable OuterStruct_InnerStruct
final _smoke_OuterStruct_InnerStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerStruct_create_handle_nullable'));
final _smoke_OuterStruct_InnerStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerStruct_release_handle_nullable'));
final _smoke_OuterStruct_InnerStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerStruct_get_value_nullable'));
Pointer<Void> smoke_OuterStruct_InnerStruct_toFfi_nullable(OuterStruct_InnerStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_OuterStruct_InnerStruct_toFfi(value);
  final result = _smoke_OuterStruct_InnerStruct_create_handle_nullable(_handle);
  smoke_OuterStruct_InnerStruct_releaseFfiHandle(_handle);
  return result;
}
OuterStruct_InnerStruct smoke_OuterStruct_InnerStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_OuterStruct_InnerStruct_get_value_nullable(handle);
  final result = smoke_OuterStruct_InnerStruct_fromFfi(_handle);
  smoke_OuterStruct_InnerStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_OuterStruct_InnerStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterStruct_InnerStruct_release_handle_nullable(handle);
// End of OuterStruct_InnerStruct "private" section.
abstract class OuterStruct_InnerClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  Set<Locale> fooBar();
}
// OuterStruct_InnerClass "private" section, not exported.
final _smoke_OuterStruct_InnerClass_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerClass_copy_handle'));
final _smoke_OuterStruct_InnerClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerClass_release_handle'));
class OuterStruct_InnerClass$Impl extends __lib.NativeBase implements OuterStruct_InnerClass {
  OuterStruct_InnerClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_OuterStruct_InnerClass_release_handle(handle);
    handle = null;
  }
  @override
  Set<Locale> fooBar() {
    final _fooBar_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_OuterStruct_InnerClass_fooBar'));
    final _handle = this.handle;
    final __result_handle = _fooBar_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_SetOf_Locale_fromFfi(__result_handle);
    } finally {
      foobar_SetOf_Locale_releaseFfiHandle(__result_handle);
    }
  }
}
Pointer<Void> smoke_OuterStruct_InnerClass_toFfi(OuterStruct_InnerClass value) =>
  _smoke_OuterStruct_InnerClass_copy_handle((value as __lib.NativeBase).handle);
OuterStruct_InnerClass smoke_OuterStruct_InnerClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterStruct_InnerClass;
  if (instance != null) return instance;
  final _copied_handle = _smoke_OuterStruct_InnerClass_copy_handle(handle);
  final result = OuterStruct_InnerClass$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterStruct_InnerClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterStruct_InnerClass_release_handle(handle);
Pointer<Void> smoke_OuterStruct_InnerClass_toFfi_nullable(OuterStruct_InnerClass value) =>
  value != null ? smoke_OuterStruct_InnerClass_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterStruct_InnerClass smoke_OuterStruct_InnerClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterStruct_InnerClass_fromFfi(handle) : null;
void smoke_OuterStruct_InnerClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterStruct_InnerClass_release_handle(handle);
// End of OuterStruct_InnerClass "private" section.
abstract class OuterStruct_InnerInterface {
  OuterStruct_InnerInterface() {}
  factory OuterStruct_InnerInterface.fromLambdas({
    @required Map<String, Uint8List> Function() lambda_barBaz,
  }) => OuterStruct_InnerInterface$Lambdas(
    lambda_barBaz,
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  Map<String, Uint8List> barBaz();
}
// OuterStruct_InnerInterface "private" section, not exported.
final _smoke_OuterStruct_InnerInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerInterface_copy_handle'));
final _smoke_OuterStruct_InnerInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerInterface_release_handle'));
final _smoke_OuterStruct_InnerInterface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_OuterStruct_InnerInterface_create_proxy'));
final _smoke_OuterStruct_InnerInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerInterface_get_type_id'));
class OuterStruct_InnerInterface$Lambdas implements OuterStruct_InnerInterface {
  Map<String, Uint8List> Function() lambda_barBaz;
  OuterStruct_InnerInterface$Lambdas(
    this.lambda_barBaz,
  );
  @override
  void release() {}
  @override
  Map<String, Uint8List> barBaz() =>
    lambda_barBaz();
}
class OuterStruct_InnerInterface$Impl extends __lib.NativeBase implements OuterStruct_InnerInterface {
  OuterStruct_InnerInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_OuterStruct_InnerInterface_release_handle(handle);
    handle = null;
  }
  @override
  Map<String, Uint8List> barBaz() {
    final _barBaz_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_OuterStruct_InnerInterface_barBaz'));
    final _handle = this.handle;
    final __result_handle = _barBaz_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_MapOf_String_to_Blob_fromFfi(__result_handle);
    } finally {
      foobar_MapOf_String_to_Blob_releaseFfiHandle(__result_handle);
    }
  }
}
int _OuterStruct_InnerInterface_barBaz_static(int _token, Pointer<Pointer<Void>> _result) {
  Map<String, Uint8List> _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as OuterStruct_InnerInterface).barBaz();
    _result.value = foobar_MapOf_String_to_Blob_toFfi(_result_object);
  } finally {
  }
  return 0;
}
Pointer<Void> smoke_OuterStruct_InnerInterface_toFfi(OuterStruct_InnerInterface value) {
  if (value is __lib.NativeBase) return _smoke_OuterStruct_InnerInterface_copy_handle((value as __lib.NativeBase).handle);
  final result = _smoke_OuterStruct_InnerInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_OuterStruct_InnerInterface_barBaz_static, __lib.unknownError)
  );
  return result;
}
OuterStruct_InnerInterface smoke_OuterStruct_InnerInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterStruct_InnerInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_OuterStruct_InnerInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_OuterStruct_InnerInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : OuterStruct_InnerInterface$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterStruct_InnerInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterStruct_InnerInterface_release_handle(handle);
Pointer<Void> smoke_OuterStruct_InnerInterface_toFfi_nullable(OuterStruct_InnerInterface value) =>
  value != null ? smoke_OuterStruct_InnerInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterStruct_InnerInterface smoke_OuterStruct_InnerInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterStruct_InnerInterface_fromFfi(handle) : null;
void smoke_OuterStruct_InnerInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterStruct_InnerInterface_release_handle(handle);
// End of OuterStruct_InnerInterface "private" section.
// OuterStruct "private" section, not exported.
final _smoke_OuterStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_create_handle'));
final _smoke_OuterStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_release_handle'));
final _smoke_OuterStruct_get_field_field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_get_field_field'));
Pointer<Void> smoke_OuterStruct_toFfi(OuterStruct value) {
  final _field_handle = String_toFfi(value.field);
  final _result = _smoke_OuterStruct_create_handle(_field_handle);
  String_releaseFfiHandle(_field_handle);
  return _result;
}
OuterStruct smoke_OuterStruct_fromFfi(Pointer<Void> handle) {
  final _field_handle = _smoke_OuterStruct_get_field_field(handle);
  try {
    return OuterStruct(
      String_fromFfi(_field_handle)
    );
  } finally {
    String_releaseFfiHandle(_field_handle);
  }
}
void smoke_OuterStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_OuterStruct_release_handle(handle);
// Nullable OuterStruct
final _smoke_OuterStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_create_handle_nullable'));
final _smoke_OuterStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_release_handle_nullable'));
final _smoke_OuterStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_get_value_nullable'));
Pointer<Void> smoke_OuterStruct_toFfi_nullable(OuterStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_OuterStruct_toFfi(value);
  final result = _smoke_OuterStruct_create_handle_nullable(_handle);
  smoke_OuterStruct_releaseFfiHandle(_handle);
  return result;
}
OuterStruct smoke_OuterStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_OuterStruct_get_value_nullable(handle);
  final result = smoke_OuterStruct_fromFfi(_handle);
  smoke_OuterStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_OuterStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterStruct_release_handle_nullable(handle);
// End of OuterStruct "private" section.

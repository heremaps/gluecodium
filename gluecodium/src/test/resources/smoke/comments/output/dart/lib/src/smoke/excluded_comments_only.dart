import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
abstract class ExcludedCommentsOnly {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// @nodoc
  static final bool veryUseful = true;
  /// @nodoc
  bool someMethodWithAllComments(String inputParameter);
  /// @nodoc
  someMethodWithoutReturnTypeOrInputParameters();
  /// @nodoc
  bool get isSomeProperty;
  /// @nodoc
  set isSomeProperty(bool value);
}
/// @nodoc
enum ExcludedCommentsOnly_SomeEnum {
    /// @nodoc
    useless
}
// ExcludedCommentsOnly_SomeEnum "private" section, not exported.
int smoke_ExcludedCommentsOnly_SomeEnum_toFfi(ExcludedCommentsOnly_SomeEnum value) {
  switch (value) {
  case ExcludedCommentsOnly_SomeEnum.useless:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for ExcludedCommentsOnly_SomeEnum enum.");
  }
}
ExcludedCommentsOnly_SomeEnum smoke_ExcludedCommentsOnly_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return ExcludedCommentsOnly_SomeEnum.useless;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ExcludedCommentsOnly_SomeEnum enum.");
  }
}
void smoke_ExcludedCommentsOnly_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_ExcludedCommentsOnly_SomeEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ExcludedCommentsOnly_SomeEnum_create_handle_nullable'));
final _smoke_ExcludedCommentsOnly_SomeEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeEnum_release_handle_nullable'));
final _smoke_ExcludedCommentsOnly_SomeEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_ExcludedCommentsOnly_SomeEnum_toFfi_nullable(ExcludedCommentsOnly_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExcludedCommentsOnly_SomeEnum_toFfi(value);
  final result = _smoke_ExcludedCommentsOnly_SomeEnum_create_handle_nullable(_handle);
  smoke_ExcludedCommentsOnly_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
ExcludedCommentsOnly_SomeEnum smoke_ExcludedCommentsOnly_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExcludedCommentsOnly_SomeEnum_get_value_nullable(handle);
  final result = smoke_ExcludedCommentsOnly_SomeEnum_fromFfi(_handle);
  smoke_ExcludedCommentsOnly_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExcludedCommentsOnly_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedCommentsOnly_SomeEnum_release_handle_nullable(handle);
// End of ExcludedCommentsOnly_SomeEnum "private" section.
/// @nodoc
class ExcludedCommentsOnly_SomethingWrongException implements Exception {
  final ExcludedCommentsOnly_SomeEnum error;
  ExcludedCommentsOnly_SomethingWrongException(this.error);
}
/// @nodoc
class ExcludedCommentsOnly_SomeStruct {
  /// @nodoc
  bool someField;
  ExcludedCommentsOnly_SomeStruct(this.someField);
}
// ExcludedCommentsOnly_SomeStruct "private" section, not exported.
final _smoke_ExcludedCommentsOnly_SomeStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_create_handle'));
final _smoke_ExcludedCommentsOnly_SomeStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_release_handle'));
final _smoke_ExcludedCommentsOnly_SomeStruct_get_field_someField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_get_field_someField'));
Pointer<Void> smoke_ExcludedCommentsOnly_SomeStruct_toFfi(ExcludedCommentsOnly_SomeStruct value) {
  final _someField_handle = Boolean_toFfi(value.someField);
  final _result = _smoke_ExcludedCommentsOnly_SomeStruct_create_handle(_someField_handle);
  Boolean_releaseFfiHandle(_someField_handle);
  return _result;
}
ExcludedCommentsOnly_SomeStruct smoke_ExcludedCommentsOnly_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_ExcludedCommentsOnly_SomeStruct_get_field_someField(handle);
  try {
    return ExcludedCommentsOnly_SomeStruct(
      Boolean_fromFfi(_someField_handle)
    );
  } finally {
    Boolean_releaseFfiHandle(_someField_handle);
  }
}
void smoke_ExcludedCommentsOnly_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_ExcludedCommentsOnly_SomeStruct_release_handle(handle);
// Nullable ExcludedCommentsOnly_SomeStruct
final _smoke_ExcludedCommentsOnly_SomeStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_create_handle_nullable'));
final _smoke_ExcludedCommentsOnly_SomeStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_release_handle_nullable'));
final _smoke_ExcludedCommentsOnly_SomeStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_ExcludedCommentsOnly_SomeStruct_toFfi_nullable(ExcludedCommentsOnly_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExcludedCommentsOnly_SomeStruct_toFfi(value);
  final result = _smoke_ExcludedCommentsOnly_SomeStruct_create_handle_nullable(_handle);
  smoke_ExcludedCommentsOnly_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
ExcludedCommentsOnly_SomeStruct smoke_ExcludedCommentsOnly_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExcludedCommentsOnly_SomeStruct_get_value_nullable(handle);
  final result = smoke_ExcludedCommentsOnly_SomeStruct_fromFfi(_handle);
  smoke_ExcludedCommentsOnly_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExcludedCommentsOnly_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedCommentsOnly_SomeStruct_release_handle_nullable(handle);
// End of ExcludedCommentsOnly_SomeStruct "private" section.
/// @nodoc
typedef ExcludedCommentsOnly_SomeLambda = double Function(String, int);
// ExcludedCommentsOnly_SomeLambda "private" section, not exported.
final _smoke_ExcludedCommentsOnly_SomeLambda_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_copy_handle'));
final _smoke_ExcludedCommentsOnly_SomeLambda_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_release_handle'));
final _smoke_ExcludedCommentsOnly_SomeLambda_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_create_proxy'));
final _smoke_ExcludedCommentsOnly_SomeLambda_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_ExcludedCommentsOnly_SomeLambda_get_raw_pointer'));
class ExcludedCommentsOnly_SomeLambda$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  ExcludedCommentsOnly_SomeLambda$Impl(this.handle);
  void release() => _smoke_ExcludedCommentsOnly_SomeLambda_release_handle(handle);
  double call(String p0, int p1) {
    final _call_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>, Int32), double Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_ExcludedCommentsOnly_SomeLambda_call__String_Int'));
    final _p0_handle = String_toFfi(p0);
    final _p1_handle = (p1);
    final _handle = this.handle;
    final __result_handle = _call_ffi(_handle, __lib.LibraryContext.isolateId, _p0_handle, _p1_handle);
    String_releaseFfiHandle(_p0_handle);
    (_p1_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
int _ExcludedCommentsOnly_SomeLambda_call_static(int _token, Pointer<Void> p0, int p1, Pointer<Double> _result) {
  double _result_object;
  try {
    _result_object = (__lib.instanceCache[_token] as ExcludedCommentsOnly_SomeLambda)(String_fromFfi(p0), (p1));
    _result.value = (_result_object);
  } finally {
    String_releaseFfiHandle(p0);
    (p1);
  }
  return 0;
}
Pointer<Void> smoke_ExcludedCommentsOnly_SomeLambda_toFfi(ExcludedCommentsOnly_SomeLambda value) {
  final result = _smoke_ExcludedCommentsOnly_SomeLambda_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Int32, Pointer<Double>)>(_ExcludedCommentsOnly_SomeLambda_call_static, __lib.unknownError)
  );
  return result;
}
ExcludedCommentsOnly_SomeLambda smoke_ExcludedCommentsOnly_SomeLambda_fromFfi(Pointer<Void> handle) {
  final _impl = ExcludedCommentsOnly_SomeLambda$Impl(_smoke_ExcludedCommentsOnly_SomeLambda_copy_handle(handle));
  return (String p0, int p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}
void smoke_ExcludedCommentsOnly_SomeLambda_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ExcludedCommentsOnly_SomeLambda_release_handle(handle);
// Nullable ExcludedCommentsOnly_SomeLambda
final _smoke_ExcludedCommentsOnly_SomeLambda_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_create_handle_nullable'));
final _smoke_ExcludedCommentsOnly_SomeLambda_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_release_handle_nullable'));
final _smoke_ExcludedCommentsOnly_SomeLambda_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_get_value_nullable'));
Pointer<Void> smoke_ExcludedCommentsOnly_SomeLambda_toFfi_nullable(ExcludedCommentsOnly_SomeLambda value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExcludedCommentsOnly_SomeLambda_toFfi(value);
  final result = _smoke_ExcludedCommentsOnly_SomeLambda_create_handle_nullable(_handle);
  smoke_ExcludedCommentsOnly_SomeLambda_releaseFfiHandle(_handle);
  return result;
}
ExcludedCommentsOnly_SomeLambda smoke_ExcludedCommentsOnly_SomeLambda_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExcludedCommentsOnly_SomeLambda_get_value_nullable(handle);
  final result = smoke_ExcludedCommentsOnly_SomeLambda_fromFfi(_handle);
  smoke_ExcludedCommentsOnly_SomeLambda_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExcludedCommentsOnly_SomeLambda_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedCommentsOnly_SomeLambda_release_handle_nullable(handle);
// End of ExcludedCommentsOnly_SomeLambda "private" section.
// ExcludedCommentsOnly "private" section, not exported.
final _smoke_ExcludedCommentsOnly_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_copy_handle'));
final _smoke_ExcludedCommentsOnly_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_release_handle'));
final _smoke_ExcludedCommentsOnly_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_ExcludedCommentsOnly_get_raw_pointer'));
final _someMethodWithAllComments_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_someMethodWithAllComments__String_return_release_handle'));
final _someMethodWithAllComments_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_someMethodWithAllComments__String_return_get_result'));
final _someMethodWithAllComments_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_someMethodWithAllComments__String_return_get_error'));
final _someMethodWithAllComments_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_someMethodWithAllComments__String_return_has_error'));
class ExcludedCommentsOnly$Impl implements ExcludedCommentsOnly {
  @protected
  Pointer<Void> handle;
  ExcludedCommentsOnly$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_ExcludedCommentsOnly_get_raw_pointer(handle));
    _smoke_ExcludedCommentsOnly_release_handle(handle);
    handle = null;
  }
  @override
  bool someMethodWithAllComments(String inputParameter) {
    final _someMethodWithAllComments_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ExcludedCommentsOnly_someMethodWithAllComments__String'));
    final _inputParameter_handle = String_toFfi(inputParameter);
    final _handle = this.handle;
    final __call_result_handle = _someMethodWithAllComments_ffi(_handle, __lib.LibraryContext.isolateId, _inputParameter_handle);
    String_releaseFfiHandle(_inputParameter_handle);
    if (_someMethodWithAllComments_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _someMethodWithAllComments_return_get_error(__call_result_handle);
        _someMethodWithAllComments_return_release_handle(__call_result_handle);
        try {
          throw ExcludedCommentsOnly_SomethingWrongException(smoke_ExcludedCommentsOnly_SomeEnum_fromFfi(__error_handle));
        } finally {
          smoke_ExcludedCommentsOnly_SomeEnum_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _someMethodWithAllComments_return_get_result(__call_result_handle);
    _someMethodWithAllComments_return_release_handle(__call_result_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  @override
  someMethodWithoutReturnTypeOrInputParameters() {
    final _someMethodWithoutReturnTypeOrInputParameters_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ExcludedCommentsOnly_someMethodWithoutReturnTypeOrInputParameters'));
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutReturnTypeOrInputParameters_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  bool get isSomeProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_ExcludedCommentsOnly_isSomeProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  @override
  set isSomeProperty(bool value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_ExcludedCommentsOnly_isSomeProperty_set__Boolean'));
    final _value_handle = Boolean_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    Boolean_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_ExcludedCommentsOnly_toFfi(ExcludedCommentsOnly value) =>
  _smoke_ExcludedCommentsOnly_copy_handle((value as ExcludedCommentsOnly$Impl).handle);
ExcludedCommentsOnly smoke_ExcludedCommentsOnly_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_ExcludedCommentsOnly_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle];
  if (instance is ExcludedCommentsOnly) return instance as ExcludedCommentsOnly;
  final _copied_handle = _smoke_ExcludedCommentsOnly_copy_handle(handle);
  final result = ExcludedCommentsOnly$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_ExcludedCommentsOnly_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ExcludedCommentsOnly_release_handle(handle);
Pointer<Void> smoke_ExcludedCommentsOnly_toFfi_nullable(ExcludedCommentsOnly value) =>
  value != null ? smoke_ExcludedCommentsOnly_toFfi(value) : Pointer<Void>.fromAddress(0);
ExcludedCommentsOnly smoke_ExcludedCommentsOnly_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ExcludedCommentsOnly_fromFfi(handle) : null;
void smoke_ExcludedCommentsOnly_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedCommentsOnly_release_handle(handle);
// End of ExcludedCommentsOnly "private" section.

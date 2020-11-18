import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// This is some very useful class.
/// @nodoc
abstract class ExcludedComments {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// This is some very useful constant.
  /// @nodoc
  static final bool veryUseful = true;
  /// This is some very useful method that measures the usefulness of its input.
  /// [inputParameter] Very useful input parameter
  /// Returns [bool]. Usefulness of the input
  /// Throws [ExcludedComments_SomethingWrongException]. Sometimes it happens.
  /// @nodoc
  bool someMethodWithAllComments(String inputParameter);
  /// This is some very useful method that does nothing.
  /// @nodoc
  someMethodWithoutReturnTypeOrInputParameters();
  /// Gets some very useful property.
  /// @nodoc
  bool get isSomeProperty;
  /// Sets some very useful property.
  /// @nodoc
  set isSomeProperty(bool value);
}
/// This is some very useful enum.
/// @nodoc
enum ExcludedComments_SomeEnum {
    /// Not quite useful
    /// @nodoc
    useless
}
// ExcludedComments_SomeEnum "private" section, not exported.
int smoke_ExcludedComments_SomeEnum_toFfi(ExcludedComments_SomeEnum value) {
  switch (value) {
  case ExcludedComments_SomeEnum.useless:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for ExcludedComments_SomeEnum enum.");
  }
}
ExcludedComments_SomeEnum smoke_ExcludedComments_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return ExcludedComments_SomeEnum.useless;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ExcludedComments_SomeEnum enum.");
  }
}
void smoke_ExcludedComments_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_ExcludedComments_SomeEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ExcludedComments_SomeEnum_create_handle_nullable'));
final _smoke_ExcludedComments_SomeEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeEnum_release_handle_nullable'));
final _smoke_ExcludedComments_SomeEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_ExcludedComments_SomeEnum_toFfi_nullable(ExcludedComments_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExcludedComments_SomeEnum_toFfi(value);
  final result = _smoke_ExcludedComments_SomeEnum_create_handle_nullable(_handle);
  smoke_ExcludedComments_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
ExcludedComments_SomeEnum smoke_ExcludedComments_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExcludedComments_SomeEnum_get_value_nullable(handle);
  final result = smoke_ExcludedComments_SomeEnum_fromFfi(_handle);
  smoke_ExcludedComments_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExcludedComments_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedComments_SomeEnum_release_handle_nullable(handle);
// End of ExcludedComments_SomeEnum "private" section.
/// This is some very useful exception.
/// @nodoc
class ExcludedComments_SomethingWrongException implements Exception {
  final ExcludedComments_SomeEnum error;
  ExcludedComments_SomethingWrongException(this.error);
}
/// This is some very useful struct.
/// @nodoc
class ExcludedComments_SomeStruct {
  /// How useful this struct is
  /// remains to be seen
  /// @nodoc
  bool someField;
  /// This is how easy it is to construct.
  /// [someField] How useful this struct is
  /// remains to be seen
  ExcludedComments_SomeStruct(this.someField);
}
// ExcludedComments_SomeStruct "private" section, not exported.
final _smoke_ExcludedComments_SomeStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_ExcludedComments_SomeStruct_create_handle'));
final _smoke_ExcludedComments_SomeStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_release_handle'));
final _smoke_ExcludedComments_SomeStruct_get_field_someField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_get_field_someField'));
Pointer<Void> smoke_ExcludedComments_SomeStruct_toFfi(ExcludedComments_SomeStruct value) {
  final _someField_handle = Boolean_toFfi(value.someField);
  final _result = _smoke_ExcludedComments_SomeStruct_create_handle(_someField_handle);
  Boolean_releaseFfiHandle(_someField_handle);
  return _result;
}
ExcludedComments_SomeStruct smoke_ExcludedComments_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_ExcludedComments_SomeStruct_get_field_someField(handle);
  try {
    return ExcludedComments_SomeStruct(
      Boolean_fromFfi(_someField_handle)
    );
  } finally {
    Boolean_releaseFfiHandle(_someField_handle);
  }
}
void smoke_ExcludedComments_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_ExcludedComments_SomeStruct_release_handle(handle);
// Nullable ExcludedComments_SomeStruct
final _smoke_ExcludedComments_SomeStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_create_handle_nullable'));
final _smoke_ExcludedComments_SomeStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_release_handle_nullable'));
final _smoke_ExcludedComments_SomeStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_ExcludedComments_SomeStruct_toFfi_nullable(ExcludedComments_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExcludedComments_SomeStruct_toFfi(value);
  final result = _smoke_ExcludedComments_SomeStruct_create_handle_nullable(_handle);
  smoke_ExcludedComments_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
ExcludedComments_SomeStruct smoke_ExcludedComments_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExcludedComments_SomeStruct_get_value_nullable(handle);
  final result = smoke_ExcludedComments_SomeStruct_fromFfi(_handle);
  smoke_ExcludedComments_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExcludedComments_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedComments_SomeStruct_release_handle_nullable(handle);
// End of ExcludedComments_SomeStruct "private" section.
/// This is some very useful lambda that does it.
/// @nodoc
typedef ExcludedComments_SomeLambda = double Function(String, int);
// ExcludedComments_SomeLambda "private" section, not exported.
final _smoke_ExcludedComments_SomeLambda_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_copy_handle'));
final _smoke_ExcludedComments_SomeLambda_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_release_handle'));
final _smoke_ExcludedComments_SomeLambda_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_ExcludedComments_SomeLambda_create_proxy'));
final _smoke_ExcludedComments_SomeLambda_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_ExcludedComments_SomeLambda_get_raw_pointer'));
class ExcludedComments_SomeLambda$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  ExcludedComments_SomeLambda$Impl(this.handle);
  void release() => _smoke_ExcludedComments_SomeLambda_release_handle(handle);
  double call(String p0, int p1) {
    final _call_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>, Int32), double Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_ExcludedComments_SomeLambda_call__String_Int'));
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
int _ExcludedComments_SomeLambda_call_static(int _token, Pointer<Void> p0, int p1, Pointer<Double> _result) {
  double _result_object;
  try {
    _result_object = (__lib.instanceCache[_token] as ExcludedComments_SomeLambda)(String_fromFfi(p0), (p1));
    _result.value = (_result_object);
  } finally {
    String_releaseFfiHandle(p0);
    (p1);
  }
  return 0;
}
Pointer<Void> smoke_ExcludedComments_SomeLambda_toFfi(ExcludedComments_SomeLambda value) {
  final result = _smoke_ExcludedComments_SomeLambda_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Int32, Pointer<Double>)>(_ExcludedComments_SomeLambda_call_static, __lib.unknownError)
  );
  return result;
}
ExcludedComments_SomeLambda smoke_ExcludedComments_SomeLambda_fromFfi(Pointer<Void> handle) {
  final _impl = ExcludedComments_SomeLambda$Impl(_smoke_ExcludedComments_SomeLambda_copy_handle(handle));
  return (String p0, int p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}
void smoke_ExcludedComments_SomeLambda_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ExcludedComments_SomeLambda_release_handle(handle);
// Nullable ExcludedComments_SomeLambda
final _smoke_ExcludedComments_SomeLambda_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_create_handle_nullable'));
final _smoke_ExcludedComments_SomeLambda_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_release_handle_nullable'));
final _smoke_ExcludedComments_SomeLambda_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_get_value_nullable'));
Pointer<Void> smoke_ExcludedComments_SomeLambda_toFfi_nullable(ExcludedComments_SomeLambda value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExcludedComments_SomeLambda_toFfi(value);
  final result = _smoke_ExcludedComments_SomeLambda_create_handle_nullable(_handle);
  smoke_ExcludedComments_SomeLambda_releaseFfiHandle(_handle);
  return result;
}
ExcludedComments_SomeLambda smoke_ExcludedComments_SomeLambda_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExcludedComments_SomeLambda_get_value_nullable(handle);
  final result = smoke_ExcludedComments_SomeLambda_fromFfi(_handle);
  smoke_ExcludedComments_SomeLambda_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExcludedComments_SomeLambda_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedComments_SomeLambda_release_handle_nullable(handle);
// End of ExcludedComments_SomeLambda "private" section.
// ExcludedComments "private" section, not exported.
final _smoke_ExcludedComments_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_copy_handle'));
final _smoke_ExcludedComments_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_release_handle'));
final _smoke_ExcludedComments_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_ExcludedComments_get_raw_pointer'));
final _someMethodWithAllComments_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_someMethodWithAllComments__String_return_release_handle'));
final _someMethodWithAllComments_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_someMethodWithAllComments__String_return_get_result'));
final _someMethodWithAllComments_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_someMethodWithAllComments__String_return_get_error'));
final _someMethodWithAllComments_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_someMethodWithAllComments__String_return_has_error'));
class ExcludedComments$Impl implements ExcludedComments {
  @protected
  Pointer<Void> handle;
  ExcludedComments$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_ExcludedComments_get_raw_pointer(handle));
    _smoke_ExcludedComments_release_handle(handle);
    handle = null;
  }
  @override
  bool someMethodWithAllComments(String inputParameter) {
    final _someMethodWithAllComments_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ExcludedComments_someMethodWithAllComments__String'));
    final _inputParameter_handle = String_toFfi(inputParameter);
    final _handle = this.handle;
    final __call_result_handle = _someMethodWithAllComments_ffi(_handle, __lib.LibraryContext.isolateId, _inputParameter_handle);
    String_releaseFfiHandle(_inputParameter_handle);
    if (_someMethodWithAllComments_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _someMethodWithAllComments_return_get_error(__call_result_handle);
        _someMethodWithAllComments_return_release_handle(__call_result_handle);
        try {
          throw ExcludedComments_SomethingWrongException(smoke_ExcludedComments_SomeEnum_fromFfi(__error_handle));
        } finally {
          smoke_ExcludedComments_SomeEnum_releaseFfiHandle(__error_handle);
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
    final _someMethodWithoutReturnTypeOrInputParameters_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ExcludedComments_someMethodWithoutReturnTypeOrInputParameters'));
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
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_ExcludedComments_isSomeProperty_get'));
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
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_ExcludedComments_isSomeProperty_set__Boolean'));
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
Pointer<Void> smoke_ExcludedComments_toFfi(ExcludedComments value) =>
  _smoke_ExcludedComments_copy_handle((value as ExcludedComments$Impl).handle);
ExcludedComments smoke_ExcludedComments_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_ExcludedComments_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle];
  if (instance is ExcludedComments) return instance as ExcludedComments;
  final _copied_handle = _smoke_ExcludedComments_copy_handle(handle);
  final result = ExcludedComments$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_ExcludedComments_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ExcludedComments_release_handle(handle);
Pointer<Void> smoke_ExcludedComments_toFfi_nullable(ExcludedComments value) =>
  value != null ? smoke_ExcludedComments_toFfi(value) : Pointer<Void>.fromAddress(0);
ExcludedComments smoke_ExcludedComments_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ExcludedComments_fromFfi(handle) : null;
void smoke_ExcludedComments_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedComments_release_handle(handle);
// End of ExcludedComments "private" section.

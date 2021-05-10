import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
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
final _smoke_ExcludedCommentsOnly_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ExcludedCommentsOnly_SomeEnum_create_handle_nullable'));
final _smoke_ExcludedCommentsOnly_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeEnum_release_handle_nullable'));
final _smoke_ExcludedCommentsOnly_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_ExcludedCommentsOnly_SomeEnum_toFfi_nullable(ExcludedCommentsOnly_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExcludedCommentsOnly_SomeEnum_toFfi(value);
  final result = _smoke_ExcludedCommentsOnly_SomeEnumCreateHandleNullable(_handle);
  smoke_ExcludedCommentsOnly_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
ExcludedCommentsOnly_SomeEnum smoke_ExcludedCommentsOnly_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExcludedCommentsOnly_SomeEnumGetValueNullable(handle);
  final result = smoke_ExcludedCommentsOnly_SomeEnum_fromFfi(_handle);
  smoke_ExcludedCommentsOnly_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExcludedCommentsOnly_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedCommentsOnly_SomeEnumReleaseHandleNullable(handle);
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
final _smokeExcludedcommentsonlySomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_create_handle'));
final _smokeExcludedcommentsonlySomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_release_handle'));
final _smokeExcludedcommentsonlySomestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_get_field_someField'));
Pointer<Void> smoke_ExcludedCommentsOnly_SomeStruct_toFfi(ExcludedCommentsOnly_SomeStruct value) {
  final _someFieldHandle = Boolean_toFfi(value.someField);
  final _result = _smokeExcludedcommentsonlySomestructCreateHandle(_someFieldHandle);
  Boolean_releaseFfiHandle(_someFieldHandle);
  return _result;
}
ExcludedCommentsOnly_SomeStruct smoke_ExcludedCommentsOnly_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeExcludedcommentsonlySomestructGetFieldsomeField(handle);
  try {
    return ExcludedCommentsOnly_SomeStruct(
      Boolean_fromFfi(_someFieldHandle)
    );
  } finally {
    Boolean_releaseFfiHandle(_someFieldHandle);
  }
}
void smoke_ExcludedCommentsOnly_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeExcludedcommentsonlySomestructReleaseHandle(handle);
// Nullable ExcludedCommentsOnly_SomeStruct
final _smoke_ExcludedCommentsOnly_SomeStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_create_handle_nullable'));
final _smoke_ExcludedCommentsOnly_SomeStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_release_handle_nullable'));
final _smoke_ExcludedCommentsOnly_SomeStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_ExcludedCommentsOnly_SomeStruct_toFfi_nullable(ExcludedCommentsOnly_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExcludedCommentsOnly_SomeStruct_toFfi(value);
  final result = _smoke_ExcludedCommentsOnly_SomeStructCreateHandleNullable(_handle);
  smoke_ExcludedCommentsOnly_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
ExcludedCommentsOnly_SomeStruct smoke_ExcludedCommentsOnly_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExcludedCommentsOnly_SomeStructGetValueNullable(handle);
  final result = smoke_ExcludedCommentsOnly_SomeStruct_fromFfi(_handle);
  smoke_ExcludedCommentsOnly_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExcludedCommentsOnly_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedCommentsOnly_SomeStructReleaseHandleNullable(handle);
// End of ExcludedCommentsOnly_SomeStruct "private" section.
/// @nodoc
typedef ExcludedCommentsOnly_SomeLambda = double Function(String, int);
// ExcludedCommentsOnly_SomeLambda "private" section, not exported.
final _smokeExcludedcommentsonlySomelambdaCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_copy_handle'));
final _smokeExcludedcommentsonlySomelambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_release_handle'));
final _smokeExcludedcommentsonlySomelambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_create_proxy'));
class ExcludedCommentsOnly_SomeLambda$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  ExcludedCommentsOnly_SomeLambda$Impl(this.handle);
  void release() => _smokeExcludedcommentsonlySomelambdaReleaseHandle(handle);
  double call(String p0, int p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>, Int32), double Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_ExcludedCommentsOnly_SomeLambda_call__String_Int'));
    final _p0Handle = String_toFfi(p0);
    final _p1Handle = (p1);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    String_releaseFfiHandle(_p0Handle);
    (_p1Handle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _ExcludedCommentsOnly_SomeLambda_call_static(int _token, Pointer<Void> p0, int p1, Pointer<Double> _result) {
  double _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as ExcludedCommentsOnly_SomeLambda)(String_fromFfi(p0), (p1));
    _result.value = (_resultObject);
  } finally {
    String_releaseFfiHandle(p0);
    (p1);
  }
  return 0;
}
Pointer<Void> smoke_ExcludedCommentsOnly_SomeLambda_toFfi(ExcludedCommentsOnly_SomeLambda value) {
  final result = _smokeExcludedcommentsonlySomelambdaCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Int32, Pointer<Double>)>(_ExcludedCommentsOnly_SomeLambda_call_static, __lib.unknownError)
  );
  return result;
}
ExcludedCommentsOnly_SomeLambda smoke_ExcludedCommentsOnly_SomeLambda_fromFfi(Pointer<Void> handle) {
  final _impl = ExcludedCommentsOnly_SomeLambda$Impl(_smokeExcludedcommentsonlySomelambdaCopyHandle(handle));
  return (String p0, int p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}
void smoke_ExcludedCommentsOnly_SomeLambda_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeExcludedcommentsonlySomelambdaReleaseHandle(handle);
// Nullable ExcludedCommentsOnly_SomeLambda
final _smoke_ExcludedCommentsOnly_SomeLambdaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_create_handle_nullable'));
final _smoke_ExcludedCommentsOnly_SomeLambdaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_release_handle_nullable'));
final _smoke_ExcludedCommentsOnly_SomeLambdaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_get_value_nullable'));
Pointer<Void> smoke_ExcludedCommentsOnly_SomeLambda_toFfi_nullable(ExcludedCommentsOnly_SomeLambda value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExcludedCommentsOnly_SomeLambda_toFfi(value);
  final result = _smoke_ExcludedCommentsOnly_SomeLambdaCreateHandleNullable(_handle);
  smoke_ExcludedCommentsOnly_SomeLambda_releaseFfiHandle(_handle);
  return result;
}
ExcludedCommentsOnly_SomeLambda smoke_ExcludedCommentsOnly_SomeLambda_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExcludedCommentsOnly_SomeLambdaGetValueNullable(handle);
  final result = smoke_ExcludedCommentsOnly_SomeLambda_fromFfi(_handle);
  smoke_ExcludedCommentsOnly_SomeLambda_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExcludedCommentsOnly_SomeLambda_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedCommentsOnly_SomeLambdaReleaseHandleNullable(handle);
// End of ExcludedCommentsOnly_SomeLambda "private" section.
// ExcludedCommentsOnly "private" section, not exported.
final _smokeExcludedcommentsonlyCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_copy_handle'));
final _smokeExcludedcommentsonlyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_release_handle'));
final _someMethodWithAllCommentsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_someMethodWithAllComments__String_return_release_handle'));
final _someMethodWithAllCommentsReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_someMethodWithAllComments__String_return_get_result'));
final _someMethodWithAllCommentsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_someMethodWithAllComments__String_return_get_error'));
final _someMethodWithAllCommentsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_someMethodWithAllComments__String_return_has_error'));
class ExcludedCommentsOnly$Impl extends __lib.NativeBase implements ExcludedCommentsOnly {
  ExcludedCommentsOnly$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeExcludedcommentsonlyReleaseHandle(handle);
    handle = null;
  }
  @override
  bool someMethodWithAllComments(String inputParameter) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ExcludedCommentsOnly_someMethodWithAllComments__String'));
    final _inputParameterHandle = String_toFfi(inputParameter);
    final _handle = this.handle;
    final __callResultHandle = _someMethodWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputParameterHandle);
    String_releaseFfiHandle(_inputParameterHandle);
    if (_someMethodWithAllCommentsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _someMethodWithAllCommentsReturnGetError(__callResultHandle);
        _someMethodWithAllCommentsReturnReleaseHandle(__callResultHandle);
        try {
          throw ExcludedCommentsOnly_SomethingWrongException(smoke_ExcludedCommentsOnly_SomeEnum_fromFfi(__errorHandle));
        } finally {
          smoke_ExcludedCommentsOnly_SomeEnum_releaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _someMethodWithAllCommentsReturnGetResult(__callResultHandle);
    _someMethodWithAllCommentsReturnReleaseHandle(__callResultHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  someMethodWithoutReturnTypeOrInputParameters() {
    final _someMethodWithoutReturnTypeOrInputParametersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ExcludedCommentsOnly_someMethodWithoutReturnTypeOrInputParameters'));
    final _handle = this.handle;
    final __resultHandle = _someMethodWithoutReturnTypeOrInputParametersFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  bool get isSomeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_ExcludedCommentsOnly_isSomeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set isSomeProperty(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_ExcludedCommentsOnly_isSomeProperty_set__Boolean'));
    final _valueHandle = Boolean_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    Boolean_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_ExcludedCommentsOnly_toFfi(ExcludedCommentsOnly value) =>
  _smokeExcludedcommentsonlyCopyHandle((value as __lib.NativeBase).handle);
ExcludedCommentsOnly smoke_ExcludedCommentsOnly_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ExcludedCommentsOnly;
  if (instance != null) return instance;
  final _copiedHandle = _smokeExcludedcommentsonlyCopyHandle(handle);
  final result = ExcludedCommentsOnly$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ExcludedCommentsOnly_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeExcludedcommentsonlyReleaseHandle(handle);
Pointer<Void> smoke_ExcludedCommentsOnly_toFfi_nullable(ExcludedCommentsOnly value) =>
  value != null ? smoke_ExcludedCommentsOnly_toFfi(value) : Pointer<Void>.fromAddress(0);
ExcludedCommentsOnly smoke_ExcludedCommentsOnly_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ExcludedCommentsOnly_fromFfi(handle) : null;
void smoke_ExcludedCommentsOnly_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsonlyReleaseHandle(handle);
// End of ExcludedCommentsOnly "private" section.

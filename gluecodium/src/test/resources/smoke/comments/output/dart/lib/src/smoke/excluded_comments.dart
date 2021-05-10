import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
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
  ///
  /// [inputParameter] Very useful input parameter
  ///
  /// Returns [bool]. Usefulness of the input
  ///
  /// Throws [ExcludedComments_SomethingWrongException]. Sometimes it happens.
  ///
  /// @nodoc
  bool someMethodWithAllComments(String inputParameter);
  /// This is some very useful method that does nothing.
  ///
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
final _smoke_ExcludedComments_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ExcludedComments_SomeEnum_create_handle_nullable'));
final _smoke_ExcludedComments_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeEnum_release_handle_nullable'));
final _smoke_ExcludedComments_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_ExcludedComments_SomeEnum_toFfi_nullable(ExcludedComments_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExcludedComments_SomeEnum_toFfi(value);
  final result = _smoke_ExcludedComments_SomeEnumCreateHandleNullable(_handle);
  smoke_ExcludedComments_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
ExcludedComments_SomeEnum smoke_ExcludedComments_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExcludedComments_SomeEnumGetValueNullable(handle);
  final result = smoke_ExcludedComments_SomeEnum_fromFfi(_handle);
  smoke_ExcludedComments_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExcludedComments_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedComments_SomeEnumReleaseHandleNullable(handle);
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
final _smokeExcludedcommentsSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_ExcludedComments_SomeStruct_create_handle'));
final _smokeExcludedcommentsSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_release_handle'));
final _smokeExcludedcommentsSomestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_get_field_someField'));
Pointer<Void> smoke_ExcludedComments_SomeStruct_toFfi(ExcludedComments_SomeStruct value) {
  final _someFieldHandle = Boolean_toFfi(value.someField);
  final _result = _smokeExcludedcommentsSomestructCreateHandle(_someFieldHandle);
  Boolean_releaseFfiHandle(_someFieldHandle);
  return _result;
}
ExcludedComments_SomeStruct smoke_ExcludedComments_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeExcludedcommentsSomestructGetFieldsomeField(handle);
  try {
    return ExcludedComments_SomeStruct(
      Boolean_fromFfi(_someFieldHandle)
    );
  } finally {
    Boolean_releaseFfiHandle(_someFieldHandle);
  }
}
void smoke_ExcludedComments_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeExcludedcommentsSomestructReleaseHandle(handle);
// Nullable ExcludedComments_SomeStruct
final _smoke_ExcludedComments_SomeStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_create_handle_nullable'));
final _smoke_ExcludedComments_SomeStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_release_handle_nullable'));
final _smoke_ExcludedComments_SomeStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_ExcludedComments_SomeStruct_toFfi_nullable(ExcludedComments_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExcludedComments_SomeStruct_toFfi(value);
  final result = _smoke_ExcludedComments_SomeStructCreateHandleNullable(_handle);
  smoke_ExcludedComments_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
ExcludedComments_SomeStruct smoke_ExcludedComments_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExcludedComments_SomeStructGetValueNullable(handle);
  final result = smoke_ExcludedComments_SomeStruct_fromFfi(_handle);
  smoke_ExcludedComments_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExcludedComments_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedComments_SomeStructReleaseHandleNullable(handle);
// End of ExcludedComments_SomeStruct "private" section.
/// This is some very useful lambda that does it.
/// @nodoc
typedef ExcludedComments_SomeLambda = double Function(String, int);
// ExcludedComments_SomeLambda "private" section, not exported.
final _smokeExcludedcommentsSomelambdaCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_copy_handle'));
final _smokeExcludedcommentsSomelambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_release_handle'));
final _smokeExcludedcommentsSomelambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_ExcludedComments_SomeLambda_create_proxy'));
class ExcludedComments_SomeLambda$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  ExcludedComments_SomeLambda$Impl(this.handle);
  void release() => _smokeExcludedcommentsSomelambdaReleaseHandle(handle);
  double call(String p0, int p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>, Int32), double Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_ExcludedComments_SomeLambda_call__String_Int'));
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
int _ExcludedComments_SomeLambda_call_static(int _token, Pointer<Void> p0, int p1, Pointer<Double> _result) {
  double _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as ExcludedComments_SomeLambda)(String_fromFfi(p0), (p1));
    _result.value = (_resultObject);
  } finally {
    String_releaseFfiHandle(p0);
    (p1);
  }
  return 0;
}
Pointer<Void> smoke_ExcludedComments_SomeLambda_toFfi(ExcludedComments_SomeLambda value) {
  final result = _smokeExcludedcommentsSomelambdaCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Int32, Pointer<Double>)>(_ExcludedComments_SomeLambda_call_static, __lib.unknownError)
  );
  return result;
}
ExcludedComments_SomeLambda smoke_ExcludedComments_SomeLambda_fromFfi(Pointer<Void> handle) {
  final _impl = ExcludedComments_SomeLambda$Impl(_smokeExcludedcommentsSomelambdaCopyHandle(handle));
  return (String p0, int p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}
void smoke_ExcludedComments_SomeLambda_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeExcludedcommentsSomelambdaReleaseHandle(handle);
// Nullable ExcludedComments_SomeLambda
final _smoke_ExcludedComments_SomeLambdaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_create_handle_nullable'));
final _smoke_ExcludedComments_SomeLambdaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_release_handle_nullable'));
final _smoke_ExcludedComments_SomeLambdaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_get_value_nullable'));
Pointer<Void> smoke_ExcludedComments_SomeLambda_toFfi_nullable(ExcludedComments_SomeLambda value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExcludedComments_SomeLambda_toFfi(value);
  final result = _smoke_ExcludedComments_SomeLambdaCreateHandleNullable(_handle);
  smoke_ExcludedComments_SomeLambda_releaseFfiHandle(_handle);
  return result;
}
ExcludedComments_SomeLambda smoke_ExcludedComments_SomeLambda_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExcludedComments_SomeLambdaGetValueNullable(handle);
  final result = smoke_ExcludedComments_SomeLambda_fromFfi(_handle);
  smoke_ExcludedComments_SomeLambda_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExcludedComments_SomeLambda_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedComments_SomeLambdaReleaseHandleNullable(handle);
// End of ExcludedComments_SomeLambda "private" section.
// ExcludedComments "private" section, not exported.
final _smokeExcludedcommentsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_copy_handle'));
final _smokeExcludedcommentsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_release_handle'));
final _someMethodWithAllCommentsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_someMethodWithAllComments__String_return_release_handle'));
final _someMethodWithAllCommentsReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_someMethodWithAllComments__String_return_get_result'));
final _someMethodWithAllCommentsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_someMethodWithAllComments__String_return_get_error'));
final _someMethodWithAllCommentsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_someMethodWithAllComments__String_return_has_error'));
class ExcludedComments$Impl extends __lib.NativeBase implements ExcludedComments {
  ExcludedComments$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeExcludedcommentsReleaseHandle(handle);
    handle = null;
  }
  @override
  bool someMethodWithAllComments(String inputParameter) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ExcludedComments_someMethodWithAllComments__String'));
    final _inputParameterHandle = String_toFfi(inputParameter);
    final _handle = this.handle;
    final __callResultHandle = _someMethodWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputParameterHandle);
    String_releaseFfiHandle(_inputParameterHandle);
    if (_someMethodWithAllCommentsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _someMethodWithAllCommentsReturnGetError(__callResultHandle);
        _someMethodWithAllCommentsReturnReleaseHandle(__callResultHandle);
        try {
          throw ExcludedComments_SomethingWrongException(smoke_ExcludedComments_SomeEnum_fromFfi(__errorHandle));
        } finally {
          smoke_ExcludedComments_SomeEnum_releaseFfiHandle(__errorHandle);
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
    final _someMethodWithoutReturnTypeOrInputParametersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ExcludedComments_someMethodWithoutReturnTypeOrInputParameters'));
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
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_ExcludedComments_isSomeProperty_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_ExcludedComments_isSomeProperty_set__Boolean'));
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
Pointer<Void> smoke_ExcludedComments_toFfi(ExcludedComments value) =>
  _smokeExcludedcommentsCopyHandle((value as __lib.NativeBase).handle);
ExcludedComments smoke_ExcludedComments_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ExcludedComments;
  if (instance != null) return instance;
  final _copiedHandle = _smokeExcludedcommentsCopyHandle(handle);
  final result = ExcludedComments$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ExcludedComments_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeExcludedcommentsReleaseHandle(handle);
Pointer<Void> smoke_ExcludedComments_toFfi_nullable(ExcludedComments value) =>
  value != null ? smoke_ExcludedComments_toFfi(value) : Pointer<Void>.fromAddress(0);
ExcludedComments smoke_ExcludedComments_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ExcludedComments_fromFfi(handle) : null;
void smoke_ExcludedComments_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsReleaseHandle(handle);
// End of ExcludedComments "private" section.

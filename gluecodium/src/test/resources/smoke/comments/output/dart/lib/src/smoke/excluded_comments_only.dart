import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
/// @nodoc
abstract class ExcludedCommentsOnly {
  /// @nodoc
  @Deprecated("Does nothing")
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
int smokeExcludedcommentsonlySomeenumToFfi(ExcludedCommentsOnly_SomeEnum value) {
  switch (value) {
  case ExcludedCommentsOnly_SomeEnum.useless:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for ExcludedCommentsOnly_SomeEnum enum.");
  }
}
ExcludedCommentsOnly_SomeEnum smokeExcludedcommentsonlySomeenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ExcludedCommentsOnly_SomeEnum.useless;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ExcludedCommentsOnly_SomeEnum enum.");
  }
}
void smokeExcludedcommentsonlySomeenumReleaseFfiHandle(int handle) {}
final _smokeExcludedcommentsonlySomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ExcludedCommentsOnly_SomeEnum_create_handle_nullable'));
final _smokeExcludedcommentsonlySomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeEnum_release_handle_nullable'));
final _smokeExcludedcommentsonlySomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeEnum_get_value_nullable'));
Pointer<Void> smokeExcludedcommentsonlySomeenumToFfiNullable(ExcludedCommentsOnly_SomeEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeExcludedcommentsonlySomeenumToFfi(value);
  final result = _smokeExcludedcommentsonlySomeenumCreateHandleNullable(_handle);
  smokeExcludedcommentsonlySomeenumReleaseFfiHandle(_handle);
  return result;
}
ExcludedCommentsOnly_SomeEnum? smokeExcludedcommentsonlySomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeExcludedcommentsonlySomeenumGetValueNullable(handle);
  final result = smokeExcludedcommentsonlySomeenumFromFfi(_handle);
  smokeExcludedcommentsonlySomeenumReleaseFfiHandle(_handle);
  return result;
}
void smokeExcludedcommentsonlySomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsonlySomeenumReleaseHandleNullable(handle);
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
Pointer<Void> smokeExcludedcommentsonlySomestructToFfi(ExcludedCommentsOnly_SomeStruct value) {
  final _someFieldHandle = booleanToFfi(value.someField);
  final _result = _smokeExcludedcommentsonlySomestructCreateHandle(_someFieldHandle);
  booleanReleaseFfiHandle(_someFieldHandle);
  return _result;
}
ExcludedCommentsOnly_SomeStruct smokeExcludedcommentsonlySomestructFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeExcludedcommentsonlySomestructGetFieldsomeField(handle);
  try {
    return ExcludedCommentsOnly_SomeStruct(
      booleanFromFfi(_someFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_someFieldHandle);
  }
}
void smokeExcludedcommentsonlySomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeExcludedcommentsonlySomestructReleaseHandle(handle);
// Nullable ExcludedCommentsOnly_SomeStruct
final _smokeExcludedcommentsonlySomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_create_handle_nullable'));
final _smokeExcludedcommentsonlySomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_release_handle_nullable'));
final _smokeExcludedcommentsonlySomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeStruct_get_value_nullable'));
Pointer<Void> smokeExcludedcommentsonlySomestructToFfiNullable(ExcludedCommentsOnly_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeExcludedcommentsonlySomestructToFfi(value);
  final result = _smokeExcludedcommentsonlySomestructCreateHandleNullable(_handle);
  smokeExcludedcommentsonlySomestructReleaseFfiHandle(_handle);
  return result;
}
ExcludedCommentsOnly_SomeStruct? smokeExcludedcommentsonlySomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeExcludedcommentsonlySomestructGetValueNullable(handle);
  final result = smokeExcludedcommentsonlySomestructFromFfi(_handle);
  smokeExcludedcommentsonlySomestructReleaseFfiHandle(_handle);
  return result;
}
void smokeExcludedcommentsonlySomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsonlySomestructReleaseHandleNullable(handle);
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
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_create_proxy'));
class ExcludedCommentsOnly_SomeLambda$Impl {
  final Pointer<Void> handle;
  ExcludedCommentsOnly_SomeLambda$Impl(this.handle);
  void release() => _smokeExcludedcommentsonlySomelambdaReleaseHandle(handle);
  double call(String p0, int p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>, Int32), double Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_ExcludedCommentsOnly_SomeLambda_call__String_Int'));
    final _p0Handle = stringToFfi(p0);
    final _p1Handle = (p1);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    stringReleaseFfiHandle(_p0Handle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
int _smokeExcludedcommentsonlySomelambdacallStatic(Object _obj, Pointer<Void> p0, int p1, Pointer<Double> _result) {
  double? _resultObject;
  try {
    _resultObject = (_obj as ExcludedCommentsOnly_SomeLambda)(stringFromFfi(p0), (p1));
    _result.value = (_resultObject);
  } finally {
    stringReleaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smokeExcludedcommentsonlySomelambdaToFfi(ExcludedCommentsOnly_SomeLambda value) =>
  _smokeExcludedcommentsonlySomelambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Int32, Pointer<Double>)>(_smokeExcludedcommentsonlySomelambdacallStatic, __lib.unknownError)
  );
ExcludedCommentsOnly_SomeLambda smokeExcludedcommentsonlySomelambdaFromFfi(Pointer<Void> handle) {
  final _impl = ExcludedCommentsOnly_SomeLambda$Impl(_smokeExcludedcommentsonlySomelambdaCopyHandle(handle));
  return (String p0, int p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}
void smokeExcludedcommentsonlySomelambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeExcludedcommentsonlySomelambdaReleaseHandle(handle);
// Nullable ExcludedCommentsOnly_SomeLambda
final _smokeExcludedcommentsonlySomelambdaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_create_handle_nullable'));
final _smokeExcludedcommentsonlySomelambdaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_release_handle_nullable'));
final _smokeExcludedcommentsonlySomelambdaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsOnly_SomeLambda_get_value_nullable'));
Pointer<Void> smokeExcludedcommentsonlySomelambdaToFfiNullable(ExcludedCommentsOnly_SomeLambda? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeExcludedcommentsonlySomelambdaToFfi(value);
  final result = _smokeExcludedcommentsonlySomelambdaCreateHandleNullable(_handle);
  smokeExcludedcommentsonlySomelambdaReleaseFfiHandle(_handle);
  return result;
}
ExcludedCommentsOnly_SomeLambda? smokeExcludedcommentsonlySomelambdaFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeExcludedcommentsonlySomelambdaGetValueNullable(handle);
  final result = smokeExcludedcommentsonlySomelambdaFromFfi(_handle);
  smokeExcludedcommentsonlySomelambdaReleaseFfiHandle(_handle);
  return result;
}
void smokeExcludedcommentsonlySomelambdaReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsonlySomelambdaReleaseHandleNullable(handle);
// End of ExcludedCommentsOnly_SomeLambda "private" section.
// ExcludedCommentsOnly "private" section, not exported.
final _smokeExcludedcommentsonlyRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ExcludedCommentsOnly_register_finalizer'));
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
  void release() {}
  @override
  bool someMethodWithAllComments(String inputParameter) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ExcludedCommentsOnly_someMethodWithAllComments__String'));
    final _inputParameterHandle = stringToFfi(inputParameter);
    final _handle = this.handle;
    final __callResultHandle = _someMethodWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputParameterHandle);
    stringReleaseFfiHandle(_inputParameterHandle);
    if (_someMethodWithAllCommentsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _someMethodWithAllCommentsReturnGetError(__callResultHandle);
        _someMethodWithAllCommentsReturnReleaseHandle(__callResultHandle);
        try {
          throw ExcludedCommentsOnly_SomethingWrongException(smokeExcludedcommentsonlySomeenumFromFfi(__errorHandle));
        } finally {
          smokeExcludedcommentsonlySomeenumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _someMethodWithAllCommentsReturnGetResult(__callResultHandle);
    _someMethodWithAllCommentsReturnReleaseHandle(__callResultHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
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
    }
  }
  @override
  bool get isSomeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_ExcludedCommentsOnly_isSomeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  set isSomeProperty(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_ExcludedCommentsOnly_isSomeProperty_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
Pointer<Void> smokeExcludedcommentsonlyToFfi(ExcludedCommentsOnly value) =>
  _smokeExcludedcommentsonlyCopyHandle((value as __lib.NativeBase).handle);
ExcludedCommentsOnly smokeExcludedcommentsonlyFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ExcludedCommentsOnly) return instance as ExcludedCommentsOnly;
  final _copiedHandle = _smokeExcludedcommentsonlyCopyHandle(handle);
  final result = ExcludedCommentsOnly$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeExcludedcommentsonlyRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeExcludedcommentsonlyReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeExcludedcommentsonlyReleaseHandle(handle);
Pointer<Void> smokeExcludedcommentsonlyToFfiNullable(ExcludedCommentsOnly? value) =>
  value != null ? smokeExcludedcommentsonlyToFfi(value) : Pointer<Void>.fromAddress(0);
ExcludedCommentsOnly? smokeExcludedcommentsonlyFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeExcludedcommentsonlyFromFfi(handle) : null;
void smokeExcludedcommentsonlyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsonlyReleaseHandle(handle);
// End of ExcludedCommentsOnly "private" section.

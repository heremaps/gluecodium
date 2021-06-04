import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
/// This is some very useful class.
/// @nodoc
abstract class ExcludedComments {
  /// @nodoc
  @Deprecated("Does nothing")
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
  void someMethodWithoutReturnTypeOrInputParameters();
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
int smokeExcludedcommentsSomeenumToFfi(ExcludedComments_SomeEnum value) {
  switch (value) {
  case ExcludedComments_SomeEnum.useless:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for ExcludedComments_SomeEnum enum.");
  }
}
ExcludedComments_SomeEnum smokeExcludedcommentsSomeenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ExcludedComments_SomeEnum.useless;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ExcludedComments_SomeEnum enum.");
  }
}
void smokeExcludedcommentsSomeenumReleaseFfiHandle(int handle) {}
final _smokeExcludedcommentsSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ExcludedComments_SomeEnum_create_handle_nullable'));
final _smokeExcludedcommentsSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeEnum_release_handle_nullable'));
final _smokeExcludedcommentsSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeEnum_get_value_nullable'));
Pointer<Void> smokeExcludedcommentsSomeenumToFfiNullable(ExcludedComments_SomeEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeExcludedcommentsSomeenumToFfi(value);
  final result = _smokeExcludedcommentsSomeenumCreateHandleNullable(_handle);
  smokeExcludedcommentsSomeenumReleaseFfiHandle(_handle);
  return result;
}
ExcludedComments_SomeEnum? smokeExcludedcommentsSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeExcludedcommentsSomeenumGetValueNullable(handle);
  final result = smokeExcludedcommentsSomeenumFromFfi(_handle);
  smokeExcludedcommentsSomeenumReleaseFfiHandle(_handle);
  return result;
}
void smokeExcludedcommentsSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsSomeenumReleaseHandleNullable(handle);
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
Pointer<Void> smokeExcludedcommentsSomestructToFfi(ExcludedComments_SomeStruct value) {
  final _someFieldHandle = booleanToFfi(value.someField);
  final _result = _smokeExcludedcommentsSomestructCreateHandle(_someFieldHandle);
  booleanReleaseFfiHandle(_someFieldHandle);
  return _result;
}
ExcludedComments_SomeStruct smokeExcludedcommentsSomestructFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeExcludedcommentsSomestructGetFieldsomeField(handle);
  try {
    return ExcludedComments_SomeStruct(
      booleanFromFfi(_someFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_someFieldHandle);
  }
}
void smokeExcludedcommentsSomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeExcludedcommentsSomestructReleaseHandle(handle);
// Nullable ExcludedComments_SomeStruct
final _smokeExcludedcommentsSomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_create_handle_nullable'));
final _smokeExcludedcommentsSomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_release_handle_nullable'));
final _smokeExcludedcommentsSomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeStruct_get_value_nullable'));
Pointer<Void> smokeExcludedcommentsSomestructToFfiNullable(ExcludedComments_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeExcludedcommentsSomestructToFfi(value);
  final result = _smokeExcludedcommentsSomestructCreateHandleNullable(_handle);
  smokeExcludedcommentsSomestructReleaseFfiHandle(_handle);
  return result;
}
ExcludedComments_SomeStruct? smokeExcludedcommentsSomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeExcludedcommentsSomestructGetValueNullable(handle);
  final result = smokeExcludedcommentsSomestructFromFfi(_handle);
  smokeExcludedcommentsSomestructReleaseFfiHandle(_handle);
  return result;
}
void smokeExcludedcommentsSomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsSomestructReleaseHandleNullable(handle);
// End of ExcludedComments_SomeStruct "private" section.
/// This is some very useful lambda that does it.
/// @nodoc
typedef ExcludedComments_SomeLambda = double Function(String, int);
// ExcludedComments_SomeLambda "private" section, not exported.
final _smokeExcludedcommentsSomelambdaRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ExcludedComments_SomeLambda_register_finalizer'));
final _smokeExcludedcommentsSomelambdaCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_copy_handle'));
final _smokeExcludedcommentsSomelambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_release_handle'));
final _smokeExcludedcommentsSomelambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_ExcludedComments_SomeLambda_create_proxy'));
class ExcludedComments_SomeLambda$Impl {
  final Pointer<Void> handle;
  ExcludedComments_SomeLambda$Impl(this.handle);
  double call(String p0, int p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>, Int32), double Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_ExcludedComments_SomeLambda_call__String_Int'));
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
int _smokeExcludedcommentsSomelambdacallStatic(Object _obj, Pointer<Void> p0, int p1, Pointer<Double> _result) {
  double? _resultObject;
  try {
    _resultObject = (_obj as ExcludedComments_SomeLambda)(stringFromFfi(p0), (p1));
    _result.value = (_resultObject);
  } finally {
    stringReleaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smokeExcludedcommentsSomelambdaToFfi(ExcludedComments_SomeLambda value) =>
  _smokeExcludedcommentsSomelambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Int32, Pointer<Double>)>(_smokeExcludedcommentsSomelambdacallStatic, __lib.unknownError)
  );
ExcludedComments_SomeLambda smokeExcludedcommentsSomelambdaFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeExcludedcommentsSomelambdaCopyHandle(handle);
  final _impl = ExcludedComments_SomeLambda$Impl(_copiedHandle);
  final result = (String p0, int p1) => _impl.call(p0, p1);
  _smokeExcludedcommentsSomelambdaRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeExcludedcommentsSomelambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeExcludedcommentsSomelambdaReleaseHandle(handle);
// Nullable ExcludedComments_SomeLambda
final _smokeExcludedcommentsSomelambdaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_create_handle_nullable'));
final _smokeExcludedcommentsSomelambdaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_release_handle_nullable'));
final _smokeExcludedcommentsSomelambdaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedComments_SomeLambda_get_value_nullable'));
Pointer<Void> smokeExcludedcommentsSomelambdaToFfiNullable(ExcludedComments_SomeLambda? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeExcludedcommentsSomelambdaToFfi(value);
  final result = _smokeExcludedcommentsSomelambdaCreateHandleNullable(_handle);
  smokeExcludedcommentsSomelambdaReleaseFfiHandle(_handle);
  return result;
}
ExcludedComments_SomeLambda? smokeExcludedcommentsSomelambdaFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeExcludedcommentsSomelambdaGetValueNullable(handle);
  final result = smokeExcludedcommentsSomelambdaFromFfi(_handle);
  smokeExcludedcommentsSomelambdaReleaseFfiHandle(_handle);
  return result;
}
void smokeExcludedcommentsSomelambdaReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsSomelambdaReleaseHandleNullable(handle);
// End of ExcludedComments_SomeLambda "private" section.
// ExcludedComments "private" section, not exported.
final _smokeExcludedcommentsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ExcludedComments_register_finalizer'));
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
  void release() {}
  @override
  bool someMethodWithAllComments(String inputParameter) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ExcludedComments_someMethodWithAllComments__String'));
    final _inputParameterHandle = stringToFfi(inputParameter);
    final _handle = this.handle;
    final __callResultHandle = _someMethodWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputParameterHandle);
    stringReleaseFfiHandle(_inputParameterHandle);
    if (_someMethodWithAllCommentsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _someMethodWithAllCommentsReturnGetError(__callResultHandle);
        _someMethodWithAllCommentsReturnReleaseHandle(__callResultHandle);
        try {
          throw ExcludedComments_SomethingWrongException(smokeExcludedcommentsSomeenumFromFfi(__errorHandle));
        } finally {
          smokeExcludedcommentsSomeenumReleaseFfiHandle(__errorHandle);
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
  void someMethodWithoutReturnTypeOrInputParameters() {
    final _someMethodWithoutReturnTypeOrInputParametersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ExcludedComments_someMethodWithoutReturnTypeOrInputParameters'));
    final _handle = this.handle;
    final __resultHandle = _someMethodWithoutReturnTypeOrInputParametersFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  bool get isSomeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_ExcludedComments_isSomeProperty_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_ExcludedComments_isSomeProperty_set__Boolean'));
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
Pointer<Void> smokeExcludedcommentsToFfi(ExcludedComments value) =>
  _smokeExcludedcommentsCopyHandle((value as __lib.NativeBase).handle);
ExcludedComments smokeExcludedcommentsFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ExcludedComments) return instance as ExcludedComments;
  final _copiedHandle = _smokeExcludedcommentsCopyHandle(handle);
  final result = ExcludedComments$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeExcludedcommentsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeExcludedcommentsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeExcludedcommentsReleaseHandle(handle);
Pointer<Void> smokeExcludedcommentsToFfiNullable(ExcludedComments? value) =>
  value != null ? smokeExcludedcommentsToFfi(value) : Pointer<Void>.fromAddress(0);
ExcludedComments? smokeExcludedcommentsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeExcludedcommentsFromFfi(handle) : null;
void smokeExcludedcommentsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsReleaseHandle(handle);
// End of ExcludedComments "private" section.

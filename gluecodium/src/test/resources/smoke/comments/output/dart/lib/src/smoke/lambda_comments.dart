import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class LambdaComments {
}
/// The first line of the doc.
///
/// [p0] The first input parameter
typedef LambdaComments_WithNoNamedParameters = String Function(String);
// LambdaComments_WithNoNamedParameters "private" section, not exported.
final _smokeLambdacommentsWithnonamedparametersRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_LambdaComments_WithNoNamedParameters_register_finalizer'));
final _smokeLambdacommentsWithnonamedparametersCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNoNamedParameters_copy_handle'));
final _smokeLambdacommentsWithnonamedparametersReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNoNamedParameters_release_handle'));
final _smokeLambdacommentsWithnonamedparametersCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_LambdaComments_WithNoNamedParameters_create_proxy'));
class LambdaComments_WithNoNamedParameters$Impl {
  final Pointer<Void> handle;
  LambdaComments_WithNoNamedParameters$Impl(this.handle);
  String call(String p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LambdaComments_WithNoNamedParameters_call__String'));
    final _p0Handle = stringToFfi(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    stringReleaseFfiHandle(_p0Handle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
int _smokeLambdacommentsWithnonamedparameterscallStatic(Object _obj, Pointer<Void> p0, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (_obj as LambdaComments_WithNoNamedParameters)(stringFromFfi(p0));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smokeLambdacommentsWithnonamedparametersToFfi(LambdaComments_WithNoNamedParameters value) =>
  _smokeLambdacommentsWithnonamedparametersCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Pointer<Void>>)>(_smokeLambdacommentsWithnonamedparameterscallStatic, __lib.unknownError)
  );
LambdaComments_WithNoNamedParameters smokeLambdacommentsWithnonamedparametersFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdacommentsWithnonamedparametersCopyHandle(handle);
  final _impl = LambdaComments_WithNoNamedParameters$Impl(_copiedHandle);
  final result = (String p0) => _impl.call(p0);
  _smokeLambdacommentsWithnonamedparametersRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeLambdacommentsWithnonamedparametersReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdacommentsWithnonamedparametersReleaseHandle(handle);
// Nullable LambdaComments_WithNoNamedParameters
final _smokeLambdacommentsWithnonamedparametersCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNoNamedParameters_create_handle_nullable'));
final _smokeLambdacommentsWithnonamedparametersReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNoNamedParameters_release_handle_nullable'));
final _smokeLambdacommentsWithnonamedparametersGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNoNamedParameters_get_value_nullable'));
Pointer<Void> smokeLambdacommentsWithnonamedparametersToFfiNullable(LambdaComments_WithNoNamedParameters? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdacommentsWithnonamedparametersToFfi(value);
  final result = _smokeLambdacommentsWithnonamedparametersCreateHandleNullable(_handle);
  smokeLambdacommentsWithnonamedparametersReleaseFfiHandle(_handle);
  return result;
}
LambdaComments_WithNoNamedParameters? smokeLambdacommentsWithnonamedparametersFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdacommentsWithnonamedparametersGetValueNullable(handle);
  final result = smokeLambdacommentsWithnonamedparametersFromFfi(_handle);
  smokeLambdacommentsWithnonamedparametersReleaseFfiHandle(_handle);
  return result;
}
void smokeLambdacommentsWithnonamedparametersReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdacommentsWithnonamedparametersReleaseHandleNullable(handle);
// End of LambdaComments_WithNoNamedParameters "private" section.
/// The first line of the doc.
typedef LambdaComments_WithNoDocsForParameters = String Function(String);
// LambdaComments_WithNoDocsForParameters "private" section, not exported.
final _smokeLambdacommentsWithnodocsforparametersRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_LambdaComments_WithNoDocsForParameters_register_finalizer'));
final _smokeLambdacommentsWithnodocsforparametersCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNoDocsForParameters_copy_handle'));
final _smokeLambdacommentsWithnodocsforparametersReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNoDocsForParameters_release_handle'));
final _smokeLambdacommentsWithnodocsforparametersCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_LambdaComments_WithNoDocsForParameters_create_proxy'));
class LambdaComments_WithNoDocsForParameters$Impl {
  final Pointer<Void> handle;
  LambdaComments_WithNoDocsForParameters$Impl(this.handle);
  String call(String p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LambdaComments_WithNoDocsForParameters_call__String'));
    final _p0Handle = stringToFfi(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    stringReleaseFfiHandle(_p0Handle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
int _smokeLambdacommentsWithnodocsforparameterscallStatic(Object _obj, Pointer<Void> p0, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (_obj as LambdaComments_WithNoDocsForParameters)(stringFromFfi(p0));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smokeLambdacommentsWithnodocsforparametersToFfi(LambdaComments_WithNoDocsForParameters value) =>
  _smokeLambdacommentsWithnodocsforparametersCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Pointer<Void>>)>(_smokeLambdacommentsWithnodocsforparameterscallStatic, __lib.unknownError)
  );
LambdaComments_WithNoDocsForParameters smokeLambdacommentsWithnodocsforparametersFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdacommentsWithnodocsforparametersCopyHandle(handle);
  final _impl = LambdaComments_WithNoDocsForParameters$Impl(_copiedHandle);
  final result = (String p0) => _impl.call(p0);
  _smokeLambdacommentsWithnodocsforparametersRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeLambdacommentsWithnodocsforparametersReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdacommentsWithnodocsforparametersReleaseHandle(handle);
// Nullable LambdaComments_WithNoDocsForParameters
final _smokeLambdacommentsWithnodocsforparametersCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNoDocsForParameters_create_handle_nullable'));
final _smokeLambdacommentsWithnodocsforparametersReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNoDocsForParameters_release_handle_nullable'));
final _smokeLambdacommentsWithnodocsforparametersGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNoDocsForParameters_get_value_nullable'));
Pointer<Void> smokeLambdacommentsWithnodocsforparametersToFfiNullable(LambdaComments_WithNoDocsForParameters? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdacommentsWithnodocsforparametersToFfi(value);
  final result = _smokeLambdacommentsWithnodocsforparametersCreateHandleNullable(_handle);
  smokeLambdacommentsWithnodocsforparametersReleaseFfiHandle(_handle);
  return result;
}
LambdaComments_WithNoDocsForParameters? smokeLambdacommentsWithnodocsforparametersFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdacommentsWithnodocsforparametersGetValueNullable(handle);
  final result = smokeLambdacommentsWithnodocsforparametersFromFfi(_handle);
  smokeLambdacommentsWithnodocsforparametersReleaseFfiHandle(_handle);
  return result;
}
void smokeLambdacommentsWithnodocsforparametersReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdacommentsWithnodocsforparametersReleaseHandleNullable(handle);
// End of LambdaComments_WithNoDocsForParameters "private" section.
/// The first line of the doc.
///
/// [inputParameter] The first input parameter. The second sentence of the first input parameter.
///
/// Returns The string.
typedef LambdaComments_WithNamedParameters = String Function(String inputParameter);
// LambdaComments_WithNamedParameters "private" section, not exported.
final _smokeLambdacommentsWithnamedparametersRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_LambdaComments_WithNamedParameters_register_finalizer'));
final _smokeLambdacommentsWithnamedparametersCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNamedParameters_copy_handle'));
final _smokeLambdacommentsWithnamedparametersReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNamedParameters_release_handle'));
final _smokeLambdacommentsWithnamedparametersCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_LambdaComments_WithNamedParameters_create_proxy'));
class LambdaComments_WithNamedParameters$Impl {
  final Pointer<Void> handle;
  LambdaComments_WithNamedParameters$Impl(this.handle);
  String call(String inputParameter) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LambdaComments_WithNamedParameters_call__String'));
    final _inputParameterHandle = stringToFfi(inputParameter);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _inputParameterHandle);
    stringReleaseFfiHandle(_inputParameterHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
int _smokeLambdacommentsWithnamedparameterscallStatic(Object _obj, Pointer<Void> inputParameter, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (_obj as LambdaComments_WithNamedParameters)(stringFromFfi(inputParameter));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(inputParameter);
  }
  return 0;
}
Pointer<Void> smokeLambdacommentsWithnamedparametersToFfi(LambdaComments_WithNamedParameters value) =>
  _smokeLambdacommentsWithnamedparametersCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Pointer<Void>>)>(_smokeLambdacommentsWithnamedparameterscallStatic, __lib.unknownError)
  );
LambdaComments_WithNamedParameters smokeLambdacommentsWithnamedparametersFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdacommentsWithnamedparametersCopyHandle(handle);
  final _impl = LambdaComments_WithNamedParameters$Impl(_copiedHandle);
  final result = (String inputParameter) => _impl.call(inputParameter);
  _smokeLambdacommentsWithnamedparametersRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeLambdacommentsWithnamedparametersReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdacommentsWithnamedparametersReleaseHandle(handle);
// Nullable LambdaComments_WithNamedParameters
final _smokeLambdacommentsWithnamedparametersCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNamedParameters_create_handle_nullable'));
final _smokeLambdacommentsWithnamedparametersReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNamedParameters_release_handle_nullable'));
final _smokeLambdacommentsWithnamedparametersGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_WithNamedParameters_get_value_nullable'));
Pointer<Void> smokeLambdacommentsWithnamedparametersToFfiNullable(LambdaComments_WithNamedParameters? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdacommentsWithnamedparametersToFfi(value);
  final result = _smokeLambdacommentsWithnamedparametersCreateHandleNullable(_handle);
  smokeLambdacommentsWithnamedparametersReleaseFfiHandle(_handle);
  return result;
}
LambdaComments_WithNamedParameters? smokeLambdacommentsWithnamedparametersFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdacommentsWithnamedparametersGetValueNullable(handle);
  final result = smokeLambdacommentsWithnamedparametersFromFfi(_handle);
  smokeLambdacommentsWithnamedparametersReleaseFfiHandle(_handle);
  return result;
}
void smokeLambdacommentsWithnamedparametersReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdacommentsWithnamedparametersReleaseHandleNullable(handle);
// End of LambdaComments_WithNamedParameters "private" section.
/// The first line of the doc.
///
/// Returns The string.
typedef LambdaComments_MixedDocNameParameters = String Function(String inputParameter, String secondInputParameter);
// LambdaComments_MixedDocNameParameters "private" section, not exported.
final _smokeLambdacommentsMixeddocnameparametersRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_LambdaComments_MixedDocNameParameters_register_finalizer'));
final _smokeLambdacommentsMixeddocnameparametersCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_MixedDocNameParameters_copy_handle'));
final _smokeLambdacommentsMixeddocnameparametersReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_MixedDocNameParameters_release_handle'));
final _smokeLambdacommentsMixeddocnameparametersCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_LambdaComments_MixedDocNameParameters_create_proxy'));
class LambdaComments_MixedDocNameParameters$Impl {
  final Pointer<Void> handle;
  LambdaComments_MixedDocNameParameters$Impl(this.handle);
  String call(String inputParameter, String secondInputParameter) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('library_smoke_LambdaComments_MixedDocNameParameters_call__String_String'));
    final _inputParameterHandle = stringToFfi(inputParameter);
    final _secondInputParameterHandle = stringToFfi(secondInputParameter);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _inputParameterHandle, _secondInputParameterHandle);
    stringReleaseFfiHandle(_inputParameterHandle);
    stringReleaseFfiHandle(_secondInputParameterHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
int _smokeLambdacommentsMixeddocnameparameterscallStatic(Object _obj, Pointer<Void> inputParameter, Pointer<Void> secondInputParameter, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (_obj as LambdaComments_MixedDocNameParameters)(stringFromFfi(inputParameter), stringFromFfi(secondInputParameter));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(inputParameter);
    stringReleaseFfiHandle(secondInputParameter);
  }
  return 0;
}
Pointer<Void> smokeLambdacommentsMixeddocnameparametersToFfi(LambdaComments_MixedDocNameParameters value) =>
  _smokeLambdacommentsMixeddocnameparametersCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_smokeLambdacommentsMixeddocnameparameterscallStatic, __lib.unknownError)
  );
LambdaComments_MixedDocNameParameters smokeLambdacommentsMixeddocnameparametersFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdacommentsMixeddocnameparametersCopyHandle(handle);
  final _impl = LambdaComments_MixedDocNameParameters$Impl(_copiedHandle);
  final result = (String inputParameter, String secondInputParameter) => _impl.call(inputParameter, secondInputParameter);
  _smokeLambdacommentsMixeddocnameparametersRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeLambdacommentsMixeddocnameparametersReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdacommentsMixeddocnameparametersReleaseHandle(handle);
// Nullable LambdaComments_MixedDocNameParameters
final _smokeLambdacommentsMixeddocnameparametersCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_MixedDocNameParameters_create_handle_nullable'));
final _smokeLambdacommentsMixeddocnameparametersReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_MixedDocNameParameters_release_handle_nullable'));
final _smokeLambdacommentsMixeddocnameparametersGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_MixedDocNameParameters_get_value_nullable'));
Pointer<Void> smokeLambdacommentsMixeddocnameparametersToFfiNullable(LambdaComments_MixedDocNameParameters? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdacommentsMixeddocnameparametersToFfi(value);
  final result = _smokeLambdacommentsMixeddocnameparametersCreateHandleNullable(_handle);
  smokeLambdacommentsMixeddocnameparametersReleaseFfiHandle(_handle);
  return result;
}
LambdaComments_MixedDocNameParameters? smokeLambdacommentsMixeddocnameparametersFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdacommentsMixeddocnameparametersGetValueNullable(handle);
  final result = smokeLambdacommentsMixeddocnameparametersFromFfi(_handle);
  smokeLambdacommentsMixeddocnameparametersReleaseFfiHandle(_handle);
  return result;
}
void smokeLambdacommentsMixeddocnameparametersReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdacommentsMixeddocnameparametersReleaseHandleNullable(handle);
// End of LambdaComments_MixedDocNameParameters "private" section.
typedef LambdaComments_NoCommentsNoNamedParams = String Function(String, String);
// LambdaComments_NoCommentsNoNamedParams "private" section, not exported.
final _smokeLambdacommentsNocommentsnonamedparamsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_LambdaComments_NoCommentsNoNamedParams_register_finalizer'));
final _smokeLambdacommentsNocommentsnonamedparamsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_NoCommentsNoNamedParams_copy_handle'));
final _smokeLambdacommentsNocommentsnonamedparamsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_NoCommentsNoNamedParams_release_handle'));
final _smokeLambdacommentsNocommentsnonamedparamsCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_LambdaComments_NoCommentsNoNamedParams_create_proxy'));
class LambdaComments_NoCommentsNoNamedParams$Impl {
  final Pointer<Void> handle;
  LambdaComments_NoCommentsNoNamedParams$Impl(this.handle);
  String call(String p0, String p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('library_smoke_LambdaComments_NoCommentsNoNamedParams_call__String_String'));
    final _p0Handle = stringToFfi(p0);
    final _p1Handle = stringToFfi(p1);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    stringReleaseFfiHandle(_p0Handle);
    stringReleaseFfiHandle(_p1Handle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
int _smokeLambdacommentsNocommentsnonamedparamscallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (_obj as LambdaComments_NoCommentsNoNamedParams)(stringFromFfi(p0), stringFromFfi(p1));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(p0);
    stringReleaseFfiHandle(p1);
  }
  return 0;
}
Pointer<Void> smokeLambdacommentsNocommentsnonamedparamsToFfi(LambdaComments_NoCommentsNoNamedParams value) =>
  _smokeLambdacommentsNocommentsnonamedparamsCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_smokeLambdacommentsNocommentsnonamedparamscallStatic, __lib.unknownError)
  );
LambdaComments_NoCommentsNoNamedParams smokeLambdacommentsNocommentsnonamedparamsFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdacommentsNocommentsnonamedparamsCopyHandle(handle);
  final _impl = LambdaComments_NoCommentsNoNamedParams$Impl(_copiedHandle);
  final result = (String p0, String p1) => _impl.call(p0, p1);
  _smokeLambdacommentsNocommentsnonamedparamsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeLambdacommentsNocommentsnonamedparamsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdacommentsNocommentsnonamedparamsReleaseHandle(handle);
// Nullable LambdaComments_NoCommentsNoNamedParams
final _smokeLambdacommentsNocommentsnonamedparamsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_NoCommentsNoNamedParams_create_handle_nullable'));
final _smokeLambdacommentsNocommentsnonamedparamsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_NoCommentsNoNamedParams_release_handle_nullable'));
final _smokeLambdacommentsNocommentsnonamedparamsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_NoCommentsNoNamedParams_get_value_nullable'));
Pointer<Void> smokeLambdacommentsNocommentsnonamedparamsToFfiNullable(LambdaComments_NoCommentsNoNamedParams? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdacommentsNocommentsnonamedparamsToFfi(value);
  final result = _smokeLambdacommentsNocommentsnonamedparamsCreateHandleNullable(_handle);
  smokeLambdacommentsNocommentsnonamedparamsReleaseFfiHandle(_handle);
  return result;
}
LambdaComments_NoCommentsNoNamedParams? smokeLambdacommentsNocommentsnonamedparamsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdacommentsNocommentsnonamedparamsGetValueNullable(handle);
  final result = smokeLambdacommentsNocommentsnonamedparamsFromFfi(_handle);
  smokeLambdacommentsNocommentsnonamedparamsReleaseFfiHandle(_handle);
  return result;
}
void smokeLambdacommentsNocommentsnonamedparamsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdacommentsNocommentsnonamedparamsReleaseHandleNullable(handle);
// End of LambdaComments_NoCommentsNoNamedParams "private" section.
typedef LambdaComments_NoCommentsWithNamedParams = String Function(String first, String second);
// LambdaComments_NoCommentsWithNamedParams "private" section, not exported.
final _smokeLambdacommentsNocommentswithnamedparamsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_LambdaComments_NoCommentsWithNamedParams_register_finalizer'));
final _smokeLambdacommentsNocommentswithnamedparamsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_NoCommentsWithNamedParams_copy_handle'));
final _smokeLambdacommentsNocommentswithnamedparamsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_NoCommentsWithNamedParams_release_handle'));
final _smokeLambdacommentsNocommentswithnamedparamsCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_LambdaComments_NoCommentsWithNamedParams_create_proxy'));
class LambdaComments_NoCommentsWithNamedParams$Impl {
  final Pointer<Void> handle;
  LambdaComments_NoCommentsWithNamedParams$Impl(this.handle);
  String call(String first, String second) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('library_smoke_LambdaComments_NoCommentsWithNamedParams_call__String_String'));
    final _firstHandle = stringToFfi(first);
    final _secondHandle = stringToFfi(second);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _firstHandle, _secondHandle);
    stringReleaseFfiHandle(_firstHandle);
    stringReleaseFfiHandle(_secondHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
int _smokeLambdacommentsNocommentswithnamedparamscallStatic(Object _obj, Pointer<Void> first, Pointer<Void> second, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (_obj as LambdaComments_NoCommentsWithNamedParams)(stringFromFfi(first), stringFromFfi(second));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(first);
    stringReleaseFfiHandle(second);
  }
  return 0;
}
Pointer<Void> smokeLambdacommentsNocommentswithnamedparamsToFfi(LambdaComments_NoCommentsWithNamedParams value) =>
  _smokeLambdacommentsNocommentswithnamedparamsCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_smokeLambdacommentsNocommentswithnamedparamscallStatic, __lib.unknownError)
  );
LambdaComments_NoCommentsWithNamedParams smokeLambdacommentsNocommentswithnamedparamsFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdacommentsNocommentswithnamedparamsCopyHandle(handle);
  final _impl = LambdaComments_NoCommentsWithNamedParams$Impl(_copiedHandle);
  final result = (String first, String second) => _impl.call(first, second);
  _smokeLambdacommentsNocommentswithnamedparamsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeLambdacommentsNocommentswithnamedparamsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdacommentsNocommentswithnamedparamsReleaseHandle(handle);
// Nullable LambdaComments_NoCommentsWithNamedParams
final _smokeLambdacommentsNocommentswithnamedparamsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_NoCommentsWithNamedParams_create_handle_nullable'));
final _smokeLambdacommentsNocommentswithnamedparamsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_NoCommentsWithNamedParams_release_handle_nullable'));
final _smokeLambdacommentsNocommentswithnamedparamsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_NoCommentsWithNamedParams_get_value_nullable'));
Pointer<Void> smokeLambdacommentsNocommentswithnamedparamsToFfiNullable(LambdaComments_NoCommentsWithNamedParams? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdacommentsNocommentswithnamedparamsToFfi(value);
  final result = _smokeLambdacommentsNocommentswithnamedparamsCreateHandleNullable(_handle);
  smokeLambdacommentsNocommentswithnamedparamsReleaseFfiHandle(_handle);
  return result;
}
LambdaComments_NoCommentsWithNamedParams? smokeLambdacommentsNocommentswithnamedparamsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdacommentsNocommentswithnamedparamsGetValueNullable(handle);
  final result = smokeLambdacommentsNocommentswithnamedparamsFromFfi(_handle);
  smokeLambdacommentsNocommentswithnamedparamsReleaseFfiHandle(_handle);
  return result;
}
void smokeLambdacommentsNocommentswithnamedparamsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdacommentsNocommentswithnamedparamsReleaseHandleNullable(handle);
// End of LambdaComments_NoCommentsWithNamedParams "private" section.
// LambdaComments "private" section, not exported.
final _smokeLambdacommentsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_LambdaComments_register_finalizer'));
final _smokeLambdacommentsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdaComments_copy_handle'));
final _smokeLambdacommentsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdaComments_release_handle'));
class LambdaComments$Impl extends __lib.NativeBase implements LambdaComments {
  LambdaComments$Impl(Pointer<Void> handle) : super(handle);
}
Pointer<Void> smokeLambdacommentsToFfi(LambdaComments value) =>
  _smokeLambdacommentsCopyHandle((value as __lib.NativeBase).handle);
LambdaComments smokeLambdacommentsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LambdaComments) return instance;
  final _copiedHandle = _smokeLambdacommentsCopyHandle(handle);
  final result = LambdaComments$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeLambdacommentsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeLambdacommentsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdacommentsReleaseHandle(handle);
Pointer<Void> smokeLambdacommentsToFfiNullable(LambdaComments? value) =>
  value != null ? smokeLambdacommentsToFfi(value) : Pointer<Void>.fromAddress(0);
LambdaComments? smokeLambdacommentsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeLambdacommentsFromFfi(handle) : null;
void smokeLambdacommentsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdacommentsReleaseHandle(handle);
// End of LambdaComments "private" section.
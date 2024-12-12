

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/smoke/lambdas_declaration_order.dart';
import 'package:library/src/smoke/lambdas_interface.dart';

abstract class LambdasWithStructuredTypes implements Finalizable {


  void doClassStuff(LambdasWithStructuredTypes_ClassCallback callback);

  void doStructStuff(LambdasWithStructuredTypes_StructCallback callback);
}

typedef LambdasWithStructuredTypes_ClassCallback = void Function(LambdasInterface);

// LambdasWithStructuredTypes_ClassCallback "private" section, not exported.

final _smokeLambdaswithstructuredtypesClasscallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_register_finalizer'));
final _smokeLambdaswithstructuredtypesClasscallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_copy_handle'));
final _smokeLambdaswithstructuredtypesClasscallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_release_handle'));
final _smokeLambdaswithstructuredtypesClasscallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_create_proxy'));

class LambdasWithStructuredTypes_ClassCallback$Impl implements Finalizable {
  final Pointer<Void> handle;
  LambdasWithStructuredTypes_ClassCallback$Impl(this.handle);

  void call(LambdasInterface p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LambdasWithStructuredTypes_ClassCallback_call__LambdasInterface'));
    final _p0Handle = smokeLambdasinterfaceToFfi(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    smokeLambdasinterfaceReleaseFfiHandle(_p0Handle);

  }

}

int _smokeLambdaswithstructuredtypesClasscallbackcallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as LambdasWithStructuredTypes_ClassCallback)(smokeLambdasinterfaceFromFfi(p0));
  } finally {
    smokeLambdasinterfaceReleaseFfiHandle(p0);
  }
  return 0;
}

Pointer<Void> smokeLambdaswithstructuredtypesClasscallbackToFfi(LambdasWithStructuredTypes_ClassCallback value) =>
  _smokeLambdaswithstructuredtypesClasscallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_smokeLambdaswithstructuredtypesClasscallbackcallStatic, __lib.unknownError)
  );

LambdasWithStructuredTypes_ClassCallback smokeLambdaswithstructuredtypesClasscallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdaswithstructuredtypesClasscallbackCopyHandle(handle);
  final _impl = LambdasWithStructuredTypes_ClassCallback$Impl(_copiedHandle);
  final result = (LambdasInterface p0) => _impl.call(p0);
  _smokeLambdaswithstructuredtypesClasscallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeLambdaswithstructuredtypesClasscallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdaswithstructuredtypesClasscallbackReleaseHandle(handle);

// Nullable LambdasWithStructuredTypes_ClassCallback

final _smokeLambdaswithstructuredtypesClasscallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_create_handle_nullable'));
final _smokeLambdaswithstructuredtypesClasscallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_release_handle_nullable'));
final _smokeLambdaswithstructuredtypesClasscallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_get_value_nullable'));

Pointer<Void> smokeLambdaswithstructuredtypesClasscallbackToFfiNullable(LambdasWithStructuredTypes_ClassCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdaswithstructuredtypesClasscallbackToFfi(value);
  final result = _smokeLambdaswithstructuredtypesClasscallbackCreateHandleNullable(_handle);
  smokeLambdaswithstructuredtypesClasscallbackReleaseFfiHandle(_handle);
  return result;
}

LambdasWithStructuredTypes_ClassCallback? smokeLambdaswithstructuredtypesClasscallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdaswithstructuredtypesClasscallbackGetValueNullable(handle);
  final result = smokeLambdaswithstructuredtypesClasscallbackFromFfi(_handle);
  smokeLambdaswithstructuredtypesClasscallbackReleaseFfiHandle(_handle);
  return result;
}

void smokeLambdaswithstructuredtypesClasscallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdaswithstructuredtypesClasscallbackReleaseHandleNullable(handle);

// End of LambdasWithStructuredTypes_ClassCallback "private" section.
typedef LambdasWithStructuredTypes_StructCallback = void Function(LambdasDeclarationOrder_SomeStruct);

// LambdasWithStructuredTypes_StructCallback "private" section, not exported.

final _smokeLambdaswithstructuredtypesStructcallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_register_finalizer'));
final _smokeLambdaswithstructuredtypesStructcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_copy_handle'));
final _smokeLambdaswithstructuredtypesStructcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_release_handle'));
final _smokeLambdaswithstructuredtypesStructcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_create_proxy'));

class LambdasWithStructuredTypes_StructCallback$Impl implements Finalizable {
  final Pointer<Void> handle;
  LambdasWithStructuredTypes_StructCallback$Impl(this.handle);

  void call(LambdasDeclarationOrder_SomeStruct p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LambdasWithStructuredTypes_StructCallback_call__SomeStruct'));
    final _p0Handle = smokeLambdasdeclarationorderSomestructToFfi(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    smokeLambdasdeclarationorderSomestructReleaseFfiHandle(_p0Handle);

  }

}

int _smokeLambdaswithstructuredtypesStructcallbackcallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as LambdasWithStructuredTypes_StructCallback)(smokeLambdasdeclarationorderSomestructFromFfi(p0));
  } finally {
    smokeLambdasdeclarationorderSomestructReleaseFfiHandle(p0);
  }
  return 0;
}

Pointer<Void> smokeLambdaswithstructuredtypesStructcallbackToFfi(LambdasWithStructuredTypes_StructCallback value) =>
  _smokeLambdaswithstructuredtypesStructcallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_smokeLambdaswithstructuredtypesStructcallbackcallStatic, __lib.unknownError)
  );

LambdasWithStructuredTypes_StructCallback smokeLambdaswithstructuredtypesStructcallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdaswithstructuredtypesStructcallbackCopyHandle(handle);
  final _impl = LambdasWithStructuredTypes_StructCallback$Impl(_copiedHandle);
  final result = (LambdasDeclarationOrder_SomeStruct p0) => _impl.call(p0);
  _smokeLambdaswithstructuredtypesStructcallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeLambdaswithstructuredtypesStructcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdaswithstructuredtypesStructcallbackReleaseHandle(handle);

// Nullable LambdasWithStructuredTypes_StructCallback

final _smokeLambdaswithstructuredtypesStructcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_create_handle_nullable'));
final _smokeLambdaswithstructuredtypesStructcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_release_handle_nullable'));
final _smokeLambdaswithstructuredtypesStructcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_get_value_nullable'));

Pointer<Void> smokeLambdaswithstructuredtypesStructcallbackToFfiNullable(LambdasWithStructuredTypes_StructCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdaswithstructuredtypesStructcallbackToFfi(value);
  final result = _smokeLambdaswithstructuredtypesStructcallbackCreateHandleNullable(_handle);
  smokeLambdaswithstructuredtypesStructcallbackReleaseFfiHandle(_handle);
  return result;
}

LambdasWithStructuredTypes_StructCallback? smokeLambdaswithstructuredtypesStructcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdaswithstructuredtypesStructcallbackGetValueNullable(handle);
  final result = smokeLambdaswithstructuredtypesStructcallbackFromFfi(_handle);
  smokeLambdaswithstructuredtypesStructcallbackReleaseFfiHandle(_handle);
  return result;
}

void smokeLambdaswithstructuredtypesStructcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdaswithstructuredtypesStructcallbackReleaseHandleNullable(handle);

// End of LambdasWithStructuredTypes_StructCallback "private" section.

// LambdasWithStructuredTypes "private" section, not exported.

final _smokeLambdaswithstructuredtypesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_LambdasWithStructuredTypes_register_finalizer'));
final _smokeLambdaswithstructuredtypesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_copy_handle'));
final _smokeLambdaswithstructuredtypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_release_handle'));




class LambdasWithStructuredTypes$Impl extends __lib.NativeBase implements LambdasWithStructuredTypes {

  LambdasWithStructuredTypes$Impl(Pointer<Void> handle) : super(handle);

  @override
  void doClassStuff(LambdasWithStructuredTypes_ClassCallback callback) {
    final _doClassStuffFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LambdasWithStructuredTypes_doClassStuff__ClassCallback'));
    final _callbackHandle = smokeLambdaswithstructuredtypesClasscallbackToFfi(callback);
    final _handle = this.handle;
    _doClassStuffFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    smokeLambdaswithstructuredtypesClasscallbackReleaseFfiHandle(_callbackHandle);

  }

  @override
  void doStructStuff(LambdasWithStructuredTypes_StructCallback callback) {
    final _doStructStuffFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LambdasWithStructuredTypes_doStructStuff__StructCallback'));
    final _callbackHandle = smokeLambdaswithstructuredtypesStructcallbackToFfi(callback);
    final _handle = this.handle;
    _doStructStuffFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    smokeLambdaswithstructuredtypesStructcallbackReleaseFfiHandle(_callbackHandle);

  }


}

Pointer<Void> smokeLambdaswithstructuredtypesToFfi(LambdasWithStructuredTypes value) =>
  _smokeLambdaswithstructuredtypesCopyHandle((value as __lib.NativeBase).handle);

LambdasWithStructuredTypes smokeLambdaswithstructuredtypesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LambdasWithStructuredTypes) return instance;

  final _copiedHandle = _smokeLambdaswithstructuredtypesCopyHandle(handle);
  final result = LambdasWithStructuredTypes$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeLambdaswithstructuredtypesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeLambdaswithstructuredtypesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdaswithstructuredtypesReleaseHandle(handle);

Pointer<Void> smokeLambdaswithstructuredtypesToFfiNullable(LambdasWithStructuredTypes? value) =>
  value != null ? smokeLambdaswithstructuredtypesToFfi(value) : Pointer<Void>.fromAddress(0);

LambdasWithStructuredTypes? smokeLambdaswithstructuredtypesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeLambdaswithstructuredtypesFromFfi(handle) : null;

void smokeLambdaswithstructuredtypesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdaswithstructuredtypesReleaseHandle(handle);

// End of LambdasWithStructuredTypes "private" section.





import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;

abstract class ClassWithStructWithSkipLambdaInPlatform implements Finalizable {

}


class ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform {
  int intField;

  ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform(this.intField);
}


// ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform "private" section, not exported.

final _smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32),
    Pointer<Void> Function(int)
  >('library_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_create_handle'));
final _smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_release_handle'));
final _smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_get_field_intField'));



Pointer<Void> smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformToFfi(ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform value) {
  final _intFieldHandle = (value.intField);
  final _result = _smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformCreateHandle(_intFieldHandle);
  
  return _result;
}

ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformFromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformGetFieldintField(handle);
  try {
    return ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform(
      (_intFieldHandle)
    );
  } finally {
    
  }
}

void smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformReleaseFfiHandle(Pointer<Void> handle) => _smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformReleaseHandle(handle);

// Nullable ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform

final _smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_create_handle_nullable'));
final _smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_release_handle_nullable'));
final _smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_get_value_nullable'));

Pointer<Void> smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformToFfiNullable(ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformToFfi(value);
  final result = _smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformCreateHandleNullable(_handle);
  smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformReleaseFfiHandle(_handle);
  return result;
}

ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform? smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformGetValueNullable(handle);
  final result = smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformFromFfi(_handle);
  smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformReleaseFfiHandle(_handle);
  return result;
}

void smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeClasswithstructwithskiplambdainplatformSkiplambdainplatformReleaseHandleNullable(handle);

// End of ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform "private" section.

// ClassWithStructWithSkipLambdaInPlatform "private" section, not exported.

final _smokeClasswithstructwithskiplambdainplatformRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ClassWithStructWithSkipLambdaInPlatform_register_finalizer'));
final _smokeClasswithstructwithskiplambdainplatformCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithStructWithSkipLambdaInPlatform_copy_handle'));
final _smokeClasswithstructwithskiplambdainplatformReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithStructWithSkipLambdaInPlatform_release_handle'));


class ClassWithStructWithSkipLambdaInPlatform$Impl extends __lib.NativeBase implements ClassWithStructWithSkipLambdaInPlatform {

  ClassWithStructWithSkipLambdaInPlatform$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> smokeClasswithstructwithskiplambdainplatformToFfi(ClassWithStructWithSkipLambdaInPlatform value) =>
  _smokeClasswithstructwithskiplambdainplatformCopyHandle((value as __lib.NativeBase).handle);

ClassWithStructWithSkipLambdaInPlatform smokeClasswithstructwithskiplambdainplatformFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ClassWithStructWithSkipLambdaInPlatform) return instance;

  final _copiedHandle = _smokeClasswithstructwithskiplambdainplatformCopyHandle(handle);
  final result = ClassWithStructWithSkipLambdaInPlatform$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeClasswithstructwithskiplambdainplatformRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeClasswithstructwithskiplambdainplatformReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeClasswithstructwithskiplambdainplatformReleaseHandle(handle);

Pointer<Void> smokeClasswithstructwithskiplambdainplatformToFfiNullable(ClassWithStructWithSkipLambdaInPlatform? value) =>
  value != null ? smokeClasswithstructwithskiplambdainplatformToFfi(value) : Pointer<Void>.fromAddress(0);

ClassWithStructWithSkipLambdaInPlatform? smokeClasswithstructwithskiplambdainplatformFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeClasswithstructwithskiplambdainplatformFromFfi(handle) : null;

void smokeClasswithstructwithskiplambdainplatformReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeClasswithstructwithskiplambdainplatformReleaseHandle(handle);

// End of ClassWithStructWithSkipLambdaInPlatform "private" section.



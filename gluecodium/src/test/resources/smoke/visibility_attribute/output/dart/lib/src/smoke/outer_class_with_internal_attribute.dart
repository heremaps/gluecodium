

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;

/// @nodoc
abstract class OuterClassWithInternalAttribute implements Finalizable {

}


class OuterClassWithInternalAttribute_StructNestedInInternalClass {
  int someField;

  OuterClassWithInternalAttribute_StructNestedInInternalClass._(this.someField);
  OuterClassWithInternalAttribute_StructNestedInInternalClass()
    : someField = 2;
}


// OuterClassWithInternalAttribute_StructNestedInInternalClass "private" section, not exported.

final _smokeOuterclasswithinternalattributeStructnestedininternalclassCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32),
    Pointer<Void> Function(int)
  >('library_smoke_OuterClassWithInternalAttribute_StructNestedInInternalClass_create_handle'));
final _smokeOuterclasswithinternalattributeStructnestedininternalclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_StructNestedInInternalClass_release_handle'));
final _smokeOuterclasswithinternalattributeStructnestedininternalclassGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_StructNestedInInternalClass_get_field_someField'));



Pointer<Void> smokeOuterclasswithinternalattributeStructnestedininternalclassToFfi(OuterClassWithInternalAttribute_StructNestedInInternalClass value) {
  final _someFieldHandle = (value.someField);
  final _result = _smokeOuterclasswithinternalattributeStructnestedininternalclassCreateHandle(_someFieldHandle);
  
  return _result;
}

OuterClassWithInternalAttribute_StructNestedInInternalClass smokeOuterclasswithinternalattributeStructnestedininternalclassFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeOuterclasswithinternalattributeStructnestedininternalclassGetFieldsomeField(handle);
  try {
    return OuterClassWithInternalAttribute_StructNestedInInternalClass._(
      (_someFieldHandle)
    );
  } finally {
    
  }
}

void smokeOuterclasswithinternalattributeStructnestedininternalclassReleaseFfiHandle(Pointer<Void> handle) => _smokeOuterclasswithinternalattributeStructnestedininternalclassReleaseHandle(handle);

// Nullable OuterClassWithInternalAttribute_StructNestedInInternalClass

final _smokeOuterclasswithinternalattributeStructnestedininternalclassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_StructNestedInInternalClass_create_handle_nullable'));
final _smokeOuterclasswithinternalattributeStructnestedininternalclassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_StructNestedInInternalClass_release_handle_nullable'));
final _smokeOuterclasswithinternalattributeStructnestedininternalclassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_StructNestedInInternalClass_get_value_nullable'));

Pointer<Void> smokeOuterclasswithinternalattributeStructnestedininternalclassToFfiNullable(OuterClassWithInternalAttribute_StructNestedInInternalClass? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOuterclasswithinternalattributeStructnestedininternalclassToFfi(value);
  final result = _smokeOuterclasswithinternalattributeStructnestedininternalclassCreateHandleNullable(_handle);
  smokeOuterclasswithinternalattributeStructnestedininternalclassReleaseFfiHandle(_handle);
  return result;
}

OuterClassWithInternalAttribute_StructNestedInInternalClass? smokeOuterclasswithinternalattributeStructnestedininternalclassFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOuterclasswithinternalattributeStructnestedininternalclassGetValueNullable(handle);
  final result = smokeOuterclasswithinternalattributeStructnestedininternalclassFromFfi(_handle);
  smokeOuterclasswithinternalattributeStructnestedininternalclassReleaseFfiHandle(_handle);
  return result;
}

void smokeOuterclasswithinternalattributeStructnestedininternalclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterclasswithinternalattributeStructnestedininternalclassReleaseHandleNullable(handle);

// End of OuterClassWithInternalAttribute_StructNestedInInternalClass "private" section.
abstract class OuterClassWithInternalAttribute_ClassNestedInInternalClass implements Finalizable {

}


// OuterClassWithInternalAttribute_ClassNestedInInternalClass "private" section, not exported.

final _smokeOuterclasswithinternalattributeClassnestedininternalclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_OuterClassWithInternalAttribute_ClassNestedInInternalClass_register_finalizer'));
final _smokeOuterclasswithinternalattributeClassnestedininternalclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_ClassNestedInInternalClass_copy_handle'));
final _smokeOuterclasswithinternalattributeClassnestedininternalclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_ClassNestedInInternalClass_release_handle'));


class OuterClassWithInternalAttribute_ClassNestedInInternalClass$Impl extends __lib.NativeBase implements OuterClassWithInternalAttribute_ClassNestedInInternalClass {

  OuterClassWithInternalAttribute_ClassNestedInInternalClass$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> smokeOuterclasswithinternalattributeClassnestedininternalclassToFfi(OuterClassWithInternalAttribute_ClassNestedInInternalClass value) =>
  _smokeOuterclasswithinternalattributeClassnestedininternalclassCopyHandle((value as __lib.NativeBase).handle);

OuterClassWithInternalAttribute_ClassNestedInInternalClass smokeOuterclasswithinternalattributeClassnestedininternalclassFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OuterClassWithInternalAttribute_ClassNestedInInternalClass) return instance;

  final _copiedHandle = _smokeOuterclasswithinternalattributeClassnestedininternalclassCopyHandle(handle);
  final result = OuterClassWithInternalAttribute_ClassNestedInInternalClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeOuterclasswithinternalattributeClassnestedininternalclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeOuterclasswithinternalattributeClassnestedininternalclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterclasswithinternalattributeClassnestedininternalclassReleaseHandle(handle);

Pointer<Void> smokeOuterclasswithinternalattributeClassnestedininternalclassToFfiNullable(OuterClassWithInternalAttribute_ClassNestedInInternalClass? value) =>
  value != null ? smokeOuterclasswithinternalattributeClassnestedininternalclassToFfi(value) : Pointer<Void>.fromAddress(0);

OuterClassWithInternalAttribute_ClassNestedInInternalClass? smokeOuterclasswithinternalattributeClassnestedininternalclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterclasswithinternalattributeClassnestedininternalclassFromFfi(handle) : null;

void smokeOuterclasswithinternalattributeClassnestedininternalclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterclasswithinternalattributeClassnestedininternalclassReleaseHandle(handle);

// End of OuterClassWithInternalAttribute_ClassNestedInInternalClass "private" section.
typedef OuterClassWithInternalAttribute_LambdaNestedInInternalClass = void Function();

// OuterClassWithInternalAttribute_LambdaNestedInInternalClass "private" section, not exported.

final _smokeOuterclasswithinternalattributeLambdanestedininternalclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_OuterClassWithInternalAttribute_LambdaNestedInInternalClass_register_finalizer'));
final _smokeOuterclasswithinternalattributeLambdanestedininternalclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_LambdaNestedInInternalClass_copy_handle'));
final _smokeOuterclasswithinternalattributeLambdanestedininternalclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_LambdaNestedInInternalClass_release_handle'));
final _smokeOuterclasswithinternalattributeLambdanestedininternalclassCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_OuterClassWithInternalAttribute_LambdaNestedInInternalClass_create_proxy'));

class OuterClassWithInternalAttribute_LambdaNestedInInternalClass$Impl implements Finalizable {
  final Pointer<Void> handle;
  OuterClassWithInternalAttribute_LambdaNestedInInternalClass$Impl(this.handle);

  void call() {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_OuterClassWithInternalAttribute_LambdaNestedInInternalClass_call'));
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId);

  }

}

int _smokeOuterclasswithinternalattributeLambdanestedininternalclasscallStatic(Object _obj) {
  
  try {
    (_obj as OuterClassWithInternalAttribute_LambdaNestedInInternalClass)();
  } finally {
  }
  return 0;
}

Pointer<Void> smokeOuterclasswithinternalattributeLambdanestedininternalclassToFfi(OuterClassWithInternalAttribute_LambdaNestedInInternalClass value) =>
  _smokeOuterclasswithinternalattributeLambdanestedininternalclassCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeOuterclasswithinternalattributeLambdanestedininternalclasscallStatic, __lib.unknownError)
  );

OuterClassWithInternalAttribute_LambdaNestedInInternalClass smokeOuterclasswithinternalattributeLambdanestedininternalclassFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeOuterclasswithinternalattributeLambdanestedininternalclassCopyHandle(handle);
  final _impl = OuterClassWithInternalAttribute_LambdaNestedInInternalClass$Impl(_copiedHandle);
  final result = () => _impl.call();
  _smokeOuterclasswithinternalattributeLambdanestedininternalclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeOuterclasswithinternalattributeLambdanestedininternalclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterclasswithinternalattributeLambdanestedininternalclassReleaseHandle(handle);

// Nullable OuterClassWithInternalAttribute_LambdaNestedInInternalClass

final _smokeOuterclasswithinternalattributeLambdanestedininternalclassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_LambdaNestedInInternalClass_create_handle_nullable'));
final _smokeOuterclasswithinternalattributeLambdanestedininternalclassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_LambdaNestedInInternalClass_release_handle_nullable'));
final _smokeOuterclasswithinternalattributeLambdanestedininternalclassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_LambdaNestedInInternalClass_get_value_nullable'));

Pointer<Void> smokeOuterclasswithinternalattributeLambdanestedininternalclassToFfiNullable(OuterClassWithInternalAttribute_LambdaNestedInInternalClass? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOuterclasswithinternalattributeLambdanestedininternalclassToFfi(value);
  final result = _smokeOuterclasswithinternalattributeLambdanestedininternalclassCreateHandleNullable(_handle);
  smokeOuterclasswithinternalattributeLambdanestedininternalclassReleaseFfiHandle(_handle);
  return result;
}

OuterClassWithInternalAttribute_LambdaNestedInInternalClass? smokeOuterclasswithinternalattributeLambdanestedininternalclassFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOuterclasswithinternalattributeLambdanestedininternalclassGetValueNullable(handle);
  final result = smokeOuterclasswithinternalattributeLambdanestedininternalclassFromFfi(_handle);
  smokeOuterclasswithinternalattributeLambdanestedininternalclassReleaseFfiHandle(_handle);
  return result;
}

void smokeOuterclasswithinternalattributeLambdanestedininternalclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterclasswithinternalattributeLambdanestedininternalclassReleaseHandleNullable(handle);

// End of OuterClassWithInternalAttribute_LambdaNestedInInternalClass "private" section.

// OuterClassWithInternalAttribute "private" section, not exported.

final _smokeOuterclasswithinternalattributeRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_OuterClassWithInternalAttribute_register_finalizer'));
final _smokeOuterclasswithinternalattributeCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_copy_handle'));
final _smokeOuterclasswithinternalattributeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInternalAttribute_release_handle'));


class OuterClassWithInternalAttribute$Impl extends __lib.NativeBase implements OuterClassWithInternalAttribute {

  OuterClassWithInternalAttribute$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> smokeOuterclasswithinternalattributeToFfi(OuterClassWithInternalAttribute value) =>
  _smokeOuterclasswithinternalattributeCopyHandle((value as __lib.NativeBase).handle);

OuterClassWithInternalAttribute smokeOuterclasswithinternalattributeFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OuterClassWithInternalAttribute) return instance;

  final _copiedHandle = _smokeOuterclasswithinternalattributeCopyHandle(handle);
  final result = OuterClassWithInternalAttribute$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeOuterclasswithinternalattributeRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeOuterclasswithinternalattributeReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterclasswithinternalattributeReleaseHandle(handle);

Pointer<Void> smokeOuterclasswithinternalattributeToFfiNullable(OuterClassWithInternalAttribute? value) =>
  value != null ? smokeOuterclasswithinternalattributeToFfi(value) : Pointer<Void>.fromAddress(0);

OuterClassWithInternalAttribute? smokeOuterclasswithinternalattributeFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterclasswithinternalattributeFromFfi(handle) : null;

void smokeOuterclasswithinternalattributeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterclasswithinternalattributeReleaseHandle(handle);

// End of OuterClassWithInternalAttribute "private" section.



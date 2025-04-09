

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;

/// @nodoc

class OuterStructWithInternalAttribute {
  OuterStructWithInternalAttribute_StructNestedInInternalStruct inner;

  OuterStructWithInternalAttribute._(this.inner);
  OuterStructWithInternalAttribute()
    : inner = OuterStructWithInternalAttribute_StructNestedInInternalStruct();
}


class OuterStructWithInternalAttribute_StructNestedInInternalStruct {
  int someField;

  OuterStructWithInternalAttribute_StructNestedInInternalStruct._(this.someField);
  OuterStructWithInternalAttribute_StructNestedInInternalStruct()
    : someField = 1;
}


// OuterStructWithInternalAttribute_StructNestedInInternalStruct "private" section, not exported.

final _smokeOuterstructwithinternalattributeStructnestedininternalstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32),
    Pointer<Void> Function(int)
  >('library_smoke_OuterStructWithInternalAttribute_StructNestedInInternalStruct_create_handle'));
final _smokeOuterstructwithinternalattributeStructnestedininternalstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_StructNestedInInternalStruct_release_handle'));
final _smokeOuterstructwithinternalattributeStructnestedininternalstructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_StructNestedInInternalStruct_get_field_someField'));



Pointer<Void> smokeOuterstructwithinternalattributeStructnestedininternalstructToFfi(OuterStructWithInternalAttribute_StructNestedInInternalStruct value) {
  final _someFieldHandle = (value.someField);
  final _result = _smokeOuterstructwithinternalattributeStructnestedininternalstructCreateHandle(_someFieldHandle);
  
  return _result;
}

OuterStructWithInternalAttribute_StructNestedInInternalStruct smokeOuterstructwithinternalattributeStructnestedininternalstructFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeOuterstructwithinternalattributeStructnestedininternalstructGetFieldsomeField(handle);
  try {
    return OuterStructWithInternalAttribute_StructNestedInInternalStruct._(
      (_someFieldHandle)
    );
  } finally {
    
  }
}

void smokeOuterstructwithinternalattributeStructnestedininternalstructReleaseFfiHandle(Pointer<Void> handle) => _smokeOuterstructwithinternalattributeStructnestedininternalstructReleaseHandle(handle);

// Nullable OuterStructWithInternalAttribute_StructNestedInInternalStruct

final _smokeOuterstructwithinternalattributeStructnestedininternalstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_StructNestedInInternalStruct_create_handle_nullable'));
final _smokeOuterstructwithinternalattributeStructnestedininternalstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_StructNestedInInternalStruct_release_handle_nullable'));
final _smokeOuterstructwithinternalattributeStructnestedininternalstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_StructNestedInInternalStruct_get_value_nullable'));

Pointer<Void> smokeOuterstructwithinternalattributeStructnestedininternalstructToFfiNullable(OuterStructWithInternalAttribute_StructNestedInInternalStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOuterstructwithinternalattributeStructnestedininternalstructToFfi(value);
  final result = _smokeOuterstructwithinternalattributeStructnestedininternalstructCreateHandleNullable(_handle);
  smokeOuterstructwithinternalattributeStructnestedininternalstructReleaseFfiHandle(_handle);
  return result;
}

OuterStructWithInternalAttribute_StructNestedInInternalStruct? smokeOuterstructwithinternalattributeStructnestedininternalstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOuterstructwithinternalattributeStructnestedininternalstructGetValueNullable(handle);
  final result = smokeOuterstructwithinternalattributeStructnestedininternalstructFromFfi(_handle);
  smokeOuterstructwithinternalattributeStructnestedininternalstructReleaseFfiHandle(_handle);
  return result;
}

void smokeOuterstructwithinternalattributeStructnestedininternalstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterstructwithinternalattributeStructnestedininternalstructReleaseHandleNullable(handle);

// End of OuterStructWithInternalAttribute_StructNestedInInternalStruct "private" section.
abstract class OuterStructWithInternalAttribute_ClassNestedInInternalStruct implements Finalizable {

}


// OuterStructWithInternalAttribute_ClassNestedInInternalStruct "private" section, not exported.

final _smokeOuterstructwithinternalattributeClassnestedininternalstructRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_OuterStructWithInternalAttribute_ClassNestedInInternalStruct_register_finalizer'));
final _smokeOuterstructwithinternalattributeClassnestedininternalstructCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_ClassNestedInInternalStruct_copy_handle'));
final _smokeOuterstructwithinternalattributeClassnestedininternalstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_ClassNestedInInternalStruct_release_handle'));



class OuterStructWithInternalAttribute_ClassNestedInInternalStruct$Impl extends __lib.NativeBase implements OuterStructWithInternalAttribute_ClassNestedInInternalStruct {

  OuterStructWithInternalAttribute_ClassNestedInInternalStruct$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> smokeOuterstructwithinternalattributeClassnestedininternalstructToFfi(OuterStructWithInternalAttribute_ClassNestedInInternalStruct value) =>
  _smokeOuterstructwithinternalattributeClassnestedininternalstructCopyHandle((value as __lib.NativeBase).handle);

OuterStructWithInternalAttribute_ClassNestedInInternalStruct smokeOuterstructwithinternalattributeClassnestedininternalstructFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OuterStructWithInternalAttribute_ClassNestedInInternalStruct) return instance;

  final _copiedHandle = _smokeOuterstructwithinternalattributeClassnestedininternalstructCopyHandle(handle);
  final result = OuterStructWithInternalAttribute_ClassNestedInInternalStruct$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeOuterstructwithinternalattributeClassnestedininternalstructRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeOuterstructwithinternalattributeClassnestedininternalstructReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterstructwithinternalattributeClassnestedininternalstructReleaseHandle(handle);

Pointer<Void> smokeOuterstructwithinternalattributeClassnestedininternalstructToFfiNullable(OuterStructWithInternalAttribute_ClassNestedInInternalStruct? value) =>
  value != null ? smokeOuterstructwithinternalattributeClassnestedininternalstructToFfi(value) : Pointer<Void>.fromAddress(0);

OuterStructWithInternalAttribute_ClassNestedInInternalStruct? smokeOuterstructwithinternalattributeClassnestedininternalstructFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterstructwithinternalattributeClassnestedininternalstructFromFfi(handle) : null;

void smokeOuterstructwithinternalattributeClassnestedininternalstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterstructwithinternalattributeClassnestedininternalstructReleaseHandle(handle);

// End of OuterStructWithInternalAttribute_ClassNestedInInternalStruct "private" section.
typedef OuterStructWithInternalAttribute_LambdaNestedInInternalStruct = void Function();

// OuterStructWithInternalAttribute_LambdaNestedInInternalStruct "private" section, not exported.

final _smokeOuterstructwithinternalattributeLambdanestedininternalstructRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_OuterStructWithInternalAttribute_LambdaNestedInInternalStruct_register_finalizer'));
final _smokeOuterstructwithinternalattributeLambdanestedininternalstructCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_LambdaNestedInInternalStruct_copy_handle'));
final _smokeOuterstructwithinternalattributeLambdanestedininternalstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_LambdaNestedInInternalStruct_release_handle'));
final _smokeOuterstructwithinternalattributeLambdanestedininternalstructCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_OuterStructWithInternalAttribute_LambdaNestedInInternalStruct_create_proxy'));

class OuterStructWithInternalAttribute_LambdaNestedInInternalStruct$Impl implements Finalizable {
  final Pointer<Void> handle;
  OuterStructWithInternalAttribute_LambdaNestedInInternalStruct$Impl(this.handle);

  void call() {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_OuterStructWithInternalAttribute_LambdaNestedInInternalStruct_call'));
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId);

  }

}

void _smokeOuterstructwithinternalattributeLambdanestedininternalstructcallStatic(OuterStructWithInternalAttribute_LambdaNestedInInternalStruct _obj) {
  
  try {
    _obj();
  } finally {
  }
}

Pointer<Void> smokeOuterstructwithinternalattributeLambdanestedininternalstructToFfi(OuterStructWithInternalAttribute_LambdaNestedInInternalStruct value) {
  void __lambdaCaller() { _smokeOuterstructwithinternalattributeLambdanestedininternalstructcallStatic(value); }
  final __lambdaCallback = NativeCallable<Void Function()>.isolateLocal(__lambdaCaller);
  __lambdaCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __lambdaCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  return _smokeOuterstructwithinternalattributeLambdanestedininternalstructCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    __closeAllCallback.nativeFunction,
    __lambdaCallback.nativeFunction
  );
}

OuterStructWithInternalAttribute_LambdaNestedInInternalStruct smokeOuterstructwithinternalattributeLambdanestedininternalstructFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeOuterstructwithinternalattributeLambdanestedininternalstructCopyHandle(handle);
  final _impl = OuterStructWithInternalAttribute_LambdaNestedInInternalStruct$Impl(_copiedHandle);
  final result = () => _impl.call();
  _smokeOuterstructwithinternalattributeLambdanestedininternalstructRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeOuterstructwithinternalattributeLambdanestedininternalstructReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterstructwithinternalattributeLambdanestedininternalstructReleaseHandle(handle);

// Nullable OuterStructWithInternalAttribute_LambdaNestedInInternalStruct

final _smokeOuterstructwithinternalattributeLambdanestedininternalstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_LambdaNestedInInternalStruct_create_handle_nullable'));
final _smokeOuterstructwithinternalattributeLambdanestedininternalstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_LambdaNestedInInternalStruct_release_handle_nullable'));
final _smokeOuterstructwithinternalattributeLambdanestedininternalstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_LambdaNestedInInternalStruct_get_value_nullable'));

Pointer<Void> smokeOuterstructwithinternalattributeLambdanestedininternalstructToFfiNullable(OuterStructWithInternalAttribute_LambdaNestedInInternalStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOuterstructwithinternalattributeLambdanestedininternalstructToFfi(value);
  final result = _smokeOuterstructwithinternalattributeLambdanestedininternalstructCreateHandleNullable(_handle);
  smokeOuterstructwithinternalattributeLambdanestedininternalstructReleaseFfiHandle(_handle);
  return result;
}

OuterStructWithInternalAttribute_LambdaNestedInInternalStruct? smokeOuterstructwithinternalattributeLambdanestedininternalstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOuterstructwithinternalattributeLambdanestedininternalstructGetValueNullable(handle);
  final result = smokeOuterstructwithinternalattributeLambdanestedininternalstructFromFfi(_handle);
  smokeOuterstructwithinternalattributeLambdanestedininternalstructReleaseFfiHandle(_handle);
  return result;
}

void smokeOuterstructwithinternalattributeLambdanestedininternalstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterstructwithinternalattributeLambdanestedininternalstructReleaseHandleNullable(handle);

// End of OuterStructWithInternalAttribute_LambdaNestedInInternalStruct "private" section.

// OuterStructWithInternalAttribute "private" section, not exported.

final _smokeOuterstructwithinternalattributeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_create_handle'));
final _smokeOuterstructwithinternalattributeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_release_handle'));
final _smokeOuterstructwithinternalattributeGetFieldinner = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_get_field_inner'));



Pointer<Void> smokeOuterstructwithinternalattributeToFfi(OuterStructWithInternalAttribute value) {
  final _innerHandle = smokeOuterstructwithinternalattributeStructnestedininternalstructToFfi(value.inner);
  final _result = _smokeOuterstructwithinternalattributeCreateHandle(_innerHandle);
  smokeOuterstructwithinternalattributeStructnestedininternalstructReleaseFfiHandle(_innerHandle);
  return _result;
}

OuterStructWithInternalAttribute smokeOuterstructwithinternalattributeFromFfi(Pointer<Void> handle) {
  final _innerHandle = _smokeOuterstructwithinternalattributeGetFieldinner(handle);
  try {
    return OuterStructWithInternalAttribute._(
      smokeOuterstructwithinternalattributeStructnestedininternalstructFromFfi(_innerHandle)
    );
  } finally {
    smokeOuterstructwithinternalattributeStructnestedininternalstructReleaseFfiHandle(_innerHandle);
  }
}

void smokeOuterstructwithinternalattributeReleaseFfiHandle(Pointer<Void> handle) => _smokeOuterstructwithinternalattributeReleaseHandle(handle);

// Nullable OuterStructWithInternalAttribute

final _smokeOuterstructwithinternalattributeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_create_handle_nullable'));
final _smokeOuterstructwithinternalattributeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_release_handle_nullable'));
final _smokeOuterstructwithinternalattributeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithInternalAttribute_get_value_nullable'));

Pointer<Void> smokeOuterstructwithinternalattributeToFfiNullable(OuterStructWithInternalAttribute? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOuterstructwithinternalattributeToFfi(value);
  final result = _smokeOuterstructwithinternalattributeCreateHandleNullable(_handle);
  smokeOuterstructwithinternalattributeReleaseFfiHandle(_handle);
  return result;
}

OuterStructWithInternalAttribute? smokeOuterstructwithinternalattributeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOuterstructwithinternalattributeGetValueNullable(handle);
  final result = smokeOuterstructwithinternalattributeFromFfi(_handle);
  smokeOuterstructwithinternalattributeReleaseFfiHandle(_handle);
  return result;
}

void smokeOuterstructwithinternalattributeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterstructwithinternalattributeReleaseHandleNullable(handle);

// End of OuterStructWithInternalAttribute "private" section.



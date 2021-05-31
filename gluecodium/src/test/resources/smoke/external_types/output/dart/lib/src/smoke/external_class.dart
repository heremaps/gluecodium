import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class ExternalClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  someMethod(int someParameter);
  String get someProperty;
}
enum ExternalClass_SomeEnum {
    someValue
}
// ExternalClass_SomeEnum "private" section, not exported.
int smokeExternalclassSomeenumToFfi(ExternalClass_SomeEnum value) {
  switch (value) {
  case ExternalClass_SomeEnum.someValue:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for ExternalClass_SomeEnum enum.");
  }
}
ExternalClass_SomeEnum smokeExternalclassSomeenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ExternalClass_SomeEnum.someValue;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ExternalClass_SomeEnum enum.");
  }
}
void smokeExternalclassSomeenumReleaseFfiHandle(int handle) {}
final _smokeExternalclassSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ExternalClass_SomeEnum_create_handle_nullable'));
final _smokeExternalclassSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeEnum_release_handle_nullable'));
final _smokeExternalclassSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeEnum_get_value_nullable'));
Pointer<Void> smokeExternalclassSomeenumToFfiNullable(ExternalClass_SomeEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeExternalclassSomeenumToFfi(value);
  final result = _smokeExternalclassSomeenumCreateHandleNullable(_handle);
  smokeExternalclassSomeenumReleaseFfiHandle(_handle);
  return result;
}
ExternalClass_SomeEnum? smokeExternalclassSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeExternalclassSomeenumGetValueNullable(handle);
  final result = smokeExternalclassSomeenumFromFfi(_handle);
  smokeExternalclassSomeenumReleaseFfiHandle(_handle);
  return result;
}
void smokeExternalclassSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExternalclassSomeenumReleaseHandleNullable(handle);
// End of ExternalClass_SomeEnum "private" section.
class ExternalClass_SomeStruct {
  String someField;
  ExternalClass_SomeStruct(this.someField);
}
// ExternalClass_SomeStruct "private" section, not exported.
final _smokeExternalclassSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeStruct_create_handle'));
final _smokeExternalclassSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeStruct_release_handle'));
final _smokeExternalclassSomestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeStruct_get_field_someField'));
Pointer<Void> smokeExternalclassSomestructToFfi(ExternalClass_SomeStruct value) {
  final _someFieldHandle = stringToFfi(value.someField);
  final _result = _smokeExternalclassSomestructCreateHandle(_someFieldHandle);
  stringReleaseFfiHandle(_someFieldHandle);
  return _result;
}
ExternalClass_SomeStruct smokeExternalclassSomestructFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeExternalclassSomestructGetFieldsomeField(handle);
  try {
    return ExternalClass_SomeStruct(
      stringFromFfi(_someFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_someFieldHandle);
  }
}
void smokeExternalclassSomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeExternalclassSomestructReleaseHandle(handle);
// Nullable ExternalClass_SomeStruct
final _smokeExternalclassSomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeStruct_create_handle_nullable'));
final _smokeExternalclassSomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeStruct_release_handle_nullable'));
final _smokeExternalclassSomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeStruct_get_value_nullable'));
Pointer<Void> smokeExternalclassSomestructToFfiNullable(ExternalClass_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeExternalclassSomestructToFfi(value);
  final result = _smokeExternalclassSomestructCreateHandleNullable(_handle);
  smokeExternalclassSomestructReleaseFfiHandle(_handle);
  return result;
}
ExternalClass_SomeStruct? smokeExternalclassSomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeExternalclassSomestructGetValueNullable(handle);
  final result = smokeExternalclassSomestructFromFfi(_handle);
  smokeExternalclassSomestructReleaseFfiHandle(_handle);
  return result;
}
void smokeExternalclassSomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExternalclassSomestructReleaseHandleNullable(handle);
// End of ExternalClass_SomeStruct "private" section.
// ExternalClass "private" section, not exported.
final _smokeExternalclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_copy_handle'));
final _smokeExternalclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_release_handle'));
class ExternalClass$Impl extends __lib.NativeBase implements ExternalClass {
  ExternalClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheInstance(handle);
    _smokeExternalclassReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  someMethod(int someParameter) {
    final _someMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int8), void Function(Pointer<Void>, int, int)>('library_smoke_ExternalClass_someMethod__Byte'));
    final _someParameterHandle = (someParameter);
    final _handle = this.handle;
    final __resultHandle = _someMethodFfi(_handle, __lib.LibraryContext.isolateId, _someParameterHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  String get someProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ExternalClass_someProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeExternalclassToFfi(ExternalClass value) =>
  _smokeExternalclassCopyHandle((value as __lib.NativeBase).handle);
ExternalClass smokeExternalclassFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ExternalClass) return instance as ExternalClass;
  final _copiedHandle = _smokeExternalclassCopyHandle(handle);
  final result = ExternalClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  return result;
}
void smokeExternalclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeExternalclassReleaseHandle(handle);
Pointer<Void> smokeExternalclassToFfiNullable(ExternalClass? value) =>
  value != null ? smokeExternalclassToFfi(value) : Pointer<Void>.fromAddress(0);
ExternalClass? smokeExternalclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeExternalclassFromFfi(handle) : null;
void smokeExternalclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExternalclassReleaseHandle(handle);
// End of ExternalClass "private" section.

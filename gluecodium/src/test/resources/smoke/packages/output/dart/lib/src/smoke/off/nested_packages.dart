import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
abstract class NestedPackages {

  static NestedPackages_SomeStruct basicMethod(NestedPackages_SomeStruct input) => $prototype.basicMethod(input);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = NestedPackages$Impl(Pointer<Void>.fromAddress(0));
}
class NestedPackages_SomeStruct {
  String someField;
  NestedPackages_SomeStruct(this.someField);
}
// NestedPackages_SomeStruct "private" section, not exported.
final _smokeOffNestedpackagesSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_create_handle'));
final _smokeOffNestedpackagesSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_release_handle'));
final _smokeOffNestedpackagesSomestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_get_field_someField'));
Pointer<Void> smokeOffNestedpackagesSomestructToFfi(NestedPackages_SomeStruct value) {
  final _someFieldHandle = stringToFfi(value.someField);
  final _result = _smokeOffNestedpackagesSomestructCreateHandle(_someFieldHandle);
  stringReleaseFfiHandle(_someFieldHandle);
  return _result;
}
NestedPackages_SomeStruct smokeOffNestedpackagesSomestructFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeOffNestedpackagesSomestructGetFieldsomeField(handle);
  try {
    return NestedPackages_SomeStruct(
      stringFromFfi(_someFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_someFieldHandle);
  }
}
void smokeOffNestedpackagesSomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeOffNestedpackagesSomestructReleaseHandle(handle);
// Nullable NestedPackages_SomeStruct
final _smokeOffNestedpackagesSomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_create_handle_nullable'));
final _smokeOffNestedpackagesSomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_release_handle_nullable'));
final _smokeOffNestedpackagesSomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_get_value_nullable'));
Pointer<Void> smokeOffNestedpackagesSomestructToFfiNullable(NestedPackages_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOffNestedpackagesSomestructToFfi(value);
  final result = _smokeOffNestedpackagesSomestructCreateHandleNullable(_handle);
  smokeOffNestedpackagesSomestructReleaseFfiHandle(_handle);
  return result;
}
NestedPackages_SomeStruct? smokeOffNestedpackagesSomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOffNestedpackagesSomestructGetValueNullable(handle);
  final result = smokeOffNestedpackagesSomestructFromFfi(_handle);
  smokeOffNestedpackagesSomestructReleaseFfiHandle(_handle);
  return result;
}
void smokeOffNestedpackagesSomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOffNestedpackagesSomestructReleaseHandleNullable(handle);
// End of NestedPackages_SomeStruct "private" section.
// NestedPackages "private" section, not exported.
final _smokeOffNestedpackagesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_off_NestedPackages_register_finalizer'));
final _smokeOffNestedpackagesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_copy_handle'));
final _smokeOffNestedpackagesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_release_handle'));
/// @nodoc
@visibleForTesting
class NestedPackages$Impl extends __lib.NativeBase implements NestedPackages {
  NestedPackages$Impl(Pointer<Void> handle) : super(handle);

  NestedPackages_SomeStruct basicMethod(NestedPackages_SomeStruct input) {
    final _basicMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_off_NestedPackages_basicMethod__SomeStruct'));
    final _inputHandle = smokeOffNestedpackagesSomestructToFfi(input);
    final __resultHandle = _basicMethodFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeOffNestedpackagesSomestructReleaseFfiHandle(_inputHandle);
    try {
      return smokeOffNestedpackagesSomestructFromFfi(__resultHandle);
    } finally {
      smokeOffNestedpackagesSomestructReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeOffNestedpackagesToFfi(NestedPackages value) =>
  _smokeOffNestedpackagesCopyHandle((value as __lib.NativeBase).handle);
NestedPackages smokeOffNestedpackagesFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is NestedPackages) return instance;
  final _copiedHandle = _smokeOffNestedpackagesCopyHandle(handle);
  final result = NestedPackages$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeOffNestedpackagesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeOffNestedpackagesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOffNestedpackagesReleaseHandle(handle);
Pointer<Void> smokeOffNestedpackagesToFfiNullable(NestedPackages? value) =>
  value != null ? smokeOffNestedpackagesToFfi(value) : Pointer<Void>.fromAddress(0);
NestedPackages? smokeOffNestedpackagesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOffNestedpackagesFromFfi(handle) : null;
void smokeOffNestedpackagesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOffNestedpackagesReleaseHandle(handle);
// End of NestedPackages "private" section.

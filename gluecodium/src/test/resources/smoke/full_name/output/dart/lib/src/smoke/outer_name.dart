import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class OuterName {

}
class Futhark {
  String stringField;
  Futhark(this.stringField);
}
// Futhark "private" section, not exported.
final _smokeOuternameInnernameCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterName_InnerName_create_handle'));
final _smokeOuternameInnernameReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterName_InnerName_release_handle'));
final _smokeOuternameInnernameGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterName_InnerName_get_field_stringField'));
Pointer<Void> smokeOuternameInnernameToFfi(Futhark value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeOuternameInnernameCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
Futhark smokeOuternameInnernameFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeOuternameInnernameGetFieldstringField(handle);
  try {
    return Futhark(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeOuternameInnernameReleaseFfiHandle(Pointer<Void> handle) => _smokeOuternameInnernameReleaseHandle(handle);
// Nullable Futhark
final _smokeOuternameInnernameCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterName_InnerName_create_handle_nullable'));
final _smokeOuternameInnernameReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterName_InnerName_release_handle_nullable'));
final _smokeOuternameInnernameGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterName_InnerName_get_value_nullable'));
Pointer<Void> smokeOuternameInnernameToFfiNullable(Futhark? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOuternameInnernameToFfi(value);
  final result = _smokeOuternameInnernameCreateHandleNullable(_handle);
  smokeOuternameInnernameReleaseFfiHandle(_handle);
  return result;
}
Futhark? smokeOuternameInnernameFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOuternameInnernameGetValueNullable(handle);
  final result = smokeOuternameInnernameFromFfi(_handle);
  smokeOuternameInnernameReleaseFfiHandle(_handle);
  return result;
}
void smokeOuternameInnernameReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuternameInnernameReleaseHandleNullable(handle);
// End of Futhark "private" section.
// OuterName "private" section, not exported.
final _smokeOuternameRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_OuterName_register_finalizer'));
final _smokeOuternameCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterName_copy_handle'));
final _smokeOuternameReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterName_release_handle'));
class OuterName$Impl extends __lib.NativeBase implements OuterName {
  OuterName$Impl(Pointer<Void> handle) : super(handle);

}
Pointer<Void> smokeOuternameToFfi(OuterName value) =>
  _smokeOuternameCopyHandle((value as __lib.NativeBase).handle);
OuterName smokeOuternameFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OuterName) return instance;
  final _copiedHandle = _smokeOuternameCopyHandle(handle);
  final result = OuterName$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeOuternameRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeOuternameReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuternameReleaseHandle(handle);
Pointer<Void> smokeOuternameToFfiNullable(OuterName? value) =>
  value != null ? smokeOuternameToFfi(value) : Pointer<Void>.fromAddress(0);
OuterName? smokeOuternameFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuternameFromFfi(handle) : null;
void smokeOuternameReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuternameReleaseHandle(handle);
// End of OuterName "private" section.

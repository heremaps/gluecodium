import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class DeprecatedStructCtor {
  @Deprecated("Unfortunately, this field is deprecated.\nUse [Comments_SomeStruct.someField] instead.")
  String someField;
  DeprecatedStructCtor._(this.someField);
  // ignore: deprecated_member_use_from_same_package
  DeprecatedStructCtor._copy(DeprecatedStructCtor _other) : this._(_other.someField);
  DeprecatedStructCtor() : this._copy(_foo());
  static DeprecatedStructCtor _foo() {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_DeprecatedStructCtor_foo'));
    final __resultHandle = _fooFfi(__lib.LibraryContext.isolateId);
    try {
      return smokeDeprecatedstructctorFromFfi(__resultHandle);
    } finally {
      smokeDeprecatedstructctorReleaseFfiHandle(__resultHandle);
    }
  }
}
// DeprecatedStructCtor "private" section, not exported.
final _smokeDeprecatedstructctorCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedStructCtor_create_handle'));
final _smokeDeprecatedstructctorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecatedStructCtor_release_handle'));
final _smokeDeprecatedstructctorGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedStructCtor_get_field_someField'));
Pointer<Void> smokeDeprecatedstructctorToFfi(DeprecatedStructCtor value) {
  // ignore: deprecated_member_use_from_same_package
  final _someFieldHandle = stringToFfi(value.someField);
  final _result = _smokeDeprecatedstructctorCreateHandle(_someFieldHandle);
  stringReleaseFfiHandle(_someFieldHandle);
  return _result;
}
DeprecatedStructCtor smokeDeprecatedstructctorFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeDeprecatedstructctorGetFieldsomeField(handle);
  try {
    return DeprecatedStructCtor._(
      stringFromFfi(_someFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_someFieldHandle);
  }
}
void smokeDeprecatedstructctorReleaseFfiHandle(Pointer<Void> handle) => _smokeDeprecatedstructctorReleaseHandle(handle);
// Nullable DeprecatedStructCtor
final _smokeDeprecatedstructctorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedStructCtor_create_handle_nullable'));
final _smokeDeprecatedstructctorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecatedStructCtor_release_handle_nullable'));
final _smokeDeprecatedstructctorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedStructCtor_get_value_nullable'));
Pointer<Void> smokeDeprecatedstructctorToFfiNullable(DeprecatedStructCtor? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDeprecatedstructctorToFfi(value);
  final result = _smokeDeprecatedstructctorCreateHandleNullable(_handle);
  smokeDeprecatedstructctorReleaseFfiHandle(_handle);
  return result;
}
DeprecatedStructCtor? smokeDeprecatedstructctorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDeprecatedstructctorGetValueNullable(handle);
  final result = smokeDeprecatedstructctorFromFfi(_handle);
  smokeDeprecatedstructctorReleaseFfiHandle(_handle);
  return result;
}
void smokeDeprecatedstructctorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecatedstructctorReleaseHandleNullable(handle);
// End of DeprecatedStructCtor "private" section.

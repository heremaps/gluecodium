import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
class DartPublicElements {
  String stringField;
  DartPublicElements(this.stringField);
  void foo() => $prototype.foo(this);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = DartPublicElements$Impl();
}
// DartPublicElements "private" section, not exported.
final _smokeDartpublicelementsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartPublicElements_create_handle'));
final _smokeDartpublicelementsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartPublicElements_release_handle'));
final _smokeDartpublicelementsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartPublicElements_get_field_stringField'));
/// @nodoc
@visibleForTesting
class DartPublicElements$Impl {
  void foo(DartPublicElements $that) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_DartPublicElements_foo'));
    final _handle = smokeDartpublicelementsToFfi($that);
    _fooFfi(_handle, __lib.LibraryContext.isolateId);
    smokeDartpublicelementsReleaseFfiHandle(_handle);
  }
}
Pointer<Void> smokeDartpublicelementsToFfi(DartPublicElements value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeDartpublicelementsCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
DartPublicElements smokeDartpublicelementsFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeDartpublicelementsGetFieldstringField(handle);
  try {
    return DartPublicElements(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeDartpublicelementsReleaseFfiHandle(Pointer<Void> handle) => _smokeDartpublicelementsReleaseHandle(handle);
// Nullable DartPublicElements
final _smokeDartpublicelementsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartPublicElements_create_handle_nullable'));
final _smokeDartpublicelementsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartPublicElements_release_handle_nullable'));
final _smokeDartpublicelementsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartPublicElements_get_value_nullable'));
Pointer<Void> smokeDartpublicelementsToFfiNullable(DartPublicElements? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDartpublicelementsToFfi(value);
  final result = _smokeDartpublicelementsCreateHandleNullable(_handle);
  smokeDartpublicelementsReleaseFfiHandle(_handle);
  return result;
}
DartPublicElements? smokeDartpublicelementsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDartpublicelementsGetValueNullable(handle);
  final result = smokeDartpublicelementsFromFfi(_handle);
  smokeDartpublicelementsReleaseFfiHandle(_handle);
  return result;
}
void smokeDartpublicelementsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartpublicelementsReleaseHandleNullable(handle);
// End of DartPublicElements "private" section.

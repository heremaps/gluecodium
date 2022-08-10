import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
class DartPublicElementsEnabled {
  bool boolField;
  String stringField;
  DartPublicElementsEnabled(this.boolField, this.stringField);
  void foo() => $prototype.foo(this);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = DartPublicElementsEnabled$Impl();
}
// DartPublicElementsEnabled "private" section, not exported.
final _smokeDartpublicelementsenabledCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_DartPublicElementsEnabled_create_handle'));
final _smokeDartpublicelementsenabledReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartPublicElementsEnabled_release_handle'));
final _smokeDartpublicelementsenabledGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DartPublicElementsEnabled_get_field_boolField'));
final _smokeDartpublicelementsenabledGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartPublicElementsEnabled_get_field_stringField'));
/// @nodoc
@visibleForTesting
class DartPublicElementsEnabled$Impl {
  void foo(DartPublicElementsEnabled $that) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_DartPublicElementsEnabled_foo'));
    final _handle = smokeDartpublicelementsenabledToFfi($that);
    _fooFfi(_handle, __lib.LibraryContext.isolateId);
    smokeDartpublicelementsenabledReleaseFfiHandle(_handle);
  }
}
Pointer<Void> smokeDartpublicelementsenabledToFfi(DartPublicElementsEnabled value) {
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeDartpublicelementsenabledCreateHandle(_boolFieldHandle, _stringFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
DartPublicElementsEnabled smokeDartpublicelementsenabledFromFfi(Pointer<Void> handle) {
  final _boolFieldHandle = _smokeDartpublicelementsenabledGetFieldboolField(handle);
  final _stringFieldHandle = _smokeDartpublicelementsenabledGetFieldstringField(handle);
  try {
    return DartPublicElementsEnabled(
      booleanFromFfi(_boolFieldHandle),
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_boolFieldHandle);
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeDartpublicelementsenabledReleaseFfiHandle(Pointer<Void> handle) => _smokeDartpublicelementsenabledReleaseHandle(handle);
// Nullable DartPublicElementsEnabled
final _smokeDartpublicelementsenabledCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartPublicElementsEnabled_create_handle_nullable'));
final _smokeDartpublicelementsenabledReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartPublicElementsEnabled_release_handle_nullable'));
final _smokeDartpublicelementsenabledGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartPublicElementsEnabled_get_value_nullable'));
Pointer<Void> smokeDartpublicelementsenabledToFfiNullable(DartPublicElementsEnabled? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDartpublicelementsenabledToFfi(value);
  final result = _smokeDartpublicelementsenabledCreateHandleNullable(_handle);
  smokeDartpublicelementsenabledReleaseFfiHandle(_handle);
  return result;
}
DartPublicElementsEnabled? smokeDartpublicelementsenabledFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDartpublicelementsenabledGetValueNullable(handle);
  final result = smokeDartpublicelementsenabledFromFfi(_handle);
  smokeDartpublicelementsenabledReleaseFfiHandle(_handle);
  return result;
}
void smokeDartpublicelementsenabledReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartpublicelementsenabledReleaseHandleNullable(handle);
// End of DartPublicElementsEnabled "private" section.

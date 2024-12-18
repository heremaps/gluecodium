

import 'dart:ffi';
import 'dart:math' as math;
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/smoke/rectangle_int_.dart';


class ExternalDartConstants {
  static final math.Rectangle<int> small = math.Rectangle<int>(0, 0, 1, 1);

  static final math.Rectangle<int> big = math.Rectangle<int>(0, 0, 10, 10);

}


// ExternalDartConstants "private" section, not exported.

final _smokeExternaldartconstantsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_smoke_ExternalDartConstants_create_handle'));
final _smokeExternaldartconstantsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalDartConstants_release_handle'));



Pointer<Void> smokeExternaldartconstantsToFfi(ExternalDartConstants value) {
  final _result = _smokeExternaldartconstantsCreateHandle();
  return _result;
}

ExternalDartConstants smokeExternaldartconstantsFromFfi(Pointer<Void> handle) {
  try {
    return ExternalDartConstants(
    );
  } finally {
  }
}

void smokeExternaldartconstantsReleaseFfiHandle(Pointer<Void> handle) => _smokeExternaldartconstantsReleaseHandle(handle);

// Nullable ExternalDartConstants

final _smokeExternaldartconstantsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalDartConstants_create_handle_nullable'));
final _smokeExternaldartconstantsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalDartConstants_release_handle_nullable'));
final _smokeExternaldartconstantsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalDartConstants_get_value_nullable'));

Pointer<Void> smokeExternaldartconstantsToFfiNullable(ExternalDartConstants? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeExternaldartconstantsToFfi(value);
  final result = _smokeExternaldartconstantsCreateHandleNullable(_handle);
  smokeExternaldartconstantsReleaseFfiHandle(_handle);
  return result;
}

ExternalDartConstants? smokeExternaldartconstantsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeExternaldartconstantsGetValueNullable(handle);
  final result = smokeExternaldartconstantsFromFfi(_handle);
  smokeExternaldartconstantsReleaseFfiHandle(_handle);
  return result;
}

void smokeExternaldartconstantsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExternaldartconstantsReleaseHandleNullable(handle);

// End of ExternalDartConstants "private" section.



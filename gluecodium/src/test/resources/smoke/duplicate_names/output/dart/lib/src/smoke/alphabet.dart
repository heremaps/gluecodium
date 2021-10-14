import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
enum Alphabet {
    a,
    b,
    c
}
// Alphabet "private" section, not exported.
int smokeAlphabetToFfi(Alphabet value) {
  switch (value) {
  case Alphabet.a:
    return 0;
  case Alphabet.b:
    return 1;
  case Alphabet.c:
    return 2;
  default:
    throw StateError("Invalid enum value $value for Alphabet enum.");
  }
}
Alphabet smokeAlphabetFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Alphabet.a;
  case 1:
    return Alphabet.b;
  case 2:
    return Alphabet.c;
  default:
    throw StateError("Invalid numeric value $handle for Alphabet enum.");
  }
}
void smokeAlphabetReleaseFfiHandle(int handle) {}
final _smokeAlphabetCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Alphabet_create_handle_nullable'));
final _smokeAlphabetReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Alphabet_release_handle_nullable'));
final _smokeAlphabetGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Alphabet_get_value_nullable'));
Pointer<Void> smokeAlphabetToFfiNullable(Alphabet? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeAlphabetToFfi(value);
  final result = _smokeAlphabetCreateHandleNullable(_handle);
  smokeAlphabetReleaseFfiHandle(_handle);
  return result;
}
Alphabet? smokeAlphabetFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeAlphabetGetValueNullable(handle);
  final result = smokeAlphabetFromFfi(_handle);
  smokeAlphabetReleaseFfiHandle(_handle);
  return result;
}
void smokeAlphabetReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAlphabetReleaseHandleNullable(handle);
// End of Alphabet "private" section.

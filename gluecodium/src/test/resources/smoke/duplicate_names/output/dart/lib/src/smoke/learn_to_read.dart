import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/smoke/alphabet.dart' as smoke;
import 'package:library/src/smoke/foo/alphabet.dart' as smoke_foo;
class LearnToRead {
  smoke.Alphabet fieldA;
  smoke_foo.Alphabet fieldB;
  LearnToRead(this.fieldA, this.fieldB);
  LearnToRead.withDefaults()
    : fieldA = smoke.Alphabet.a, fieldB = smoke_foo.Alphabet.beta;
}
// LearnToRead "private" section, not exported.
final _smokeLearntoreadCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint32),
    Pointer<Void> Function(int, int)
  >('library_smoke_LearnToRead_create_handle'));
final _smokeLearntoreadReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LearnToRead_release_handle'));
final _smokeLearntoreadGetFieldfieldA = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_LearnToRead_get_field_fieldA'));
final _smokeLearntoreadGetFieldfieldB = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_LearnToRead_get_field_fieldB'));
Pointer<Void> smokeLearntoreadToFfi(LearnToRead value) {
  final _fieldAHandle = smoke.smokeAlphabetToFfi(value.fieldA);
  final _fieldBHandle = smoke_foo.smokeFooAlphabetToFfi(value.fieldB);
  final _result = _smokeLearntoreadCreateHandle(_fieldAHandle, _fieldBHandle);
  smoke.smokeAlphabetReleaseFfiHandle(_fieldAHandle);
  smoke_foo.smokeFooAlphabetReleaseFfiHandle(_fieldBHandle);
  return _result;
}
LearnToRead smokeLearntoreadFromFfi(Pointer<Void> handle) {
  final _fieldAHandle = _smokeLearntoreadGetFieldfieldA(handle);
  final _fieldBHandle = _smokeLearntoreadGetFieldfieldB(handle);
  try {
    return LearnToRead(
      smoke.smokeAlphabetFromFfi(_fieldAHandle),
      smoke_foo.smokeFooAlphabetFromFfi(_fieldBHandle)
    );
  } finally {
    smoke.smokeAlphabetReleaseFfiHandle(_fieldAHandle);
    smoke_foo.smokeFooAlphabetReleaseFfiHandle(_fieldBHandle);
  }
}
void smokeLearntoreadReleaseFfiHandle(Pointer<Void> handle) => _smokeLearntoreadReleaseHandle(handle);
// Nullable LearnToRead
final _smokeLearntoreadCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LearnToRead_create_handle_nullable'));
final _smokeLearntoreadReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LearnToRead_release_handle_nullable'));
final _smokeLearntoreadGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LearnToRead_get_value_nullable'));
Pointer<Void> smokeLearntoreadToFfiNullable(LearnToRead? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLearntoreadToFfi(value);
  final result = _smokeLearntoreadCreateHandleNullable(_handle);
  smokeLearntoreadReleaseFfiHandle(_handle);
  return result;
}
LearnToRead? smokeLearntoreadFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLearntoreadGetValueNullable(handle);
  final result = smokeLearntoreadFromFfi(_handle);
  smokeLearntoreadReleaseFfiHandle(_handle);
  return result;
}
void smokeLearntoreadReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLearntoreadReleaseHandleNullable(handle);
// End of LearnToRead "private" section.

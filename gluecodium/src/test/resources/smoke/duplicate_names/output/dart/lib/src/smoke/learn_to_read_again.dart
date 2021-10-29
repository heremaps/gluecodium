import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/smoke/bar/alphabet.dart' as smoke_bar;
import 'package:library/src/smoke/foo/alphabet.dart' as smoke_foo;
class LearnToReadAgain {
  smoke_foo.Alphabet fieldB;
  smoke_bar.Alphabet fieldC;
  LearnToReadAgain(this.fieldB, this.fieldC);
  LearnToReadAgain.withDefaults()
    : fieldB = smoke_foo.Alphabet.beta, fieldC = smoke_bar.Alphabet.gimel;
}
// LearnToReadAgain "private" section, not exported.
final _smokeLearntoreadagainCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint32),
    Pointer<Void> Function(int, int)
  >('library_smoke_LearnToReadAgain_create_handle'));
final _smokeLearntoreadagainReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LearnToReadAgain_release_handle'));
final _smokeLearntoreadagainGetFieldfieldB = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_LearnToReadAgain_get_field_fieldB'));
final _smokeLearntoreadagainGetFieldfieldC = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_LearnToReadAgain_get_field_fieldC'));
Pointer<Void> smokeLearntoreadagainToFfi(LearnToReadAgain value) {
  final _fieldBHandle = smoke_foo.smokeFooAlphabetToFfi(value.fieldB);
  final _fieldCHandle = smoke_bar.smokeBarAlphabetToFfi(value.fieldC);
  final _result = _smokeLearntoreadagainCreateHandle(_fieldBHandle, _fieldCHandle);
  smoke_foo.smokeFooAlphabetReleaseFfiHandle(_fieldBHandle);
  smoke_bar.smokeBarAlphabetReleaseFfiHandle(_fieldCHandle);
  return _result;
}
LearnToReadAgain smokeLearntoreadagainFromFfi(Pointer<Void> handle) {
  final _fieldBHandle = _smokeLearntoreadagainGetFieldfieldB(handle);
  final _fieldCHandle = _smokeLearntoreadagainGetFieldfieldC(handle);
  try {
    return LearnToReadAgain(
      smoke_foo.smokeFooAlphabetFromFfi(_fieldBHandle),
      smoke_bar.smokeBarAlphabetFromFfi(_fieldCHandle)
    );
  } finally {
    smoke_foo.smokeFooAlphabetReleaseFfiHandle(_fieldBHandle);
    smoke_bar.smokeBarAlphabetReleaseFfiHandle(_fieldCHandle);
  }
}
void smokeLearntoreadagainReleaseFfiHandle(Pointer<Void> handle) => _smokeLearntoreadagainReleaseHandle(handle);
// Nullable LearnToReadAgain
final _smokeLearntoreadagainCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LearnToReadAgain_create_handle_nullable'));
final _smokeLearntoreadagainReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LearnToReadAgain_release_handle_nullable'));
final _smokeLearntoreadagainGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LearnToReadAgain_get_value_nullable'));
Pointer<Void> smokeLearntoreadagainToFfiNullable(LearnToReadAgain? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLearntoreadagainToFfi(value);
  final result = _smokeLearntoreadagainCreateHandleNullable(_handle);
  smokeLearntoreadagainReleaseFfiHandle(_handle);
  return result;
}
LearnToReadAgain? smokeLearntoreadagainFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLearntoreadagainGetValueNullable(handle);
  final result = smokeLearntoreadagainFromFfi(_handle);
  smokeLearntoreadagainReleaseFfiHandle(_handle);
  return result;
}
void smokeLearntoreadagainReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLearntoreadagainReleaseHandleNullable(handle);
// End of LearnToReadAgain "private" section.

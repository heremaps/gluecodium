import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
class SkipTypesTags {
  static final bool placeHolder = true;
}
// SkipTypesTags "private" section, not exported.
final _smokeSkiptypestagsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_smoke_SkipTypesTags_create_handle'));
final _smokeSkiptypestagsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTypesTags_release_handle'));
Pointer<Void> smokeSkiptypestagsToFfi(SkipTypesTags value) {
  final _result = _smokeSkiptypestagsCreateHandle();
  return _result;
}
SkipTypesTags smokeSkiptypestagsFromFfi(Pointer<Void> handle) {
  try {
    return SkipTypesTags(
    );
  } finally {
  }
}
void smokeSkiptypestagsReleaseFfiHandle(Pointer<Void> handle) => _smokeSkiptypestagsReleaseHandle(handle);
// Nullable SkipTypesTags
final _smokeSkiptypestagsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypesTags_create_handle_nullable'));
final _smokeSkiptypestagsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTypesTags_release_handle_nullable'));
final _smokeSkiptypestagsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypesTags_get_value_nullable'));
Pointer<Void> smokeSkiptypestagsToFfiNullable(SkipTypesTags? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeSkiptypestagsToFfi(value);
  final result = _smokeSkiptypestagsCreateHandleNullable(_handle);
  smokeSkiptypestagsReleaseFfiHandle(_handle);
  return result;
}
SkipTypesTags? smokeSkiptypestagsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeSkiptypestagsGetValueNullable(handle);
  final result = smokeSkiptypestagsFromFfi(_handle);
  smokeSkiptypestagsReleaseFfiHandle(_handle);
  return result;
}
void smokeSkiptypestagsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSkiptypestagsReleaseHandleNullable(handle);
// End of SkipTypesTags "private" section.

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/smoke/constants.dart';
class CrossFileConstants {
  static final Constants_StateEnum fooBar = Constants_StateEnum.on;
}
// CrossFileConstants "private" section, not exported.
final _smokeCrossfileconstantsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_smoke_CrossFileConstants_create_handle'));
final _smokeCrossfileconstantsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CrossFileConstants_release_handle'));
Pointer<Void> smokeCrossfileconstantsToFfi(CrossFileConstants value) {
  final _result = _smokeCrossfileconstantsCreateHandle();
  return _result;
}
CrossFileConstants smokeCrossfileconstantsFromFfi(Pointer<Void> handle) {
  try {
    return CrossFileConstants(
    );
  } finally {
  }
}
void smokeCrossfileconstantsReleaseFfiHandle(Pointer<Void> handle) => _smokeCrossfileconstantsReleaseHandle(handle);
// Nullable CrossFileConstants
final _smokeCrossfileconstantsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CrossFileConstants_create_handle_nullable'));
final _smokeCrossfileconstantsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CrossFileConstants_release_handle_nullable'));
final _smokeCrossfileconstantsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CrossFileConstants_get_value_nullable'));
Pointer<Void> smokeCrossfileconstantsToFfiNullable(CrossFileConstants? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeCrossfileconstantsToFfi(value);
  final result = _smokeCrossfileconstantsCreateHandleNullable(_handle);
  smokeCrossfileconstantsReleaseFfiHandle(_handle);
  return result;
}
CrossFileConstants? smokeCrossfileconstantsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeCrossfileconstantsGetValueNullable(handle);
  final result = smokeCrossfileconstantsFromFfi(_handle);
  smokeCrossfileconstantsReleaseFfiHandle(_handle);
  return result;
}
void smokeCrossfileconstantsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCrossfileconstantsReleaseHandleNullable(handle);
// End of CrossFileConstants "private" section.

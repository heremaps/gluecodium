import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/smoke/simple_class.dart';
class StructWithClass {
  SimpleClass classInstance;
  StructWithClass(this.classInstance);
}
// StructWithClass "private" section, not exported.
final _smokeStructwithclassCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithClass_create_handle'));
final _smokeStructwithclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithClass_release_handle'));
final _smokeStructwithclassGetFieldclassInstance = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithClass_get_field_classInstance'));
Pointer<Void> smokeStructwithclassToFfi(StructWithClass value) {
  final _classInstanceHandle = smokeSimpleclassToFfi(value.classInstance);
  final _result = _smokeStructwithclassCreateHandle(_classInstanceHandle);
  smokeSimpleclassReleaseFfiHandle(_classInstanceHandle);
  return _result;
}
StructWithClass smokeStructwithclassFromFfi(Pointer<Void> handle) {
  final _classInstanceHandle = _smokeStructwithclassGetFieldclassInstance(handle);
  try {
    return StructWithClass(
      smokeSimpleclassFromFfi(_classInstanceHandle)
    );
  } finally {
    smokeSimpleclassReleaseFfiHandle(_classInstanceHandle);
  }
}
void smokeStructwithclassReleaseFfiHandle(Pointer<Void> handle) => _smokeStructwithclassReleaseHandle(handle);
// Nullable StructWithClass
final _smokeStructwithclassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithClass_create_handle_nullable'));
final _smokeStructwithclassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithClass_release_handle_nullable'));
final _smokeStructwithclassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithClass_get_value_nullable'));
Pointer<Void> smokeStructwithclassToFfiNullable(StructWithClass? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructwithclassToFfi(value);
  final result = _smokeStructwithclassCreateHandleNullable(_handle);
  smokeStructwithclassReleaseFfiHandle(_handle);
  return result;
}
StructWithClass? smokeStructwithclassFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructwithclassGetValueNullable(handle);
  final result = smokeStructwithclassFromFfi(_handle);
  smokeStructwithclassReleaseFfiHandle(_handle);
  return result;
}
void smokeStructwithclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructwithclassReleaseHandleNullable(handle);
// End of StructWithClass "private" section.

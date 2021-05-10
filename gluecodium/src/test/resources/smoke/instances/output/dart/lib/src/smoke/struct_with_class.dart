import 'package:library/src/smoke/simple_class.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
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
Pointer<Void> smoke_StructWithClass_toFfi(StructWithClass value) {
  final _classInstanceHandle = smoke_SimpleClass_toFfi(value.classInstance);
  final _result = _smokeStructwithclassCreateHandle(_classInstanceHandle);
  smoke_SimpleClass_releaseFfiHandle(_classInstanceHandle);
  return _result;
}
StructWithClass smoke_StructWithClass_fromFfi(Pointer<Void> handle) {
  final _classInstanceHandle = _smokeStructwithclassGetFieldclassInstance(handle);
  try {
    return StructWithClass(
      smoke_SimpleClass_fromFfi(_classInstanceHandle)
    );
  } finally {
    smoke_SimpleClass_releaseFfiHandle(_classInstanceHandle);
  }
}
void smoke_StructWithClass_releaseFfiHandle(Pointer<Void> handle) => _smokeStructwithclassReleaseHandle(handle);
// Nullable StructWithClass
final _smoke_StructWithClassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithClass_create_handle_nullable'));
final _smoke_StructWithClassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithClass_release_handle_nullable'));
final _smoke_StructWithClassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithClass_get_value_nullable'));
Pointer<Void> smoke_StructWithClass_toFfi_nullable(StructWithClass value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithClass_toFfi(value);
  final result = _smoke_StructWithClassCreateHandleNullable(_handle);
  smoke_StructWithClass_releaseFfiHandle(_handle);
  return result;
}
StructWithClass smoke_StructWithClass_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithClassGetValueNullable(handle);
  final result = smoke_StructWithClass_fromFfi(_handle);
  smoke_StructWithClass_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithClassReleaseHandleNullable(handle);
// End of StructWithClass "private" section.

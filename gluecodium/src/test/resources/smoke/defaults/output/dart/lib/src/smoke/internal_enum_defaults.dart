import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/foo_bar_enum.dart';
import 'package:meta/meta.dart';
class InternalEnumDefaults {
  FooBarEnum publicField;
  List<FooBarEnum> publicListField;
  /// @nodoc
  @internal
  FooBarEnum internal_internalField;
  /// @nodoc
  @internal
  List<FooBarEnum> internal_internalListField;
  InternalEnumDefaults(this.publicField, this.publicListField, this.internal_internalField, this.internal_internalListField);
  InternalEnumDefaults.withDefaults()
    : publicField = FooBarEnum.foo, publicListField = [FooBarEnum.foo, FooBarEnum.bar, FooBarEnum.baz], internal_internalField = FooBarEnum.bar, internal_internalListField = [FooBarEnum.foo, FooBarEnum.bar, FooBarEnum.baz];
}
// InternalEnumDefaults "private" section, not exported.
final _smokeInternalenumdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Uint32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, int, Pointer<Void>)
  >('library_smoke_InternalEnumDefaults_create_handle'));
final _smokeInternalenumdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalEnumDefaults_release_handle'));
final _smokeInternalenumdefaultsGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_InternalEnumDefaults_get_field_publicField'));
final _smokeInternalenumdefaultsGetFieldpublicListField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalEnumDefaults_get_field_publicListField'));
final _smokeInternalenumdefaultsGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_InternalEnumDefaults_get_field_internalField'));
final _smokeInternalenumdefaultsGetFieldinternalListField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalEnumDefaults_get_field_internalListField'));
Pointer<Void> smokeInternalenumdefaultsToFfi(InternalEnumDefaults value) {
  final _publicFieldHandle = smokeFoobarenumToFfi(value.publicField);
  final _publicListFieldHandle = listofSmokeFoobarenumToFfi(value.publicListField);
  final _internalFieldHandle = smokeFoobarenumToFfi(value.internal_internalField);
  final _internalListFieldHandle = listofSmokeFoobarenumToFfi(value.internal_internalListField);
  final _result = _smokeInternalenumdefaultsCreateHandle(_publicFieldHandle, _publicListFieldHandle, _internalFieldHandle, _internalListFieldHandle);
  smokeFoobarenumReleaseFfiHandle(_publicFieldHandle);
  listofSmokeFoobarenumReleaseFfiHandle(_publicListFieldHandle);
  smokeFoobarenumReleaseFfiHandle(_internalFieldHandle);
  listofSmokeFoobarenumReleaseFfiHandle(_internalListFieldHandle);
  return _result;
}
InternalEnumDefaults smokeInternalenumdefaultsFromFfi(Pointer<Void> handle) {
  final _publicFieldHandle = _smokeInternalenumdefaultsGetFieldpublicField(handle);
  final _publicListFieldHandle = _smokeInternalenumdefaultsGetFieldpublicListField(handle);
  final _internalFieldHandle = _smokeInternalenumdefaultsGetFieldinternalField(handle);
  final _internalListFieldHandle = _smokeInternalenumdefaultsGetFieldinternalListField(handle);
  try {
    return InternalEnumDefaults(
      smokeFoobarenumFromFfi(_publicFieldHandle),
      listofSmokeFoobarenumFromFfi(_publicListFieldHandle),
      smokeFoobarenumFromFfi(_internalFieldHandle),
      listofSmokeFoobarenumFromFfi(_internalListFieldHandle)
    );
  } finally {
    smokeFoobarenumReleaseFfiHandle(_publicFieldHandle);
    listofSmokeFoobarenumReleaseFfiHandle(_publicListFieldHandle);
    smokeFoobarenumReleaseFfiHandle(_internalFieldHandle);
    listofSmokeFoobarenumReleaseFfiHandle(_internalListFieldHandle);
  }
}
void smokeInternalenumdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeInternalenumdefaultsReleaseHandle(handle);
// Nullable InternalEnumDefaults
final _smokeInternalenumdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalEnumDefaults_create_handle_nullable'));
final _smokeInternalenumdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalEnumDefaults_release_handle_nullable'));
final _smokeInternalenumdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalEnumDefaults_get_value_nullable'));
Pointer<Void> smokeInternalenumdefaultsToFfiNullable(InternalEnumDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeInternalenumdefaultsToFfi(value);
  final result = _smokeInternalenumdefaultsCreateHandleNullable(_handle);
  smokeInternalenumdefaultsReleaseFfiHandle(_handle);
  return result;
}
InternalEnumDefaults? smokeInternalenumdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeInternalenumdefaultsGetValueNullable(handle);
  final result = smokeInternalenumdefaultsFromFfi(_handle);
  smokeInternalenumdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeInternalenumdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInternalenumdefaultsReleaseHandleNullable(handle);
// End of InternalEnumDefaults "private" section.

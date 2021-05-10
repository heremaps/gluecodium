import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class EquatableStructWithInternalFields {
  String publicField;
  /// @nodoc
  String internal_internalField;
  /// @nodoc
  List<String> internal_internalListField;
  /// @nodoc
  Map<String, String> internal_internalMapField;
  /// @nodoc
  Set<String> internal_internalSetField;
  EquatableStructWithInternalFields(this.publicField, this.internal_internalField, this.internal_internalListField, this.internal_internalMapField, this.internal_internalSetField);
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EquatableStructWithInternalFields) return false;
    EquatableStructWithInternalFields _other = other;
    return publicField == _other.publicField &&
        internal_internalField == _other.internal_internalField &&
        DeepCollectionEquality().equals(internal_internalListField, _other.internal_internalListField) &&
        DeepCollectionEquality().equals(internal_internalMapField, _other.internal_internalMapField) &&
        DeepCollectionEquality().equals(internal_internalSetField, _other.internal_internalSetField);
  }
  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + publicField.hashCode;
    result = 31 * result + internal_internalField.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(internal_internalListField);
    result = 31 * result + DeepCollectionEquality().hash(internal_internalMapField);
    result = 31 * result + DeepCollectionEquality().hash(internal_internalSetField);
    return result;
  }
}
// EquatableStructWithInternalFields "private" section, not exported.
final _smokeEquatablestructwithinternalfieldsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_create_handle'));
final _smokeEquatablestructwithinternalfieldsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_release_handle'));
final _smokeEquatablestructwithinternalfieldsGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_field_publicField'));
final _smokeEquatablestructwithinternalfieldsGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_field_internalField'));
final _smokeEquatablestructwithinternalfieldsGetFieldinternalListField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_field_internalListField'));
final _smokeEquatablestructwithinternalfieldsGetFieldinternalMapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_field_internalMapField'));
final _smokeEquatablestructwithinternalfieldsGetFieldinternalSetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_field_internalSetField'));
Pointer<Void> smoke_EquatableStructWithInternalFields_toFfi(EquatableStructWithInternalFields value) {
  final _publicFieldHandle = String_toFfi(value.publicField);
  final _internalFieldHandle = String_toFfi(value.internal_internalField);
  final _internalListFieldHandle = foobar_ListOf_String_toFfi(value.internal_internalListField);
  final _internalMapFieldHandle = foobar_MapOf_String_to_String_toFfi(value.internal_internalMapField);
  final _internalSetFieldHandle = foobar_SetOf_String_toFfi(value.internal_internalSetField);
  final _result = _smokeEquatablestructwithinternalfieldsCreateHandle(_publicFieldHandle, _internalFieldHandle, _internalListFieldHandle, _internalMapFieldHandle, _internalSetFieldHandle);
  String_releaseFfiHandle(_publicFieldHandle);
  String_releaseFfiHandle(_internalFieldHandle);
  foobar_ListOf_String_releaseFfiHandle(_internalListFieldHandle);
  foobar_MapOf_String_to_String_releaseFfiHandle(_internalMapFieldHandle);
  foobar_SetOf_String_releaseFfiHandle(_internalSetFieldHandle);
  return _result;
}
EquatableStructWithInternalFields smoke_EquatableStructWithInternalFields_fromFfi(Pointer<Void> handle) {
  final _publicFieldHandle = _smokeEquatablestructwithinternalfieldsGetFieldpublicField(handle);
  final _internalFieldHandle = _smokeEquatablestructwithinternalfieldsGetFieldinternalField(handle);
  final _internalListFieldHandle = _smokeEquatablestructwithinternalfieldsGetFieldinternalListField(handle);
  final _internalMapFieldHandle = _smokeEquatablestructwithinternalfieldsGetFieldinternalMapField(handle);
  final _internalSetFieldHandle = _smokeEquatablestructwithinternalfieldsGetFieldinternalSetField(handle);
  try {
    return EquatableStructWithInternalFields(
      String_fromFfi(_publicFieldHandle),
      String_fromFfi(_internalFieldHandle),
      foobar_ListOf_String_fromFfi(_internalListFieldHandle),
      foobar_MapOf_String_to_String_fromFfi(_internalMapFieldHandle),
      foobar_SetOf_String_fromFfi(_internalSetFieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_publicFieldHandle);
    String_releaseFfiHandle(_internalFieldHandle);
    foobar_ListOf_String_releaseFfiHandle(_internalListFieldHandle);
    foobar_MapOf_String_to_String_releaseFfiHandle(_internalMapFieldHandle);
    foobar_SetOf_String_releaseFfiHandle(_internalSetFieldHandle);
  }
}
void smoke_EquatableStructWithInternalFields_releaseFfiHandle(Pointer<Void> handle) => _smokeEquatablestructwithinternalfieldsReleaseHandle(handle);
// Nullable EquatableStructWithInternalFields
final _smoke_EquatableStructWithInternalFieldsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_create_handle_nullable'));
final _smoke_EquatableStructWithInternalFieldsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_release_handle_nullable'));
final _smoke_EquatableStructWithInternalFieldsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_value_nullable'));
Pointer<Void> smoke_EquatableStructWithInternalFields_toFfi_nullable(EquatableStructWithInternalFields value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_EquatableStructWithInternalFields_toFfi(value);
  final result = _smoke_EquatableStructWithInternalFieldsCreateHandleNullable(_handle);
  smoke_EquatableStructWithInternalFields_releaseFfiHandle(_handle);
  return result;
}
EquatableStructWithInternalFields smoke_EquatableStructWithInternalFields_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_EquatableStructWithInternalFieldsGetValueNullable(handle);
  final result = smoke_EquatableStructWithInternalFields_fromFfi(_handle);
  smoke_EquatableStructWithInternalFields_releaseFfiHandle(_handle);
  return result;
}
void smoke_EquatableStructWithInternalFields_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_EquatableStructWithInternalFieldsReleaseHandleNullable(handle);
// End of EquatableStructWithInternalFields "private" section.

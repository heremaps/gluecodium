import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_library_init.dart' as __lib;
class EquatableStructWithInternalFields {
  String publicField;
  String internal_internalField;
  List<String> internal_internalListField;
  Map<String, String> internal_internalMapField;
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
    result = 31 * result + internal_internalListField.hashCode;
    result = 31 * result + internal_internalMapField.hashCode;
    result = 31 * result + internal_internalSetField.hashCode;
    return result;
  }
}
// EquatableStructWithInternalFields "private" section, not exported.
final _smoke_EquatableStructWithInternalFields_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_create_handle');
final _smoke_EquatableStructWithInternalFields_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_release_handle');
final _smoke_EquatableStructWithInternalFields_get_field_publicField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_field_publicField');
final _smoke_EquatableStructWithInternalFields_get_field_internalField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_field_internalField');
final _smoke_EquatableStructWithInternalFields_get_field_internalListField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_field_internalListField');
final _smoke_EquatableStructWithInternalFields_get_field_internalMapField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_field_internalMapField');
final _smoke_EquatableStructWithInternalFields_get_field_internalSetField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_field_internalSetField');
Pointer<Void> smoke_EquatableStructWithInternalFields_toFfi(EquatableStructWithInternalFields value) {
  final _publicField_handle = String_toFfi(value.publicField);
  final _internalField_handle = String_toFfi(value.internal_internalField);
  final _internalListField_handle = ListOf_String_toFfi(value.internal_internalListField);
  final _internalMapField_handle = MapOf_String_to_String_toFfi(value.internal_internalMapField);
  final _internalSetField_handle = SetOf_String_toFfi(value.internal_internalSetField);
  final _result = _smoke_EquatableStructWithInternalFields_create_handle(_publicField_handle, _internalField_handle, _internalListField_handle, _internalMapField_handle, _internalSetField_handle);
  String_releaseFfiHandle(_publicField_handle);
  String_releaseFfiHandle(_internalField_handle);
  ListOf_String_releaseFfiHandle(_internalListField_handle);
  MapOf_String_to_String_releaseFfiHandle(_internalMapField_handle);
  SetOf_String_releaseFfiHandle(_internalSetField_handle);
  return _result;
}
EquatableStructWithInternalFields smoke_EquatableStructWithInternalFields_fromFfi(Pointer<Void> handle) {
  final _publicField_handle = _smoke_EquatableStructWithInternalFields_get_field_publicField(handle);
  final _internalField_handle = _smoke_EquatableStructWithInternalFields_get_field_internalField(handle);
  final _internalListField_handle = _smoke_EquatableStructWithInternalFields_get_field_internalListField(handle);
  final _internalMapField_handle = _smoke_EquatableStructWithInternalFields_get_field_internalMapField(handle);
  final _internalSetField_handle = _smoke_EquatableStructWithInternalFields_get_field_internalSetField(handle);
  final _result = EquatableStructWithInternalFields(
    String_fromFfi(_publicField_handle),
    String_fromFfi(_internalField_handle),
    ListOf_String_fromFfi(_internalListField_handle),
    MapOf_String_to_String_fromFfi(_internalMapField_handle),
    SetOf_String_fromFfi(_internalSetField_handle)
  );
  String_releaseFfiHandle(_publicField_handle);
  String_releaseFfiHandle(_internalField_handle);
  ListOf_String_releaseFfiHandle(_internalListField_handle);
  MapOf_String_to_String_releaseFfiHandle(_internalMapField_handle);
  SetOf_String_releaseFfiHandle(_internalSetField_handle);
  return _result;
}
void smoke_EquatableStructWithInternalFields_releaseFfiHandle(Pointer<Void> handle) => _smoke_EquatableStructWithInternalFields_release_handle(handle);
// Nullable EquatableStructWithInternalFields
final _smoke_EquatableStructWithInternalFields_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_create_handle_nullable');
final _smoke_EquatableStructWithInternalFields_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_release_handle_nullable');
final _smoke_EquatableStructWithInternalFields_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_value_nullable');
Pointer<Void> smoke_EquatableStructWithInternalFields_toFfi_nullable(EquatableStructWithInternalFields value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_EquatableStructWithInternalFields_toFfi(value);
  final result = _smoke_EquatableStructWithInternalFields_create_handle_nullable(_handle);
  smoke_EquatableStructWithInternalFields_releaseFfiHandle(_handle);
  return result;
}
EquatableStructWithInternalFields smoke_EquatableStructWithInternalFields_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_EquatableStructWithInternalFields_get_value_nullable(handle);
  final result = smoke_EquatableStructWithInternalFields_fromFfi(_handle);
  smoke_EquatableStructWithInternalFields_releaseFfiHandle(_handle);
  return result;
}
void smoke_EquatableStructWithInternalFields_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_EquatableStructWithInternalFields_release_handle_nullable(handle);
// End of EquatableStructWithInternalFields "private" section.

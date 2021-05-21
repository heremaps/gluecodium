import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
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
Pointer<Void> smokeEquatablestructwithinternalfieldsToFfi(EquatableStructWithInternalFields value) {
  final _publicFieldHandle = stringToFfi(value.publicField);
  final _internalFieldHandle = stringToFfi(value.internal_internalField);
  final _internalListFieldHandle = foobarListofStringToFfi(value.internal_internalListField);
  final _internalMapFieldHandle = foobarMapofStringToStringToFfi(value.internal_internalMapField);
  final _internalSetFieldHandle = foobarSetofStringToFfi(value.internal_internalSetField);
  final _result = _smokeEquatablestructwithinternalfieldsCreateHandle(_publicFieldHandle, _internalFieldHandle, _internalListFieldHandle, _internalMapFieldHandle, _internalSetFieldHandle);
  stringReleaseFfiHandle(_publicFieldHandle);
  stringReleaseFfiHandle(_internalFieldHandle);
  foobarListofStringReleaseFfiHandle(_internalListFieldHandle);
  foobarMapofStringToStringReleaseFfiHandle(_internalMapFieldHandle);
  foobarSetofStringReleaseFfiHandle(_internalSetFieldHandle);
  return _result;
}
EquatableStructWithInternalFields smokeEquatablestructwithinternalfieldsFromFfi(Pointer<Void> handle) {
  final _publicFieldHandle = _smokeEquatablestructwithinternalfieldsGetFieldpublicField(handle);
  final _internalFieldHandle = _smokeEquatablestructwithinternalfieldsGetFieldinternalField(handle);
  final _internalListFieldHandle = _smokeEquatablestructwithinternalfieldsGetFieldinternalListField(handle);
  final _internalMapFieldHandle = _smokeEquatablestructwithinternalfieldsGetFieldinternalMapField(handle);
  final _internalSetFieldHandle = _smokeEquatablestructwithinternalfieldsGetFieldinternalSetField(handle);
  try {
    return EquatableStructWithInternalFields(
      stringFromFfi(_publicFieldHandle),
      stringFromFfi(_internalFieldHandle),
      foobarListofStringFromFfi(_internalListFieldHandle),
      foobarMapofStringToStringFromFfi(_internalMapFieldHandle),
      foobarSetofStringFromFfi(_internalSetFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_publicFieldHandle);
    stringReleaseFfiHandle(_internalFieldHandle);
    foobarListofStringReleaseFfiHandle(_internalListFieldHandle);
    foobarMapofStringToStringReleaseFfiHandle(_internalMapFieldHandle);
    foobarSetofStringReleaseFfiHandle(_internalSetFieldHandle);
  }
}
void smokeEquatablestructwithinternalfieldsReleaseFfiHandle(Pointer<Void> handle) => _smokeEquatablestructwithinternalfieldsReleaseHandle(handle);
// Nullable EquatableStructWithInternalFields
final _smokeEquatablestructwithinternalfieldsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_create_handle_nullable'));
final _smokeEquatablestructwithinternalfieldsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_release_handle_nullable'));
final _smokeEquatablestructwithinternalfieldsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableStructWithInternalFields_get_value_nullable'));
Pointer<Void> smokeEquatablestructwithinternalfieldsToFfiNullable(EquatableStructWithInternalFields value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEquatablestructwithinternalfieldsToFfi(value);
  final result = _smokeEquatablestructwithinternalfieldsCreateHandleNullable(_handle);
  smokeEquatablestructwithinternalfieldsReleaseFfiHandle(_handle);
  return result;
}
EquatableStructWithInternalFields smokeEquatablestructwithinternalfieldsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEquatablestructwithinternalfieldsGetValueNullable(handle);
  final result = smokeEquatablestructwithinternalfieldsFromFfi(_handle);
  smokeEquatablestructwithinternalfieldsReleaseFfiHandle(_handle);
  return result;
}
void smokeEquatablestructwithinternalfieldsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEquatablestructwithinternalfieldsReleaseHandleNullable(handle);
// End of EquatableStructWithInternalFields "private" section.

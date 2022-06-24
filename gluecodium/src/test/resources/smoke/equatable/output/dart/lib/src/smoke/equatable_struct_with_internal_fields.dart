import 'dart:ffi';
import 'package:collection/collection.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:meta/meta.dart';
class EquatableStructWithInternalFields {
  String publicField;
  /// @nodoc
  @internal
  String _internalField;
  /// @nodoc
  @internal
  List<String> _internalListField;
  /// @nodoc
  @internal
  Map<String, String> _internalMapField;
  /// @nodoc
  @internal
  Set<String> _internalSetField;
  EquatableStructWithInternalFields(this.publicField, this._internalField, this._internalListField, this._internalMapField, this._internalSetField);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EquatableStructWithInternalFields) return false;
    EquatableStructWithInternalFields _other = other;
    return publicField == _other.publicField &&
        _internalField == _other._internalField &&
        DeepCollectionEquality().equals(_internalListField, _other._internalListField) &&
        DeepCollectionEquality().equals(_internalMapField, _other._internalMapField) &&
        DeepCollectionEquality().equals(_internalSetField, _other._internalSetField);
  }
  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + publicField.hashCode;
    result = 31 * result + _internalField.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(_internalListField);
    result = 31 * result + DeepCollectionEquality().hash(_internalMapField);
    result = 31 * result + DeepCollectionEquality().hash(_internalSetField);
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
  final _internalFieldHandle = stringToFfi(value._internalField);
  final _internalListFieldHandle = foobarListofStringToFfi(value._internalListField);
  final _internalMapFieldHandle = foobarMapofStringToStringToFfi(value._internalMapField);
  final _internalSetFieldHandle = foobarSetofStringToFfi(value._internalSetField);
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
Pointer<Void> smokeEquatablestructwithinternalfieldsToFfiNullable(EquatableStructWithInternalFields? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEquatablestructwithinternalfieldsToFfi(value);
  final result = _smokeEquatablestructwithinternalfieldsCreateHandleNullable(_handle);
  smokeEquatablestructwithinternalfieldsReleaseFfiHandle(_handle);
  return result;
}
EquatableStructWithInternalFields? smokeEquatablestructwithinternalfieldsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEquatablestructwithinternalfieldsGetValueNullable(handle);
  final result = smokeEquatablestructwithinternalfieldsFromFfi(_handle);
  smokeEquatablestructwithinternalfieldsReleaseFfiHandle(_handle);
  return result;
}
void smokeEquatablestructwithinternalfieldsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEquatablestructwithinternalfieldsReleaseHandleNullable(handle);
// End of EquatableStructWithInternalFields "private" section.

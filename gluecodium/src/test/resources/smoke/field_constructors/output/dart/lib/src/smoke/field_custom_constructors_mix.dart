import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
class FieldCustomConstructorsMix {
  String stringField;
  int intField;
  bool boolField;
  FieldCustomConstructorsMix._(this.stringField, this.intField, this.boolField);
  FieldCustomConstructorsMix.withTrueNonsense(this.intField)
      : stringField = "nonsense", boolField = true;
  factory FieldCustomConstructorsMix(int intValue, double dummy) => $prototype.$init(intValue, dummy);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = FieldCustomConstructorsMix$Impl();
}
// FieldCustomConstructorsMix "private" section, not exported.
final _smokeFieldcustomconstructorsmixCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32, Uint8),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('library_smoke_FieldCustomConstructorsMix_create_handle'));
final _smokeFieldcustomconstructorsmixReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldCustomConstructorsMix_release_handle'));
final _smokeFieldcustomconstructorsmixGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldCustomConstructorsMix_get_field_stringField'));
final _smokeFieldcustomconstructorsmixGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_FieldCustomConstructorsMix_get_field_intField'));
final _smokeFieldcustomconstructorsmixGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_FieldCustomConstructorsMix_get_field_boolField'));
/// @nodoc
@visibleForTesting
class FieldCustomConstructorsMix$Impl {
  FieldCustomConstructorsMix $init(int intValue, double dummy) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Int32, Double), Pointer<Void> Function(int, int, double)>('library_smoke_FieldCustomConstructorsMix_createMe__Int_Double'));
    final _intValueHandle = (intValue);
    final _dummyHandle = (dummy);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _intValueHandle, _dummyHandle);
    try {
      return smokeFieldcustomconstructorsmixFromFfi(__resultHandle);
    } finally {
      smokeFieldcustomconstructorsmixReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeFieldcustomconstructorsmixToFfi(FieldCustomConstructorsMix value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _intFieldHandle = (value.intField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _result = _smokeFieldcustomconstructorsmixCreateHandle(_stringFieldHandle, _intFieldHandle, _boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  return _result;
}
FieldCustomConstructorsMix smokeFieldcustomconstructorsmixFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeFieldcustomconstructorsmixGetFieldstringField(handle);
  final _intFieldHandle = _smokeFieldcustomconstructorsmixGetFieldintField(handle);
  final _boolFieldHandle = _smokeFieldcustomconstructorsmixGetFieldboolField(handle);
  try {
    return FieldCustomConstructorsMix._(
      stringFromFfi(_stringFieldHandle),
      (_intFieldHandle),
      booleanFromFfi(_boolFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
    booleanReleaseFfiHandle(_boolFieldHandle);
  }
}
void smokeFieldcustomconstructorsmixReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldcustomconstructorsmixReleaseHandle(handle);
// Nullable FieldCustomConstructorsMix
final _smokeFieldcustomconstructorsmixCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldCustomConstructorsMix_create_handle_nullable'));
final _smokeFieldcustomconstructorsmixReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldCustomConstructorsMix_release_handle_nullable'));
final _smokeFieldcustomconstructorsmixGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldCustomConstructorsMix_get_value_nullable'));
Pointer<Void> smokeFieldcustomconstructorsmixToFfiNullable(FieldCustomConstructorsMix? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldcustomconstructorsmixToFfi(value);
  final result = _smokeFieldcustomconstructorsmixCreateHandleNullable(_handle);
  smokeFieldcustomconstructorsmixReleaseFfiHandle(_handle);
  return result;
}
FieldCustomConstructorsMix? smokeFieldcustomconstructorsmixFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldcustomconstructorsmixGetValueNullable(handle);
  final result = smokeFieldcustomconstructorsmixFromFfi(_handle);
  smokeFieldcustomconstructorsmixReleaseFfiHandle(_handle);
  return result;
}
void smokeFieldcustomconstructorsmixReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldcustomconstructorsmixReleaseHandleNullable(handle);
// End of FieldCustomConstructorsMix "private" section.

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
import '../foo_converter.dart';
class DartExternalCtorInternal {
  String field;
  DartExternalCtorInternal._(this.field);
  factory DartExternalCtorInternal(String field) => $prototype.make(field);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = DartExternalCtor$Impl();
}
// DartExternalCtor "private" section, not exported.
final _smokeDartexternalctorCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartExternalCtor_create_handle'));
final _smokeDartexternalctorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartExternalCtor_release_handle'));
final _smokeDartexternalctorGetFieldfield = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartExternalCtor_get_field_field'));
/// @nodoc
@visibleForTesting
class DartExternalCtor$Impl {
  DartExternalCtorInternal make(String field) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_DartExternalCtor_make__String'));
    final _fieldHandle = stringToFfi(field);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _fieldHandle);
    stringReleaseFfiHandle(_fieldHandle);
    try {
      return smokeDartexternalctorFromFfiInternal(__resultHandle);
    } finally {
      smokeDartexternalctorReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeDartexternalctorToFfi(DartExternalCtor valueExternal) {
  final value = FooConverter.convertToInternal(valueExternal);
  final _fieldHandle = stringToFfi(value.field);
  final _result = _smokeDartexternalctorCreateHandle(_fieldHandle);
  stringReleaseFfiHandle(_fieldHandle);
  return _result;
}
DartExternalCtor smokeDartexternalctorFromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeDartexternalctorGetFieldfield(handle);
  try {
    final resultInternal = DartExternalCtorInternal(
      stringFromFfi(_fieldHandle)
    );
    return FooConverter.convertFromInternal(resultInternal);
  } finally {
    stringReleaseFfiHandle(_fieldHandle);
  }
}
DartExternalCtorInternal smokeDartexternalctorFromFfiInternal(Pointer<Void> handle) {
  final _fieldHandle = _smokeDartexternalctorGetFieldfield(handle);
  try {
    return DartExternalCtorInternal._(
      stringFromFfi(_fieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_fieldHandle);
  }
}
void smokeDartexternalctorReleaseFfiHandle(Pointer<Void> handle) => _smokeDartexternalctorReleaseHandle(handle);
// Nullable DartExternalCtor
final _smokeDartexternalctorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartExternalCtor_create_handle_nullable'));
final _smokeDartexternalctorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartExternalCtor_release_handle_nullable'));
final _smokeDartexternalctorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartExternalCtor_get_value_nullable'));
Pointer<Void> smokeDartexternalctorToFfiNullable(DartExternalCtor? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDartexternalctorToFfi(value);
  final result = _smokeDartexternalctorCreateHandleNullable(_handle);
  smokeDartexternalctorReleaseFfiHandle(_handle);
  return result;
}
DartExternalCtor? smokeDartexternalctorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDartexternalctorGetValueNullable(handle);
  final result = smokeDartexternalctorFromFfi(_handle);
  smokeDartexternalctorReleaseFfiHandle(_handle);
  return result;
}
void smokeDartexternalctorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartexternalctorReleaseHandleNullable(handle);
// End of DartExternalCtor "private" section.

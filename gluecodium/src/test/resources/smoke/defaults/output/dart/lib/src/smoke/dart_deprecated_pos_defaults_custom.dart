

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';


/// Foo Bar this is a comment

class DartDeprecatedPosDefaultsCustom {
  int intField;

  String stringField;

  /// buzz fizz
  /// - [intField] 
  /// - [stringField] 
  @Deprecated("Sorry, this is deprecated.")
  DartDeprecatedPosDefaultsCustom(String stringField, [int intField = 42])
    : intField = intField, stringField = stringField;

  factory DartDeprecatedPosDefaultsCustom() => $prototype.custom();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = DartDeprecatedPosDefaultsCustom$Impl();
}


// DartDeprecatedPosDefaultsCustom "private" section, not exported.

final _smokeDartdeprecatedposdefaultscustomCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaultsCustom_create_handle'));
final _smokeDartdeprecatedposdefaultscustomReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaultsCustom_release_handle'));
final _smokeDartdeprecatedposdefaultscustomGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaultsCustom_get_field_intField'));
final _smokeDartdeprecatedposdefaultscustomGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaultsCustom_get_field_stringField'));



/// @nodoc
@visibleForTesting
class DartDeprecatedPosDefaultsCustom$Impl {
  DartDeprecatedPosDefaultsCustom custom() {
    final _customFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_DartDeprecatedPosDefaultsCustom_custom'));
    final __resultHandle = _customFfi(__lib.LibraryContext.isolateId);
    try {
      return smokeDartdeprecatedposdefaultscustomFromFfi(__resultHandle);
    } finally {
      smokeDartdeprecatedposdefaultscustomReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> smokeDartdeprecatedposdefaultscustomToFfi(DartDeprecatedPosDefaultsCustom value) {
  final _intFieldHandle = (value.intField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeDartdeprecatedposdefaultscustomCreateHandle(_intFieldHandle, _stringFieldHandle);
  
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}

DartDeprecatedPosDefaultsCustom smokeDartdeprecatedposdefaultscustomFromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeDartdeprecatedposdefaultscustomGetFieldintField(handle);
  final _stringFieldHandle = _smokeDartdeprecatedposdefaultscustomGetFieldstringField(handle);
  try {
    return DartDeprecatedPosDefaultsCustom(
      stringFromFfi(_stringFieldHandle), 
      (_intFieldHandle)
    );
  } finally {
    
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}

void smokeDartdeprecatedposdefaultscustomReleaseFfiHandle(Pointer<Void> handle) => _smokeDartdeprecatedposdefaultscustomReleaseHandle(handle);

// Nullable DartDeprecatedPosDefaultsCustom

final _smokeDartdeprecatedposdefaultscustomCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaultsCustom_create_handle_nullable'));
final _smokeDartdeprecatedposdefaultscustomReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaultsCustom_release_handle_nullable'));
final _smokeDartdeprecatedposdefaultscustomGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaultsCustom_get_value_nullable'));

Pointer<Void> smokeDartdeprecatedposdefaultscustomToFfiNullable(DartDeprecatedPosDefaultsCustom? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDartdeprecatedposdefaultscustomToFfi(value);
  final result = _smokeDartdeprecatedposdefaultscustomCreateHandleNullable(_handle);
  smokeDartdeprecatedposdefaultscustomReleaseFfiHandle(_handle);
  return result;
}

DartDeprecatedPosDefaultsCustom? smokeDartdeprecatedposdefaultscustomFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDartdeprecatedposdefaultscustomGetValueNullable(handle);
  final result = smokeDartdeprecatedposdefaultscustomFromFfi(_handle);
  smokeDartdeprecatedposdefaultscustomReleaseFfiHandle(_handle);
  return result;
}

void smokeDartdeprecatedposdefaultscustomReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartdeprecatedposdefaultscustomReleaseHandleNullable(handle);

// End of DartDeprecatedPosDefaultsCustom "private" section.



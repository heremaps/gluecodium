

import 'dart:ffi';
import 'dart:typed_data';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/properties_interface.dart';
import 'package:meta/meta.dart';

abstract class Properties implements Finalizable {

  int get builtInTypeProperty;
  set builtInTypeProperty(int value);

  double get readonlyProperty;

  Properties_ExampleStruct get structProperty;
  set structProperty(Properties_ExampleStruct value);

  List<String> get arrayProperty;
  set arrayProperty(List<String> value);

  Properties_InternalErrorCode get complexTypeProperty;
  set complexTypeProperty(Properties_InternalErrorCode value);

  Uint8List get byteBufferProperty;
  set byteBufferProperty(Uint8List value);

  PropertiesInterface get instanceProperty;
  set instanceProperty(PropertiesInterface value);

  bool get isBooleanProperty;
  set isBooleanProperty(bool value);

  static String get staticProperty => $prototype.staticProperty;
  static set staticProperty(String value) { $prototype.staticProperty = value; }

  static Properties_ExampleStruct get staticReadonlyProperty => $prototype.staticReadonlyProperty;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Properties$Impl(Pointer<Void>.fromAddress(0));
}

enum Properties_InternalErrorCode {
    errorNone,
    errorFatal
}

// Properties_InternalErrorCode "private" section, not exported.

int smokePropertiesInternalerrorcodeToFfi(Properties_InternalErrorCode value) {
  switch (value) {
  case Properties_InternalErrorCode.errorNone:
    return 0;
  case Properties_InternalErrorCode.errorFatal:
    return 999;
  }
}

Properties_InternalErrorCode smokePropertiesInternalerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Properties_InternalErrorCode.errorNone;
  case 999:
    return Properties_InternalErrorCode.errorFatal;
  default:
    throw StateError("Invalid numeric value $handle for Properties_InternalErrorCode enum.");
  }
}

void smokePropertiesInternalerrorcodeReleaseFfiHandle(int handle) {}

final _smokePropertiesInternalerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Properties_InternalErrorCode_create_handle_nullable'));
final _smokePropertiesInternalerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Properties_InternalErrorCode_release_handle_nullable'));
final _smokePropertiesInternalerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Properties_InternalErrorCode_get_value_nullable'));

Pointer<Void> smokePropertiesInternalerrorcodeToFfiNullable(Properties_InternalErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePropertiesInternalerrorcodeToFfi(value);
  final result = _smokePropertiesInternalerrorcodeCreateHandleNullable(_handle);
  smokePropertiesInternalerrorcodeReleaseFfiHandle(_handle);
  return result;
}

Properties_InternalErrorCode? smokePropertiesInternalerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePropertiesInternalerrorcodeGetValueNullable(handle);
  final result = smokePropertiesInternalerrorcodeFromFfi(_handle);
  smokePropertiesInternalerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void smokePropertiesInternalerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePropertiesInternalerrorcodeReleaseHandleNullable(handle);

// End of Properties_InternalErrorCode "private" section.

class Properties_ExampleStruct {
  double value;

  Properties_ExampleStruct(this.value);
}


// Properties_ExampleStruct "private" section, not exported.

final _smokePropertiesExamplestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_Properties_ExampleStruct_create_handle'));
final _smokePropertiesExamplestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Properties_ExampleStruct_release_handle'));
final _smokePropertiesExamplestructGetFieldvalue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Properties_ExampleStruct_get_field_value'));



Pointer<Void> smokePropertiesExamplestructToFfi(Properties_ExampleStruct value) {
  final _valueHandle = (value.value);
  final _result = _smokePropertiesExamplestructCreateHandle(_valueHandle);
  
  return _result;
}

Properties_ExampleStruct smokePropertiesExamplestructFromFfi(Pointer<Void> handle) {
  final _valueHandle = _smokePropertiesExamplestructGetFieldvalue(handle);
  try {
    return Properties_ExampleStruct(
      (_valueHandle)
    );
  } finally {
    
  }
}

void smokePropertiesExamplestructReleaseFfiHandle(Pointer<Void> handle) => _smokePropertiesExamplestructReleaseHandle(handle);

// Nullable Properties_ExampleStruct

final _smokePropertiesExamplestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Properties_ExampleStruct_create_handle_nullable'));
final _smokePropertiesExamplestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Properties_ExampleStruct_release_handle_nullable'));
final _smokePropertiesExamplestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Properties_ExampleStruct_get_value_nullable'));

Pointer<Void> smokePropertiesExamplestructToFfiNullable(Properties_ExampleStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePropertiesExamplestructToFfi(value);
  final result = _smokePropertiesExamplestructCreateHandleNullable(_handle);
  smokePropertiesExamplestructReleaseFfiHandle(_handle);
  return result;
}

Properties_ExampleStruct? smokePropertiesExamplestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePropertiesExamplestructGetValueNullable(handle);
  final result = smokePropertiesExamplestructFromFfi(_handle);
  smokePropertiesExamplestructReleaseFfiHandle(_handle);
  return result;
}

void smokePropertiesExamplestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePropertiesExamplestructReleaseHandleNullable(handle);

// End of Properties_ExampleStruct "private" section.

// Properties "private" section, not exported.

final _smokePropertiesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Properties_register_finalizer'));
final _smokePropertiesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Properties_copy_handle'));
final _smokePropertiesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Properties_release_handle'));


/// @nodoc
@visibleForTesting
class Properties$Impl extends __lib.NativeBase implements Properties {

  Properties$Impl(Pointer<Void> handle) : super(handle);

  @override
  int get builtInTypeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Properties_builtInTypeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set builtInTypeProperty(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_smoke_Properties_builtInTypeProperty_set__UInt'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  double get readonlyProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('library_smoke_Properties_readonlyProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  Properties_ExampleStruct get structProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Properties_structProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokePropertiesExamplestructFromFfi(__resultHandle);
    } finally {
      smokePropertiesExamplestructReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set structProperty(Properties_ExampleStruct value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Properties_structProperty_set__ExampleStruct'));
    final _valueHandle = smokePropertiesExamplestructToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokePropertiesExamplestructReleaseFfiHandle(_valueHandle);

  }


  @override
  List<String> get arrayProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Properties_arrayProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarListofStringFromFfi(__resultHandle);
    } finally {
      foobarListofStringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set arrayProperty(List<String> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Properties_arrayProperty_set__ListOf_String'));
    final _valueHandle = foobarListofStringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarListofStringReleaseFfiHandle(_valueHandle);

  }


  @override
  Properties_InternalErrorCode get complexTypeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Properties_complexTypeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokePropertiesInternalerrorcodeFromFfi(__resultHandle);
    } finally {
      smokePropertiesInternalerrorcodeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set complexTypeProperty(Properties_InternalErrorCode value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_smoke_Properties_complexTypeProperty_set__InternalErrorCode'));
    final _valueHandle = smokePropertiesInternalerrorcodeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokePropertiesInternalerrorcodeReleaseFfiHandle(_valueHandle);

  }


  @override
  Uint8List get byteBufferProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Properties_byteBufferProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return blobFromFfi(__resultHandle);
    } finally {
      blobReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set byteBufferProperty(Uint8List value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Properties_byteBufferProperty_set__Blob'));
    final _valueHandle = blobToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    blobReleaseFfiHandle(_valueHandle);

  }


  @override
  PropertiesInterface get instanceProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Properties_instanceProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokePropertiesinterfaceFromFfi(__resultHandle);
    } finally {
      smokePropertiesinterfaceReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set instanceProperty(PropertiesInterface value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Properties_instanceProperty_set__PropertiesInterface'));
    final _valueHandle = smokePropertiesinterfaceToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokePropertiesinterfaceReleaseFfiHandle(_valueHandle);

  }


  @override
  bool get isBooleanProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Properties_isBooleanProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isBooleanProperty(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_Properties_isBooleanProperty_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  String get staticProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Properties_staticProperty_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  set staticProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('library_smoke_Properties_staticProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


  Properties_ExampleStruct get staticReadonlyProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Properties_staticReadonlyProperty_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return smokePropertiesExamplestructFromFfi(__resultHandle);
    } finally {
      smokePropertiesExamplestructReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> smokePropertiesToFfi(Properties value) =>
  _smokePropertiesCopyHandle((value as __lib.NativeBase).handle);

Properties smokePropertiesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Properties) return instance;

  final _copiedHandle = _smokePropertiesCopyHandle(handle);
  final result = Properties$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokePropertiesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokePropertiesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokePropertiesReleaseHandle(handle);

Pointer<Void> smokePropertiesToFfiNullable(Properties? value) =>
  value != null ? smokePropertiesToFfi(value) : Pointer<Void>.fromAddress(0);

Properties? smokePropertiesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokePropertiesFromFfi(handle) : null;

void smokePropertiesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePropertiesReleaseHandle(handle);

// End of Properties "private" section.



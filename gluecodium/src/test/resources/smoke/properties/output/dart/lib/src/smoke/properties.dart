import 'dart:typed_data';
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/properties_interface.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Properties {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
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
  static String get staticProperty => Properties$Impl.staticProperty;
  static set staticProperty(String value) { Properties$Impl.staticProperty = value; }
  static Properties_ExampleStruct get staticReadonlyProperty => Properties$Impl.staticReadonlyProperty;
}
enum Properties_InternalErrorCode {
    errorNone,
    errorFatal
}
// Properties_InternalErrorCode "private" section, not exported.
int smoke_Properties_InternalErrorCode_toFfi(Properties_InternalErrorCode value) {
  switch (value) {
  case Properties_InternalErrorCode.errorNone:
    return 0;
  break;
  case Properties_InternalErrorCode.errorFatal:
    return 999;
  break;
  default:
    throw StateError("Invalid enum value $value for Properties_InternalErrorCode enum.");
  }
}
Properties_InternalErrorCode smoke_Properties_InternalErrorCode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Properties_InternalErrorCode.errorNone;
  break;
  case 999:
    return Properties_InternalErrorCode.errorFatal;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Properties_InternalErrorCode enum.");
  }
}
void smoke_Properties_InternalErrorCode_releaseFfiHandle(int handle) {}
final _smoke_Properties_InternalErrorCodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Properties_InternalErrorCode_create_handle_nullable'));
final _smoke_Properties_InternalErrorCodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Properties_InternalErrorCode_release_handle_nullable'));
final _smoke_Properties_InternalErrorCodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Properties_InternalErrorCode_get_value_nullable'));
Pointer<Void> smoke_Properties_InternalErrorCode_toFfi_nullable(Properties_InternalErrorCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Properties_InternalErrorCode_toFfi(value);
  final result = _smoke_Properties_InternalErrorCodeCreateHandleNullable(_handle);
  smoke_Properties_InternalErrorCode_releaseFfiHandle(_handle);
  return result;
}
Properties_InternalErrorCode smoke_Properties_InternalErrorCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Properties_InternalErrorCodeGetValueNullable(handle);
  final result = smoke_Properties_InternalErrorCode_fromFfi(_handle);
  smoke_Properties_InternalErrorCode_releaseFfiHandle(_handle);
  return result;
}
void smoke_Properties_InternalErrorCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Properties_InternalErrorCodeReleaseHandleNullable(handle);
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
Pointer<Void> smoke_Properties_ExampleStruct_toFfi(Properties_ExampleStruct value) {
  final _valueHandle = (value.value);
  final _result = _smokePropertiesExamplestructCreateHandle(_valueHandle);
  (_valueHandle);
  return _result;
}
Properties_ExampleStruct smoke_Properties_ExampleStruct_fromFfi(Pointer<Void> handle) {
  final _valueHandle = _smokePropertiesExamplestructGetFieldvalue(handle);
  try {
    return Properties_ExampleStruct(
      (_valueHandle)
    );
  } finally {
    (_valueHandle);
  }
}
void smoke_Properties_ExampleStruct_releaseFfiHandle(Pointer<Void> handle) => _smokePropertiesExamplestructReleaseHandle(handle);
// Nullable Properties_ExampleStruct
final _smoke_Properties_ExampleStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Properties_ExampleStruct_create_handle_nullable'));
final _smoke_Properties_ExampleStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Properties_ExampleStruct_release_handle_nullable'));
final _smoke_Properties_ExampleStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Properties_ExampleStruct_get_value_nullable'));
Pointer<Void> smoke_Properties_ExampleStruct_toFfi_nullable(Properties_ExampleStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Properties_ExampleStruct_toFfi(value);
  final result = _smoke_Properties_ExampleStructCreateHandleNullable(_handle);
  smoke_Properties_ExampleStruct_releaseFfiHandle(_handle);
  return result;
}
Properties_ExampleStruct smoke_Properties_ExampleStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Properties_ExampleStructGetValueNullable(handle);
  final result = smoke_Properties_ExampleStruct_fromFfi(_handle);
  smoke_Properties_ExampleStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Properties_ExampleStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Properties_ExampleStructReleaseHandleNullable(handle);
// End of Properties_ExampleStruct "private" section.
// Properties "private" section, not exported.
final _smokePropertiesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Properties_copy_handle'));
final _smokePropertiesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Properties_release_handle'));
class Properties$Impl extends __lib.NativeBase implements Properties {
  Properties$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokePropertiesReleaseHandle(handle);
    handle = null;
  }
  @override
  int get builtInTypeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Properties_builtInTypeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  set builtInTypeProperty(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_smoke_Properties_builtInTypeProperty_set__UInt'));
    final _valueHandle = (value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    (_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  double get readonlyProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('library_smoke_Properties_readonlyProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  Properties_ExampleStruct get structProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Properties_structProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_Properties_ExampleStruct_fromFfi(__resultHandle);
    } finally {
      smoke_Properties_ExampleStruct_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set structProperty(Properties_ExampleStruct value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Properties_structProperty_set__ExampleStruct'));
    final _valueHandle = smoke_Properties_ExampleStruct_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smoke_Properties_ExampleStruct_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  List<String> get arrayProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Properties_arrayProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_ListOf_String_fromFfi(__resultHandle);
    } finally {
      foobar_ListOf_String_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set arrayProperty(List<String> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Properties_arrayProperty_set__ListOf_1String'));
    final _valueHandle = foobar_ListOf_String_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobar_ListOf_String_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  Properties_InternalErrorCode get complexTypeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Properties_complexTypeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_Properties_InternalErrorCode_fromFfi(__resultHandle);
    } finally {
      smoke_Properties_InternalErrorCode_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set complexTypeProperty(Properties_InternalErrorCode value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_smoke_Properties_complexTypeProperty_set__InternalErrorCode'));
    final _valueHandle = smoke_Properties_InternalErrorCode_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smoke_Properties_InternalErrorCode_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  Uint8List get byteBufferProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Properties_byteBufferProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Blob_fromFfi(__resultHandle);
    } finally {
      Blob_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set byteBufferProperty(Uint8List value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Properties_byteBufferProperty_set__Blob'));
    final _valueHandle = Blob_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    Blob_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  PropertiesInterface get instanceProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Properties_instanceProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_PropertiesInterface_fromFfi(__resultHandle);
    } finally {
      smoke_PropertiesInterface_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set instanceProperty(PropertiesInterface value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Properties_instanceProperty_set__PropertiesInterface'));
    final _valueHandle = smoke_PropertiesInterface_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smoke_PropertiesInterface_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  bool get isBooleanProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Properties_isBooleanProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set isBooleanProperty(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_Properties_isBooleanProperty_set__Boolean'));
    final _valueHandle = Boolean_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    Boolean_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static String get staticProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Properties_staticProperty_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
  static set staticProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('library_smoke_Properties_staticProperty_set__String'));
    final _valueHandle = String_toFfi(value);
    final __resultHandle = _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    String_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static Properties_ExampleStruct get staticReadonlyProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Properties_staticReadonlyProperty_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return smoke_Properties_ExampleStruct_fromFfi(__resultHandle);
    } finally {
      smoke_Properties_ExampleStruct_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_Properties_toFfi(Properties value) =>
  _smokePropertiesCopyHandle((value as __lib.NativeBase).handle);
Properties smoke_Properties_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Properties;
  if (instance != null) return instance;
  final _copiedHandle = _smokePropertiesCopyHandle(handle);
  final result = Properties$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_Properties_releaseFfiHandle(Pointer<Void> handle) =>
  _smokePropertiesReleaseHandle(handle);
Pointer<Void> smoke_Properties_toFfi_nullable(Properties value) =>
  value != null ? smoke_Properties_toFfi(value) : Pointer<Void>.fromAddress(0);
Properties smoke_Properties_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Properties_fromFfi(handle) : null;
void smoke_Properties_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokePropertiesReleaseHandle(handle);
// End of Properties "private" section.

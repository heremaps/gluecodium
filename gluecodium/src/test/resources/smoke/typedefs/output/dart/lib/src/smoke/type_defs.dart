import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/type_collection.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class TypeDefs {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static double methodWithPrimitiveTypeDef(double input) => TypeDefs$Impl.methodWithPrimitiveTypeDef(input);
  static List<TypeDefs_TestStruct> methodWithComplexTypeDef(List<TypeDefs_TestStruct> input) => TypeDefs$Impl.methodWithComplexTypeDef(input);
  static double returnNestedIntTypeDef(double input) => TypeDefs$Impl.returnNestedIntTypeDef(input);
  static TypeDefs_TestStruct returnTestStructTypeDef(TypeDefs_TestStruct input) => TypeDefs$Impl.returnTestStructTypeDef(input);
  static TypeDefs_TestStruct returnNestedStructTypeDef(TypeDefs_TestStruct input) => TypeDefs$Impl.returnNestedStructTypeDef(input);
  static Point returnTypeDefPointFromTypeCollection(Point input) => TypeDefs$Impl.returnTypeDefPointFromTypeCollection(input);
  List<double> get primitiveTypeProperty;
  set primitiveTypeProperty(List<double> value);
}
class TypeDefs_StructHavingAliasFieldDefinedBelow {
  double field;
  TypeDefs_StructHavingAliasFieldDefinedBelow(this.field);
}
// TypeDefs_StructHavingAliasFieldDefinedBelow "private" section, not exported.
final _smokeTypedefsStructhavingaliasfielddefinedbelowCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle'));
final _smokeTypedefsStructhavingaliasfielddefinedbelowReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle'));
final _smokeTypedefsStructhavingaliasfielddefinedbelowGetFieldfield = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_field_field'));
Pointer<Void> smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_toFfi(TypeDefs_StructHavingAliasFieldDefinedBelow value) {
  final _fieldHandle = (value.field);
  final _result = _smokeTypedefsStructhavingaliasfielddefinedbelowCreateHandle(_fieldHandle);
  (_fieldHandle);
  return _result;
}
TypeDefs_StructHavingAliasFieldDefinedBelow smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_fromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeTypedefsStructhavingaliasfielddefinedbelowGetFieldfield(handle);
  try {
    return TypeDefs_StructHavingAliasFieldDefinedBelow(
      (_fieldHandle)
    );
  } finally {
    (_fieldHandle);
  }
}
void smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_releaseFfiHandle(Pointer<Void> handle) => _smokeTypedefsStructhavingaliasfielddefinedbelowReleaseHandle(handle);
// Nullable TypeDefs_StructHavingAliasFieldDefinedBelow
final _smoke_TypeDefs_StructHavingAliasFieldDefinedBelowCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle_nullable'));
final _smoke_TypeDefs_StructHavingAliasFieldDefinedBelowReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle_nullable'));
final _smoke_TypeDefs_StructHavingAliasFieldDefinedBelowGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_value_nullable'));
Pointer<Void> smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_toFfi_nullable(TypeDefs_StructHavingAliasFieldDefinedBelow value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_toFfi(value);
  final result = _smoke_TypeDefs_StructHavingAliasFieldDefinedBelowCreateHandleNullable(_handle);
  smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_releaseFfiHandle(_handle);
  return result;
}
TypeDefs_StructHavingAliasFieldDefinedBelow smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_TypeDefs_StructHavingAliasFieldDefinedBelowGetValueNullable(handle);
  final result = smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_fromFfi(_handle);
  smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_releaseFfiHandle(_handle);
  return result;
}
void smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_TypeDefs_StructHavingAliasFieldDefinedBelowReleaseHandleNullable(handle);
// End of TypeDefs_StructHavingAliasFieldDefinedBelow "private" section.
class TypeDefs_TestStruct {
  String something;
  TypeDefs_TestStruct(this.something);
}
// TypeDefs_TestStruct "private" section, not exported.
final _smokeTypedefsTeststructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_create_handle'));
final _smokeTypedefsTeststructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_release_handle'));
final _smokeTypedefsTeststructGetFieldsomething = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_get_field_something'));
Pointer<Void> smoke_TypeDefs_TestStruct_toFfi(TypeDefs_TestStruct value) {
  final _somethingHandle = String_toFfi(value.something);
  final _result = _smokeTypedefsTeststructCreateHandle(_somethingHandle);
  String_releaseFfiHandle(_somethingHandle);
  return _result;
}
TypeDefs_TestStruct smoke_TypeDefs_TestStruct_fromFfi(Pointer<Void> handle) {
  final _somethingHandle = _smokeTypedefsTeststructGetFieldsomething(handle);
  try {
    return TypeDefs_TestStruct(
      String_fromFfi(_somethingHandle)
    );
  } finally {
    String_releaseFfiHandle(_somethingHandle);
  }
}
void smoke_TypeDefs_TestStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeTypedefsTeststructReleaseHandle(handle);
// Nullable TypeDefs_TestStruct
final _smoke_TypeDefs_TestStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_create_handle_nullable'));
final _smoke_TypeDefs_TestStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_release_handle_nullable'));
final _smoke_TypeDefs_TestStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_get_value_nullable'));
Pointer<Void> smoke_TypeDefs_TestStruct_toFfi_nullable(TypeDefs_TestStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_TypeDefs_TestStruct_toFfi(value);
  final result = _smoke_TypeDefs_TestStructCreateHandleNullable(_handle);
  smoke_TypeDefs_TestStruct_releaseFfiHandle(_handle);
  return result;
}
TypeDefs_TestStruct smoke_TypeDefs_TestStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_TypeDefs_TestStructGetValueNullable(handle);
  final result = smoke_TypeDefs_TestStruct_fromFfi(_handle);
  smoke_TypeDefs_TestStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_TypeDefs_TestStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_TypeDefs_TestStructReleaseHandleNullable(handle);
// End of TypeDefs_TestStruct "private" section.
// TypeDefs "private" section, not exported.
final _smokeTypedefsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_copy_handle'));
final _smokeTypedefsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_release_handle'));
class TypeDefs$Impl extends __lib.NativeBase implements TypeDefs {
  TypeDefs$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeTypedefsReleaseHandle(handle);
    handle = null;
  }
  static double methodWithPrimitiveTypeDef(double input) {
    final _methodWithPrimitiveTypeDefFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Int32, Double), double Function(int, double)>('library_smoke_TypeDefs_methodWithPrimitiveTypeDef__Double'));
    final _inputHandle = (input);
    final __resultHandle = _methodWithPrimitiveTypeDefFfi(__lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static List<TypeDefs_TestStruct> methodWithComplexTypeDef(List<TypeDefs_TestStruct> input) {
    final _methodWithComplexTypeDefFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_TypeDefs_methodWithComplexTypeDef__ListOf_1smoke_1TypeDefs_1TestStruct'));
    final _inputHandle = foobar_ListOf_smoke_TypeDefs_TestStruct_toFfi(input);
    final __resultHandle = _methodWithComplexTypeDefFfi(__lib.LibraryContext.isolateId, _inputHandle);
    foobar_ListOf_smoke_TypeDefs_TestStruct_releaseFfiHandle(_inputHandle);
    try {
      return foobar_ListOf_smoke_TypeDefs_TestStruct_fromFfi(__resultHandle);
    } finally {
      foobar_ListOf_smoke_TypeDefs_TestStruct_releaseFfiHandle(__resultHandle);
    }
  }
  static double returnNestedIntTypeDef(double input) {
    final _returnNestedIntTypeDefFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Int32, Double), double Function(int, double)>('library_smoke_TypeDefs_returnNestedIntTypeDef__Double'));
    final _inputHandle = (input);
    final __resultHandle = _returnNestedIntTypeDefFfi(__lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static TypeDefs_TestStruct returnTestStructTypeDef(TypeDefs_TestStruct input) {
    final _returnTestStructTypeDefFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_TypeDefs_returnTestStructTypeDef__TestStruct'));
    final _inputHandle = smoke_TypeDefs_TestStruct_toFfi(input);
    final __resultHandle = _returnTestStructTypeDefFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_TypeDefs_TestStruct_releaseFfiHandle(_inputHandle);
    try {
      return smoke_TypeDefs_TestStruct_fromFfi(__resultHandle);
    } finally {
      smoke_TypeDefs_TestStruct_releaseFfiHandle(__resultHandle);
    }
  }
  static TypeDefs_TestStruct returnNestedStructTypeDef(TypeDefs_TestStruct input) {
    final _returnNestedStructTypeDefFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_TypeDefs_returnNestedStructTypeDef__TestStruct'));
    final _inputHandle = smoke_TypeDefs_TestStruct_toFfi(input);
    final __resultHandle = _returnNestedStructTypeDefFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_TypeDefs_TestStruct_releaseFfiHandle(_inputHandle);
    try {
      return smoke_TypeDefs_TestStruct_fromFfi(__resultHandle);
    } finally {
      smoke_TypeDefs_TestStruct_releaseFfiHandle(__resultHandle);
    }
  }
  static Point returnTypeDefPointFromTypeCollection(Point input) {
    final _returnTypeDefPointFromTypeCollectionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_TypeDefs_returnTypeDefPointFromTypeCollection__Point'));
    final _inputHandle = smoke_TypeCollection_Point_toFfi(input);
    final __resultHandle = _returnTypeDefPointFromTypeCollectionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_TypeCollection_Point_releaseFfiHandle(_inputHandle);
    try {
      return smoke_TypeCollection_Point_fromFfi(__resultHandle);
    } finally {
      smoke_TypeCollection_Point_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  List<double> get primitiveTypeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_TypeDefs_primitiveTypeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_ListOf_Double_fromFfi(__resultHandle);
    } finally {
      foobar_ListOf_Double_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set primitiveTypeProperty(List<double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_TypeDefs_primitiveTypeProperty_set__ListOf_1Double'));
    final _valueHandle = foobar_ListOf_Double_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobar_ListOf_Double_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_TypeDefs_toFfi(TypeDefs value) =>
  _smokeTypedefsCopyHandle((value as __lib.NativeBase).handle);
TypeDefs smoke_TypeDefs_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as TypeDefs;
  if (instance != null) return instance;
  final _copiedHandle = _smokeTypedefsCopyHandle(handle);
  final result = TypeDefs$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_TypeDefs_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeTypedefsReleaseHandle(handle);
Pointer<Void> smoke_TypeDefs_toFfi_nullable(TypeDefs value) =>
  value != null ? smoke_TypeDefs_toFfi(value) : Pointer<Void>.fromAddress(0);
TypeDefs smoke_TypeDefs_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_TypeDefs_fromFfi(handle) : null;
void smoke_TypeDefs_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeTypedefsReleaseHandle(handle);
// End of TypeDefs "private" section.

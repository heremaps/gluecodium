

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/type_collection.dart';
import 'package:meta/meta.dart';

abstract class TypeDefs implements Finalizable {


  static double methodWithPrimitiveTypeDef(double input) => $prototype.methodWithPrimitiveTypeDef(input);

  static List<TypeDefs_TestStruct> methodWithComplexTypeDef(List<TypeDefs_TestStruct> input) => $prototype.methodWithComplexTypeDef(input);

  static double returnNestedIntTypeDef(double input) => $prototype.returnNestedIntTypeDef(input);

  static TypeDefs_TestStruct returnTestStructTypeDef(TypeDefs_TestStruct input) => $prototype.returnTestStructTypeDef(input);

  static TypeDefs_TestStruct returnNestedStructTypeDef(TypeDefs_TestStruct input) => $prototype.returnNestedStructTypeDef(input);

  static TypeCollection_Point returnTypeDefPointFromTypeCollection(TypeCollection_Point input) => $prototype.returnTypeDefPointFromTypeCollection(input);
  List<double> get primitiveTypeProperty;
  set primitiveTypeProperty(List<double> value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = TypeDefs$Impl(Pointer<Void>.fromAddress(0));
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



Pointer<Void> smokeTypedefsStructhavingaliasfielddefinedbelowToFfi(TypeDefs_StructHavingAliasFieldDefinedBelow value) {
  final _fieldHandle = (value.field);
  final _result = _smokeTypedefsStructhavingaliasfielddefinedbelowCreateHandle(_fieldHandle);
  
  return _result;
}

TypeDefs_StructHavingAliasFieldDefinedBelow smokeTypedefsStructhavingaliasfielddefinedbelowFromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeTypedefsStructhavingaliasfielddefinedbelowGetFieldfield(handle);
  try {
    return TypeDefs_StructHavingAliasFieldDefinedBelow(
      (_fieldHandle)
    );
  } finally {
    
  }
}

void smokeTypedefsStructhavingaliasfielddefinedbelowReleaseFfiHandle(Pointer<Void> handle) => _smokeTypedefsStructhavingaliasfielddefinedbelowReleaseHandle(handle);

// Nullable TypeDefs_StructHavingAliasFieldDefinedBelow

final _smokeTypedefsStructhavingaliasfielddefinedbelowCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle_nullable'));
final _smokeTypedefsStructhavingaliasfielddefinedbelowReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle_nullable'));
final _smokeTypedefsStructhavingaliasfielddefinedbelowGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_value_nullable'));

Pointer<Void> smokeTypedefsStructhavingaliasfielddefinedbelowToFfiNullable(TypeDefs_StructHavingAliasFieldDefinedBelow? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypedefsStructhavingaliasfielddefinedbelowToFfi(value);
  final result = _smokeTypedefsStructhavingaliasfielddefinedbelowCreateHandleNullable(_handle);
  smokeTypedefsStructhavingaliasfielddefinedbelowReleaseFfiHandle(_handle);
  return result;
}

TypeDefs_StructHavingAliasFieldDefinedBelow? smokeTypedefsStructhavingaliasfielddefinedbelowFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypedefsStructhavingaliasfielddefinedbelowGetValueNullable(handle);
  final result = smokeTypedefsStructhavingaliasfielddefinedbelowFromFfi(_handle);
  smokeTypedefsStructhavingaliasfielddefinedbelowReleaseFfiHandle(_handle);
  return result;
}

void smokeTypedefsStructhavingaliasfielddefinedbelowReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypedefsStructhavingaliasfielddefinedbelowReleaseHandleNullable(handle);

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



Pointer<Void> smokeTypedefsTeststructToFfi(TypeDefs_TestStruct value) {
  final _somethingHandle = stringToFfi(value.something);
  final _result = _smokeTypedefsTeststructCreateHandle(_somethingHandle);
  stringReleaseFfiHandle(_somethingHandle);
  return _result;
}

TypeDefs_TestStruct smokeTypedefsTeststructFromFfi(Pointer<Void> handle) {
  final _somethingHandle = _smokeTypedefsTeststructGetFieldsomething(handle);
  try {
    return TypeDefs_TestStruct(
      stringFromFfi(_somethingHandle)
    );
  } finally {
    stringReleaseFfiHandle(_somethingHandle);
  }
}

void smokeTypedefsTeststructReleaseFfiHandle(Pointer<Void> handle) => _smokeTypedefsTeststructReleaseHandle(handle);

// Nullable TypeDefs_TestStruct

final _smokeTypedefsTeststructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_create_handle_nullable'));
final _smokeTypedefsTeststructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_release_handle_nullable'));
final _smokeTypedefsTeststructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_get_value_nullable'));

Pointer<Void> smokeTypedefsTeststructToFfiNullable(TypeDefs_TestStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypedefsTeststructToFfi(value);
  final result = _smokeTypedefsTeststructCreateHandleNullable(_handle);
  smokeTypedefsTeststructReleaseFfiHandle(_handle);
  return result;
}

TypeDefs_TestStruct? smokeTypedefsTeststructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypedefsTeststructGetValueNullable(handle);
  final result = smokeTypedefsTeststructFromFfi(_handle);
  smokeTypedefsTeststructReleaseFfiHandle(_handle);
  return result;
}

void smokeTypedefsTeststructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypedefsTeststructReleaseHandleNullable(handle);

// End of TypeDefs_TestStruct "private" section.

// TypeDefs "private" section, not exported.

final _smokeTypedefsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_TypeDefs_register_finalizer'));
final _smokeTypedefsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_copy_handle'));
final _smokeTypedefsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_release_handle'));








/// @nodoc
@visibleForTesting
class TypeDefs$Impl extends __lib.NativeBase implements TypeDefs {

  TypeDefs$Impl(Pointer<Void> handle) : super(handle);

  double methodWithPrimitiveTypeDef(double input) {
    final _methodWithPrimitiveTypeDefFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Int32, Double), double Function(int, double)>('library_smoke_TypeDefs_methodWithPrimitiveTypeDef__Double'));
    final _inputHandle = (input);
    final __resultHandle = _methodWithPrimitiveTypeDefFfi(__lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  List<TypeDefs_TestStruct> methodWithComplexTypeDef(List<TypeDefs_TestStruct> input) {
    final _methodWithComplexTypeDefFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_TypeDefs_methodWithComplexTypeDef__ListOf_smoke_TypeDefs_TestStruct'));
    final _inputHandle = foobarListofSmokeTypedefsTeststructToFfi(input);
    final __resultHandle = _methodWithComplexTypeDefFfi(__lib.LibraryContext.isolateId, _inputHandle);
    foobarListofSmokeTypedefsTeststructReleaseFfiHandle(_inputHandle);
    try {
      return foobarListofSmokeTypedefsTeststructFromFfi(__resultHandle);
    } finally {
      foobarListofSmokeTypedefsTeststructReleaseFfiHandle(__resultHandle);

    }

  }

  double returnNestedIntTypeDef(double input) {
    final _returnNestedIntTypeDefFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Int32, Double), double Function(int, double)>('library_smoke_TypeDefs_returnNestedIntTypeDef__Double'));
    final _inputHandle = (input);
    final __resultHandle = _returnNestedIntTypeDefFfi(__lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  TypeDefs_TestStruct returnTestStructTypeDef(TypeDefs_TestStruct input) {
    final _returnTestStructTypeDefFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_TypeDefs_returnTestStructTypeDef__TestStruct'));
    final _inputHandle = smokeTypedefsTeststructToFfi(input);
    final __resultHandle = _returnTestStructTypeDefFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeTypedefsTeststructReleaseFfiHandle(_inputHandle);
    try {
      return smokeTypedefsTeststructFromFfi(__resultHandle);
    } finally {
      smokeTypedefsTeststructReleaseFfiHandle(__resultHandle);

    }

  }

  TypeDefs_TestStruct returnNestedStructTypeDef(TypeDefs_TestStruct input) {
    final _returnNestedStructTypeDefFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_TypeDefs_returnNestedStructTypeDef__TestStruct'));
    final _inputHandle = smokeTypedefsTeststructToFfi(input);
    final __resultHandle = _returnNestedStructTypeDefFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeTypedefsTeststructReleaseFfiHandle(_inputHandle);
    try {
      return smokeTypedefsTeststructFromFfi(__resultHandle);
    } finally {
      smokeTypedefsTeststructReleaseFfiHandle(__resultHandle);

    }

  }

  TypeCollection_Point returnTypeDefPointFromTypeCollection(TypeCollection_Point input) {
    final _returnTypeDefPointFromTypeCollectionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_TypeDefs_returnTypeDefPointFromTypeCollection__Point'));
    final _inputHandle = smokeTypecollectionPointToFfi(input);
    final __resultHandle = _returnTypeDefPointFromTypeCollectionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeTypecollectionPointReleaseFfiHandle(_inputHandle);
    try {
      return smokeTypecollectionPointFromFfi(__resultHandle);
    } finally {
      smokeTypecollectionPointReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  List<double> get primitiveTypeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_TypeDefs_primitiveTypeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarListofDoubleFromFfi(__resultHandle);
    } finally {
      foobarListofDoubleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set primitiveTypeProperty(List<double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_TypeDefs_primitiveTypeProperty_set__ListOf_Double'));
    final _valueHandle = foobarListofDoubleToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarListofDoubleReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> smokeTypedefsToFfi(TypeDefs value) =>
  _smokeTypedefsCopyHandle((value as __lib.NativeBase).handle);

TypeDefs smokeTypedefsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TypeDefs) return instance;

  final _copiedHandle = _smokeTypedefsCopyHandle(handle);
  final result = TypeDefs$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeTypedefsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeTypedefsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeTypedefsReleaseHandle(handle);

Pointer<Void> smokeTypedefsToFfiNullable(TypeDefs? value) =>
  value != null ? smokeTypedefsToFfi(value) : Pointer<Void>.fromAddress(0);

TypeDefs? smokeTypedefsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeTypedefsFromFfi(handle) : null;

void smokeTypedefsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypedefsReleaseHandle(handle);

// End of TypeDefs "private" section.





import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

abstract class PropertiesInterface implements Finalizable {

  factory PropertiesInterface(
    PropertiesInterface_ExampleStruct Function() structPropertyGetLambda,
    void Function(PropertiesInterface_ExampleStruct) structPropertySetLambda
  ) => PropertiesInterface$Lambdas(
    structPropertyGetLambda,
    structPropertySetLambda
  );

  PropertiesInterface_ExampleStruct get structProperty;
  set structProperty(PropertiesInterface_ExampleStruct value);

}


class PropertiesInterface_ExampleStruct {
  double value;

  PropertiesInterface_ExampleStruct(this.value);
}


// PropertiesInterface_ExampleStruct "private" section, not exported.

final _smokePropertiesinterfaceExamplestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_PropertiesInterface_ExampleStruct_create_handle'));
final _smokePropertiesinterfaceExamplestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_release_handle'));
final _smokePropertiesinterfaceExamplestructGetFieldvalue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_get_field_value'));



Pointer<Void> smokePropertiesinterfaceExamplestructToFfi(PropertiesInterface_ExampleStruct value) {
  final _valueHandle = (value.value);
  final _result = _smokePropertiesinterfaceExamplestructCreateHandle(_valueHandle);
  
  return _result;
}

PropertiesInterface_ExampleStruct smokePropertiesinterfaceExamplestructFromFfi(Pointer<Void> handle) {
  final _valueHandle = _smokePropertiesinterfaceExamplestructGetFieldvalue(handle);
  try {
    return PropertiesInterface_ExampleStruct(
      (_valueHandle)
    );
  } finally {
    
  }
}

void smokePropertiesinterfaceExamplestructReleaseFfiHandle(Pointer<Void> handle) => _smokePropertiesinterfaceExamplestructReleaseHandle(handle);

// Nullable PropertiesInterface_ExampleStruct

final _smokePropertiesinterfaceExamplestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_create_handle_nullable'));
final _smokePropertiesinterfaceExamplestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_release_handle_nullable'));
final _smokePropertiesinterfaceExamplestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_get_value_nullable'));

Pointer<Void> smokePropertiesinterfaceExamplestructToFfiNullable(PropertiesInterface_ExampleStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePropertiesinterfaceExamplestructToFfi(value);
  final result = _smokePropertiesinterfaceExamplestructCreateHandleNullable(_handle);
  smokePropertiesinterfaceExamplestructReleaseFfiHandle(_handle);
  return result;
}

PropertiesInterface_ExampleStruct? smokePropertiesinterfaceExamplestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePropertiesinterfaceExamplestructGetValueNullable(handle);
  final result = smokePropertiesinterfaceExamplestructFromFfi(_handle);
  smokePropertiesinterfaceExamplestructReleaseFfiHandle(_handle);
  return result;
}

void smokePropertiesinterfaceExamplestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePropertiesinterfaceExamplestructReleaseHandleNullable(handle);

// End of PropertiesInterface_ExampleStruct "private" section.

// PropertiesInterface "private" section, not exported.

final _smokePropertiesinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_PropertiesInterface_register_finalizer'));
final _smokePropertiesinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_copy_handle'));
final _smokePropertiesinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_release_handle'));
final _smokePropertiesinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
  >('library_smoke_PropertiesInterface_create_proxy'));
final _smokePropertiesinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_get_type_id'));

class PropertiesInterface$Lambdas implements PropertiesInterface {
  PropertiesInterface_ExampleStruct Function() structPropertyGetLambda;
  void Function(PropertiesInterface_ExampleStruct) structPropertySetLambda;

  PropertiesInterface$Lambdas(
    this.structPropertyGetLambda,
    this.structPropertySetLambda
  );

  @override
  PropertiesInterface_ExampleStruct get structProperty => structPropertyGetLambda();
  @override
  set structProperty(PropertiesInterface_ExampleStruct value) => structPropertySetLambda(value);
}

class PropertiesInterface$Impl extends __lib.NativeBase implements PropertiesInterface {

  PropertiesInterface$Impl(Pointer<Void> handle) : super(handle);

  PropertiesInterface_ExampleStruct get structProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_PropertiesInterface_structProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokePropertiesinterfaceExamplestructFromFfi(__resultHandle);
    } finally {
      smokePropertiesinterfaceExamplestructReleaseFfiHandle(__resultHandle);

    }

  }


  set structProperty(PropertiesInterface_ExampleStruct value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PropertiesInterface_structProperty_set__ExampleStruct'));
    final _valueHandle = smokePropertiesinterfaceExamplestructToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokePropertiesinterfaceExamplestructReleaseFfiHandle(_valueHandle);

  }



}


void _smokePropertiesinterfacestructPropertyGetStatic(PropertiesInterface _obj, Pointer<Pointer<Void>> _result) {
  _result.value = smokePropertiesinterfaceExamplestructToFfi(_obj.structProperty);
}

void _smokePropertiesinterfacestructPropertySetStatic(PropertiesInterface _obj, Pointer<Void> _value) {
  try {
    _obj.structProperty = smokePropertiesinterfaceExamplestructFromFfi(_value);
  } finally {
    smokePropertiesinterfaceExamplestructReleaseFfiHandle(_value);
  }
}

Pointer<Void> smokePropertiesinterfaceToFfi(PropertiesInterface __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokePropertiesinterfaceCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __smokePropertiesinterfacestructPropertyGetCaller(Pointer<Pointer<Void>> _result) { _smokePropertiesinterfacestructPropertyGetStatic(__interfaceObj, _result); }
  final __smokePropertiesinterfacestructPropertyGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokePropertiesinterfacestructPropertyGetCaller);
  __smokePropertiesinterfacestructPropertyGetCallback.keepIsolateAlive = false;

  void __smokePropertiesinterfacestructPropertySetCaller(Pointer<Void> _value) { _smokePropertiesinterfacestructPropertySetStatic(__interfaceObj, _value); }
  final __smokePropertiesinterfacestructPropertySetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokePropertiesinterfacestructPropertySetCaller);
  __smokePropertiesinterfacestructPropertySetCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __smokePropertiesinterfacestructPropertyGetCallback.close();
    __smokePropertiesinterfacestructPropertySetCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokePropertiesinterfaceCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __smokePropertiesinterfacestructPropertyGetCallback.nativeFunction,
    __smokePropertiesinterfacestructPropertySetCallback.nativeFunction
  );

  return result;
}

PropertiesInterface smokePropertiesinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PropertiesInterface) return instance;

  final _typeIdHandle = _smokePropertiesinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokePropertiesinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : PropertiesInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokePropertiesinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokePropertiesinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokePropertiesinterfaceReleaseHandle(handle);

Pointer<Void> smokePropertiesinterfaceToFfiNullable(PropertiesInterface? value) =>
  value != null ? smokePropertiesinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);

PropertiesInterface? smokePropertiesinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokePropertiesinterfaceFromFfi(handle) : null;

void smokePropertiesinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePropertiesinterfaceReleaseHandle(handle);

// End of PropertiesInterface "private" section.



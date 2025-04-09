

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/child_interface.dart';
import 'package:library/src/smoke/grand_child_interface.dart';

abstract class ParentInterface implements Finalizable {

  factory ParentInterface(
    void Function() rootMethodLambda,
    String Function() rootPropertyGetLambda,
    void Function(String) rootPropertySetLambda
  ) => ParentInterface$Lambdas(
    rootMethodLambda,
    rootPropertyGetLambda,
    rootPropertySetLambda
  );


  void rootMethod();
  String get rootProperty;
  set rootProperty(String value);

}


// ParentInterface "private" section, not exported.

final _smokeParentinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ParentInterface_register_finalizer'));
final _smokeParentinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ParentInterface_copy_handle'));
final _smokeParentinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ParentInterface_release_handle'));
final _smokeParentinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ParentInterface_create_proxy'));
final _smokeParentinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ParentInterface_get_type_id'));


class ParentInterface$Lambdas implements ParentInterface {
  void Function() rootMethodLambda;
  String Function() rootPropertyGetLambda;
  void Function(String) rootPropertySetLambda;

  ParentInterface$Lambdas(
    this.rootMethodLambda,
    this.rootPropertyGetLambda,
    this.rootPropertySetLambda
  );

  @override
  void rootMethod() =>
    rootMethodLambda();
  @override
  String get rootProperty => rootPropertyGetLambda();
  @override
  set rootProperty(String value) => rootPropertySetLambda(value);
}

class ParentInterface$Impl extends __lib.NativeBase implements ParentInterface {

  ParentInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  void rootMethod() {
    final _rootMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootMethod'));
    final _handle = this.handle;
    _rootMethodFfi(_handle, __lib.LibraryContext.isolateId);

  }

  String get rootProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  set rootProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentInterface_rootProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }



}

void _smokeParentinterfacerootMethodStatic(ParentInterface _obj) {

  try {
    _obj.rootMethod();
  } finally {
  }
}

void _smokeParentinterfacerootPropertyGetStatic(ParentInterface _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi(_obj.rootProperty);
}

void _smokeParentinterfacerootPropertySetStatic(ParentInterface _obj, Pointer<Void> _value) {
  try {
    _obj.rootProperty = stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
}

Pointer<Void> smokeParentinterfaceToFfi(ParentInterface value) {
  if (value is __lib.NativeBase) return _smokeParentinterfaceCopyHandle((value as __lib.NativeBase).handle);

  final descendantResult = tryDescendantToFfi(value);
  if (descendantResult != null) {
    return descendantResult;
  }

  void __rootMethodCaller() { _smokeParentinterfacerootMethodStatic(value); }
  final __rootMethodCallback = NativeCallable<Void Function()>.isolateLocal(__rootMethodCaller);
  __rootMethodCallback.keepIsolateAlive = false;

  void __smokeParentinterfacerootPropertyGetCaller(Pointer<Pointer<Void>> _result) { _smokeParentinterfacerootPropertyGetStatic(value, _result); }
  final __smokeParentinterfacerootPropertyGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeParentinterfacerootPropertyGetCaller);
  __smokeParentinterfacerootPropertyGetCallback.keepIsolateAlive = false;

  void __smokeParentinterfacerootPropertySetCaller(Pointer<Void> _value) { _smokeParentinterfacerootPropertySetStatic(value, _value); }
  final __smokeParentinterfacerootPropertySetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeParentinterfacerootPropertySetCaller);
  __smokeParentinterfacerootPropertySetCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __rootMethodCallback.close();
    __smokeParentinterfacerootPropertyGetCallback.close();
    __smokeParentinterfacerootPropertySetCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeParentinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    __closeAllCallback.nativeFunction,
    __rootMethodCallback.nativeFunction,
    __smokeParentinterfacerootPropertyGetCallback.nativeFunction,
    __smokeParentinterfacerootPropertySetCallback.nativeFunction
  );

  return result;
}

ParentInterface smokeParentinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ParentInterface) return instance;

  final _typeIdHandle = _smokeParentinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeParentinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ParentInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeParentinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeParentinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeParentinterfaceReleaseHandle(handle);

Pointer<Void> smokeParentinterfaceToFfiNullable(ParentInterface? value) =>
  value != null ? smokeParentinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);

ParentInterface? smokeParentinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeParentinterfaceFromFfi(handle) : null;

void smokeParentinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeParentinterfaceReleaseHandle(handle);

Pointer<Void>? tryDescendantToFfi(ParentInterface value) {
  if (value is GrandChildInterface) return smokeGrandchildinterfaceToFfi(value);
  if (value is ChildInterface) return smokeChildinterfaceToFfi(value);
  return null;
}

// End of ParentInterface "private" section.



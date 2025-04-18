

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/grand_child_interface.dart';
import 'package:library/src/smoke/parent_interface.dart';

abstract class ChildInterface implements ParentInterface, Finalizable {

  factory ChildInterface(
    void Function() rootMethodLambda,
    void Function() childMethodLambda,
    String Function() rootPropertyGetLambda,
    void Function(String) rootPropertySetLambda
  ) => ChildInterface$Lambdas(
    rootMethodLambda,
    childMethodLambda,
    rootPropertyGetLambda,
    rootPropertySetLambda
  );


  void childMethod();
}


// ChildInterface "private" section, not exported.

final _smokeChildinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ChildInterface_register_finalizer'));
final _smokeChildinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildInterface_copy_handle'));
final _smokeChildinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ChildInterface_release_handle'));
final _smokeChildinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ChildInterface_create_proxy'));
final _smokeChildinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildInterface_get_type_id'));


class ChildInterface$Lambdas implements ChildInterface {
  void Function() rootMethodLambda;
  void Function() childMethodLambda;
  String Function() rootPropertyGetLambda;
  void Function(String) rootPropertySetLambda;

  ChildInterface$Lambdas(
    this.rootMethodLambda,
    this.childMethodLambda,
    this.rootPropertyGetLambda,
    this.rootPropertySetLambda
  );

  @override
  void rootMethod() =>
    rootMethodLambda();
  @override
  void childMethod() =>
    childMethodLambda();
  @override
  String get rootProperty => rootPropertyGetLambda();
  @override
  set rootProperty(String value) => rootPropertySetLambda(value);
}

class ChildInterface$Impl extends __lib.NativeBase implements ChildInterface {

  ChildInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  void rootMethod() {
    final _rootMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootMethod'));
    final _handle = this.handle;
    _rootMethodFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void childMethod() {
    final _childMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildInterface_childMethod'));
    final _handle = this.handle;
    _childMethodFfi(_handle, __lib.LibraryContext.isolateId);

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

void _smokeChildinterfacerootMethodStatic(ChildInterface _obj) {

  try {
    _obj.rootMethod();
  } finally {
  }
}
void _smokeChildinterfacechildMethodStatic(ChildInterface _obj) {

  try {
    _obj.childMethod();
  } finally {
  }
}

void _smokeChildinterfacerootPropertyGetStatic(ChildInterface _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi(_obj.rootProperty);
}

void _smokeChildinterfacerootPropertySetStatic(ChildInterface _obj, Pointer<Void> _value) {
  try {
    _obj.rootProperty = stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
}

Pointer<Void> smokeChildinterfaceToFfi(ChildInterface __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeChildinterfaceCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  final descendantResult = tryDescendantToFfi(__interfaceObj);
  if (descendantResult != null) {
    return descendantResult;
  }

  void __rootMethodCaller() { _smokeChildinterfacerootMethodStatic(__interfaceObj); }
  final __rootMethodCallback = NativeCallable<Void Function()>.isolateLocal(__rootMethodCaller);
  __rootMethodCallback.keepIsolateAlive = false;

  void __childMethodCaller() { _smokeChildinterfacechildMethodStatic(__interfaceObj); }
  final __childMethodCallback = NativeCallable<Void Function()>.isolateLocal(__childMethodCaller);
  __childMethodCallback.keepIsolateAlive = false;

  void __smokeChildinterfacerootPropertyGetCaller(Pointer<Pointer<Void>> _result) { _smokeChildinterfacerootPropertyGetStatic(__interfaceObj, _result); }
  final __smokeChildinterfacerootPropertyGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeChildinterfacerootPropertyGetCaller);
  __smokeChildinterfacerootPropertyGetCallback.keepIsolateAlive = false;

  void __smokeChildinterfacerootPropertySetCaller(Pointer<Void> _value) { _smokeChildinterfacerootPropertySetStatic(__interfaceObj, _value); }
  final __smokeChildinterfacerootPropertySetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeChildinterfacerootPropertySetCaller);
  __smokeChildinterfacerootPropertySetCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __rootMethodCallback.close();
    __childMethodCallback.close();
    __smokeChildinterfacerootPropertyGetCallback.close();
    __smokeChildinterfacerootPropertySetCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeChildinterfaceCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __rootMethodCallback.nativeFunction,
    __childMethodCallback.nativeFunction,
    __smokeChildinterfacerootPropertyGetCallback.nativeFunction,
    __smokeChildinterfacerootPropertySetCallback.nativeFunction
  );

  return result;
}

ChildInterface smokeChildinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ChildInterface) return instance;

  final _typeIdHandle = _smokeChildinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeChildinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ChildInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeChildinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeChildinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeChildinterfaceReleaseHandle(handle);

Pointer<Void> smokeChildinterfaceToFfiNullable(ChildInterface? value) =>
  value != null ? smokeChildinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);

ChildInterface? smokeChildinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeChildinterfaceFromFfi(handle) : null;

void smokeChildinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeChildinterfaceReleaseHandle(handle);

Pointer<Void>? tryDescendantToFfi(ChildInterface value) {
  if (value is GrandChildInterface) return smokeGrandchildinterfaceToFfi(value);
  return null;
}

// End of ChildInterface "private" section.



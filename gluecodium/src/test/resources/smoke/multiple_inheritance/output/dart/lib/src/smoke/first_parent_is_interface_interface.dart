

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/another/some_cool_class_type.dart';
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_interface.dart';
import 'package:library/src/smoke/parent_narrow_one.dart';

abstract class FirstParentIsInterfaceInterface implements ParentInterface, ParentNarrowOne, Finalizable {

  factory FirstParentIsInterfaceInterface(
    void Function() parentFunctionLambda,
    void Function(SomeCoolClassType) someFunctionThatUsesTypeFromAnotherPackageLambda,
    void Function() parentFunctionOneLambda,
    void Function() childFunctionLambda,
    String Function() parentPropertyGetLambda,
    void Function(String) parentPropertySetLambda,
    String Function() parentPropertyOneGetLambda,
    void Function(String) parentPropertyOneSetLambda,
    String Function() childPropertyGetLambda,
    void Function(String) childPropertySetLambda
  ) => FirstParentIsInterfaceInterface$Lambdas(
    parentFunctionLambda,
    someFunctionThatUsesTypeFromAnotherPackageLambda,
    parentFunctionOneLambda,
    childFunctionLambda,
    parentPropertyGetLambda,
    parentPropertySetLambda,
    parentPropertyOneGetLambda,
    parentPropertyOneSetLambda,
    childPropertyGetLambda,
    childPropertySetLambda
  );


  void childFunction();
  String get childProperty;
  set childProperty(String value);

}


// FirstParentIsInterfaceInterface "private" section, not exported.

final _smokeFirstparentisinterfaceinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_FirstParentIsInterfaceInterface_register_finalizer'));
final _smokeFirstparentisinterfaceinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FirstParentIsInterfaceInterface_copy_handle'));
final _smokeFirstparentisinterfaceinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FirstParentIsInterfaceInterface_release_handle'));
final _smokeFirstparentisinterfaceinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_FirstParentIsInterfaceInterface_create_proxy'));
final _smokeFirstparentisinterfaceinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FirstParentIsInterfaceInterface_get_type_id'));


class FirstParentIsInterfaceInterface$Lambdas implements FirstParentIsInterfaceInterface {
  void Function() parentFunctionLambda;
  void Function(SomeCoolClassType) someFunctionThatUsesTypeFromAnotherPackageLambda;
  void Function() parentFunctionOneLambda;
  void Function() childFunctionLambda;
  String Function() parentPropertyGetLambda;
  void Function(String) parentPropertySetLambda;
  String Function() parentPropertyOneGetLambda;
  void Function(String) parentPropertyOneSetLambda;
  String Function() childPropertyGetLambda;
  void Function(String) childPropertySetLambda;

  FirstParentIsInterfaceInterface$Lambdas(
    this.parentFunctionLambda,
    this.someFunctionThatUsesTypeFromAnotherPackageLambda,
    this.parentFunctionOneLambda,
    this.childFunctionLambda,
    this.parentPropertyGetLambda,
    this.parentPropertySetLambda,
    this.parentPropertyOneGetLambda,
    this.parentPropertyOneSetLambda,
    this.childPropertyGetLambda,
    this.childPropertySetLambda
  );

  @override
  void parentFunction() =>
    parentFunctionLambda();
  @override
  void someFunctionThatUsesTypeFromAnotherPackage(SomeCoolClassType someParam) =>
    someFunctionThatUsesTypeFromAnotherPackageLambda(someParam);
  @override
  void parentFunctionOne() =>
    parentFunctionOneLambda();
  @override
  void childFunction() =>
    childFunctionLambda();
  @override
  String get parentProperty => parentPropertyGetLambda();
  @override
  set parentProperty(String value) => parentPropertySetLambda(value);
  @override
  String get parentPropertyOne => parentPropertyOneGetLambda();
  @override
  set parentPropertyOne(String value) => parentPropertyOneSetLambda(value);
  @override
  String get childProperty => childPropertyGetLambda();
  @override
  set childProperty(String value) => childPropertySetLambda(value);
}

class FirstParentIsInterfaceInterface$Impl extends __lib.NativeBase implements FirstParentIsInterfaceInterface {

  FirstParentIsInterfaceInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  void parentFunction() {
    final _parentFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentInterface_parentFunction'));
    final _handle = this.handle;
    _parentFunctionFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void someFunctionThatUsesTypeFromAnotherPackage(SomeCoolClassType someParam) {
    final _someFunctionThatUsesTypeFromAnotherPackageFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentInterface_someFunctionThatUsesTypeFromAnotherPackage__SomeCoolClassType'));
    final _someParamHandle = anotherSomecoolclasstypeToFfi(someParam);
    final _handle = this.handle;
    _someFunctionThatUsesTypeFromAnotherPackageFfi(_handle, __lib.LibraryContext.isolateId, _someParamHandle);
    anotherSomecoolclasstypeReleaseFfiHandle(_someParamHandle);

  }

  @override
  void parentFunctionOne() {
    final _parentFunctionOneFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentNarrowOne_parentFunctionOne'));
    final _handle = this.handle;
    _parentFunctionOneFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void childFunction() {
    final _childFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_FirstParentIsInterfaceInterface_childFunction'));
    final _handle = this.handle;
    _childFunctionFfi(_handle, __lib.LibraryContext.isolateId);

  }

  String get parentProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentInterface_parentProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  set parentProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentInterface_parentProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


  String get parentPropertyOne {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentNarrowOne_parentPropertyOne_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  set parentPropertyOne(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentNarrowOne_parentPropertyOne_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


  String get childProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_FirstParentIsInterfaceInterface_childProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  set childProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_FirstParentIsInterfaceInterface_childProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }



}

void _smokeFirstparentisinterfaceinterfaceparentFunctionStatic(FirstParentIsInterfaceInterface _obj) {

  try {
    _obj.parentFunction();
  } finally {
  }
}
void _smokeFirstparentisinterfaceinterfacesomeFunctionThatUsesTypeFromAnotherPackageStatic(FirstParentIsInterfaceInterface _obj, Pointer<Void> someParam) {

  try {
    _obj.someFunctionThatUsesTypeFromAnotherPackage(anotherSomecoolclasstypeFromFfi(someParam));
  } finally {
    anotherSomecoolclasstypeReleaseFfiHandle(someParam);
  }
}
void _smokeFirstparentisinterfaceinterfaceparentFunctionOneStatic(FirstParentIsInterfaceInterface _obj) {

  try {
    _obj.parentFunctionOne();
  } finally {
  }
}
void _smokeFirstparentisinterfaceinterfacechildFunctionStatic(FirstParentIsInterfaceInterface _obj) {

  try {
    _obj.childFunction();
  } finally {
  }
}

void _smokeFirstparentisinterfaceinterfaceparentPropertyGetStatic(FirstParentIsInterfaceInterface _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi(_obj.parentProperty);
}

void _smokeFirstparentisinterfaceinterfaceparentPropertySetStatic(FirstParentIsInterfaceInterface _obj, Pointer<Void> _value) {
  try {
    _obj.parentProperty = stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
}
void _smokeFirstparentisinterfaceinterfaceparentPropertyOneGetStatic(FirstParentIsInterfaceInterface _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi(_obj.parentPropertyOne);
}

void _smokeFirstparentisinterfaceinterfaceparentPropertyOneSetStatic(FirstParentIsInterfaceInterface _obj, Pointer<Void> _value) {
  try {
    _obj.parentPropertyOne = stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
}
void _smokeFirstparentisinterfaceinterfacechildPropertyGetStatic(FirstParentIsInterfaceInterface _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi(_obj.childProperty);
}

void _smokeFirstparentisinterfaceinterfacechildPropertySetStatic(FirstParentIsInterfaceInterface _obj, Pointer<Void> _value) {
  try {
    _obj.childProperty = stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
}

Pointer<Void> smokeFirstparentisinterfaceinterfaceToFfi(FirstParentIsInterfaceInterface __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeFirstparentisinterfaceinterfaceCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __parentFunctionCaller() { _smokeFirstparentisinterfaceinterfaceparentFunctionStatic(__interfaceObj); }
  final __parentFunctionCallback = NativeCallable<Void Function()>.isolateLocal(__parentFunctionCaller);
  __parentFunctionCallback.keepIsolateAlive = false;

  void __someFunctionThatUsesTypeFromAnotherPackageCaller(Pointer<Void> someParam) { _smokeFirstparentisinterfaceinterfacesomeFunctionThatUsesTypeFromAnotherPackageStatic(__interfaceObj, someParam); }
  final __someFunctionThatUsesTypeFromAnotherPackageCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__someFunctionThatUsesTypeFromAnotherPackageCaller);
  __someFunctionThatUsesTypeFromAnotherPackageCallback.keepIsolateAlive = false;

  void __parentFunctionOneCaller() { _smokeFirstparentisinterfaceinterfaceparentFunctionOneStatic(__interfaceObj); }
  final __parentFunctionOneCallback = NativeCallable<Void Function()>.isolateLocal(__parentFunctionOneCaller);
  __parentFunctionOneCallback.keepIsolateAlive = false;

  void __childFunctionCaller() { _smokeFirstparentisinterfaceinterfacechildFunctionStatic(__interfaceObj); }
  final __childFunctionCallback = NativeCallable<Void Function()>.isolateLocal(__childFunctionCaller);
  __childFunctionCallback.keepIsolateAlive = false;

  void __smokeFirstparentisinterfaceinterfaceparentPropertyGetCaller(Pointer<Pointer<Void>> _result) { _smokeFirstparentisinterfaceinterfaceparentPropertyGetStatic(__interfaceObj, _result); }
  final __smokeFirstparentisinterfaceinterfaceparentPropertyGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeFirstparentisinterfaceinterfaceparentPropertyGetCaller);
  __smokeFirstparentisinterfaceinterfaceparentPropertyGetCallback.keepIsolateAlive = false;

  void __smokeFirstparentisinterfaceinterfaceparentPropertySetCaller(Pointer<Void> _value) { _smokeFirstparentisinterfaceinterfaceparentPropertySetStatic(__interfaceObj, _value); }
  final __smokeFirstparentisinterfaceinterfaceparentPropertySetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeFirstparentisinterfaceinterfaceparentPropertySetCaller);
  __smokeFirstparentisinterfaceinterfaceparentPropertySetCallback.keepIsolateAlive = false;

  void __smokeFirstparentisinterfaceinterfaceparentPropertyOneGetCaller(Pointer<Pointer<Void>> _result) { _smokeFirstparentisinterfaceinterfaceparentPropertyOneGetStatic(__interfaceObj, _result); }
  final __smokeFirstparentisinterfaceinterfaceparentPropertyOneGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeFirstparentisinterfaceinterfaceparentPropertyOneGetCaller);
  __smokeFirstparentisinterfaceinterfaceparentPropertyOneGetCallback.keepIsolateAlive = false;

  void __smokeFirstparentisinterfaceinterfaceparentPropertyOneSetCaller(Pointer<Void> _value) { _smokeFirstparentisinterfaceinterfaceparentPropertyOneSetStatic(__interfaceObj, _value); }
  final __smokeFirstparentisinterfaceinterfaceparentPropertyOneSetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeFirstparentisinterfaceinterfaceparentPropertyOneSetCaller);
  __smokeFirstparentisinterfaceinterfaceparentPropertyOneSetCallback.keepIsolateAlive = false;

  void __smokeFirstparentisinterfaceinterfacechildPropertyGetCaller(Pointer<Pointer<Void>> _result) { _smokeFirstparentisinterfaceinterfacechildPropertyGetStatic(__interfaceObj, _result); }
  final __smokeFirstparentisinterfaceinterfacechildPropertyGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeFirstparentisinterfaceinterfacechildPropertyGetCaller);
  __smokeFirstparentisinterfaceinterfacechildPropertyGetCallback.keepIsolateAlive = false;

  void __smokeFirstparentisinterfaceinterfacechildPropertySetCaller(Pointer<Void> _value) { _smokeFirstparentisinterfaceinterfacechildPropertySetStatic(__interfaceObj, _value); }
  final __smokeFirstparentisinterfaceinterfacechildPropertySetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeFirstparentisinterfaceinterfacechildPropertySetCaller);
  __smokeFirstparentisinterfaceinterfacechildPropertySetCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __parentFunctionCallback.close();
    __someFunctionThatUsesTypeFromAnotherPackageCallback.close();
    __parentFunctionOneCallback.close();
    __childFunctionCallback.close();
    __smokeFirstparentisinterfaceinterfaceparentPropertyGetCallback.close();
    __smokeFirstparentisinterfaceinterfaceparentPropertySetCallback.close();
    __smokeFirstparentisinterfaceinterfaceparentPropertyOneGetCallback.close();
    __smokeFirstparentisinterfaceinterfaceparentPropertyOneSetCallback.close();
    __smokeFirstparentisinterfaceinterfacechildPropertyGetCallback.close();
    __smokeFirstparentisinterfaceinterfacechildPropertySetCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeFirstparentisinterfaceinterfaceCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __parentFunctionCallback.nativeFunction,
    __someFunctionThatUsesTypeFromAnotherPackageCallback.nativeFunction,
    __parentFunctionOneCallback.nativeFunction,
    __childFunctionCallback.nativeFunction,
    __smokeFirstparentisinterfaceinterfaceparentPropertyGetCallback.nativeFunction,
    __smokeFirstparentisinterfaceinterfaceparentPropertySetCallback.nativeFunction,
    __smokeFirstparentisinterfaceinterfaceparentPropertyOneGetCallback.nativeFunction,
    __smokeFirstparentisinterfaceinterfaceparentPropertyOneSetCallback.nativeFunction,
    __smokeFirstparentisinterfaceinterfacechildPropertyGetCallback.nativeFunction,
    __smokeFirstparentisinterfaceinterfacechildPropertySetCallback.nativeFunction
  );

  return result;
}

FirstParentIsInterfaceInterface smokeFirstparentisinterfaceinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is FirstParentIsInterfaceInterface) return instance;

  final _typeIdHandle = _smokeFirstparentisinterfaceinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeFirstparentisinterfaceinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : FirstParentIsInterfaceInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeFirstparentisinterfaceinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeFirstparentisinterfaceinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeFirstparentisinterfaceinterfaceReleaseHandle(handle);

Pointer<Void> smokeFirstparentisinterfaceinterfaceToFfiNullable(FirstParentIsInterfaceInterface? value) =>
  value != null ? smokeFirstparentisinterfaceinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);

FirstParentIsInterfaceInterface? smokeFirstparentisinterfaceinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeFirstparentisinterfaceinterfaceFromFfi(handle) : null;

void smokeFirstparentisinterfaceinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFirstparentisinterfaceinterfaceReleaseHandle(handle);

// End of FirstParentIsInterfaceInterface "private" section.



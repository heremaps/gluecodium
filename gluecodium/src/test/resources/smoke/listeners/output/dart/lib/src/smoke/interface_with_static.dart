

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';

abstract class InterfaceWithStatic implements Finalizable {

  factory InterfaceWithStatic(
    String Function() regularFunctionLambda,
    String Function() regularPropertyGetLambda,
    void Function(String) regularPropertySetLambda,

  ) => InterfaceWithStatic$Lambdas(
    regularFunctionLambda,
    regularPropertyGetLambda,
    regularPropertySetLambda,

  );


  String regularFunction();

  static String staticFunction() => $prototype.staticFunction();
  String get regularProperty;
  set regularProperty(String value);

  static String get staticProperty => $prototype.staticProperty;
  static set staticProperty(String value) { $prototype.staticProperty = value; }


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = InterfaceWithStatic$Impl(Pointer<Void>.fromAddress(0));
}


// InterfaceWithStatic "private" section, not exported.

final _smokeInterfacewithstaticRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_InterfaceWithStatic_register_finalizer'));
final _smokeInterfacewithstaticCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InterfaceWithStatic_copy_handle'));
final _smokeInterfacewithstaticReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InterfaceWithStatic_release_handle'));
final _smokeInterfacewithstaticCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_InterfaceWithStatic_create_proxy'));
final _smokeInterfacewithstaticGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InterfaceWithStatic_get_type_id'));



class InterfaceWithStatic$Lambdas implements InterfaceWithStatic {
  String Function() regularFunctionLambda;
  String Function() regularPropertyGetLambda;
  void Function(String) regularPropertySetLambda;

  InterfaceWithStatic$Lambdas(
    this.regularFunctionLambda,
    this.regularPropertyGetLambda,
    this.regularPropertySetLambda,

  );

  @override
  String regularFunction() =>
    regularFunctionLambda();
  @override
  String get regularProperty => regularPropertyGetLambda();
  @override
  set regularProperty(String value) => regularPropertySetLambda(value);
}

/// @nodoc
@visibleForTesting
class InterfaceWithStatic$Impl extends __lib.NativeBase implements InterfaceWithStatic {

  InterfaceWithStatic$Impl(Pointer<Void> handle) : super(handle);

  @override
  String regularFunction() {
    final _regularFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_InterfaceWithStatic_regularFunction'));
    final _handle = this.handle;
    final __resultHandle = _regularFunctionFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  String staticFunction() {
    final _staticFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_InterfaceWithStatic_staticFunction'));
    final __resultHandle = _staticFunctionFfi(__lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  String get regularProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_InterfaceWithStatic_regularProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  set regularProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_InterfaceWithStatic_regularProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


  String get staticProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_InterfaceWithStatic_staticProperty_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  set staticProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('library_smoke_InterfaceWithStatic_staticProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }



}

void _smokeInterfacewithstaticregularFunctionStatic(InterfaceWithStatic _obj, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = _obj.regularFunction();
    _result.value = stringToFfi(_resultObject);
  } finally {
  }
}

void _smokeInterfacewithstaticregularPropertyGetStatic(InterfaceWithStatic _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi(_obj.regularProperty);
}

void _smokeInterfacewithstaticregularPropertySetStatic(InterfaceWithStatic _obj, Pointer<Void> _value) {
  try {
    _obj.regularProperty = stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
}

Pointer<Void> smokeInterfacewithstaticToFfi(InterfaceWithStatic __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeInterfacewithstaticCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __regularFunctionCaller(Pointer<Pointer<Void>> _result) { _smokeInterfacewithstaticregularFunctionStatic(__interfaceObj, _result); }
  final __regularFunctionCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__regularFunctionCaller);
  __regularFunctionCallback.keepIsolateAlive = false;

  void __smokeInterfacewithstaticregularPropertyGetCaller(Pointer<Pointer<Void>> _result) { _smokeInterfacewithstaticregularPropertyGetStatic(__interfaceObj, _result); }
  final __smokeInterfacewithstaticregularPropertyGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeInterfacewithstaticregularPropertyGetCaller);
  __smokeInterfacewithstaticregularPropertyGetCallback.keepIsolateAlive = false;

  void __smokeInterfacewithstaticregularPropertySetCaller(Pointer<Void> _value) { _smokeInterfacewithstaticregularPropertySetStatic(__interfaceObj, _value); }
  final __smokeInterfacewithstaticregularPropertySetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeInterfacewithstaticregularPropertySetCaller);
  __smokeInterfacewithstaticregularPropertySetCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __regularFunctionCallback.close();
    __smokeInterfacewithstaticregularPropertyGetCallback.close();
    __smokeInterfacewithstaticregularPropertySetCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeInterfacewithstaticCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __regularFunctionCallback.nativeFunction,
    __smokeInterfacewithstaticregularPropertyGetCallback.nativeFunction,
    __smokeInterfacewithstaticregularPropertySetCallback.nativeFunction
  );

  return result;
}

InterfaceWithStatic smokeInterfacewithstaticFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InterfaceWithStatic) return instance;

  final _typeIdHandle = _smokeInterfacewithstaticGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeInterfacewithstaticCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : InterfaceWithStatic$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeInterfacewithstaticRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeInterfacewithstaticReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeInterfacewithstaticReleaseHandle(handle);

Pointer<Void> smokeInterfacewithstaticToFfiNullable(InterfaceWithStatic? value) =>
  value != null ? smokeInterfacewithstaticToFfi(value) : Pointer<Void>.fromAddress(0);

InterfaceWithStatic? smokeInterfacewithstaticFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeInterfacewithstaticFromFfi(handle) : null;

void smokeInterfacewithstaticReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInterfacewithstaticReleaseHandle(handle);

// End of InterfaceWithStatic "private" section.



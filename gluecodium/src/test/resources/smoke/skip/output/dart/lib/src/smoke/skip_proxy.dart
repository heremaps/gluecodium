

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/inherit_from_skipped.dart';

abstract class SkipProxy implements Finalizable {

  factory SkipProxy(
    String Function(String) notInJavaLambda,
    bool Function(bool) notInSwiftLambda,
    double Function(double) notInKotlinLambda,
    String Function() skippedInJavaGetLambda,
    void Function(String) skippedInJavaSetLambda,
    bool Function() isSkippedInSwiftGetLambda,
    void Function(bool) isSkippedInSwiftSetLambda,
    double Function() skippedInKotlinGetLambda,
    void Function(double) skippedInKotlinSetLambda
  ) => SkipProxy$Lambdas(
    notInJavaLambda,
    notInSwiftLambda,
    notInKotlinLambda,
    skippedInJavaGetLambda,
    skippedInJavaSetLambda,
    isSkippedInSwiftGetLambda,
    isSkippedInSwiftSetLambda,
    skippedInKotlinGetLambda,
    skippedInKotlinSetLambda
  );


  String notInJava(String input);

  bool notInSwift(bool input);

  double notInKotlin(double input);
  String get skippedInJava;
  set skippedInJava(String value);

  bool get isSkippedInSwift;
  set isSkippedInSwift(bool value);

  double get skippedInKotlin;
  set skippedInKotlin(double value);

}


// SkipProxy "private" section, not exported.

final _smokeSkipproxyRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SkipProxy_register_finalizer'));
final _smokeSkipproxyCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipProxy_copy_handle'));
final _smokeSkipproxyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipProxy_release_handle'));
final _smokeSkipproxyCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_SkipProxy_create_proxy'));
final _smokeSkipproxyGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipProxy_get_type_id'));




class SkipProxy$Lambdas implements SkipProxy {
  String Function(String) notInJavaLambda;
  bool Function(bool) notInSwiftLambda;
  double Function(double) notInKotlinLambda;
  String Function() skippedInJavaGetLambda;
  void Function(String) skippedInJavaSetLambda;
  bool Function() isSkippedInSwiftGetLambda;
  void Function(bool) isSkippedInSwiftSetLambda;
  double Function() skippedInKotlinGetLambda;
  void Function(double) skippedInKotlinSetLambda;

  SkipProxy$Lambdas(
    this.notInJavaLambda,
    this.notInSwiftLambda,
    this.notInKotlinLambda,
    this.skippedInJavaGetLambda,
    this.skippedInJavaSetLambda,
    this.isSkippedInSwiftGetLambda,
    this.isSkippedInSwiftSetLambda,
    this.skippedInKotlinGetLambda,
    this.skippedInKotlinSetLambda
  );

  @override
  String notInJava(String input) =>
    notInJavaLambda(input);
  @override
  bool notInSwift(bool input) =>
    notInSwiftLambda(input);
  @override
  double notInKotlin(double input) =>
    notInKotlinLambda(input);
  @override
  String get skippedInJava => skippedInJavaGetLambda();
  @override
  set skippedInJava(String value) => skippedInJavaSetLambda(value);
  @override
  bool get isSkippedInSwift => isSkippedInSwiftGetLambda();
  @override
  set isSkippedInSwift(bool value) => isSkippedInSwiftSetLambda(value);
  @override
  double get skippedInKotlin => skippedInKotlinGetLambda();
  @override
  set skippedInKotlin(double value) => skippedInKotlinSetLambda(value);
}

class SkipProxy$Impl extends __lib.NativeBase implements SkipProxy {

  SkipProxy$Impl(Pointer<Void> handle) : super(handle);

  @override
  String notInJava(String input) {
    final _notInJavaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SkipProxy_notInJava__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _notInJavaFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool notInSwift(bool input) {
    final _notInSwiftFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint8), int Function(Pointer<Void>, int, int)>('library_smoke_SkipProxy_notInSwift__Boolean'));
    final _inputHandle = booleanToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _notInSwiftFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    booleanReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  double notInKotlin(double input) {
    final _notInKotlinFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32, Float), double Function(Pointer<Void>, int, double)>('library_smoke_SkipProxy_notInKotlin__Float'));
    final _inputHandle = (input);
    final _handle = this.handle;
    final __resultHandle = _notInKotlinFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  String get skippedInJava {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SkipProxy_skippedInJava_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  set skippedInJava(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SkipProxy_skippedInJava_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


  bool get isSkippedInSwift {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_SkipProxy_isSkippedInSwift_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }


  set isSkippedInSwift(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_SkipProxy_isSkippedInSwift_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  double get skippedInKotlin {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('library_smoke_SkipProxy_skippedInKotlin_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  set skippedInKotlin(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Float), void Function(Pointer<Void>, int, double)>('library_smoke_SkipProxy_skippedInKotlin_set__Float'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }



}

void _smokeSkipproxynotInJavaStatic(SkipProxy _obj, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = _obj.notInJava(stringFromFfi(input));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
}
void _smokeSkipproxynotInSwiftStatic(SkipProxy _obj, int input, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = _obj.notInSwift(booleanFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    booleanReleaseFfiHandle(input);
  }
}
void _smokeSkipproxynotInKotlinStatic(SkipProxy _obj, double input, Pointer<Float> _result) {
  double? _resultObject;
  try {
    _resultObject = _obj.notInKotlin((input));
    _result.value = (_resultObject);
  } finally {
    
  }
}

void _smokeSkipproxyskippedInJavaGetStatic(SkipProxy _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi(_obj.skippedInJava);
}

void _smokeSkipproxyskippedInJavaSetStatic(SkipProxy _obj, Pointer<Void> _value) {
  try {
    _obj.skippedInJava = stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
}
void _smokeSkipproxyisSkippedInSwiftGetStatic(SkipProxy _obj, Pointer<Uint8> _result) {
  _result.value = booleanToFfi(_obj.isSkippedInSwift);
}

void _smokeSkipproxyisSkippedInSwiftSetStatic(SkipProxy _obj, int _value) {
  try {
    _obj.isSkippedInSwift = booleanFromFfi(_value);
  } finally {
    booleanReleaseFfiHandle(_value);
  }
}
void _smokeSkipproxyskippedInKotlinGetStatic(SkipProxy _obj, Pointer<Float> _result) {
  _result.value = (_obj.skippedInKotlin);
}

void _smokeSkipproxyskippedInKotlinSetStatic(SkipProxy _obj, double _value) {
  try {
    _obj.skippedInKotlin = (_value);
  } finally {
    
  }
}

Pointer<Void> smokeSkipproxyToFfi(SkipProxy __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeSkipproxyCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  final descendantResult = tryDescendantToFfi(__interfaceObj);
  if (descendantResult != null) {
    return descendantResult;
  }

  void __notInJavaCaller(Pointer<Void> input, Pointer<Pointer<Void>> _result) { _smokeSkipproxynotInJavaStatic(__interfaceObj, input, _result); }
  final __notInJavaCallback = NativeCallable<Void Function(Pointer<Void>, Pointer<Pointer<Void>>)>.isolateLocal(__notInJavaCaller);
  __notInJavaCallback.keepIsolateAlive = false;

  void __notInSwiftCaller(int input, Pointer<Uint8> _result) { _smokeSkipproxynotInSwiftStatic(__interfaceObj, input, _result); }
  final __notInSwiftCallback = NativeCallable<Void Function(Uint8, Pointer<Uint8>)>.isolateLocal(__notInSwiftCaller);
  __notInSwiftCallback.keepIsolateAlive = false;

  void __notInKotlinCaller(double input, Pointer<Float> _result) { _smokeSkipproxynotInKotlinStatic(__interfaceObj, input, _result); }
  final __notInKotlinCallback = NativeCallable<Void Function(Float, Pointer<Float>)>.isolateLocal(__notInKotlinCaller);
  __notInKotlinCallback.keepIsolateAlive = false;

  void __smokeSkipproxyskippedInJavaGetCaller(Pointer<Pointer<Void>> _result) { _smokeSkipproxyskippedInJavaGetStatic(__interfaceObj, _result); }
  final __smokeSkipproxyskippedInJavaGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeSkipproxyskippedInJavaGetCaller);
  __smokeSkipproxyskippedInJavaGetCallback.keepIsolateAlive = false;

  void __smokeSkipproxyskippedInJavaSetCaller(Pointer<Void> _value) { _smokeSkipproxyskippedInJavaSetStatic(__interfaceObj, _value); }
  final __smokeSkipproxyskippedInJavaSetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeSkipproxyskippedInJavaSetCaller);
  __smokeSkipproxyskippedInJavaSetCallback.keepIsolateAlive = false;

  void __smokeSkipproxyisSkippedInSwiftGetCaller(Pointer<Uint8> _result) { _smokeSkipproxyisSkippedInSwiftGetStatic(__interfaceObj, _result); }
  final __smokeSkipproxyisSkippedInSwiftGetCallback = NativeCallable<Void Function(Pointer<Uint8>)>.isolateLocal(__smokeSkipproxyisSkippedInSwiftGetCaller);
  __smokeSkipproxyisSkippedInSwiftGetCallback.keepIsolateAlive = false;

  void __smokeSkipproxyisSkippedInSwiftSetCaller(int _value) { _smokeSkipproxyisSkippedInSwiftSetStatic(__interfaceObj, _value); }
  final __smokeSkipproxyisSkippedInSwiftSetCallback = NativeCallable<Void Function(Uint8)>.isolateLocal(__smokeSkipproxyisSkippedInSwiftSetCaller);
  __smokeSkipproxyisSkippedInSwiftSetCallback.keepIsolateAlive = false;

  void __smokeSkipproxyskippedInKotlinGetCaller(Pointer<Float> _result) { _smokeSkipproxyskippedInKotlinGetStatic(__interfaceObj, _result); }
  final __smokeSkipproxyskippedInKotlinGetCallback = NativeCallable<Void Function(Pointer<Float>)>.isolateLocal(__smokeSkipproxyskippedInKotlinGetCaller);
  __smokeSkipproxyskippedInKotlinGetCallback.keepIsolateAlive = false;

  void __smokeSkipproxyskippedInKotlinSetCaller(double _value) { _smokeSkipproxyskippedInKotlinSetStatic(__interfaceObj, _value); }
  final __smokeSkipproxyskippedInKotlinSetCallback = NativeCallable<Void Function(Float)>.isolateLocal(__smokeSkipproxyskippedInKotlinSetCaller);
  __smokeSkipproxyskippedInKotlinSetCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __notInJavaCallback.close();
    __notInSwiftCallback.close();
    __notInKotlinCallback.close();
    __smokeSkipproxyskippedInJavaGetCallback.close();
    __smokeSkipproxyskippedInJavaSetCallback.close();
    __smokeSkipproxyisSkippedInSwiftGetCallback.close();
    __smokeSkipproxyisSkippedInSwiftSetCallback.close();
    __smokeSkipproxyskippedInKotlinGetCallback.close();
    __smokeSkipproxyskippedInKotlinSetCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeSkipproxyCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __notInJavaCallback.nativeFunction,
    __notInSwiftCallback.nativeFunction,
    __notInKotlinCallback.nativeFunction,
    __smokeSkipproxyskippedInJavaGetCallback.nativeFunction,
    __smokeSkipproxyskippedInJavaSetCallback.nativeFunction,
    __smokeSkipproxyisSkippedInSwiftGetCallback.nativeFunction,
    __smokeSkipproxyisSkippedInSwiftSetCallback.nativeFunction,
    __smokeSkipproxyskippedInKotlinGetCallback.nativeFunction,
    __smokeSkipproxyskippedInKotlinSetCallback.nativeFunction
  );

  return result;
}

SkipProxy smokeSkipproxyFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SkipProxy) return instance;

  final _typeIdHandle = _smokeSkipproxyGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeSkipproxyCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : SkipProxy$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeSkipproxyRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeSkipproxyReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSkipproxyReleaseHandle(handle);

Pointer<Void> smokeSkipproxyToFfiNullable(SkipProxy? value) =>
  value != null ? smokeSkipproxyToFfi(value) : Pointer<Void>.fromAddress(0);

SkipProxy? smokeSkipproxyFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSkipproxyFromFfi(handle) : null;

void smokeSkipproxyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSkipproxyReleaseHandle(handle);

Pointer<Void>? tryDescendantToFfi(SkipProxy value) {
  if (value is InheritFromSkipped) return smokeInheritfromskippedToFfi(value);
  return null;
}

// End of SkipProxy "private" section.



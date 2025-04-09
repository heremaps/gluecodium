

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/skip_proxy.dart';

abstract class InheritFromSkipped implements SkipProxy, Finalizable {

  factory InheritFromSkipped(
    String Function(String) notInJavaLambda,
    bool Function(bool) notInSwiftLambda,
    double Function(double) notInKotlinLambda,
    String Function() skippedInJavaGetLambda,
    void Function(String) skippedInJavaSetLambda,
    bool Function() isSkippedInSwiftGetLambda,
    void Function(bool) isSkippedInSwiftSetLambda,
    double Function() skippedInKotlinGetLambda,
    void Function(double) skippedInKotlinSetLambda
  ) => InheritFromSkipped$Lambdas(
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

}


// InheritFromSkipped "private" section, not exported.

final _smokeInheritfromskippedRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_InheritFromSkipped_register_finalizer'));
final _smokeInheritfromskippedCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InheritFromSkipped_copy_handle'));
final _smokeInheritfromskippedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InheritFromSkipped_release_handle'));
final _smokeInheritfromskippedCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_InheritFromSkipped_create_proxy'));
final _smokeInheritfromskippedGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InheritFromSkipped_get_type_id'));

class InheritFromSkipped$Lambdas implements InheritFromSkipped {
  String Function(String) notInJavaLambda;
  bool Function(bool) notInSwiftLambda;
  double Function(double) notInKotlinLambda;
  String Function() skippedInJavaGetLambda;
  void Function(String) skippedInJavaSetLambda;
  bool Function() isSkippedInSwiftGetLambda;
  void Function(bool) isSkippedInSwiftSetLambda;
  double Function() skippedInKotlinGetLambda;
  void Function(double) skippedInKotlinSetLambda;

  InheritFromSkipped$Lambdas(
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

class InheritFromSkipped$Impl extends __lib.NativeBase implements InheritFromSkipped {

  InheritFromSkipped$Impl(Pointer<Void> handle) : super(handle);

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

void _smokeInheritfromskippednotInJavaStatic(InheritFromSkipped _obj, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = _obj.notInJava(stringFromFfi(input));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
}
void _smokeInheritfromskippednotInSwiftStatic(InheritFromSkipped _obj, int input, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = _obj.notInSwift(booleanFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    booleanReleaseFfiHandle(input);
  }
}
void _smokeInheritfromskippednotInKotlinStatic(InheritFromSkipped _obj, double input, Pointer<Float> _result) {
  double? _resultObject;
  try {
    _resultObject = _obj.notInKotlin((input));
    _result.value = (_resultObject);
  } finally {
    
  }
}

void _smokeInheritfromskippedskippedInJavaGetStatic(InheritFromSkipped _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi(_obj.skippedInJava);
}

void _smokeInheritfromskippedskippedInJavaSetStatic(InheritFromSkipped _obj, Pointer<Void> _value) {
  try {
    _obj.skippedInJava = stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
}
void _smokeInheritfromskippedisSkippedInSwiftGetStatic(InheritFromSkipped _obj, Pointer<Uint8> _result) {
  _result.value = booleanToFfi(_obj.isSkippedInSwift);
}

void _smokeInheritfromskippedisSkippedInSwiftSetStatic(InheritFromSkipped _obj, int _value) {
  try {
    _obj.isSkippedInSwift = booleanFromFfi(_value);
  } finally {
    booleanReleaseFfiHandle(_value);
  }
}
void _smokeInheritfromskippedskippedInKotlinGetStatic(InheritFromSkipped _obj, Pointer<Float> _result) {
  _result.value = (_obj.skippedInKotlin);
}

void _smokeInheritfromskippedskippedInKotlinSetStatic(InheritFromSkipped _obj, double _value) {
  try {
    _obj.skippedInKotlin = (_value);
  } finally {
    
  }
}

Pointer<Void> smokeInheritfromskippedToFfi(InheritFromSkipped __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeInheritfromskippedCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __notInJavaCaller(Pointer<Void> input, Pointer<Pointer<Void>> _result) { _smokeInheritfromskippednotInJavaStatic(__interfaceObj, input, _result); }
  final __notInJavaCallback = NativeCallable<Void Function(Pointer<Void>, Pointer<Pointer<Void>>)>.isolateLocal(__notInJavaCaller);
  __notInJavaCallback.keepIsolateAlive = false;

  void __notInSwiftCaller(int input, Pointer<Uint8> _result) { _smokeInheritfromskippednotInSwiftStatic(__interfaceObj, input, _result); }
  final __notInSwiftCallback = NativeCallable<Void Function(Uint8, Pointer<Uint8>)>.isolateLocal(__notInSwiftCaller);
  __notInSwiftCallback.keepIsolateAlive = false;

  void __notInKotlinCaller(double input, Pointer<Float> _result) { _smokeInheritfromskippednotInKotlinStatic(__interfaceObj, input, _result); }
  final __notInKotlinCallback = NativeCallable<Void Function(Float, Pointer<Float>)>.isolateLocal(__notInKotlinCaller);
  __notInKotlinCallback.keepIsolateAlive = false;

  void __smokeInheritfromskippedskippedInJavaGetCaller(Pointer<Pointer<Void>> _result) { _smokeInheritfromskippedskippedInJavaGetStatic(__interfaceObj, _result); }
  final __smokeInheritfromskippedskippedInJavaGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeInheritfromskippedskippedInJavaGetCaller);
  __smokeInheritfromskippedskippedInJavaGetCallback.keepIsolateAlive = false;

  void __smokeInheritfromskippedskippedInJavaSetCaller(Pointer<Void> _value) { _smokeInheritfromskippedskippedInJavaSetStatic(__interfaceObj, _value); }
  final __smokeInheritfromskippedskippedInJavaSetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeInheritfromskippedskippedInJavaSetCaller);
  __smokeInheritfromskippedskippedInJavaSetCallback.keepIsolateAlive = false;

  void __smokeInheritfromskippedisSkippedInSwiftGetCaller(Pointer<Uint8> _result) { _smokeInheritfromskippedisSkippedInSwiftGetStatic(__interfaceObj, _result); }
  final __smokeInheritfromskippedisSkippedInSwiftGetCallback = NativeCallable<Void Function(Pointer<Uint8>)>.isolateLocal(__smokeInheritfromskippedisSkippedInSwiftGetCaller);
  __smokeInheritfromskippedisSkippedInSwiftGetCallback.keepIsolateAlive = false;

  void __smokeInheritfromskippedisSkippedInSwiftSetCaller(int _value) { _smokeInheritfromskippedisSkippedInSwiftSetStatic(__interfaceObj, _value); }
  final __smokeInheritfromskippedisSkippedInSwiftSetCallback = NativeCallable<Void Function(Uint8)>.isolateLocal(__smokeInheritfromskippedisSkippedInSwiftSetCaller);
  __smokeInheritfromskippedisSkippedInSwiftSetCallback.keepIsolateAlive = false;

  void __smokeInheritfromskippedskippedInKotlinGetCaller(Pointer<Float> _result) { _smokeInheritfromskippedskippedInKotlinGetStatic(__interfaceObj, _result); }
  final __smokeInheritfromskippedskippedInKotlinGetCallback = NativeCallable<Void Function(Pointer<Float>)>.isolateLocal(__smokeInheritfromskippedskippedInKotlinGetCaller);
  __smokeInheritfromskippedskippedInKotlinGetCallback.keepIsolateAlive = false;

  void __smokeInheritfromskippedskippedInKotlinSetCaller(double _value) { _smokeInheritfromskippedskippedInKotlinSetStatic(__interfaceObj, _value); }
  final __smokeInheritfromskippedskippedInKotlinSetCallback = NativeCallable<Void Function(Float)>.isolateLocal(__smokeInheritfromskippedskippedInKotlinSetCaller);
  __smokeInheritfromskippedskippedInKotlinSetCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __notInJavaCallback.close();
    __notInSwiftCallback.close();
    __notInKotlinCallback.close();
    __smokeInheritfromskippedskippedInJavaGetCallback.close();
    __smokeInheritfromskippedskippedInJavaSetCallback.close();
    __smokeInheritfromskippedisSkippedInSwiftGetCallback.close();
    __smokeInheritfromskippedisSkippedInSwiftSetCallback.close();
    __smokeInheritfromskippedskippedInKotlinGetCallback.close();
    __smokeInheritfromskippedskippedInKotlinSetCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeInheritfromskippedCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __notInJavaCallback.nativeFunction,
    __notInSwiftCallback.nativeFunction,
    __notInKotlinCallback.nativeFunction,
    __smokeInheritfromskippedskippedInJavaGetCallback.nativeFunction,
    __smokeInheritfromskippedskippedInJavaSetCallback.nativeFunction,
    __smokeInheritfromskippedisSkippedInSwiftGetCallback.nativeFunction,
    __smokeInheritfromskippedisSkippedInSwiftSetCallback.nativeFunction,
    __smokeInheritfromskippedskippedInKotlinGetCallback.nativeFunction,
    __smokeInheritfromskippedskippedInKotlinSetCallback.nativeFunction
  );

  return result;
}

InheritFromSkipped smokeInheritfromskippedFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InheritFromSkipped) return instance;

  final _typeIdHandle = _smokeInheritfromskippedGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeInheritfromskippedCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : InheritFromSkipped$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeInheritfromskippedRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeInheritfromskippedReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeInheritfromskippedReleaseHandle(handle);

Pointer<Void> smokeInheritfromskippedToFfiNullable(InheritFromSkipped? value) =>
  value != null ? smokeInheritfromskippedToFfi(value) : Pointer<Void>.fromAddress(0);

InheritFromSkipped? smokeInheritfromskippedFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeInheritfromskippedFromFfi(handle) : null;

void smokeInheritfromskippedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInheritfromskippedReleaseHandle(handle);

// End of InheritFromSkipped "private" section.



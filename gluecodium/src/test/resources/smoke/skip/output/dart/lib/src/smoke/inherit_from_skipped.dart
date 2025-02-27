

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
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
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

int _smokeInheritfromskippednotInJavaStatic(Object _obj, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (_obj as InheritFromSkipped).notInJava(stringFromFfi(input));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
int _smokeInheritfromskippednotInSwiftStatic(Object _obj, int input, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as InheritFromSkipped).notInSwift(booleanFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    booleanReleaseFfiHandle(input);
  }
  return 0;
}
int _smokeInheritfromskippednotInKotlinStatic(Object _obj, double input, Pointer<Float> _result) {
  double? _resultObject;
  try {
    _resultObject = (_obj as InheritFromSkipped).notInKotlin((input));
    _result.value = (_resultObject);
  } finally {
    
  }
  return 0;
}

int _smokeInheritfromskippedskippedInJavaGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((_obj as InheritFromSkipped).skippedInJava);
  return 0;
}

int _smokeInheritfromskippedskippedInJavaSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as InheritFromSkipped).skippedInJava =
      stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
  return 0;
}
int _smokeInheritfromskippedisSkippedInSwiftGetStatic(Object _obj, Pointer<Uint8> _result) {
  _result.value = booleanToFfi((_obj as InheritFromSkipped).isSkippedInSwift);
  return 0;
}

int _smokeInheritfromskippedisSkippedInSwiftSetStatic(Object _obj, int _value) {
  try {
    (_obj as InheritFromSkipped).isSkippedInSwift =
      booleanFromFfi(_value);
  } finally {
    booleanReleaseFfiHandle(_value);
  }
  return 0;
}
int _smokeInheritfromskippedskippedInKotlinGetStatic(Object _obj, Pointer<Float> _result) {
  _result.value = ((_obj as InheritFromSkipped).skippedInKotlin);
  return 0;
}

int _smokeInheritfromskippedskippedInKotlinSetStatic(Object _obj, double _value) {
  try {
    (_obj as InheritFromSkipped).skippedInKotlin =
      (_value);
  } finally {
    
  }
  return 0;
}

Pointer<Void> smokeInheritfromskippedToFfi(InheritFromSkipped value) {
  if (value is __lib.NativeBase) return _smokeInheritfromskippedCopyHandle((value as __lib.NativeBase).handle);

  final result = _smokeInheritfromskippedCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Pointer<Void>>)>(_smokeInheritfromskippednotInJavaStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint8, Pointer<Uint8>)>(_smokeInheritfromskippednotInSwiftStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Float, Pointer<Float>)>(_smokeInheritfromskippednotInKotlinStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeInheritfromskippedskippedInJavaGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeInheritfromskippedskippedInJavaSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_smokeInheritfromskippedisSkippedInSwiftGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint8)>(_smokeInheritfromskippedisSkippedInSwiftSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Float>)>(_smokeInheritfromskippedskippedInKotlinGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Float)>(_smokeInheritfromskippedskippedInKotlinSetStatic, __lib.unknownError)
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



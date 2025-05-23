

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

abstract class OuterInterface implements Finalizable {

  factory OuterInterface(
    String Function(String) fooLambda,

  ) => OuterInterface$Lambdas(
    fooLambda,

  );


  String foo(String input);
}

abstract class OuterInterface_InnerClass implements Finalizable {


  String foo(String input);
}


// OuterInterface_InnerClass "private" section, not exported.

final _smokeOuterinterfaceInnerclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_OuterInterface_InnerClass_register_finalizer'));
final _smokeOuterinterfaceInnerclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerClass_copy_handle'));
final _smokeOuterinterfaceInnerclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerClass_release_handle'));




class OuterInterface_InnerClass$Impl extends __lib.NativeBase implements OuterInterface_InnerClass {

  OuterInterface_InnerClass$Impl(Pointer<Void> handle) : super(handle);

  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterInterface_InnerClass_foo__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _fooFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> smokeOuterinterfaceInnerclassToFfi(OuterInterface_InnerClass value) =>
  _smokeOuterinterfaceInnerclassCopyHandle((value as __lib.NativeBase).handle);

OuterInterface_InnerClass smokeOuterinterfaceInnerclassFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OuterInterface_InnerClass) return instance;

  final _copiedHandle = _smokeOuterinterfaceInnerclassCopyHandle(handle);
  final result = OuterInterface_InnerClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeOuterinterfaceInnerclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeOuterinterfaceInnerclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterinterfaceInnerclassReleaseHandle(handle);

Pointer<Void> smokeOuterinterfaceInnerclassToFfiNullable(OuterInterface_InnerClass? value) =>
  value != null ? smokeOuterinterfaceInnerclassToFfi(value) : Pointer<Void>.fromAddress(0);

OuterInterface_InnerClass? smokeOuterinterfaceInnerclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterinterfaceInnerclassFromFfi(handle) : null;

void smokeOuterinterfaceInnerclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterinterfaceInnerclassReleaseHandle(handle);

// End of OuterInterface_InnerClass "private" section.
abstract class OuterInterface_InnerInterface implements Finalizable {

  factory OuterInterface_InnerInterface(
    String Function(String) fooLambda,

  ) => OuterInterface_InnerInterface$Lambdas(
    fooLambda,

  );


  String foo(String input);
}


// OuterInterface_InnerInterface "private" section, not exported.

final _smokeOuterinterfaceInnerinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_OuterInterface_InnerInterface_register_finalizer'));
final _smokeOuterinterfaceInnerinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerInterface_copy_handle'));
final _smokeOuterinterfaceInnerinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerInterface_release_handle'));
final _smokeOuterinterfaceInnerinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_OuterInterface_InnerInterface_create_proxy'));
final _smokeOuterinterfaceInnerinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerInterface_get_type_id'));


class OuterInterface_InnerInterface$Lambdas implements OuterInterface_InnerInterface {
  String Function(String) fooLambda;

  OuterInterface_InnerInterface$Lambdas(
    this.fooLambda,

  );

  @override
  String foo(String input) =>
    fooLambda(input);
}

class OuterInterface_InnerInterface$Impl extends __lib.NativeBase implements OuterInterface_InnerInterface {

  OuterInterface_InnerInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterInterface_InnerInterface_foo__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _fooFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


}

void _smokeOuterinterfaceInnerinterfacefooStatic(OuterInterface_InnerInterface _obj, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = _obj.foo(stringFromFfi(input));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
}


Pointer<Void> smokeOuterinterfaceInnerinterfaceToFfi(OuterInterface_InnerInterface __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeOuterinterfaceInnerinterfaceCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __fooCaller(Pointer<Void> input, Pointer<Pointer<Void>> _result) { _smokeOuterinterfaceInnerinterfacefooStatic(__interfaceObj, input, _result); }
  final __fooCallback = NativeCallable<Void Function(Pointer<Void>, Pointer<Pointer<Void>>)>.isolateLocal(__fooCaller);
  __fooCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __fooCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeOuterinterfaceInnerinterfaceCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __fooCallback.nativeFunction
  );

  return result;
}

OuterInterface_InnerInterface smokeOuterinterfaceInnerinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OuterInterface_InnerInterface) return instance;

  final _typeIdHandle = _smokeOuterinterfaceInnerinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeOuterinterfaceInnerinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OuterInterface_InnerInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeOuterinterfaceInnerinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeOuterinterfaceInnerinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterinterfaceInnerinterfaceReleaseHandle(handle);

Pointer<Void> smokeOuterinterfaceInnerinterfaceToFfiNullable(OuterInterface_InnerInterface? value) =>
  value != null ? smokeOuterinterfaceInnerinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);

OuterInterface_InnerInterface? smokeOuterinterfaceInnerinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterinterfaceInnerinterfaceFromFfi(handle) : null;

void smokeOuterinterfaceInnerinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterinterfaceInnerinterfaceReleaseHandle(handle);

// End of OuterInterface_InnerInterface "private" section.

// OuterInterface "private" section, not exported.

final _smokeOuterinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_OuterInterface_register_finalizer'));
final _smokeOuterinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_copy_handle'));
final _smokeOuterinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterInterface_release_handle'));
final _smokeOuterinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_OuterInterface_create_proxy'));
final _smokeOuterinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_get_type_id'));


class OuterInterface$Lambdas implements OuterInterface {
  String Function(String) fooLambda;

  OuterInterface$Lambdas(
    this.fooLambda,

  );

  @override
  String foo(String input) =>
    fooLambda(input);
}

class OuterInterface$Impl extends __lib.NativeBase implements OuterInterface {

  OuterInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterInterface_foo__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _fooFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


}

void _smokeOuterinterfacefooStatic(OuterInterface _obj, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = _obj.foo(stringFromFfi(input));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
}


Pointer<Void> smokeOuterinterfaceToFfi(OuterInterface __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeOuterinterfaceCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __fooCaller(Pointer<Void> input, Pointer<Pointer<Void>> _result) { _smokeOuterinterfacefooStatic(__interfaceObj, input, _result); }
  final __fooCallback = NativeCallable<Void Function(Pointer<Void>, Pointer<Pointer<Void>>)>.isolateLocal(__fooCaller);
  __fooCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __fooCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeOuterinterfaceCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __fooCallback.nativeFunction
  );

  return result;
}

OuterInterface smokeOuterinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OuterInterface) return instance;

  final _typeIdHandle = _smokeOuterinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeOuterinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OuterInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeOuterinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeOuterinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterinterfaceReleaseHandle(handle);

Pointer<Void> smokeOuterinterfaceToFfiNullable(OuterInterface? value) =>
  value != null ? smokeOuterinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);

OuterInterface? smokeOuterinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterinterfaceFromFfi(handle) : null;

void smokeOuterinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterinterfaceReleaseHandle(handle);

// End of OuterInterface "private" section.



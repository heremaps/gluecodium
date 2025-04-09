

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

abstract class ParentNarrowOne implements Finalizable {

  factory ParentNarrowOne(
    void Function() parentFunctionOneLambda,
    String Function() parentPropertyOneGetLambda,
    void Function(String) parentPropertyOneSetLambda
  ) => ParentNarrowOne$Lambdas(
    parentFunctionOneLambda,
    parentPropertyOneGetLambda,
    parentPropertyOneSetLambda
  );


  void parentFunctionOne();
  String get parentPropertyOne;
  set parentPropertyOne(String value);

}


// ParentNarrowOne "private" section, not exported.

final _smokeParentnarrowoneRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ParentNarrowOne_register_finalizer'));
final _smokeParentnarrowoneCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ParentNarrowOne_copy_handle'));
final _smokeParentnarrowoneReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ParentNarrowOne_release_handle'));
final _smokeParentnarrowoneCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ParentNarrowOne_create_proxy'));
final _smokeParentnarrowoneGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ParentNarrowOne_get_type_id'));


class ParentNarrowOne$Lambdas implements ParentNarrowOne {
  void Function() parentFunctionOneLambda;
  String Function() parentPropertyOneGetLambda;
  void Function(String) parentPropertyOneSetLambda;

  ParentNarrowOne$Lambdas(
    this.parentFunctionOneLambda,
    this.parentPropertyOneGetLambda,
    this.parentPropertyOneSetLambda
  );

  @override
  void parentFunctionOne() =>
    parentFunctionOneLambda();
  @override
  String get parentPropertyOne => parentPropertyOneGetLambda();
  @override
  set parentPropertyOne(String value) => parentPropertyOneSetLambda(value);
}

class ParentNarrowOne$Impl extends __lib.NativeBase implements ParentNarrowOne {

  ParentNarrowOne$Impl(Pointer<Void> handle) : super(handle);

  @override
  void parentFunctionOne() {
    final _parentFunctionOneFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentNarrowOne_parentFunctionOne'));
    final _handle = this.handle;
    _parentFunctionOneFfi(_handle, __lib.LibraryContext.isolateId);

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



}

void _smokeParentnarrowoneparentFunctionOneStatic(ParentNarrowOne _obj) {

  try {
    _obj.parentFunctionOne();
  } finally {
  }
}

void _smokeParentnarrowoneparentPropertyOneGetStatic(ParentNarrowOne _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi(_obj.parentPropertyOne);
}

void _smokeParentnarrowoneparentPropertyOneSetStatic(ParentNarrowOne _obj, Pointer<Void> _value) {
  try {
    _obj.parentPropertyOne = stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
}

Pointer<Void> smokeParentnarrowoneToFfi(ParentNarrowOne value) {

  void __parentFunctionOneCaller() { _smokeParentnarrowoneparentFunctionOneStatic(value); }
  final __parentFunctionOneCallback = NativeCallable<Void Function()>.isolateLocal(__parentFunctionOneCaller);
  __parentFunctionOneCallback.keepIsolateAlive = false;

  void __smokeParentnarrowoneparentPropertyOneGetCaller(Pointer<Pointer<Void>> _result) { _smokeParentnarrowoneparentPropertyOneGetStatic(value, _result); }
  final __smokeParentnarrowoneparentPropertyOneGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeParentnarrowoneparentPropertyOneGetCaller);
  __smokeParentnarrowoneparentPropertyOneGetCallback.keepIsolateAlive = false;

  void __smokeParentnarrowoneparentPropertyOneSetCaller(Pointer<Void> _value) { _smokeParentnarrowoneparentPropertyOneSetStatic(value, _value); }
  final __smokeParentnarrowoneparentPropertyOneSetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeParentnarrowoneparentPropertyOneSetCaller);
  __smokeParentnarrowoneparentPropertyOneSetCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __parentFunctionOneCallback.close();
    __smokeParentnarrowoneparentPropertyOneGetCallback.close();
    __smokeParentnarrowoneparentPropertyOneSetCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeParentnarrowoneCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    __closeAllCallback.nativeFunction,
    __parentFunctionOneCallback.nativeFunction,
    __smokeParentnarrowoneparentPropertyOneGetCallback.nativeFunction,
    __smokeParentnarrowoneparentPropertyOneSetCallback.nativeFunction
  );

  return result;
}

ParentNarrowOne smokeParentnarrowoneFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ParentNarrowOne) return instance;

  final _typeIdHandle = _smokeParentnarrowoneGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeParentnarrowoneCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ParentNarrowOne$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeParentnarrowoneRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeParentnarrowoneReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeParentnarrowoneReleaseHandle(handle);

Pointer<Void> smokeParentnarrowoneToFfiNullable(ParentNarrowOne? value) =>
  value != null ? smokeParentnarrowoneToFfi(value) : Pointer<Void>.fromAddress(0);

ParentNarrowOne? smokeParentnarrowoneFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeParentnarrowoneFromFfi(handle) : null;

void smokeParentnarrowoneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeParentnarrowoneReleaseHandle(handle);

// End of ParentNarrowOne "private" section.



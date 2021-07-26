import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/deprecated_equatable_struct.dart';
abstract class DeprecatedFromLambdas {
  // ignore: deprecated_member_use_from_same_package
  factory DeprecatedFromLambdas(
    void Function(DeprecatedEquatableStruct) fooLambda,
    DeprecatedEquatableStruct Function() barGetLambda,
    void Function(DeprecatedEquatableStruct) barSetLambda
  ) => DeprecatedFromLambdas$Lambdas(
    fooLambda,
    barGetLambda,
    barSetLambda
  );
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
  void foo(DeprecatedEquatableStruct input);
  DeprecatedEquatableStruct get bar;
  set bar(DeprecatedEquatableStruct value);
}
// DeprecatedFromLambdas "private" section, not exported.
final _smokeDeprecatedfromlambdasRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_DeprecatedFromLambdas_register_finalizer'));
final _smokeDeprecatedfromlambdasCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedFromLambdas_copy_handle'));
final _smokeDeprecatedfromlambdasReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecatedFromLambdas_release_handle'));
final _smokeDeprecatedfromlambdasCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
  >('library_smoke_DeprecatedFromLambdas_create_proxy'));
final _smokeDeprecatedfromlambdasGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedFromLambdas_get_type_id'));
class DeprecatedFromLambdas$Lambdas implements DeprecatedFromLambdas {
  // ignore: deprecated_member_use_from_same_package
  void Function(DeprecatedEquatableStruct) fooLambda;
  // ignore: deprecated_member_use_from_same_package
  DeprecatedEquatableStruct Function() barGetLambda;
  // ignore: deprecated_member_use_from_same_package
  void Function(DeprecatedEquatableStruct) barSetLambda;
  DeprecatedFromLambdas$Lambdas(
    this.fooLambda,
    this.barGetLambda,
    this.barSetLambda
  );
  @override
  void release() {}
  @override
  // ignore: deprecated_member_use_from_same_package
  void foo(DeprecatedEquatableStruct input) =>
    fooLambda(input);
  @override
  // ignore: deprecated_member_use_from_same_package
  DeprecatedEquatableStruct get bar => barGetLambda();
  @override
  // ignore: deprecated_member_use_from_same_package
  set bar(DeprecatedEquatableStruct value) => barSetLambda(value);
}
class DeprecatedFromLambdas$Impl extends __lib.NativeBase implements DeprecatedFromLambdas {
  DeprecatedFromLambdas$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  void foo(DeprecatedEquatableStruct input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DeprecatedFromLambdas_foo__DeprecatedEquatableStruct'));
    final _inputHandle = smokeDeprecatedequatablestructToFfi(input);
    final _handle = this.handle;
    _fooFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smokeDeprecatedequatablestructReleaseFfiHandle(_inputHandle);
  }
  DeprecatedEquatableStruct get bar {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_DeprecatedFromLambdas_bar_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeDeprecatedequatablestructFromFfi(__resultHandle);
    } finally {
      smokeDeprecatedequatablestructReleaseFfiHandle(__resultHandle);
    }
  }
  set bar(DeprecatedEquatableStruct value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DeprecatedFromLambdas_bar_set__DeprecatedEquatableStruct'));
    final _valueHandle = smokeDeprecatedequatablestructToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokeDeprecatedequatablestructReleaseFfiHandle(_valueHandle);
  }
}
int _smokeDeprecatedfromlambdasfooStatic(Object _obj, Pointer<Void> input) {
  try {
    (_obj as DeprecatedFromLambdas).foo(smokeDeprecatedequatablestructFromFfi(input));
  } finally {
    smokeDeprecatedequatablestructReleaseFfiHandle(input);
  }
  return 0;
}
int _smokeDeprecatedfromlambdasbarGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = smokeDeprecatedequatablestructToFfi((_obj as DeprecatedFromLambdas).bar);
  return 0;
}
int _smokeDeprecatedfromlambdasbarSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as DeprecatedFromLambdas).bar =
      smokeDeprecatedequatablestructFromFfi(_value);
  } finally {
    smokeDeprecatedequatablestructReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeDeprecatedfromlambdasToFfi(DeprecatedFromLambdas value) {
  if (value is __lib.NativeBase) return _smokeDeprecatedfromlambdasCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeDeprecatedfromlambdasCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeDeprecatedfromlambdasfooStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeDeprecatedfromlambdasbarGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeDeprecatedfromlambdasbarSetStatic, __lib.unknownError)
  );
  return result;
}
DeprecatedFromLambdas smokeDeprecatedfromlambdasFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DeprecatedFromLambdas) return instance;
  final _typeIdHandle = _smokeDeprecatedfromlambdasGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeDeprecatedfromlambdasCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DeprecatedFromLambdas$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeDeprecatedfromlambdasRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeDeprecatedfromlambdasReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeDeprecatedfromlambdasReleaseHandle(handle);
Pointer<Void> smokeDeprecatedfromlambdasToFfiNullable(DeprecatedFromLambdas? value) =>
  value != null ? smokeDeprecatedfromlambdasToFfi(value) : Pointer<Void>.fromAddress(0);
DeprecatedFromLambdas? smokeDeprecatedfromlambdasFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeDeprecatedfromlambdasFromFfi(handle) : null;
void smokeDeprecatedfromlambdasReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecatedfromlambdasReleaseHandle(handle);
// End of DeprecatedFromLambdas "private" section.

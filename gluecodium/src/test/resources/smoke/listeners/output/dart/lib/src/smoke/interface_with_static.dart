import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
abstract class InterfaceWithStatic {
  factory InterfaceWithStatic(
    String Function() regularFunctionLambda,
    String Function() regularPropertyGetLambda,
    void Function(String) regularPropertySetLambda,
  ) => InterfaceWithStatic$Lambdas(
    regularFunctionLambda,
    regularPropertyGetLambda,
    regularPropertySetLambda,
  );
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
  String regularFunction();
  static String staticFunction() => InterfaceWithStatic$Impl.staticFunction();
  String get regularProperty;
  set regularProperty(String value);
  static String get staticProperty => InterfaceWithStatic$Impl.staticProperty;
  static set staticProperty(String value) { InterfaceWithStatic$Impl.staticProperty = value; }
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
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
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
  void release() {}
  @override
  String regularFunction() =>
    regularFunctionLambda();
  @override
  String get regularProperty => regularPropertyGetLambda();
  @override
  set regularProperty(String value) => regularPropertySetLambda(value);
}
class InterfaceWithStatic$Impl extends __lib.NativeBase implements InterfaceWithStatic {
  InterfaceWithStatic$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
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
  @override
  static String staticFunction() {
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
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  static String get staticProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_InterfaceWithStatic_staticProperty_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  static set staticProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('library_smoke_InterfaceWithStatic_staticProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    final __resultHandle = _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
int _smokeInterfacewithstaticregularFunctionStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (_obj as InterfaceWithStatic).regularFunction();
    _result.value = stringToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _smokeInterfacewithstaticregularPropertyGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((_obj as InterfaceWithStatic).regularProperty);
  return 0;
}
int _smokeInterfacewithstaticregularPropertySetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as InterfaceWithStatic).regularProperty =
      stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeInterfacewithstaticToFfi(InterfaceWithStatic value) {
  if (value is __lib.NativeBase) return _smokeInterfacewithstaticCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeInterfacewithstaticCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeInterfacewithstaticregularFunctionStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeInterfacewithstaticregularPropertyGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeInterfacewithstaticregularPropertySetStatic, __lib.unknownError)
  );
  return result;
}
InterfaceWithStatic smokeInterfacewithstaticFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InterfaceWithStatic) return instance as InterfaceWithStatic;
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

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_interface.dart';
import 'package:meta/meta.dart';
abstract class ChildInterface implements ParentInterface {
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
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
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
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer)
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
  void release() {}
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
  void release() {}
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
int _smokeChildinterfacerootMethodStatic(Object _obj) {
  try {
    (_obj as ChildInterface).rootMethod();
  } finally {
  }
  return 0;
}
int _smokeChildinterfacechildMethodStatic(Object _obj) {
  try {
    (_obj as ChildInterface).childMethod();
  } finally {
  }
  return 0;
}
int _smokeChildinterfacerootPropertyGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((_obj as ChildInterface).rootProperty);
  return 0;
}
int _smokeChildinterfacerootPropertySetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as ChildInterface).rootProperty =
      stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeChildinterfaceToFfi(ChildInterface value) {
  if (value is __lib.NativeBase) return _smokeChildinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeChildinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle)>(_smokeChildinterfacerootMethodStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_smokeChildinterfacechildMethodStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeChildinterfacerootPropertyGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeChildinterfacerootPropertySetStatic, __lib.unknownError)
  );
  return result;
}
ChildInterface smokeChildinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ChildInterface) return instance as ChildInterface;
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
// End of ChildInterface "private" section.

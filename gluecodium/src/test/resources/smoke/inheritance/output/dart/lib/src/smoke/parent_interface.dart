import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/child_interface.dart';
import 'package:library/src/smoke/grand_child_interface.dart';
abstract class ParentInterface {
  factory ParentInterface(
    void Function() rootMethodLambda,
    String Function() rootPropertyGetLambda,
    void Function(String) rootPropertySetLambda
  ) => ParentInterface$Lambdas(
    rootMethodLambda,
    rootPropertyGetLambda,
    rootPropertySetLambda
  );
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
  void rootMethod();
  String get rootProperty;
  set rootProperty(String value);
}
// ParentInterface "private" section, not exported.
final _smokeParentinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ParentInterface_register_finalizer'));
final _smokeParentinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ParentInterface_copy_handle'));
final _smokeParentinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ParentInterface_release_handle'));
final _smokeParentinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
  >('library_smoke_ParentInterface_create_proxy'));
final _smokeParentinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ParentInterface_get_type_id'));
class ParentInterface$Lambdas implements ParentInterface {
  void Function() rootMethodLambda;
  String Function() rootPropertyGetLambda;
  void Function(String) rootPropertySetLambda;
  ParentInterface$Lambdas(
    this.rootMethodLambda,
    this.rootPropertyGetLambda,
    this.rootPropertySetLambda
  );
  @override
  void release() {}
  @override
  void rootMethod() =>
    rootMethodLambda();
  @override
  String get rootProperty => rootPropertyGetLambda();
  @override
  set rootProperty(String value) => rootPropertySetLambda(value);
}
class ParentInterface$Impl extends __lib.NativeBase implements ParentInterface {
  ParentInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  void rootMethod() {
    final _rootMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootMethod'));
    final _handle = this.handle;
    _rootMethodFfi(_handle, __lib.LibraryContext.isolateId);
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
int _smokeParentinterfacerootMethodStatic(Object _obj) {
  try {
    (_obj as ParentInterface).rootMethod();
  } finally {
  }
  return 0;
}
int _smokeParentinterfacerootPropertyGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((_obj as ParentInterface).rootProperty);
  return 0;
}
int _smokeParentinterfacerootPropertySetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as ParentInterface).rootProperty =
      stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeParentinterfaceToFfi(ParentInterface value) {
  if (value is __lib.NativeBase) return _smokeParentinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final descendantResult = tryDescendantToFfi(value);
  if (descendantResult != null) {
    return descendantResult;
  }
  final result = _smokeParentinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle)>(_smokeParentinterfacerootMethodStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeParentinterfacerootPropertyGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeParentinterfacerootPropertySetStatic, __lib.unknownError)
  );
  return result;
}
ParentInterface smokeParentinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ParentInterface) return instance;
  final _typeIdHandle = _smokeParentinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeParentinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ParentInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeParentinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeParentinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeParentinterfaceReleaseHandle(handle);
Pointer<Void> smokeParentinterfaceToFfiNullable(ParentInterface? value) =>
  value != null ? smokeParentinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
ParentInterface? smokeParentinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeParentinterfaceFromFfi(handle) : null;
void smokeParentinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeParentinterfaceReleaseHandle(handle);
Pointer<Void>? tryDescendantToFfi(ParentInterface value) {
  if (value is GrandChildInterface) return smokeGrandchildinterfaceToFfi(value);
  if (value is ChildInterface) return smokeChildinterfaceToFfi(value);
  return null;
}
// End of ParentInterface "private" section.

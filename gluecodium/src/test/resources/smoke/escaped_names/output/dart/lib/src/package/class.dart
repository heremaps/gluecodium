import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/package/interface.dart';
import 'package:library/src/package/types.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Class implements Interface {
  factory Class() => Class$Impl.constructor();
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  Struct fun(List<Struct> double);
  Enum get property;
  set property(Enum value);
}
// Class "private" section, not exported.
final _packageClassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Class_copy_handle'));
final _packageClassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Class_release_handle'));
final _packageClassGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Class_get_type_id'));
final _funReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Class_fun__ListOf_1package_1Types_1Struct_return_release_handle'));
final _funReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Class_fun__ListOf_1package_1Types_1Struct_return_get_result'));
final _funReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_package_Class_fun__ListOf_1package_1Types_1Struct_return_get_error'));
final _funReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_package_Class_fun__ListOf_1package_1Types_1Struct_return_has_error'));
class Class$Impl extends __lib.NativeBase implements Class {
  Class$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _packageClassReleaseHandle(handle);
    handle = null;
  }
  Class$Impl.constructor() : super(_constructor()) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  static Pointer<Void> _constructor() {
    final _constructorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_package_Class_constructor'));
    final __resultHandle = _constructorFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }
  @override
  Struct fun(List<Struct> double) {
    final _funFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_package_Class_fun__ListOf_1package_1Types_1Struct'));
    final _doubleHandle = foobarListofPackageTypesStructToFfi(double);
    final _handle = this.handle;
    final __callResultHandle = _funFfi(_handle, __lib.LibraryContext.isolateId, _doubleHandle);
    foobarListofPackageTypesStructReleaseFfiHandle(_doubleHandle);
    if (_funReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _funReturnGetError(__callResultHandle);
        _funReturnReleaseHandle(__callResultHandle);
        try {
          throw ExceptionException(packageTypesEnumFromFfi(__errorHandle));
        } finally {
          packageTypesEnumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _funReturnGetResult(__callResultHandle);
    _funReturnReleaseHandle(__callResultHandle);
    try {
      return packageTypesStructFromFfi(__resultHandle);
    } finally {
      packageTypesStructReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  Enum get property {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_package_Class_property_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return packageTypesEnumFromFfi(__resultHandle);
    } finally {
      packageTypesEnumReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  set property(Enum value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_package_Class_property_set__enum'));
    final _valueHandle = packageTypesEnumToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    packageTypesEnumReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
Pointer<Void> packageClassToFfi(Class value) =>
  _packageClassCopyHandle((value as __lib.NativeBase).handle);
Class packageClassFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Class;
  if (instance != null) return instance;
  final _typeIdHandle = _packageClassGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _packageClassCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : Class$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void packageClassReleaseFfiHandle(Pointer<Void> handle) =>
  _packageClassReleaseHandle(handle);
Pointer<Void> packageClassToFfiNullable(Class value) =>
  value != null ? packageClassToFfi(value) : Pointer<Void>.fromAddress(0);
Class packageClassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? packageClassFromFfi(handle) : null;
void packageClassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _packageClassReleaseHandle(handle);
// End of Class "private" section.

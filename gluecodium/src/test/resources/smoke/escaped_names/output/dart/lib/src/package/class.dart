

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/package/interface.dart';
import 'package:library/src/package/types.dart';
import 'package:meta/meta.dart';

abstract class Class implements Interface, Finalizable {

  factory Class() => $prototype.constructor();


  Types_Struct fun(Types_ULong double);
  Types_Enum get property;
  set property(Types_Enum value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Class$Impl(Pointer<Void>.fromAddress(0));
}


// Class "private" section, not exported.

final _packageClassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_package_Class_register_finalizer'));
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



final _funpackageClassFunListofPackageTypesStructReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Class_fun__ListOf_package_Types_Struct_return_release_handle'));
final _funpackageClassFunListofPackageTypesStructReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Class_fun__ListOf_package_Types_Struct_return_get_result'));
final _funpackageClassFunListofPackageTypesStructReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_package_Class_fun__ListOf_package_Types_Struct_return_get_error'));
final _funpackageClassFunListofPackageTypesStructReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_package_Class_fun__ListOf_package_Types_Struct_return_has_error'));


/// @nodoc
@visibleForTesting

class Class$Impl extends __lib.NativeBase implements Class {

  Class$Impl(Pointer<Void> handle) : super(handle);


  Class constructor() {
    final _result_handle = _constructor();
    final _result = Class$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _packageClassRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);

    return _result;
  }

  static Pointer<Void> _constructor() {
    final _constructorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_package_Class_constructor'));
    final __resultHandle = _constructorFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  @override
  Types_Struct fun(Types_ULong double) {
    final _funFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_package_Class_fun__ListOf_package_Types_Struct'));
    final _doubleHandle = foobarListofPackageTypesStructToFfi(double);
    final _handle = this.handle;
    final __callResultHandle = _funFfi(_handle, __lib.LibraryContext.isolateId, _doubleHandle);
    foobarListofPackageTypesStructReleaseFfiHandle(_doubleHandle);
    if (_funpackageClassFunListofPackageTypesStructReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _funpackageClassFunListofPackageTypesStructReturnGetError(__callResultHandle);
        _funpackageClassFunListofPackageTypesStructReturnReleaseHandle(__callResultHandle);
        try {
          throw Types_ExceptionException(packageTypesEnumFromFfi(__errorHandle));
        } finally {
          packageTypesEnumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _funpackageClassFunListofPackageTypesStructReturnGetResult(__callResultHandle);
    _funpackageClassFunListofPackageTypesStructReturnReleaseHandle(__callResultHandle);
    try {
      return packageTypesStructFromFfi(__resultHandle);
    } finally {
      packageTypesStructReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Types_Enum get property {
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
  set property(Types_Enum value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_package_Class_property_set__enum'));
    final _valueHandle = packageTypesEnumToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    packageTypesEnumReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> packageClassToFfi(Class value) =>
  _packageClassCopyHandle((value as __lib.NativeBase).handle);

Class packageClassFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Class) return instance;

  final _typeIdHandle = _packageClassGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _packageClassCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : Class$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _packageClassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void packageClassReleaseFfiHandle(Pointer<Void> handle) =>
  _packageClassReleaseHandle(handle);

Pointer<Void> packageClassToFfiNullable(Class? value) =>
  value != null ? packageClassToFfi(value) : Pointer<Void>.fromAddress(0);

Class? packageClassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? packageClassFromFfi(handle) : null;

void packageClassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _packageClassReleaseHandle(handle);

// End of Class "private" section.



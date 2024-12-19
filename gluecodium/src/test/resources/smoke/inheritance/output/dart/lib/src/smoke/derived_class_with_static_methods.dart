

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/base_class_with_static_methods.dart';
import 'package:meta/meta.dart';

abstract class DerivedClassWithStaticMethods implements BaseClassWithStaticMethods, Finalizable {
  /// A constructor, which creates the derived class.
  ///
  factory DerivedClassWithStaticMethods() => $prototype.create();

  /// A static function defined in the derived class.
  ///
  static double getRandomDouble() => $prototype.getRandomDouble();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = DerivedClassWithStaticMethods$Impl(Pointer<Void>.fromAddress(0));
}


// DerivedClassWithStaticMethods "private" section, not exported.

final _smokeDerivedclasswithstaticmethodsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_DerivedClassWithStaticMethods_register_finalizer'));
final _smokeDerivedclasswithstaticmethodsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DerivedClassWithStaticMethods_copy_handle'));
final _smokeDerivedclasswithstaticmethodsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DerivedClassWithStaticMethods_release_handle'));
final _smokeDerivedclasswithstaticmethodsGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DerivedClassWithStaticMethods_get_type_id'));




/// @nodoc
@visibleForTesting
class DerivedClassWithStaticMethods$Impl extends BaseClassWithStaticMethods$HiddenImpl implements DerivedClassWithStaticMethods {

  DerivedClassWithStaticMethods$Impl(Pointer<Void> handle) : super(handle);


  DerivedClassWithStaticMethods create() {
    final _result_handle = _create();
    final _result = DerivedClassWithStaticMethods$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeDerivedclasswithstaticmethodsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _create() {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_DerivedClassWithStaticMethods_create'));
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  double getRandomDouble() {
    final _getRandomDoubleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Int32), double Function(int)>('library_smoke_DerivedClassWithStaticMethods_getRandomDouble'));
    final __resultHandle = _getRandomDoubleFfi(__lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}
/// @nodoc
class DerivedClassWithStaticMethods$HiddenImpl extends DerivedClassWithStaticMethods$Impl {

  DerivedClassWithStaticMethods$HiddenImpl(Pointer<Void> handle) : super(handle);

}

Pointer<Void> smokeDerivedclasswithstaticmethodsToFfi(DerivedClassWithStaticMethods value) =>
  _smokeDerivedclasswithstaticmethodsCopyHandle((value as __lib.NativeBase).handle);

DerivedClassWithStaticMethods smokeDerivedclasswithstaticmethodsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DerivedClassWithStaticMethods) return instance;

  final _typeIdHandle = _smokeDerivedclasswithstaticmethodsGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeDerivedclasswithstaticmethodsCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DerivedClassWithStaticMethods$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeDerivedclasswithstaticmethodsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeDerivedclasswithstaticmethodsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeDerivedclasswithstaticmethodsReleaseHandle(handle);

Pointer<Void> smokeDerivedclasswithstaticmethodsToFfiNullable(DerivedClassWithStaticMethods? value) =>
  value != null ? smokeDerivedclasswithstaticmethodsToFfi(value) : Pointer<Void>.fromAddress(0);

DerivedClassWithStaticMethods? smokeDerivedclasswithstaticmethodsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeDerivedclasswithstaticmethodsFromFfi(handle) : null;

void smokeDerivedclasswithstaticmethodsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDerivedclasswithstaticmethodsReleaseHandle(handle);

// End of DerivedClassWithStaticMethods "private" section.



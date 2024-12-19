

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';

abstract class BaseClassWithStaticMethods implements Finalizable {

  factory BaseClassWithStaticMethods() => $prototype.create();

  /// A static function defined in the base class.
  ///
  static int getRandomInt() => $prototype.getRandomInt();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = BaseClassWithStaticMethods$Impl(Pointer<Void>.fromAddress(0));
}


// BaseClassWithStaticMethods "private" section, not exported.

final _smokeBaseclasswithstaticmethodsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_BaseClassWithStaticMethods_register_finalizer'));
final _smokeBaseclasswithstaticmethodsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_BaseClassWithStaticMethods_copy_handle'));
final _smokeBaseclasswithstaticmethodsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_BaseClassWithStaticMethods_release_handle'));
final _smokeBaseclasswithstaticmethodsGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_BaseClassWithStaticMethods_get_type_id'));




/// @nodoc
@visibleForTesting
class BaseClassWithStaticMethods$Impl extends __lib.NativeBase implements BaseClassWithStaticMethods {

  BaseClassWithStaticMethods$Impl(Pointer<Void> handle) : super(handle);


  BaseClassWithStaticMethods create() {
    final _result_handle = _create();
    final _result = BaseClassWithStaticMethods$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeBaseclasswithstaticmethodsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _create() {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_BaseClassWithStaticMethods_create'));
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  int getRandomInt() {
    final _getRandomIntFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Int32), int Function(int)>('library_smoke_BaseClassWithStaticMethods_getRandomInt'));
    final __resultHandle = _getRandomIntFfi(__lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}
/// @nodoc
class BaseClassWithStaticMethods$HiddenImpl extends BaseClassWithStaticMethods$Impl {

  BaseClassWithStaticMethods$HiddenImpl(Pointer<Void> handle) : super(handle);

}

Pointer<Void> smokeBaseclasswithstaticmethodsToFfi(BaseClassWithStaticMethods value) =>
  _smokeBaseclasswithstaticmethodsCopyHandle((value as __lib.NativeBase).handle);

BaseClassWithStaticMethods smokeBaseclasswithstaticmethodsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is BaseClassWithStaticMethods) return instance;

  final _typeIdHandle = _smokeBaseclasswithstaticmethodsGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeBaseclasswithstaticmethodsCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : BaseClassWithStaticMethods$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeBaseclasswithstaticmethodsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeBaseclasswithstaticmethodsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeBaseclasswithstaticmethodsReleaseHandle(handle);

Pointer<Void> smokeBaseclasswithstaticmethodsToFfiNullable(BaseClassWithStaticMethods? value) =>
  value != null ? smokeBaseclasswithstaticmethodsToFfi(value) : Pointer<Void>.fromAddress(0);

BaseClassWithStaticMethods? smokeBaseclasswithstaticmethodsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeBaseclasswithstaticmethodsFromFfi(handle) : null;

void smokeBaseclasswithstaticmethodsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeBaseclasswithstaticmethodsReleaseHandle(handle);

// End of BaseClassWithStaticMethods "private" section.



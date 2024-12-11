

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';

abstract class SpecialNames implements Finalizable {

  factory SpecialNames(String result) => $prototype.make(result);


  void create();

  void reallyRelease();

  void createProxy();

  void Uppercase();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SpecialNames$Impl(Pointer<Void>.fromAddress(0));
}


// SpecialNames "private" section, not exported.

final _smokeSpecialnamesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SpecialNames_register_finalizer'));
final _smokeSpecialnamesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SpecialNames_copy_handle'));
final _smokeSpecialnamesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SpecialNames_release_handle'));







/// @nodoc
@visibleForTesting
class SpecialNames$Impl extends __lib.NativeBase implements SpecialNames {

  SpecialNames$Impl(Pointer<Void> handle) : super(handle);


  SpecialNames make(String result) {
    final _result_handle = _make(result);
    final _result = SpecialNames$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeSpecialnamesRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  @override
  void create() {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialNames_create'));
    final _handle = this.handle;
    _createFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void reallyRelease() {
    final _reallyReleaseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialNames_release'));
    final _handle = this.handle;
    _reallyReleaseFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void createProxy() {
    final _createProxyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialNames_createProxy'));
    final _handle = this.handle;
    _createProxyFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void Uppercase() {
    final _UppercaseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialNames_Uppercase'));
    final _handle = this.handle;
    _UppercaseFfi(_handle, __lib.LibraryContext.isolateId);

  }

  static Pointer<Void> _make(String result) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_SpecialNames_make__String'));
    final _resultHandle = stringToFfi(result);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _resultHandle);
    stringReleaseFfiHandle(_resultHandle);
    return __resultHandle;
  }


}

Pointer<Void> smokeSpecialnamesToFfi(SpecialNames value) =>
  _smokeSpecialnamesCopyHandle((value as __lib.NativeBase).handle);

SpecialNames smokeSpecialnamesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SpecialNames) return instance;

  final _copiedHandle = _smokeSpecialnamesCopyHandle(handle);
  final result = SpecialNames$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeSpecialnamesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeSpecialnamesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSpecialnamesReleaseHandle(handle);

Pointer<Void> smokeSpecialnamesToFfiNullable(SpecialNames? value) =>
  value != null ? smokeSpecialnamesToFfi(value) : Pointer<Void>.fromAddress(0);

SpecialNames? smokeSpecialnamesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSpecialnamesFromFfi(handle) : null;

void smokeSpecialnamesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSpecialnamesReleaseHandle(handle);

// End of SpecialNames "private" section.



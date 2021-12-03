import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
abstract class InternalPropertyOnly {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  /// @nodoc
  @internal
  String get internal_foo;
  /// @nodoc
  @internal
  set internal_foo(String value);
}
// InternalPropertyOnly "private" section, not exported.
final _smokeInternalpropertyonlyRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_InternalPropertyOnly_register_finalizer'));
final _smokeInternalpropertyonlyCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalPropertyOnly_copy_handle'));
final _smokeInternalpropertyonlyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalPropertyOnly_release_handle'));
class InternalPropertyOnly$Impl extends __lib.NativeBase implements InternalPropertyOnly {
  InternalPropertyOnly$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @internal
  @override
  String get internal_foo {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_InternalPropertyOnly_foo_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @internal
  @override
  set internal_foo(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_InternalPropertyOnly_foo_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
}
Pointer<Void> smokeInternalpropertyonlyToFfi(InternalPropertyOnly value) =>
  _smokeInternalpropertyonlyCopyHandle((value as __lib.NativeBase).handle);
InternalPropertyOnly smokeInternalpropertyonlyFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InternalPropertyOnly) return instance;
  final _copiedHandle = _smokeInternalpropertyonlyCopyHandle(handle);
  final result = InternalPropertyOnly$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeInternalpropertyonlyRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeInternalpropertyonlyReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeInternalpropertyonlyReleaseHandle(handle);
Pointer<Void> smokeInternalpropertyonlyToFfiNullable(InternalPropertyOnly? value) =>
  value != null ? smokeInternalpropertyonlyToFfi(value) : Pointer<Void>.fromAddress(0);
InternalPropertyOnly? smokeInternalpropertyonlyFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeInternalpropertyonlyFromFfi(handle) : null;
void smokeInternalpropertyonlyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInternalpropertyonlyReleaseHandle(handle);
// End of InternalPropertyOnly "private" section.

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class SkipEnableParameters {
  void doSomething(String input);
}
// SkipEnableParameters "private" section, not exported.
final _smokeSkipenableparametersRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SkipEnableParameters_register_finalizer'));
final _smokeSkipenableparametersCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipEnableParameters_copy_handle'));
final _smokeSkipenableparametersReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipEnableParameters_release_handle'));
class SkipEnableParameters$Impl extends __lib.NativeBase implements SkipEnableParameters {
  SkipEnableParameters$Impl(Pointer<Void> handle) : super(handle);
  @override
  void doSomething(String input) {
    final _doSomethingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SkipEnableParameters_doSomething__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    _doSomethingFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
  }
}
Pointer<Void> smokeSkipenableparametersToFfi(SkipEnableParameters value) =>
  _smokeSkipenableparametersCopyHandle((value as __lib.NativeBase).handle);
SkipEnableParameters smokeSkipenableparametersFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SkipEnableParameters) return instance;
  final _copiedHandle = _smokeSkipenableparametersCopyHandle(handle);
  final result = SkipEnableParameters$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeSkipenableparametersRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeSkipenableparametersReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSkipenableparametersReleaseHandle(handle);
Pointer<Void> smokeSkipenableparametersToFfiNullable(SkipEnableParameters? value) =>
  value != null ? smokeSkipenableparametersToFfi(value) : Pointer<Void>.fromAddress(0);
SkipEnableParameters? smokeSkipenableparametersFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSkipenableparametersFromFfi(handle) : null;
void smokeSkipenableparametersReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSkipenableparametersReleaseHandle(handle);
// End of SkipEnableParameters "private" section.

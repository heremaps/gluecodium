import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
abstract class EnableIfEnabled {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  static void enableIfUnquoted() => EnableIfEnabled$Impl.enableIfUnquoted();
  static void enableIfUnquotedList() => EnableIfEnabled$Impl.enableIfUnquotedList();
  static void enableIfQuoted() => EnableIfEnabled$Impl.enableIfQuoted();
  static void enableIfQuotedList() => EnableIfEnabled$Impl.enableIfQuotedList();
  static void enableIfTagged() => EnableIfEnabled$Impl.enableIfTagged();
  static void enableIfTaggedList() => EnableIfEnabled$Impl.enableIfTaggedList();
  static void enableIfMixedList() => EnableIfEnabled$Impl.enableIfMixedList();
}
// EnableIfEnabled "private" section, not exported.
final _smokeEnableifenabledRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_EnableIfEnabled_register_finalizer'));
final _smokeEnableifenabledCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnableIfEnabled_copy_handle'));
final _smokeEnableifenabledReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnableIfEnabled_release_handle'));
class EnableIfEnabled$Impl extends __lib.NativeBase implements EnableIfEnabled {
  EnableIfEnabled$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  static void enableIfUnquoted() {
    final _enableIfUnquotedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfUnquoted'));
    _enableIfUnquotedFfi(__lib.LibraryContext.isolateId);
  }
  static void enableIfUnquotedList() {
    final _enableIfUnquotedListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfUnquotedList'));
    _enableIfUnquotedListFfi(__lib.LibraryContext.isolateId);
  }
  static void enableIfQuoted() {
    final _enableIfQuotedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfQuoted'));
    _enableIfQuotedFfi(__lib.LibraryContext.isolateId);
  }
  static void enableIfQuotedList() {
    final _enableIfQuotedListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfQuotedList'));
    _enableIfQuotedListFfi(__lib.LibraryContext.isolateId);
  }
  static void enableIfTagged() {
    final _enableIfTaggedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfTagged'));
    _enableIfTaggedFfi(__lib.LibraryContext.isolateId);
  }
  static void enableIfTaggedList() {
    final _enableIfTaggedListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfTaggedList'));
    _enableIfTaggedListFfi(__lib.LibraryContext.isolateId);
  }
  static void enableIfMixedList() {
    final _enableIfMixedListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfMixedList'));
    _enableIfMixedListFfi(__lib.LibraryContext.isolateId);
  }
}
Pointer<Void> smokeEnableifenabledToFfi(EnableIfEnabled value) =>
  _smokeEnableifenabledCopyHandle((value as __lib.NativeBase).handle);
EnableIfEnabled smokeEnableifenabledFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is EnableIfEnabled) return instance;
  final _copiedHandle = _smokeEnableifenabledCopyHandle(handle);
  final result = EnableIfEnabled$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeEnableifenabledRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeEnableifenabledReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeEnableifenabledReleaseHandle(handle);
Pointer<Void> smokeEnableifenabledToFfiNullable(EnableIfEnabled? value) =>
  value != null ? smokeEnableifenabledToFfi(value) : Pointer<Void>.fromAddress(0);
EnableIfEnabled? smokeEnableifenabledFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeEnableifenabledFromFfi(handle) : null;
void smokeEnableifenabledReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnableifenabledReleaseHandle(handle);
// End of EnableIfEnabled "private" section.

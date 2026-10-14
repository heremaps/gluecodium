

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:meta/meta.dart';

abstract class EnableIfEnabled implements Finalizable {


  static void enableIfUnquoted() => $prototype.enableIfUnquoted();

  static void enableIfUnquotedList() => $prototype.enableIfUnquotedList();

  static void enableIfQuoted() => $prototype.enableIfQuoted();

  static void enableIfQuotedList() => $prototype.enableIfQuotedList();

  static void enableIfTagged() => $prototype.enableIfTagged();

  static void enableIfTaggedList() => $prototype.enableIfTaggedList();

  static void enableIfMixedList() => $prototype.enableIfMixedList();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = EnableIfEnabled$Impl(Pointer<Void>.fromAddress(0));
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


final __ffiPtr_library_smoke_EnableIfEnabled_enableIfUnquoted = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfUnquoted'));


final __ffiPtr_library_smoke_EnableIfEnabled_enableIfUnquotedList = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfUnquotedList'));


final __ffiPtr_library_smoke_EnableIfEnabled_enableIfQuoted = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfQuoted'));


final __ffiPtr_library_smoke_EnableIfEnabled_enableIfQuotedList = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfQuotedList'));


final __ffiPtr_library_smoke_EnableIfEnabled_enableIfTagged = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfTagged'));


final __ffiPtr_library_smoke_EnableIfEnabled_enableIfTaggedList = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfTaggedList'));


final __ffiPtr_library_smoke_EnableIfEnabled_enableIfMixedList = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfMixedList'));



/// @nodoc
@visibleForTesting

class EnableIfEnabled$Impl extends __lib.NativeBase implements EnableIfEnabled {

  EnableIfEnabled$Impl(Pointer<Void> handle) : super(handle);

  void enableIfUnquoted() {
    __ffiPtr_library_smoke_EnableIfEnabled_enableIfUnquoted(__lib.LibraryContext.isolateId);

  }

  void enableIfUnquotedList() {
    __ffiPtr_library_smoke_EnableIfEnabled_enableIfUnquotedList(__lib.LibraryContext.isolateId);

  }

  void enableIfQuoted() {
    __ffiPtr_library_smoke_EnableIfEnabled_enableIfQuoted(__lib.LibraryContext.isolateId);

  }

  void enableIfQuotedList() {
    __ffiPtr_library_smoke_EnableIfEnabled_enableIfQuotedList(__lib.LibraryContext.isolateId);

  }

  void enableIfTagged() {
    __ffiPtr_library_smoke_EnableIfEnabled_enableIfTagged(__lib.LibraryContext.isolateId);

  }

  void enableIfTaggedList() {
    __ffiPtr_library_smoke_EnableIfEnabled_enableIfTaggedList(__lib.LibraryContext.isolateId);

  }

  void enableIfMixedList() {
    __ffiPtr_library_smoke_EnableIfEnabled_enableIfMixedList(__lib.LibraryContext.isolateId);

  }


}

Pointer<Void> smokeEnableifenabledToFfi(EnableIfEnabled value) =>
  _smokeEnableifenabledCopyHandle((value as __lib.NativeBase).handle);

EnableIfEnabled smokeEnableifenabledFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
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



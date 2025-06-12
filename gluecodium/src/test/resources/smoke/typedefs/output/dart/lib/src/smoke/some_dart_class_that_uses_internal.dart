

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/dart_internal_class_with_internal_typedef.dart';

abstract class SomeDartClassThatUsesInternal implements Finalizable {

}

/// @nodoc
typedef SomeDartClassThatUsesInternal_ListOfInternals = List<DartInternalClassWithInternalTypedef>;

// SomeDartClassThatUsesInternal "private" section, not exported.

final _smokeSomedartclassthatusesinternalRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SomeDartClassThatUsesInternal_register_finalizer'));
final _smokeSomedartclassthatusesinternalCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SomeDartClassThatUsesInternal_copy_handle'));
final _smokeSomedartclassthatusesinternalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SomeDartClassThatUsesInternal_release_handle'));



class SomeDartClassThatUsesInternal$Impl extends __lib.NativeBase implements SomeDartClassThatUsesInternal {

  SomeDartClassThatUsesInternal$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> smokeSomedartclassthatusesinternalToFfi(SomeDartClassThatUsesInternal value) =>
  _smokeSomedartclassthatusesinternalCopyHandle((value as __lib.NativeBase).handle);

SomeDartClassThatUsesInternal smokeSomedartclassthatusesinternalFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SomeDartClassThatUsesInternal) return instance;

  final _copiedHandle = _smokeSomedartclassthatusesinternalCopyHandle(handle);
  final result = SomeDartClassThatUsesInternal$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeSomedartclassthatusesinternalRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeSomedartclassthatusesinternalReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSomedartclassthatusesinternalReleaseHandle(handle);

Pointer<Void> smokeSomedartclassthatusesinternalToFfiNullable(SomeDartClassThatUsesInternal? value) =>
  value != null ? smokeSomedartclassthatusesinternalToFfi(value) : Pointer<Void>.fromAddress(0);

SomeDartClassThatUsesInternal? smokeSomedartclassthatusesinternalFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSomedartclassthatusesinternalFromFfi(handle) : null;

void smokeSomedartclassthatusesinternalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSomedartclassthatusesinternalReleaseHandle(handle);

// End of SomeDartClassThatUsesInternal "private" section.



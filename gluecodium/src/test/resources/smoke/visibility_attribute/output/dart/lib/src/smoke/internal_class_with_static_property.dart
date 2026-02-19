

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;

/// @nodoc
abstract class InternalClassWithStaticProperty implements Finalizable {

}


// InternalClassWithStaticProperty "private" section, not exported.

final _smokeInternalclasswithstaticpropertyRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_InternalClassWithStaticProperty_register_finalizer'));
final _smokeInternalclasswithstaticpropertyCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalClassWithStaticProperty_copy_handle'));
final _smokeInternalclasswithstaticpropertyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalClassWithStaticProperty_release_handle'));



class InternalClassWithStaticProperty$Impl extends __lib.NativeBase implements InternalClassWithStaticProperty {

  InternalClassWithStaticProperty$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> smokeInternalclasswithstaticpropertyToFfi(InternalClassWithStaticProperty value) =>
  _smokeInternalclasswithstaticpropertyCopyHandle((value as __lib.NativeBase).handle);

InternalClassWithStaticProperty smokeInternalclasswithstaticpropertyFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InternalClassWithStaticProperty) return instance;

  final _copiedHandle = _smokeInternalclasswithstaticpropertyCopyHandle(handle);
  final result = InternalClassWithStaticProperty$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeInternalclasswithstaticpropertyRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeInternalclasswithstaticpropertyReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeInternalclasswithstaticpropertyReleaseHandle(handle);

Pointer<Void> smokeInternalclasswithstaticpropertyToFfiNullable(InternalClassWithStaticProperty? value) =>
  value != null ? smokeInternalclasswithstaticpropertyToFfi(value) : Pointer<Void>.fromAddress(0);

InternalClassWithStaticProperty? smokeInternalclasswithstaticpropertyFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeInternalclasswithstaticpropertyFromFfi(handle) : null;

void smokeInternalclasswithstaticpropertyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInternalclasswithstaticpropertyReleaseHandle(handle);

// End of InternalClassWithStaticProperty "private" section.



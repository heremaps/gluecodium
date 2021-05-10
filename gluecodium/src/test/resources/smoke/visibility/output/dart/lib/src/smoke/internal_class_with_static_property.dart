import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
abstract class InternalClassWithStaticProperty {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// @nodoc
  static String get internal_fooBar => InternalClassWithStaticProperty$Impl.internal_fooBar;
  /// @nodoc
  static set internal_fooBar(String value) { InternalClassWithStaticProperty$Impl.internal_fooBar = value; }
}
// InternalClassWithStaticProperty "private" section, not exported.
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
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeInternalclasswithstaticpropertyReleaseHandle(handle);
    handle = null;
  }
  static String get internal_fooBar {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_InternalClassWithStaticProperty_fooBar_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
  static set internal_fooBar(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('library_smoke_InternalClassWithStaticProperty_fooBar_set__String'));
    final _valueHandle = String_toFfi(value);
    final __resultHandle = _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    String_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_InternalClassWithStaticProperty_toFfi(InternalClassWithStaticProperty value) =>
  _smokeInternalclasswithstaticpropertyCopyHandle((value as __lib.NativeBase).handle);
InternalClassWithStaticProperty smoke_InternalClassWithStaticProperty_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as InternalClassWithStaticProperty;
  if (instance != null) return instance;
  final _copiedHandle = _smokeInternalclasswithstaticpropertyCopyHandle(handle);
  final result = InternalClassWithStaticProperty$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_InternalClassWithStaticProperty_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeInternalclasswithstaticpropertyReleaseHandle(handle);
Pointer<Void> smoke_InternalClassWithStaticProperty_toFfi_nullable(InternalClassWithStaticProperty value) =>
  value != null ? smoke_InternalClassWithStaticProperty_toFfi(value) : Pointer<Void>.fromAddress(0);
InternalClassWithStaticProperty smoke_InternalClassWithStaticProperty_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InternalClassWithStaticProperty_fromFfi(handle) : null;
void smoke_InternalClassWithStaticProperty_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeInternalclasswithstaticpropertyReleaseHandle(handle);
// End of InternalClassWithStaticProperty "private" section.

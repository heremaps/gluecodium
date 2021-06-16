import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
/// @nodoc
abstract class InternalClassWithStaticProperty {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  /// @nodoc
  static String get internal_fooBar => InternalClassWithStaticProperty$Impl.internal_fooBar;
  /// @nodoc
  static set internal_fooBar(String value) { InternalClassWithStaticProperty$Impl.internal_fooBar = value; }
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
  @override
  void release() {}
  static String get internal_fooBar {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_InternalClassWithStaticProperty_fooBar_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  static set internal_fooBar(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('library_smoke_InternalClassWithStaticProperty_fooBar_set__String'));
    final _valueHandle = stringToFfi(value);
    _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
}
Pointer<Void> smokeInternalclasswithstaticpropertyToFfi(InternalClassWithStaticProperty value) =>
  _smokeInternalclasswithstaticpropertyCopyHandle((value as __lib.NativeBase).handle);
InternalClassWithStaticProperty smokeInternalclasswithstaticpropertyFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InternalClassWithStaticProperty) return instance as InternalClassWithStaticProperty;
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

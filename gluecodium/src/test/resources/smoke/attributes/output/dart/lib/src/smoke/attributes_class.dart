import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@OnClass
abstract class AttributesClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  @OnConstInClass
  static final bool pi = false;
  @OnFunctionInClass
  veryFun(@OnParameterInClass String param);
  @OnPropertyInClass
  String get prop;
  @OnPropertyInClass
  set prop(String value);
}
// AttributesClass "private" section, not exported.
final _smokeAttributesclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesClass_copy_handle'));
final _smokeAttributesclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesClass_release_handle'));
class AttributesClass$Impl extends __lib.NativeBase implements AttributesClass {
  AttributesClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeAttributesclassReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  veryFun(@OnParameterInClass String param) {
    final _veryFunFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesClass_veryFun__String'));
    final _paramHandle = stringToFfi(param);
    final _handle = this.handle;
    final __resultHandle = _veryFunFfi(_handle, __lib.LibraryContext.isolateId, _paramHandle);
    stringReleaseFfiHandle(_paramHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @OnPropertyInClass
  @override
  String get prop {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_AttributesClass_prop_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @OnPropertyInClass
  @override
  set prop(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesClass_prop_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smokeAttributesclassToFfi(AttributesClass value) =>
  _smokeAttributesclassCopyHandle((value as __lib.NativeBase).handle);
AttributesClass smokeAttributesclassFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is AttributesClass) return instance;
  final _copiedHandle = _smokeAttributesclassCopyHandle(handle);
  final result = AttributesClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeAttributesclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAttributesclassReleaseHandle(handle);
Pointer<Void> smokeAttributesclassToFfiNullable(AttributesClass? value) =>
  value != null ? smokeAttributesclassToFfi(value) : Pointer<Void>.fromAddress(0);
AttributesClass? smokeAttributesclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeAttributesclassFromFfi(handle) : null;
void smokeAttributesclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAttributesclassReleaseHandle(handle);
// End of AttributesClass "private" section.

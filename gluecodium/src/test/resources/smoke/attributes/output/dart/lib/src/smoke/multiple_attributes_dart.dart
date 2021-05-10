import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class MultipleAttributesDart {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  @Foo
  @Bar
  noLists2();
  @Foo
  @Bar
  @Baz
  noLists3();
  @Foo
  @Bar
  @Baz
  listFirst();
  @Foo
  @Bar
  @Baz
  listSecond();
  @Foo
  @Bar
  @Baz
  @Fizz
  twoLists();
}
// MultipleAttributesDart "private" section, not exported.
final _smokeMultipleattributesdartCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MultipleAttributesDart_copy_handle'));
final _smokeMultipleattributesdartReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MultipleAttributesDart_release_handle'));
class MultipleAttributesDart$Impl extends __lib.NativeBase implements MultipleAttributesDart {
  MultipleAttributesDart$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeMultipleattributesdartReleaseHandle(handle);
    handle = null;
  }
  @override
  noLists2() {
    final _noLists2Ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_noLists2'));
    final _handle = this.handle;
    final __resultHandle = _noLists2Ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  noLists3() {
    final _noLists3Ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_noLists3'));
    final _handle = this.handle;
    final __resultHandle = _noLists3Ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  listFirst() {
    final _listFirstFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_listFirst'));
    final _handle = this.handle;
    final __resultHandle = _listFirstFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  listSecond() {
    final _listSecondFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_listSecond'));
    final _handle = this.handle;
    final __resultHandle = _listSecondFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  twoLists() {
    final _twoListsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_twoLists'));
    final _handle = this.handle;
    final __resultHandle = _twoListsFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_MultipleAttributesDart_toFfi(MultipleAttributesDart value) =>
  _smokeMultipleattributesdartCopyHandle((value as __lib.NativeBase).handle);
MultipleAttributesDart smoke_MultipleAttributesDart_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as MultipleAttributesDart;
  if (instance != null) return instance;
  final _copiedHandle = _smokeMultipleattributesdartCopyHandle(handle);
  final result = MultipleAttributesDart$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_MultipleAttributesDart_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeMultipleattributesdartReleaseHandle(handle);
Pointer<Void> smoke_MultipleAttributesDart_toFfi_nullable(MultipleAttributesDart value) =>
  value != null ? smoke_MultipleAttributesDart_toFfi(value) : Pointer<Void>.fromAddress(0);
MultipleAttributesDart smoke_MultipleAttributesDart_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_MultipleAttributesDart_fromFfi(handle) : null;
void smoke_MultipleAttributesDart_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeMultipleattributesdartReleaseHandle(handle);
// End of MultipleAttributesDart "private" section.

import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class MultipleAttributesDart {
  /// @nodoc
  @Deprecated("Does nothing")
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
final _smoke_MultipleAttributesDart_register_finalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_MultipleAttributesDart_register_finalizer'));
final _smoke_MultipleAttributesDart_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MultipleAttributesDart_copy_handle'));
final _smoke_MultipleAttributesDart_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MultipleAttributesDart_release_handle'));
class MultipleAttributesDart$Impl implements MultipleAttributesDart {
  @protected
  Pointer<Void> handle;
  MultipleAttributesDart$Impl(this.handle);
  @override
  void release() {}
  @override
  noLists2() {
    final _noLists2_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_noLists2'));
    final _handle = this.handle;
    final __result_handle = _noLists2_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  noLists3() {
    final _noLists3_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_noLists3'));
    final _handle = this.handle;
    final __result_handle = _noLists3_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  listFirst() {
    final _listFirst_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_listFirst'));
    final _handle = this.handle;
    final __result_handle = _listFirst_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  listSecond() {
    final _listSecond_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_listSecond'));
    final _handle = this.handle;
    final __result_handle = _listSecond_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  twoLists() {
    final _twoLists_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_twoLists'));
    final _handle = this.handle;
    final __result_handle = _twoLists_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_MultipleAttributesDart_toFfi(MultipleAttributesDart value) =>
  _smoke_MultipleAttributesDart_copy_handle((value as MultipleAttributesDart$Impl).handle);
MultipleAttributesDart smoke_MultipleAttributesDart_fromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MultipleAttributesDart) return instance as MultipleAttributesDart;
  final _copied_handle = _smoke_MultipleAttributesDart_copy_handle(handle);
  final result = MultipleAttributesDart$Impl(_copied_handle);
  __lib.cacheInstance(_copied_handle, result, _smoke_MultipleAttributesDart_register_finalizer);
  return result;
}
void smoke_MultipleAttributesDart_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_MultipleAttributesDart_release_handle(handle);
Pointer<Void> smoke_MultipleAttributesDart_toFfi_nullable(MultipleAttributesDart value) =>
  value != null ? smoke_MultipleAttributesDart_toFfi(value) : Pointer<Void>.fromAddress(0);
MultipleAttributesDart smoke_MultipleAttributesDart_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_MultipleAttributesDart_fromFfi(handle) : null;
void smoke_MultipleAttributesDart_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_MultipleAttributesDart_release_handle(handle);
// End of MultipleAttributesDart "private" section.

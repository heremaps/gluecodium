

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;

abstract class MultipleAttributesDart implements Finalizable {


  @Foo

  @Bar
  void noLists2();

  @Foo

  @Bar

  @Baz
  void noLists3();

  @Foo

  @Bar

  @Baz
  void listFirst();

  @Foo

  @Bar

  @Baz
  void listSecond();

  @Foo

  @Bar

  @Baz

  @Fizz
  void twoLists();
}


// MultipleAttributesDart "private" section, not exported.

final _smokeMultipleattributesdartRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_MultipleAttributesDart_register_finalizer'));
final _smokeMultipleattributesdartCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MultipleAttributesDart_copy_handle'));
final _smokeMultipleattributesdartReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MultipleAttributesDart_release_handle'));


final __ffiPtr_library_smoke_MultipleAttributesDart_noLists2 = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_noLists2'));


final __ffiPtr_library_smoke_MultipleAttributesDart_noLists3 = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_noLists3'));


final __ffiPtr_library_smoke_MultipleAttributesDart_listFirst = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_listFirst'));


final __ffiPtr_library_smoke_MultipleAttributesDart_listSecond = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_listSecond'));


final __ffiPtr_library_smoke_MultipleAttributesDart_twoLists = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_MultipleAttributesDart_twoLists'));




class MultipleAttributesDart$Impl extends __lib.NativeBase implements MultipleAttributesDart {

  MultipleAttributesDart$Impl(Pointer<Void> handle) : super(handle);

  @override
  void noLists2() {
    final _handle = this.handle;
    __ffiPtr_library_smoke_MultipleAttributesDart_noLists2(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void noLists3() {
    final _handle = this.handle;
    __ffiPtr_library_smoke_MultipleAttributesDart_noLists3(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void listFirst() {
    final _handle = this.handle;
    __ffiPtr_library_smoke_MultipleAttributesDart_listFirst(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void listSecond() {
    final _handle = this.handle;
    __ffiPtr_library_smoke_MultipleAttributesDart_listSecond(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void twoLists() {
    final _handle = this.handle;
    __ffiPtr_library_smoke_MultipleAttributesDart_twoLists(_handle, __lib.LibraryContext.isolateId);

  }


}

Pointer<Void> smokeMultipleattributesdartToFfi(MultipleAttributesDart value) =>
  _smokeMultipleattributesdartCopyHandle((value as __lib.NativeBase).handle);

MultipleAttributesDart smokeMultipleattributesdartFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MultipleAttributesDart) return instance;

  final _copiedHandle = _smokeMultipleattributesdartCopyHandle(handle);
  final result = MultipleAttributesDart$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeMultipleattributesdartRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeMultipleattributesdartReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeMultipleattributesdartReleaseHandle(handle);

Pointer<Void> smokeMultipleattributesdartToFfiNullable(MultipleAttributesDart? value) =>
  value != null ? smokeMultipleattributesdartToFfi(value) : Pointer<Void>.fromAddress(0);

MultipleAttributesDart? smokeMultipleattributesdartFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeMultipleattributesdartFromFfi(handle) : null;

void smokeMultipleattributesdartReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeMultipleattributesdartReleaseHandle(handle);

// End of MultipleAttributesDart "private" section.



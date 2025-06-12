

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';

/// @nodoc
abstract class DartInternalClassWithInternalTypedef implements Finalizable {

  DartInternalClassWithInternalTypedef_SomeStringToIntMap get numbers;
  set numbers(DartInternalClassWithInternalTypedef_SomeStringToIntMap value);

  DartInternalClassWithInternalTypedef_SomeStringArray get labels;
  set labels(DartInternalClassWithInternalTypedef_SomeStringArray value);

}

/// @nodoc
typedef _DartInternalClassWithInternalTypedef_SomeStringToIntMap = Map<String, int>;
/// @nodoc
typedef _DartInternalClassWithInternalTypedef_SomeStringArray = List<String>;

// DartInternalClassWithInternalTypedef "private" section, not exported.

final _smokeDartinternalclasswithinternaltypedefRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_DartInternalClassWithInternalTypedef_register_finalizer'));
final _smokeDartinternalclasswithinternaltypedefCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalClassWithInternalTypedef_copy_handle'));
final _smokeDartinternalclasswithinternaltypedefReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartInternalClassWithInternalTypedef_release_handle'));



class DartInternalClassWithInternalTypedef$Impl extends __lib.NativeBase implements DartInternalClassWithInternalTypedef {

  DartInternalClassWithInternalTypedef$Impl(Pointer<Void> handle) : super(handle);

  @override
  DartInternalClassWithInternalTypedef_SomeStringToIntMap get numbers {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_DartInternalClassWithInternalTypedef_numbers_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarMapofStringToIntFromFfi(__resultHandle);
    } finally {
      foobarMapofStringToIntReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set numbers(DartInternalClassWithInternalTypedef_SomeStringToIntMap value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DartInternalClassWithInternalTypedef_numbers_set__MapOf_String_to_Int'));
    final _valueHandle = foobarMapofStringToIntToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarMapofStringToIntReleaseFfiHandle(_valueHandle);

  }


  @override
  DartInternalClassWithInternalTypedef_SomeStringArray get labels {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_DartInternalClassWithInternalTypedef_labels_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarListofStringFromFfi(__resultHandle);
    } finally {
      foobarListofStringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set labels(DartInternalClassWithInternalTypedef_SomeStringArray value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DartInternalClassWithInternalTypedef_labels_set__ListOf_String'));
    final _valueHandle = foobarListofStringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarListofStringReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> smokeDartinternalclasswithinternaltypedefToFfi(DartInternalClassWithInternalTypedef value) =>
  _smokeDartinternalclasswithinternaltypedefCopyHandle((value as __lib.NativeBase).handle);

DartInternalClassWithInternalTypedef smokeDartinternalclasswithinternaltypedefFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DartInternalClassWithInternalTypedef) return instance;

  final _copiedHandle = _smokeDartinternalclasswithinternaltypedefCopyHandle(handle);
  final result = DartInternalClassWithInternalTypedef$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeDartinternalclasswithinternaltypedefRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeDartinternalclasswithinternaltypedefReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeDartinternalclasswithinternaltypedefReleaseHandle(handle);

Pointer<Void> smokeDartinternalclasswithinternaltypedefToFfiNullable(DartInternalClassWithInternalTypedef? value) =>
  value != null ? smokeDartinternalclasswithinternaltypedefToFfi(value) : Pointer<Void>.fromAddress(0);

DartInternalClassWithInternalTypedef? smokeDartinternalclasswithinternaltypedefFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeDartinternalclasswithinternaltypedefFromFfi(handle) : null;

void smokeDartinternalclasswithinternaltypedefReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartinternalclasswithinternaltypedefReleaseHandle(handle);

// End of DartInternalClassWithInternalTypedef "private" section.



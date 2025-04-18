

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

@OnClass
abstract class AttributesClass implements Finalizable {

  @OnConstInClass
  static final bool pi = false;


  @OnFunctionInClass
  void veryFun(@OnParameterInClass String param);
  @OnPropertyInClass
  String get prop;
  @OnPropertyInClass
  set prop(String value);

}


// AttributesClass "private" section, not exported.

final _smokeAttributesclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_AttributesClass_register_finalizer'));
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
  void veryFun(@OnParameterInClass String param) {
    final _veryFunFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesClass_veryFun__String'));
    final _paramHandle = stringToFfi(param);
    final _handle = this.handle;
    _veryFunFfi(_handle, __lib.LibraryContext.isolateId, _paramHandle);
    stringReleaseFfiHandle(_paramHandle);

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
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> smokeAttributesclassToFfi(AttributesClass value) =>
  _smokeAttributesclassCopyHandle((value as __lib.NativeBase).handle);

AttributesClass smokeAttributesclassFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is AttributesClass) return instance;

  final _copiedHandle = _smokeAttributesclassCopyHandle(handle);
  final result = AttributesClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeAttributesclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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



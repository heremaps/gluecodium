

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_class.dart';
import 'package:library/src/smoke/parent_narrow_one.dart';

abstract class FirstParentIsClassClass implements ParentClass, ParentNarrowOne, Finalizable {


  void childFunction();
  String get childProperty;
  set childProperty(String value);

}


// FirstParentIsClassClass "private" section, not exported.

final _smokeFirstparentisclassclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_FirstParentIsClassClass_register_finalizer'));
final _smokeFirstparentisclassclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FirstParentIsClassClass_copy_handle'));
final _smokeFirstparentisclassclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FirstParentIsClassClass_release_handle'));
final _smokeFirstparentisclassclassGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FirstParentIsClassClass_get_type_id'));



// ignore: invalid_use_of_visible_for_testing_member
class FirstParentIsClassClass$Impl extends ParentClass$Impl implements FirstParentIsClassClass {

  FirstParentIsClassClass$Impl(Pointer<Void> handle) : super(handle);

  @override
  void childFunction() {
    final _childFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_FirstParentIsClassClass_childFunction'));
    final _handle = this.handle;
    _childFunctionFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void parentFunctionOne() {
    final _parentFunctionOneFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_FirstParentIsClassClass_parentFunctionOne'));
    final _handle = this.handle;
    _parentFunctionOneFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  String get childProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_FirstParentIsClassClass_childProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set childProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_FirstParentIsClassClass_childProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


  @override
  String get parentPropertyOne {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_FirstParentIsClassClass_parentPropertyOne_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set parentPropertyOne(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_FirstParentIsClassClass_parentPropertyOne_set'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> smokeFirstparentisclassclassToFfi(FirstParentIsClassClass value) =>
  _smokeFirstparentisclassclassCopyHandle((value as __lib.NativeBase).handle);

FirstParentIsClassClass smokeFirstparentisclassclassFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is FirstParentIsClassClass) return instance;

  final _typeIdHandle = _smokeFirstparentisclassclassGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeFirstparentisclassclassCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : FirstParentIsClassClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeFirstparentisclassclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeFirstparentisclassclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeFirstparentisclassclassReleaseHandle(handle);

Pointer<Void> smokeFirstparentisclassclassToFfiNullable(FirstParentIsClassClass? value) =>
  value != null ? smokeFirstparentisclassclassToFfi(value) : Pointer<Void>.fromAddress(0);

FirstParentIsClassClass? smokeFirstparentisclassclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeFirstparentisclassclassFromFfi(handle) : null;

void smokeFirstparentisclassclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFirstparentisclassclassReleaseHandle(handle);

// End of FirstParentIsClassClass "private" section.



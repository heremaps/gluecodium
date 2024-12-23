

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/child_class_from_class.dart';
import 'package:library/src/smoke/parent_class.dart';
import 'package:library/src/smoke/parent_with_class_references.dart';

abstract class ChildWithParentClassReferences implements ParentWithClassReferences, Finalizable {

}


// ChildWithParentClassReferences "private" section, not exported.

final _smokeChildwithparentclassreferencesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ChildWithParentClassReferences_register_finalizer'));
final _smokeChildwithparentclassreferencesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildWithParentClassReferences_copy_handle'));
final _smokeChildwithparentclassreferencesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ChildWithParentClassReferences_release_handle'));
final _smokeChildwithparentclassreferencesGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildWithParentClassReferences_get_type_id'));


class ChildWithParentClassReferences$Impl extends __lib.NativeBase implements ChildWithParentClassReferences {

  ChildWithParentClassReferences$Impl(Pointer<Void> handle) : super(handle);

  @override
  ChildClassFromClass classFunction() {
    final _classFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ChildWithParentClassReferences_classFunction'));
    final _handle = this.handle;
    final __resultHandle = _classFunctionFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeChildclassfromclassFromFfi(__resultHandle);
    } finally {
      smokeChildclassfromclassReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  ParentClass get classProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ChildWithParentClassReferences_classProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeParentclassFromFfi(__resultHandle);
    } finally {
      smokeParentclassReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set classProperty(ParentClass value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ChildWithParentClassReferences_classProperty_set'));
    final _valueHandle = smokeParentclassToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokeParentclassReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> smokeChildwithparentclassreferencesToFfi(ChildWithParentClassReferences value) =>
  _smokeChildwithparentclassreferencesCopyHandle((value as __lib.NativeBase).handle);

ChildWithParentClassReferences smokeChildwithparentclassreferencesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ChildWithParentClassReferences) return instance;

  final _typeIdHandle = _smokeChildwithparentclassreferencesGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeChildwithparentclassreferencesCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ChildWithParentClassReferences$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeChildwithparentclassreferencesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeChildwithparentclassreferencesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeChildwithparentclassreferencesReleaseHandle(handle);

Pointer<Void> smokeChildwithparentclassreferencesToFfiNullable(ChildWithParentClassReferences? value) =>
  value != null ? smokeChildwithparentclassreferencesToFfi(value) : Pointer<Void>.fromAddress(0);

ChildWithParentClassReferences? smokeChildwithparentclassreferencesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeChildwithparentclassreferencesFromFfi(handle) : null;

void smokeChildwithparentclassreferencesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeChildwithparentclassreferencesReleaseHandle(handle);

// End of ChildWithParentClassReferences "private" section.



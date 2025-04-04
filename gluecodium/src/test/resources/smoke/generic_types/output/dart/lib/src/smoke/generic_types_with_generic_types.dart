

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';

abstract class GenericTypesWithGenericTypes implements Finalizable {


  List<List<int>> methodWithListOfLists(List<List<int>> input);

  Map<Map<int, bool>, bool> methodWithMapOfMaps(Map<int, Map<int, bool>> input);

  Set<Set<int>> methodWithSetOfSets(Set<Set<int>> input);

  Map<int, List<int>> methodWithListAndMap(List<Map<int, bool>> input);

  Set<List<int>> methodWithListAndSet(List<Set<int>> input);

  Set<Map<int, bool>> methodWithMapAndSet(Map<int, Set<int>> input);

  Map<List<int>, bool> methodWithMapGenericKeys(Map<Set<int>, bool> input);
}


// GenericTypesWithGenericTypes "private" section, not exported.

final _smokeGenerictypeswithgenerictypesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_GenericTypesWithGenericTypes_register_finalizer'));
final _smokeGenerictypeswithgenerictypesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithGenericTypes_copy_handle'));
final _smokeGenerictypeswithgenerictypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithGenericTypes_release_handle'));









class GenericTypesWithGenericTypes$Impl extends __lib.NativeBase implements GenericTypesWithGenericTypes {

  GenericTypesWithGenericTypes$Impl(Pointer<Void> handle) : super(handle);

  @override
  List<List<int>> methodWithListOfLists(List<List<int>> input) {
    final _methodWithListOfListsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithListOfLists__ListOf_foobar_ListOf_Int'));
    final _inputHandle = foobarListofFoobarListofIntToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithListOfListsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofFoobarListofIntReleaseFfiHandle(_inputHandle);
    try {
      return foobarListofFoobarListofIntFromFfi(__resultHandle);
    } finally {
      foobarListofFoobarListofIntReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Map<Map<int, bool>, bool> methodWithMapOfMaps(Map<int, Map<int, bool>> input) {
    final _methodWithMapOfMapsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithMapOfMaps__MapOf_Int_to_foobar_MapOf_Int_to_Boolean'));
    final _inputHandle = foobarMapofIntToFoobarMapofIntToBooleanToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithMapOfMapsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarMapofIntToFoobarMapofIntToBooleanReleaseFfiHandle(_inputHandle);
    try {
      return foobarMapofFoobarMapofIntToBooleanToBooleanFromFfi(__resultHandle);
    } finally {
      foobarMapofFoobarMapofIntToBooleanToBooleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Set<Set<int>> methodWithSetOfSets(Set<Set<int>> input) {
    final _methodWithSetOfSetsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithSetOfSets__SetOf_foobar_SetOf_Int'));
    final _inputHandle = foobarSetofFoobarSetofIntToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSetOfSetsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarSetofFoobarSetofIntReleaseFfiHandle(_inputHandle);
    try {
      return foobarSetofFoobarSetofIntFromFfi(__resultHandle);
    } finally {
      foobarSetofFoobarSetofIntReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Map<int, List<int>> methodWithListAndMap(List<Map<int, bool>> input) {
    final _methodWithListAndMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithListAndMap__ListOf_foobar_MapOf_Int_to_Boolean'));
    final _inputHandle = foobarListofFoobarMapofIntToBooleanToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithListAndMapFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofFoobarMapofIntToBooleanReleaseFfiHandle(_inputHandle);
    try {
      return foobarMapofIntToFoobarListofIntFromFfi(__resultHandle);
    } finally {
      foobarMapofIntToFoobarListofIntReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Set<List<int>> methodWithListAndSet(List<Set<int>> input) {
    final _methodWithListAndSetFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithListAndSet__ListOf_foobar_SetOf_Int'));
    final _inputHandle = foobarListofFoobarSetofIntToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithListAndSetFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofFoobarSetofIntReleaseFfiHandle(_inputHandle);
    try {
      return foobarSetofFoobarListofIntFromFfi(__resultHandle);
    } finally {
      foobarSetofFoobarListofIntReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Set<Map<int, bool>> methodWithMapAndSet(Map<int, Set<int>> input) {
    final _methodWithMapAndSetFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithMapAndSet__MapOf_Int_to_foobar_SetOf_Int'));
    final _inputHandle = foobarMapofIntToFoobarSetofIntToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithMapAndSetFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarMapofIntToFoobarSetofIntReleaseFfiHandle(_inputHandle);
    try {
      return foobarSetofFoobarMapofIntToBooleanFromFfi(__resultHandle);
    } finally {
      foobarSetofFoobarMapofIntToBooleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Map<List<int>, bool> methodWithMapGenericKeys(Map<Set<int>, bool> input) {
    final _methodWithMapGenericKeysFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithMapGenericKeys__MapOf_foobar_SetOf_Int_to_Boolean'));
    final _inputHandle = foobarMapofFoobarSetofIntToBooleanToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithMapGenericKeysFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarMapofFoobarSetofIntToBooleanReleaseFfiHandle(_inputHandle);
    try {
      return foobarMapofFoobarListofIntToBooleanFromFfi(__resultHandle);
    } finally {
      foobarMapofFoobarListofIntToBooleanReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> smokeGenerictypeswithgenerictypesToFfi(GenericTypesWithGenericTypes value) =>
  _smokeGenerictypeswithgenerictypesCopyHandle((value as __lib.NativeBase).handle);

GenericTypesWithGenericTypes smokeGenerictypeswithgenerictypesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is GenericTypesWithGenericTypes) return instance;

  final _copiedHandle = _smokeGenerictypeswithgenerictypesCopyHandle(handle);
  final result = GenericTypesWithGenericTypes$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeGenerictypeswithgenerictypesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeGenerictypeswithgenerictypesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeGenerictypeswithgenerictypesReleaseHandle(handle);

Pointer<Void> smokeGenerictypeswithgenerictypesToFfiNullable(GenericTypesWithGenericTypes? value) =>
  value != null ? smokeGenerictypeswithgenerictypesToFfi(value) : Pointer<Void>.fromAddress(0);

GenericTypesWithGenericTypes? smokeGenerictypeswithgenerictypesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeGenerictypeswithgenerictypesFromFfi(handle) : null;

void smokeGenerictypeswithgenerictypesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeGenerictypeswithgenerictypesReleaseHandle(handle);

// End of GenericTypesWithGenericTypes "private" section.



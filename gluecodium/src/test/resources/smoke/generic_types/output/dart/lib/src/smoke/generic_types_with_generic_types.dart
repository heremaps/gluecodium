import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
abstract class GenericTypesWithGenericTypes {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  List<List<int>> methodWithListOfLists(List<List<int>> input);
  Map<Map<int, bool>, bool> methodWithMapOfMaps(Map<int, Map<int, bool>> input);
  Set<Set<int>> methodWithSetOfSets(Set<Set<int>> input);
  Map<int, List<int>> methodWithListAndMap(List<Map<int, bool>> input);
  Set<List<int>> methodWithListAndSet(List<Set<int>> input);
  Set<Map<int, bool>> methodWithMapAndSet(Map<int, Set<int>> input);
  Map<List<int>, bool> methodWithMapGenericKeys(Map<Set<int>, bool> input);
}
// GenericTypesWithGenericTypes "private" section, not exported.
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
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeGenerictypeswithgenerictypesReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  List<List<int>> methodWithListOfLists(List<List<int>> input) {
    final _methodWithListOfListsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithListOfLists__ListOf_1foobar_1ListOf_1Int'));
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
    final _methodWithMapOfMapsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithMapOfMaps__MapOf_1Int_1to_1foobar_1MapOf_1Int_1to_1Boolean'));
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
    final _methodWithSetOfSetsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithSetOfSets__SetOf_1foobar_1SetOf_1Int'));
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
    final _methodWithListAndMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithListAndMap__ListOf_1foobar_1MapOf_1Int_1to_1Boolean'));
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
    final _methodWithListAndSetFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithListAndSet__ListOf_1foobar_1SetOf_1Int'));
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
    final _methodWithMapAndSetFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithMapAndSet__MapOf_1Int_1to_1foobar_1SetOf_1Int'));
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
    final _methodWithMapGenericKeysFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithMapGenericKeys__MapOf_1foobar_1SetOf_1Int_1to_1Boolean'));
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
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is GenericTypesWithGenericTypes) return instance;
  final _copiedHandle = _smokeGenerictypeswithgenerictypesCopyHandle(handle);
  final result = GenericTypesWithGenericTypes$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
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

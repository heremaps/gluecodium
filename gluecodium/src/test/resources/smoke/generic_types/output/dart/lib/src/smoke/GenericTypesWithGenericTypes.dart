import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class GenericTypesWithGenericTypes {
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
final _smoke_GenericTypesWithGenericTypes_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithGenericTypes_copy_handle');
final _smoke_GenericTypesWithGenericTypes_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithGenericTypes_release_handle');
final _smoke_GenericTypesWithGenericTypes_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_GenericTypesWithGenericTypes_get_raw_pointer');
class GenericTypesWithGenericTypes$Impl implements GenericTypesWithGenericTypes {
  @protected
  Pointer<Void> handle;
  GenericTypesWithGenericTypes$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_GenericTypesWithGenericTypes_get_raw_pointer(handle));
    _smoke_GenericTypesWithGenericTypes_release_handle(handle);
    handle = null;
  }
  @override
  List<List<int>> methodWithListOfLists(List<List<int>> input) {
    final _methodWithListOfLists_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithListOfLists__ListOf_1foobar_1ListOf_1Int');
    final _input_handle = foobar_ListOf_foobar_ListOf_Int_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithListOfLists_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_ListOf_foobar_ListOf_Int_releaseFfiHandle(_input_handle);
    final _result = foobar_ListOf_foobar_ListOf_Int_fromFfi(__result_handle);
    foobar_ListOf_foobar_ListOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  Map<Map<int, bool>, bool> methodWithMapOfMaps(Map<int, Map<int, bool>> input) {
    final _methodWithMapOfMaps_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithMapOfMaps__MapOf_1Int_1to_1foobar_1MapOf_1Int_1to_1Boolean');
    final _input_handle = foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithMapOfMaps_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_input_handle);
    final _result = foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_fromFfi(__result_handle);
    foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  Set<Set<int>> methodWithSetOfSets(Set<Set<int>> input) {
    final _methodWithSetOfSets_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithSetOfSets__SetOf_1foobar_1SetOf_1Int');
    final _input_handle = foobar_SetOf_foobar_SetOf_Int_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithSetOfSets_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_SetOf_foobar_SetOf_Int_releaseFfiHandle(_input_handle);
    final _result = foobar_SetOf_foobar_SetOf_Int_fromFfi(__result_handle);
    foobar_SetOf_foobar_SetOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  Map<int, List<int>> methodWithListAndMap(List<Map<int, bool>> input) {
    final _methodWithListAndMap_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithListAndMap__ListOf_1foobar_1MapOf_1Int_1to_1Boolean');
    final _input_handle = foobar_ListOf_foobar_MapOf_Int_to_Boolean_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithListAndMap_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_ListOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_input_handle);
    final _result = foobar_MapOf_Int_to_foobar_ListOf_Int_fromFfi(__result_handle);
    foobar_MapOf_Int_to_foobar_ListOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  Set<List<int>> methodWithListAndSet(List<Set<int>> input) {
    final _methodWithListAndSet_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithListAndSet__ListOf_1foobar_1SetOf_1Int');
    final _input_handle = foobar_ListOf_foobar_SetOf_Int_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithListAndSet_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_ListOf_foobar_SetOf_Int_releaseFfiHandle(_input_handle);
    final _result = foobar_SetOf_foobar_ListOf_Int_fromFfi(__result_handle);
    foobar_SetOf_foobar_ListOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  Set<Map<int, bool>> methodWithMapAndSet(Map<int, Set<int>> input) {
    final _methodWithMapAndSet_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithMapAndSet__MapOf_1Int_1to_1foobar_1SetOf_1Int');
    final _input_handle = foobar_MapOf_Int_to_foobar_SetOf_Int_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithMapAndSet_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_MapOf_Int_to_foobar_SetOf_Int_releaseFfiHandle(_input_handle);
    final _result = foobar_SetOf_foobar_MapOf_Int_to_Boolean_fromFfi(__result_handle);
    foobar_SetOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  Map<List<int>, bool> methodWithMapGenericKeys(Map<Set<int>, bool> input) {
    final _methodWithMapGenericKeys_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithGenericTypes_methodWithMapGenericKeys__MapOf_1foobar_1SetOf_1Int_1to_1Boolean');
    final _input_handle = foobar_MapOf_foobar_SetOf_Int_to_Boolean_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithMapGenericKeys_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_MapOf_foobar_SetOf_Int_to_Boolean_releaseFfiHandle(_input_handle);
    final _result = foobar_MapOf_foobar_ListOf_Int_to_Boolean_fromFfi(__result_handle);
    foobar_MapOf_foobar_ListOf_Int_to_Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_GenericTypesWithGenericTypes_toFfi(GenericTypesWithGenericTypes value) =>
  _smoke_GenericTypesWithGenericTypes_copy_handle((value as GenericTypesWithGenericTypes$Impl).handle);
GenericTypesWithGenericTypes smoke_GenericTypesWithGenericTypes_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_GenericTypesWithGenericTypes_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as GenericTypesWithGenericTypes;
  if (instance != null) {
                        print("FOOBAR cache hit ${raw_handle.address}");
                        return instance;
                      }
                        print("FOOBAR cache miss ${raw_handle.address}");
  final _copied_handle = _smoke_GenericTypesWithGenericTypes_copy_handle(handle);
  final result = GenericTypesWithGenericTypes$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_GenericTypesWithGenericTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_GenericTypesWithGenericTypes_release_handle(handle);
Pointer<Void> smoke_GenericTypesWithGenericTypes_toFfi_nullable(GenericTypesWithGenericTypes value) =>
  value != null ? smoke_GenericTypesWithGenericTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
GenericTypesWithGenericTypes smoke_GenericTypesWithGenericTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_GenericTypesWithGenericTypes_fromFfi(handle) : null;
void smoke_GenericTypesWithGenericTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithGenericTypes_release_handle(handle);
// End of GenericTypesWithGenericTypes "private" section.

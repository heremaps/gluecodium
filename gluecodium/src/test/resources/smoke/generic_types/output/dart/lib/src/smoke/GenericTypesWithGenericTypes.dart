import 'package:library/src/Boolean__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_GenericTypesWithGenericTypes_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_GenericTypesWithGenericTypes_release_handle');
class GenericTypesWithGenericTypes {
  final Pointer<Void> _handle;
  GenericTypesWithGenericTypes._(this._handle);
  void release() => _smoke_GenericTypesWithGenericTypes_release_handle(_handle);
  List<List<int>> methodWithListOfLists(List<List<int>> input) {
    final _methodWithListOfLists_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithListOfLists__ListOf_1ListOf_1Int');
    final _input_handle = ListOf_ListOf_Int_toFfi(input);
    final __result_handle = _methodWithListOfLists_ffi(_handle, _input_handle);
    ListOf_ListOf_Int_releaseFfiHandle(_input_handle);
    final _result = ListOf_ListOf_Int_fromFfi(__result_handle);
    ListOf_ListOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  Map<Map<int, bool>, bool> methodWithMapOfMaps(Map<int, Map<int, bool>> input) {
    final _methodWithMapOfMaps_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithMapOfMaps__MapOf_1Int_1to_1MapOf_1Int_1to_1Boolean');
    final _input_handle = MapOf_Int_to_MapOf_Int_to_Boolean_toFfi(input);
    final __result_handle = _methodWithMapOfMaps_ffi(_handle, _input_handle);
    MapOf_Int_to_MapOf_Int_to_Boolean_releaseFfiHandle(_input_handle);
    final _result = MapOf_MapOf_Int_to_Boolean_to_Boolean_fromFfi(__result_handle);
    MapOf_MapOf_Int_to_Boolean_to_Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  Set<Set<int>> methodWithSetOfSets(Set<Set<int>> input) {
    final _methodWithSetOfSets_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithSetOfSets__SetOf_1SetOf_1Int');
    final _input_handle = SetOf_SetOf_Int_toFfi(input);
    final __result_handle = _methodWithSetOfSets_ffi(_handle, _input_handle);
    SetOf_SetOf_Int_releaseFfiHandle(_input_handle);
    final _result = SetOf_SetOf_Int_fromFfi(__result_handle);
    SetOf_SetOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  Map<int, List<int>> methodWithListAndMap(List<Map<int, bool>> input) {
    final _methodWithListAndMap_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithListAndMap__ListOf_1MapOf_1Int_1to_1Boolean');
    final _input_handle = ListOf_MapOf_Int_to_Boolean_toFfi(input);
    final __result_handle = _methodWithListAndMap_ffi(_handle, _input_handle);
    ListOf_MapOf_Int_to_Boolean_releaseFfiHandle(_input_handle);
    final _result = MapOf_Int_to_ListOf_Int_fromFfi(__result_handle);
    MapOf_Int_to_ListOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  Set<List<int>> methodWithListAndSet(List<Set<int>> input) {
    final _methodWithListAndSet_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithListAndSet__ListOf_1SetOf_1Int');
    final _input_handle = ListOf_SetOf_Int_toFfi(input);
    final __result_handle = _methodWithListAndSet_ffi(_handle, _input_handle);
    ListOf_SetOf_Int_releaseFfiHandle(_input_handle);
    final _result = SetOf_ListOf_Int_fromFfi(__result_handle);
    SetOf_ListOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  Set<Map<int, bool>> methodWithMapAndSet(Map<int, Set<int>> input) {
    final _methodWithMapAndSet_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithMapAndSet__MapOf_1Int_1to_1SetOf_1Int');
    final _input_handle = MapOf_Int_to_SetOf_Int_toFfi(input);
    final __result_handle = _methodWithMapAndSet_ffi(_handle, _input_handle);
    MapOf_Int_to_SetOf_Int_releaseFfiHandle(_input_handle);
    final _result = SetOf_MapOf_Int_to_Boolean_fromFfi(__result_handle);
    SetOf_MapOf_Int_to_Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  Map<List<int>, bool> methodWithMapGenericKeys(Map<Set<int>, bool> input) {
    final _methodWithMapGenericKeys_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithMapGenericKeys__MapOf_1SetOf_1Int_1to_1Boolean');
    final _input_handle = MapOf_SetOf_Int_to_Boolean_toFfi(input);
    final __result_handle = _methodWithMapGenericKeys_ffi(_handle, _input_handle);
    MapOf_SetOf_Int_to_Boolean_releaseFfiHandle(_input_handle);
    final _result = MapOf_ListOf_Int_to_Boolean_fromFfi(__result_handle);
    MapOf_ListOf_Int_to_Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_GenericTypesWithGenericTypes_toFfi(GenericTypesWithGenericTypes value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
GenericTypesWithGenericTypes smoke_GenericTypesWithGenericTypes_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? GenericTypesWithGenericTypes._(handle) : null;
void smoke_GenericTypesWithGenericTypes_releaseFfiHandle(Pointer<Void> handle) {}

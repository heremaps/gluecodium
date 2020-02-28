import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_GenericTypesWithGenericTypes_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_GenericTypesWithGenericTypes_copy_handle');
final _smoke_GenericTypesWithGenericTypes_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_GenericTypesWithGenericTypes_release_handle');
class GenericTypesWithGenericTypes {
  final Pointer<Void> _handle;
  GenericTypesWithGenericTypes._(this._handle);
  void release() => _smoke_GenericTypesWithGenericTypes_release_handle(_handle);
  List<List<int>> methodWithListOfLists(List<List<int>> input) {
    final _methodWithListOfLists_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithListOfLists__ListOf_1library_1ListOf_1Int');
    final _input_handle = library_ListOf_library_ListOf_Int_toFfi(input);
    final __result_handle = _methodWithListOfLists_ffi(_handle, _input_handle);
    library_ListOf_library_ListOf_Int_releaseFfiHandle(_input_handle);
    final _result = library_ListOf_library_ListOf_Int_fromFfi(__result_handle);
    library_ListOf_library_ListOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  Map<Map<int, bool>, bool> methodWithMapOfMaps(Map<int, Map<int, bool>> input) {
    final _methodWithMapOfMaps_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithMapOfMaps__MapOf_1Int_1to_1library_1MapOf_1Int_1to_1Boolean');
    final _input_handle = library_MapOf_Int_to_library_MapOf_Int_to_Boolean_toFfi(input);
    final __result_handle = _methodWithMapOfMaps_ffi(_handle, _input_handle);
    library_MapOf_Int_to_library_MapOf_Int_to_Boolean_releaseFfiHandle(_input_handle);
    final _result = library_MapOf_library_MapOf_Int_to_Boolean_to_Boolean_fromFfi(__result_handle);
    library_MapOf_library_MapOf_Int_to_Boolean_to_Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  Set<Set<int>> methodWithSetOfSets(Set<Set<int>> input) {
    final _methodWithSetOfSets_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithSetOfSets__SetOf_1library_1SetOf_1Int');
    final _input_handle = library_SetOf_library_SetOf_Int_toFfi(input);
    final __result_handle = _methodWithSetOfSets_ffi(_handle, _input_handle);
    library_SetOf_library_SetOf_Int_releaseFfiHandle(_input_handle);
    final _result = library_SetOf_library_SetOf_Int_fromFfi(__result_handle);
    library_SetOf_library_SetOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  Map<int, List<int>> methodWithListAndMap(List<Map<int, bool>> input) {
    final _methodWithListAndMap_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithListAndMap__ListOf_1library_1MapOf_1Int_1to_1Boolean');
    final _input_handle = library_ListOf_library_MapOf_Int_to_Boolean_toFfi(input);
    final __result_handle = _methodWithListAndMap_ffi(_handle, _input_handle);
    library_ListOf_library_MapOf_Int_to_Boolean_releaseFfiHandle(_input_handle);
    final _result = library_MapOf_Int_to_library_ListOf_Int_fromFfi(__result_handle);
    library_MapOf_Int_to_library_ListOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  Set<List<int>> methodWithListAndSet(List<Set<int>> input) {
    final _methodWithListAndSet_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithListAndSet__ListOf_1library_1SetOf_1Int');
    final _input_handle = library_ListOf_library_SetOf_Int_toFfi(input);
    final __result_handle = _methodWithListAndSet_ffi(_handle, _input_handle);
    library_ListOf_library_SetOf_Int_releaseFfiHandle(_input_handle);
    final _result = library_SetOf_library_ListOf_Int_fromFfi(__result_handle);
    library_SetOf_library_ListOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  Set<Map<int, bool>> methodWithMapAndSet(Map<int, Set<int>> input) {
    final _methodWithMapAndSet_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithMapAndSet__MapOf_1Int_1to_1library_1SetOf_1Int');
    final _input_handle = library_MapOf_Int_to_library_SetOf_Int_toFfi(input);
    final __result_handle = _methodWithMapAndSet_ffi(_handle, _input_handle);
    library_MapOf_Int_to_library_SetOf_Int_releaseFfiHandle(_input_handle);
    final _result = library_SetOf_library_MapOf_Int_to_Boolean_fromFfi(__result_handle);
    library_SetOf_library_MapOf_Int_to_Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  Map<List<int>, bool> methodWithMapGenericKeys(Map<Set<int>, bool> input) {
    final _methodWithMapGenericKeys_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithGenericTypes_methodWithMapGenericKeys__MapOf_1library_1SetOf_1Int_1to_1Boolean');
    final _input_handle = library_MapOf_library_SetOf_Int_to_Boolean_toFfi(input);
    final __result_handle = _methodWithMapGenericKeys_ffi(_handle, _input_handle);
    library_MapOf_library_SetOf_Int_to_Boolean_releaseFfiHandle(_input_handle);
    final _result = library_MapOf_library_ListOf_Int_to_Boolean_fromFfi(__result_handle);
    library_MapOf_library_ListOf_Int_to_Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_GenericTypesWithGenericTypes_toFfi(GenericTypesWithGenericTypes value) =>
  _smoke_GenericTypesWithGenericTypes_copy_handle(value._handle);
GenericTypesWithGenericTypes smoke_GenericTypesWithGenericTypes_fromFfi(Pointer<Void> handle) =>
  GenericTypesWithGenericTypes._(_smoke_GenericTypesWithGenericTypes_copy_handle(handle));
void smoke_GenericTypesWithGenericTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_GenericTypesWithGenericTypes_release_handle(handle);
Pointer<Void> smoke_GenericTypesWithGenericTypes_toFfi_nullable(GenericTypesWithGenericTypes value) =>
  value != null ? smoke_GenericTypesWithGenericTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
GenericTypesWithGenericTypes smoke_GenericTypesWithGenericTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_GenericTypesWithGenericTypes_fromFfi(handle) : null;
void smoke_GenericTypesWithGenericTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithGenericTypes_release_handle(handle);

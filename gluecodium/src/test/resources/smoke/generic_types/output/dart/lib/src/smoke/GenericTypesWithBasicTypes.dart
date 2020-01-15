import 'package:library/src/Boolean__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/String__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_GenericTypesWithBasicTypes_release_handle');
class GenericTypesWithBasicTypes {
  final Pointer<Void> _handle;
  GenericTypesWithBasicTypes._(this._handle);
  void release() => __release_handle(_handle);
  List<int> methodWithList(List<int> input) {
    final _methodWithList_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_methodWithList__ListOf_1Int');
    final _input_handle = ListOf_Int_toFfi(input);
    final __result_handle = _methodWithList_ffi(_handle, _input_handle);
    final _result = ListOf_Int_fromFfi(__result_handle);
    ListOf_Int_releaseFfiHandle(__result_handle);
    ListOf_Int_releaseFfiHandle(_input_handle);
    return _result;
  }
  Map<int, bool> methodWithMap(Map<int, bool> input) {
    final _methodWithMap_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_methodWithMap__MapOf_1Int_1to_1Boolean');
    final _input_handle = MapOf_Int_to_Boolean_toFfi(input);
    final __result_handle = _methodWithMap_ffi(_handle, _input_handle);
    final _result = MapOf_Int_to_Boolean_fromFfi(__result_handle);
    MapOf_Int_to_Boolean_releaseFfiHandle(__result_handle);
    MapOf_Int_to_Boolean_releaseFfiHandle(_input_handle);
    return _result;
  }
  Set<int> methodWithSet(Set<int> input) {
    final _methodWithSet_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_methodWithSet__SetOf_1Int');
    final _input_handle = SetOf_Int_toFfi(input);
    final __result_handle = _methodWithSet_ffi(_handle, _input_handle);
    final _result = SetOf_Int_fromFfi(__result_handle);
    SetOf_Int_releaseFfiHandle(__result_handle);
    SetOf_Int_releaseFfiHandle(_input_handle);
    return _result;
  }
  List<String> methodWithListTypeAlias(List<String> input) {
    final _methodWithListTypeAlias_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_methodWithListTypeAlias__ListOf_1String');
    final _input_handle = ListOf_String_toFfi(input);
    final __result_handle = _methodWithListTypeAlias_ffi(_handle, _input_handle);
    final _result = ListOf_String_fromFfi(__result_handle);
    ListOf_String_releaseFfiHandle(__result_handle);
    ListOf_String_releaseFfiHandle(_input_handle);
    return _result;
  }
  Map<String, String> methodWithMapTypeAlias(Map<String, String> input) {
    final _methodWithMapTypeAlias_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_methodWithMapTypeAlias__MapOf_1String_1to_1String');
    final _input_handle = MapOf_String_to_String_toFfi(input);
    final __result_handle = _methodWithMapTypeAlias_ffi(_handle, _input_handle);
    final _result = MapOf_String_to_String_fromFfi(__result_handle);
    MapOf_String_to_String_releaseFfiHandle(__result_handle);
    MapOf_String_to_String_releaseFfiHandle(_input_handle);
    return _result;
  }
  Set<String> methodWithSetTypeAlias(Set<String> input) {
    final _methodWithSetTypeAlias_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_methodWithSetTypeAlias__SetOf_1String');
    final _input_handle = SetOf_String_toFfi(input);
    final __result_handle = _methodWithSetTypeAlias_ffi(_handle, _input_handle);
    final _result = SetOf_String_fromFfi(__result_handle);
    SetOf_String_releaseFfiHandle(__result_handle);
    SetOf_String_releaseFfiHandle(_input_handle);
    return _result;
  }
}
Pointer<Void> smoke_GenericTypesWithBasicTypes_toFfi(GenericTypesWithBasicTypes value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
GenericTypesWithBasicTypes smoke_GenericTypesWithBasicTypes_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? GenericTypesWithBasicTypes._(handle) : null;
void smoke_GenericTypesWithBasicTypes_releaseFfiHandle(Pointer<Void> handle) {}
class GenericTypesWithBasicTypes_StructWithGenerics {
  List<int> numbersList;
  Map<int, String> numbersMap;
  Set<int> numbersSet;
  GenericTypesWithBasicTypes_StructWithGenerics(this.numbersList, this.numbersMap, this.numbersSet);
}

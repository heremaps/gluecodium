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
    ListOf_Int_releaseFfiHandle(_input_handle);
    final _result = ListOf_Int_fromFfi(__result_handle);
    ListOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  Map<int, bool> methodWithMap(Map<int, bool> input) {
    final _methodWithMap_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_methodWithMap__MapOf_1Int_1to_1Boolean');
    final _input_handle = MapOf_Int_to_Boolean_toFfi(input);
    final __result_handle = _methodWithMap_ffi(_handle, _input_handle);
    MapOf_Int_to_Boolean_releaseFfiHandle(_input_handle);
    final _result = MapOf_Int_to_Boolean_fromFfi(__result_handle);
    MapOf_Int_to_Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  Set<int> methodWithSet(Set<int> input) {
    final _methodWithSet_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_methodWithSet__SetOf_1Int');
    final _input_handle = SetOf_Int_toFfi(input);
    final __result_handle = _methodWithSet_ffi(_handle, _input_handle);
    SetOf_Int_releaseFfiHandle(_input_handle);
    final _result = SetOf_Int_fromFfi(__result_handle);
    SetOf_Int_releaseFfiHandle(__result_handle);
    return _result;
  }
  List<String> methodWithListTypeAlias(List<String> input) {
    final _methodWithListTypeAlias_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_methodWithListTypeAlias__ListOf_1String');
    final _input_handle = ListOf_String_toFfi(input);
    final __result_handle = _methodWithListTypeAlias_ffi(_handle, _input_handle);
    ListOf_String_releaseFfiHandle(_input_handle);
    final _result = ListOf_String_fromFfi(__result_handle);
    ListOf_String_releaseFfiHandle(__result_handle);
    return _result;
  }
  Map<String, String> methodWithMapTypeAlias(Map<String, String> input) {
    final _methodWithMapTypeAlias_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_methodWithMapTypeAlias__MapOf_1String_1to_1String');
    final _input_handle = MapOf_String_to_String_toFfi(input);
    final __result_handle = _methodWithMapTypeAlias_ffi(_handle, _input_handle);
    MapOf_String_to_String_releaseFfiHandle(_input_handle);
    final _result = MapOf_String_to_String_fromFfi(__result_handle);
    MapOf_String_to_String_releaseFfiHandle(__result_handle);
    return _result;
  }
  Set<String> methodWithSetTypeAlias(Set<String> input) {
    final _methodWithSetTypeAlias_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_methodWithSetTypeAlias__SetOf_1String');
    final _input_handle = SetOf_String_toFfi(input);
    final __result_handle = _methodWithSetTypeAlias_ffi(_handle, _input_handle);
    SetOf_String_releaseFfiHandle(_input_handle);
    final _result = SetOf_String_fromFfi(__result_handle);
    SetOf_String_releaseFfiHandle(__result_handle);
    return _result;
  }
  List<double> get listProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_listProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = ListOf_Float_fromFfi(__result_handle);
    ListOf_Float_releaseFfiHandle(__result_handle);
    return _result;
  }
  set listProperty(List<double> value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_listProperty_set__ListOf_1Float');
    final _value_handle = ListOf_Float_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    ListOf_Float_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  Map<double, double> get mapProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_mapProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = MapOf_Float_to_Double_fromFfi(__result_handle);
    MapOf_Float_to_Double_releaseFfiHandle(__result_handle);
    return _result;
  }
  set mapProperty(Map<double, double> value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_mapProperty_set__MapOf_1Float_1to_1Double');
    final _value_handle = MapOf_Float_to_Double_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    MapOf_Float_to_Double_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  Set<double> get setProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_setProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = SetOf_Float_fromFfi(__result_handle);
    SetOf_Float_releaseFfiHandle(__result_handle);
    return _result;
  }
  set setProperty(Set<double> value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithBasicTypes_setProperty_set__SetOf_1Float');
    final _value_handle = SetOf_Float_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    SetOf_Float_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
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
// GenericTypesWithBasicTypes_StructWithGenerics "private" section, not exported.
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle');
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle');
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersList = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersList');
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersMap = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersMap');
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersSet = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersSet');
Pointer<Void> smoke_GenericTypesWithBasicTypes_StructWithGenerics_toFfi(GenericTypesWithBasicTypes_StructWithGenerics value) {
  final _numbersList_handle = ListOf_UByte_toFfi(value.numbersList);
  final _numbersMap_handle = MapOf_UByte_to_String_toFfi(value.numbersMap);
  final _numbersSet_handle = SetOf_UByte_toFfi(value.numbersSet);
  final _result = _smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle(_numbersList_handle, _numbersMap_handle, _numbersSet_handle);
  ListOf_UByte_releaseFfiHandle(_numbersList_handle);
  MapOf_UByte_to_String_releaseFfiHandle(_numbersMap_handle);
  SetOf_UByte_releaseFfiHandle(_numbersSet_handle);
  return _result;
}
GenericTypesWithBasicTypes_StructWithGenerics smoke_GenericTypesWithBasicTypes_StructWithGenerics_fromFfi(Pointer<Void> handle) {
  final _numbersList_handle = _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersList(handle);
  final _numbersMap_handle = _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersMap(handle);
  final _numbersSet_handle = _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersSet(handle);
  final _result = GenericTypesWithBasicTypes_StructWithGenerics(
    ListOf_UByte_fromFfi(_numbersList_handle),
    MapOf_UByte_to_String_fromFfi(_numbersMap_handle),
    SetOf_UByte_fromFfi(_numbersSet_handle)
  );
  ListOf_UByte_releaseFfiHandle(_numbersList_handle);
  MapOf_UByte_to_String_releaseFfiHandle(_numbersMap_handle);
  SetOf_UByte_releaseFfiHandle(_numbersSet_handle);
  return _result;
}
void smoke_GenericTypesWithBasicTypes_StructWithGenerics_releaseFfiHandle(Pointer<Void> handle) => _smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle(handle);
// End of GenericTypesWithBasicTypes_StructWithGenerics "private" section.

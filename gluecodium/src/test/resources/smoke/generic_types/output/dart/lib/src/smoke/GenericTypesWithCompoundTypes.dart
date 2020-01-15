import 'package:library/src/Boolean__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/String__conversion.dart';
import 'package:library/src/smoke/DummyClass.dart';
import 'package:library/src/smoke/DummyInterface.dart';
import 'package:library/src/smoke/GenericTypesWithCompoundTypes_BasicStruct__conversion.dart';
import 'package:library/src/smoke/GenericTypesWithCompoundTypes_ExternalEnum__conversion.dart';
import 'package:library/src/smoke/GenericTypesWithCompoundTypes_ExternalStruct__conversion.dart';
import 'package:library/src/smoke/GenericTypesWithCompoundTypes_SomeEnum__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_GenericTypesWithCompoundTypes_release_handle');
class GenericTypesWithCompoundTypes {
  final Pointer<Void> _handle;
  GenericTypesWithCompoundTypes._(this._handle);
  void release() => __release_handle(_handle);
  List<GenericTypesWithCompoundTypes_ExternalStruct> methodWithStructList(List<GenericTypesWithCompoundTypes_BasicStruct> input) {
    final _methodWithStructList_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithStructList__ListOf_1smoke_1GenericTypesWithCompoundTypes_1BasicStruct');
    final _input_handle = ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(input);
    final __result_handle = _methodWithStructList_ffi(_handle, _input_handle);
    final _result = ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(__result_handle);
    ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(__result_handle);
    ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_input_handle);
    return _result;
  }
  Map<String, GenericTypesWithCompoundTypes_ExternalStruct> methodWithStructMap(Map<String, GenericTypesWithCompoundTypes_BasicStruct> input) {
    final _methodWithStructMap_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithStructMap__MapOf_1String_1to_1smoke_1GenericTypesWithCompoundTypes_1BasicStruct');
    final _input_handle = MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(input);
    final __result_handle = _methodWithStructMap_ffi(_handle, _input_handle);
    final _result = MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(__result_handle);
    MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(__result_handle);
    MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_input_handle);
    return _result;
  }
  List<GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumList(List<GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumList_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithEnumList__ListOf_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum');
    final _input_handle = ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(input);
    final __result_handle = _methodWithEnumList_ffi(_handle, _input_handle);
    final _result = ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(__result_handle);
    ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(__result_handle);
    ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_input_handle);
    return _result;
  }
  Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> methodWithEnumMapKey(Map<GenericTypesWithCompoundTypes_SomeEnum, bool> input) {
    final _methodWithEnumMapKey_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithEnumMapKey__MapOf_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum_1to_1Boolean');
    final _input_handle = MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_toFfi(input);
    final __result_handle = _methodWithEnumMapKey_ffi(_handle, _input_handle);
    final _result = MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_fromFfi(__result_handle);
    MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_releaseFfiHandle(__result_handle);
    MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_releaseFfiHandle(_input_handle);
    return _result;
  }
  Map<int, GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumMapValue(Map<int, GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumMapValue_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithEnumMapValue__MapOf_1Int_1to_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum');
    final _input_handle = MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(input);
    final __result_handle = _methodWithEnumMapValue_ffi(_handle, _input_handle);
    final _result = MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(__result_handle);
    MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(__result_handle);
    MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_input_handle);
    return _result;
  }
  Set<GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumSet(Set<GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumSet_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithEnumSet__SetOf_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum');
    final _input_handle = SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(input);
    final __result_handle = _methodWithEnumSet_ffi(_handle, _input_handle);
    final _result = SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(__result_handle);
    SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(__result_handle);
    SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_input_handle);
    return _result;
  }
  List<DummyInterface> methodWithInstancesList(List<DummyClass> input) {
    final _methodWithInstancesList_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithInstancesList__ListOf_1smoke_1DummyClass');
    final _input_handle = ListOf_smoke_DummyClass_toFfi(input);
    final __result_handle = _methodWithInstancesList_ffi(_handle, _input_handle);
    final _result = ListOf_smoke_DummyInterface_fromFfi(__result_handle);
    ListOf_smoke_DummyInterface_releaseFfiHandle(__result_handle);
    ListOf_smoke_DummyClass_releaseFfiHandle(_input_handle);
    return _result;
  }
  Map<int, DummyInterface> methodWithInstancesMap(Map<int, DummyClass> input) {
    final _methodWithInstancesMap_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithInstancesMap__MapOf_1Int_1to_1smoke_1DummyClass');
    final _input_handle = MapOf_Int_to_smoke_DummyClass_toFfi(input);
    final __result_handle = _methodWithInstancesMap_ffi(_handle, _input_handle);
    final _result = MapOf_Int_to_smoke_DummyInterface_fromFfi(__result_handle);
    MapOf_Int_to_smoke_DummyInterface_releaseFfiHandle(__result_handle);
    MapOf_Int_to_smoke_DummyClass_releaseFfiHandle(_input_handle);
    return _result;
  }
}
Pointer<Void> smoke_GenericTypesWithCompoundTypes_toFfi(GenericTypesWithCompoundTypes value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
GenericTypesWithCompoundTypes smoke_GenericTypesWithCompoundTypes_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? GenericTypesWithCompoundTypes._(handle) : null;
void smoke_GenericTypesWithCompoundTypes_releaseFfiHandle(Pointer<Void> handle) {}
enum GenericTypesWithCompoundTypes_SomeEnum {
    foo,
    bar
}
enum GenericTypesWithCompoundTypes_ExternalEnum {
    on,
    off
}
class GenericTypesWithCompoundTypes_BasicStruct {
  double value;
  GenericTypesWithCompoundTypes_BasicStruct(this.value);
}
class GenericTypesWithCompoundTypes_ExternalStruct {
  String string;
  GenericTypesWithCompoundTypes_ExternalStruct(this.string);
}

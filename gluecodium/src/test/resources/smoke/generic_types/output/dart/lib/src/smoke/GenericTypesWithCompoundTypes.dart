import 'package:library/src/Boolean__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/String__conversion.dart';
import 'package:library/src/smoke/DummyClass.dart';
import 'package:library/src/smoke/DummyInterface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_GenericTypesWithCompoundTypes_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_GenericTypesWithCompoundTypes_release_handle');
class GenericTypesWithCompoundTypes {
  final Pointer<Void> _handle;
  GenericTypesWithCompoundTypes._(this._handle);
  void release() => _smoke_GenericTypesWithCompoundTypes_release_handle(_handle);
  List<GenericTypesWithCompoundTypes_ExternalStruct> methodWithStructList(List<GenericTypesWithCompoundTypes_BasicStruct> input) {
    final _methodWithStructList_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithStructList__ListOf_1smoke_1GenericTypesWithCompoundTypes_1BasicStruct');
    final _input_handle = ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(input);
    final __result_handle = _methodWithStructList_ffi(_handle, _input_handle);
    ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_input_handle);
    final _result = ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(__result_handle);
    ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  Map<String, GenericTypesWithCompoundTypes_ExternalStruct> methodWithStructMap(Map<String, GenericTypesWithCompoundTypes_BasicStruct> input) {
    final _methodWithStructMap_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithStructMap__MapOf_1String_1to_1smoke_1GenericTypesWithCompoundTypes_1BasicStruct');
    final _input_handle = MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(input);
    final __result_handle = _methodWithStructMap_ffi(_handle, _input_handle);
    MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_input_handle);
    final _result = MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(__result_handle);
    MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  List<GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumList(List<GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumList_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithEnumList__ListOf_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum');
    final _input_handle = ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(input);
    final __result_handle = _methodWithEnumList_ffi(_handle, _input_handle);
    ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_input_handle);
    final _result = ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(__result_handle);
    ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(__result_handle);
    return _result;
  }
  Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> methodWithEnumMapKey(Map<GenericTypesWithCompoundTypes_SomeEnum, bool> input) {
    final _methodWithEnumMapKey_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithEnumMapKey__MapOf_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum_1to_1Boolean');
    final _input_handle = MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_toFfi(input);
    final __result_handle = _methodWithEnumMapKey_ffi(_handle, _input_handle);
    MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_releaseFfiHandle(_input_handle);
    final _result = MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_fromFfi(__result_handle);
    MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  Map<int, GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumMapValue(Map<int, GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumMapValue_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithEnumMapValue__MapOf_1Int_1to_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum');
    final _input_handle = MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(input);
    final __result_handle = _methodWithEnumMapValue_ffi(_handle, _input_handle);
    MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_input_handle);
    final _result = MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(__result_handle);
    MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(__result_handle);
    return _result;
  }
  Set<GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumSet(Set<GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumSet_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithEnumSet__SetOf_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum');
    final _input_handle = SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(input);
    final __result_handle = _methodWithEnumSet_ffi(_handle, _input_handle);
    SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_input_handle);
    final _result = SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(__result_handle);
    SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(__result_handle);
    return _result;
  }
  List<DummyInterface> methodWithInstancesList(List<DummyClass> input) {
    final _methodWithInstancesList_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithInstancesList__ListOf_1smoke_1DummyClass');
    final _input_handle = ListOf_smoke_DummyClass_toFfi(input);
    final __result_handle = _methodWithInstancesList_ffi(_handle, _input_handle);
    ListOf_smoke_DummyClass_releaseFfiHandle(_input_handle);
    final _result = ListOf_smoke_DummyInterface_fromFfi(__result_handle);
    ListOf_smoke_DummyInterface_releaseFfiHandle(__result_handle);
    return _result;
  }
  Map<int, DummyInterface> methodWithInstancesMap(Map<int, DummyClass> input) {
    final _methodWithInstancesMap_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_GenericTypesWithCompoundTypes_methodWithInstancesMap__MapOf_1Int_1to_1smoke_1DummyClass');
    final _input_handle = MapOf_Int_to_smoke_DummyClass_toFfi(input);
    final __result_handle = _methodWithInstancesMap_ffi(_handle, _input_handle);
    MapOf_Int_to_smoke_DummyClass_releaseFfiHandle(_input_handle);
    final _result = MapOf_Int_to_smoke_DummyInterface_fromFfi(__result_handle);
    MapOf_Int_to_smoke_DummyInterface_releaseFfiHandle(__result_handle);
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
// GenericTypesWithCompoundTypes_SomeEnum "private" section, not exported.
int smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(GenericTypesWithCompoundTypes_SomeEnum value) {
  switch (value) {
  case GenericTypesWithCompoundTypes_SomeEnum.foo:
    return 0;
  break;
  case GenericTypesWithCompoundTypes_SomeEnum.bar:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for GenericTypesWithCompoundTypes_SomeEnum enum.");
  }
}
GenericTypesWithCompoundTypes_SomeEnum smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return GenericTypesWithCompoundTypes_SomeEnum.foo;
  break;
  case 1:
    return GenericTypesWithCompoundTypes_SomeEnum.bar;
  break;
  default:
    throw StateError("Invalid numeric value $handle for GenericTypesWithCompoundTypes_SomeEnum enum.");
  }
}
void smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(int handle) {}
// End of GenericTypesWithCompoundTypes_SomeEnum "private" section.
enum GenericTypesWithCompoundTypes_ExternalEnum {
    on,
    off
}
// GenericTypesWithCompoundTypes_ExternalEnum "private" section, not exported.
int smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(GenericTypesWithCompoundTypes_ExternalEnum value) {
  switch (value) {
  case GenericTypesWithCompoundTypes_ExternalEnum.on:
    return 0;
  break;
  case GenericTypesWithCompoundTypes_ExternalEnum.off:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for GenericTypesWithCompoundTypes_ExternalEnum enum.");
  }
}
GenericTypesWithCompoundTypes_ExternalEnum smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return GenericTypesWithCompoundTypes_ExternalEnum.on;
  break;
  case 1:
    return GenericTypesWithCompoundTypes_ExternalEnum.off;
  break;
  default:
    throw StateError("Invalid numeric value $handle for GenericTypesWithCompoundTypes_ExternalEnum enum.");
  }
}
void smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(int handle) {}
// End of GenericTypesWithCompoundTypes_ExternalEnum "private" section.
class GenericTypesWithCompoundTypes_BasicStruct {
  double value;
  GenericTypesWithCompoundTypes_BasicStruct(this.value);
}
// GenericTypesWithCompoundTypes_BasicStruct "private" section, not exported.
final _smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle');
final _smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle');
final _smoke_GenericTypesWithCompoundTypes_BasicStruct_get_field_value = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_GenericTypesWithCompoundTypes_BasicStruct_get_field_value');
Pointer<Void> smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(GenericTypesWithCompoundTypes_BasicStruct value) {
  final _value_handle = (value.value);
  final _result = _smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle(_value_handle);
  (_value_handle);
  return _result;
}
GenericTypesWithCompoundTypes_BasicStruct smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(Pointer<Void> handle) {
  final _value_handle = _smoke_GenericTypesWithCompoundTypes_BasicStruct_get_field_value(handle);
  final _result = GenericTypesWithCompoundTypes_BasicStruct(
    (_value_handle)
  );
  (_value_handle);
  return _result;
}
void smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle(handle);
// End of GenericTypesWithCompoundTypes_BasicStruct "private" section.
class GenericTypesWithCompoundTypes_ExternalStruct {
  String string;
  GenericTypesWithCompoundTypes_ExternalStruct(this.string);
}
// GenericTypesWithCompoundTypes_ExternalStruct "private" section, not exported.
final _smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle');
final _smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle');
final _smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_field_string = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_field_string');
Pointer<Void> smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(GenericTypesWithCompoundTypes_ExternalStruct value) {
  final _string_handle = String_toFfi(value.string);
  final _result = _smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle(_string_handle);
  String_releaseFfiHandle(_string_handle);
  return _result;
}
GenericTypesWithCompoundTypes_ExternalStruct smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(Pointer<Void> handle) {
  final _string_handle = _smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_field_string(handle);
  final _result = GenericTypesWithCompoundTypes_ExternalStruct(
    String_fromFfi(_string_handle)
  );
  String_releaseFfiHandle(_string_handle);
  return _result;
}
void smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle(handle);
// End of GenericTypesWithCompoundTypes_ExternalStruct "private" section.

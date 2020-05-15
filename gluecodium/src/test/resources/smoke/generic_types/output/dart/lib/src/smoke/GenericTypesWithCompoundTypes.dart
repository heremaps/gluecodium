import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/smoke/DummyClass.dart';
import 'package:library/src/smoke/DummyInterface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class GenericTypesWithCompoundTypes {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  List<GenericTypesWithCompoundTypes_ExternalStruct> methodWithStructList(List<GenericTypesWithCompoundTypes_BasicStruct> input);
  Map<String, GenericTypesWithCompoundTypes_ExternalStruct> methodWithStructMap(Map<String, GenericTypesWithCompoundTypes_BasicStruct> input);
  List<GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumList(List<GenericTypesWithCompoundTypes_SomeEnum> input);
  Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> methodWithEnumMapKey(Map<GenericTypesWithCompoundTypes_SomeEnum, bool> input);
  Map<int, GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumMapValue(Map<int, GenericTypesWithCompoundTypes_SomeEnum> input);
  Set<GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumSet(Set<GenericTypesWithCompoundTypes_SomeEnum> input);
  List<DummyInterface> methodWithInstancesList(List<DummyClass> input);
  Map<int, DummyInterface> methodWithInstancesMap(Map<int, DummyClass> input);
}
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
final _smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable');
final _smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable');
final _smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable');
Pointer<Void> smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi_nullable(GenericTypesWithCompoundTypes_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(value);
  final result = _smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable(_handle);
  smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
GenericTypesWithCompoundTypes_SomeEnum smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable(handle);
  final result = smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_handle);
  smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable(handle);
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
final _smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable');
final _smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable');
final _smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable');
Pointer<Void> smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi_nullable(GenericTypesWithCompoundTypes_ExternalEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(value);
  final result = _smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable(_handle);
  smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
GenericTypesWithCompoundTypes_ExternalEnum smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable(handle);
  final result = smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_handle);
  smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable(handle);
// End of GenericTypesWithCompoundTypes_ExternalEnum "private" section.
class GenericTypesWithCompoundTypes_BasicStruct {
  double value;
  GenericTypesWithCompoundTypes_BasicStruct(this.value);
}
// GenericTypesWithCompoundTypes_BasicStruct "private" section, not exported.
final _smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle');
final _smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle');
final _smoke_GenericTypesWithCompoundTypes_BasicStruct_get_field_value = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_field_value');
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
// Nullable GenericTypesWithCompoundTypes_BasicStruct
final _smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable');
final _smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable');
final _smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable');
Pointer<Void> smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi_nullable(GenericTypesWithCompoundTypes_BasicStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(value);
  final result = _smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable(_handle);
  smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
GenericTypesWithCompoundTypes_BasicStruct smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable(handle);
  final result = smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(_handle);
  smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable(handle);
// End of GenericTypesWithCompoundTypes_BasicStruct "private" section.
class GenericTypesWithCompoundTypes_ExternalStruct {
  String string;
  GenericTypesWithCompoundTypes_ExternalStruct(this.string);
}
// GenericTypesWithCompoundTypes_ExternalStruct "private" section, not exported.
final _smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle');
final _smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle');
final _smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_field_string = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_field_string');
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
// Nullable GenericTypesWithCompoundTypes_ExternalStruct
final _smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable');
final _smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable');
final _smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable');
Pointer<Void> smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi_nullable(GenericTypesWithCompoundTypes_ExternalStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(value);
  final result = _smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable(_handle);
  smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
GenericTypesWithCompoundTypes_ExternalStruct smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable(handle);
  final result = smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(_handle);
  smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable(handle);
// End of GenericTypesWithCompoundTypes_ExternalStruct "private" section.
// GenericTypesWithCompoundTypes "private" section, not exported.
final _smoke_GenericTypesWithCompoundTypes_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_copy_handle');
final _smoke_GenericTypesWithCompoundTypes_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_release_handle');
final _smoke_GenericTypesWithCompoundTypes_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_GenericTypesWithCompoundTypes_get_raw_pointer');
class GenericTypesWithCompoundTypes$Impl implements GenericTypesWithCompoundTypes {
  @protected
  Pointer<Void> handle;
  GenericTypesWithCompoundTypes$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_GenericTypesWithCompoundTypes_get_raw_pointer(handle));
    _smoke_GenericTypesWithCompoundTypes_release_handle(handle);
    handle = null;
  }
  @override
  List<GenericTypesWithCompoundTypes_ExternalStruct> methodWithStructList(List<GenericTypesWithCompoundTypes_BasicStruct> input) {
    final _methodWithStructList_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithStructList__ListOf_1smoke_1GenericTypesWithCompoundTypes_1BasicStruct');
    final _input_handle = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithStructList_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_input_handle);
    final _result = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(__result_handle);
    foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  Map<String, GenericTypesWithCompoundTypes_ExternalStruct> methodWithStructMap(Map<String, GenericTypesWithCompoundTypes_BasicStruct> input) {
    final _methodWithStructMap_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithStructMap__MapOf_1String_1to_1smoke_1GenericTypesWithCompoundTypes_1BasicStruct');
    final _input_handle = foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithStructMap_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_input_handle);
    final _result = foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(__result_handle);
    foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  List<GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumList(List<GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumList_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithEnumList__ListOf_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum');
    final _input_handle = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithEnumList_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_input_handle);
    final _result = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(__result_handle);
    foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> methodWithEnumMapKey(Map<GenericTypesWithCompoundTypes_SomeEnum, bool> input) {
    final _methodWithEnumMapKey_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithEnumMapKey__MapOf_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum_1to_1Boolean');
    final _input_handle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithEnumMapKey_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_releaseFfiHandle(_input_handle);
    final _result = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_fromFfi(__result_handle);
    foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  Map<int, GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumMapValue(Map<int, GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumMapValue_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithEnumMapValue__MapOf_1Int_1to_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum');
    final _input_handle = foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithEnumMapValue_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_input_handle);
    final _result = foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(__result_handle);
    foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  Set<GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumSet(Set<GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumSet_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithEnumSet__SetOf_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum');
    final _input_handle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithEnumSet_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_input_handle);
    final _result = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(__result_handle);
    foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  List<DummyInterface> methodWithInstancesList(List<DummyClass> input) {
    final _methodWithInstancesList_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithInstancesList__ListOf_1smoke_1DummyClass');
    final _input_handle = foobar_ListOf_smoke_DummyClass_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithInstancesList_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_ListOf_smoke_DummyClass_releaseFfiHandle(_input_handle);
    final _result = foobar_ListOf_smoke_DummyInterface_fromFfi(__result_handle);
    foobar_ListOf_smoke_DummyInterface_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  Map<int, DummyInterface> methodWithInstancesMap(Map<int, DummyClass> input) {
    final _methodWithInstancesMap_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithInstancesMap__MapOf_1Int_1to_1smoke_1DummyClass');
    final _input_handle = foobar_MapOf_Int_to_smoke_DummyClass_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithInstancesMap_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_MapOf_Int_to_smoke_DummyClass_releaseFfiHandle(_input_handle);
    final _result = foobar_MapOf_Int_to_smoke_DummyInterface_fromFfi(__result_handle);
    foobar_MapOf_Int_to_smoke_DummyInterface_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_GenericTypesWithCompoundTypes_toFfi(GenericTypesWithCompoundTypes value) =>
  _smoke_GenericTypesWithCompoundTypes_copy_handle((value as GenericTypesWithCompoundTypes$Impl).handle);
GenericTypesWithCompoundTypes smoke_GenericTypesWithCompoundTypes_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_GenericTypesWithCompoundTypes_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as GenericTypesWithCompoundTypes;
  if (instance != null) return instance;
  final _copied_handle = _smoke_GenericTypesWithCompoundTypes_copy_handle(handle);
  final result = GenericTypesWithCompoundTypes$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_GenericTypesWithCompoundTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_GenericTypesWithCompoundTypes_release_handle(handle);
Pointer<Void> smoke_GenericTypesWithCompoundTypes_toFfi_nullable(GenericTypesWithCompoundTypes value) =>
  value != null ? smoke_GenericTypesWithCompoundTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
GenericTypesWithCompoundTypes smoke_GenericTypesWithCompoundTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_GenericTypesWithCompoundTypes_fromFfi(handle) : null;
void smoke_GenericTypesWithCompoundTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithCompoundTypes_release_handle(handle);
// End of GenericTypesWithCompoundTypes "private" section.

import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class GenericTypesWithBasicTypes {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  List<int> methodWithList(List<int> input);
  Map<int, bool> methodWithMap(Map<int, bool> input);
  Set<int> methodWithSet(Set<int> input);
  List<String> methodWithListTypeAlias(List<String> input);
  Map<String, String> methodWithMapTypeAlias(Map<String, String> input);
  Set<String> methodWithSetTypeAlias(Set<String> input);
  List<double> get listProperty;
  set listProperty(List<double> value);
  Map<double, double> get mapProperty;
  set mapProperty(Map<double, double> value);
  Set<double> get setProperty;
  set setProperty(Set<double> value);
}
class GenericTypesWithBasicTypes_StructWithGenerics {
  List<int> numbersList;
  Map<int, String> numbersMap;
  Set<int> numbersSet;
  GenericTypesWithBasicTypes_StructWithGenerics(this.numbersList, this.numbersMap, this.numbersSet);
}
// GenericTypesWithBasicTypes_StructWithGenerics "private" section, not exported.
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle'));
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle'));
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersList = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersList'));
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersMap = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersMap'));
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersSet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersSet'));
Pointer<Void> smoke_GenericTypesWithBasicTypes_StructWithGenerics_toFfi(GenericTypesWithBasicTypes_StructWithGenerics value) {
  final _numbersList_handle = foobar_ListOf_UByte_toFfi(value.numbersList);
  final _numbersMap_handle = foobar_MapOf_UByte_to_String_toFfi(value.numbersMap);
  final _numbersSet_handle = foobar_SetOf_UByte_toFfi(value.numbersSet);
  final _result = _smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle(_numbersList_handle, _numbersMap_handle, _numbersSet_handle);
  foobar_ListOf_UByte_releaseFfiHandle(_numbersList_handle);
  foobar_MapOf_UByte_to_String_releaseFfiHandle(_numbersMap_handle);
  foobar_SetOf_UByte_releaseFfiHandle(_numbersSet_handle);
  return _result;
}
GenericTypesWithBasicTypes_StructWithGenerics smoke_GenericTypesWithBasicTypes_StructWithGenerics_fromFfi(Pointer<Void> handle) {
  final _numbersList_handle = _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersList(handle);
  final _numbersMap_handle = _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersMap(handle);
  final _numbersSet_handle = _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersSet(handle);
  try {
    return GenericTypesWithBasicTypes_StructWithGenerics(
      foobar_ListOf_UByte_fromFfi(_numbersList_handle),
      foobar_MapOf_UByte_to_String_fromFfi(_numbersMap_handle),
      foobar_SetOf_UByte_fromFfi(_numbersSet_handle)
    );
  } finally {
    foobar_ListOf_UByte_releaseFfiHandle(_numbersList_handle);
    foobar_MapOf_UByte_to_String_releaseFfiHandle(_numbersMap_handle);
    foobar_SetOf_UByte_releaseFfiHandle(_numbersSet_handle);
  }
}
void smoke_GenericTypesWithBasicTypes_StructWithGenerics_releaseFfiHandle(Pointer<Void> handle) => _smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle(handle);
// Nullable GenericTypesWithBasicTypes_StructWithGenerics
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle_nullable'));
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle_nullable'));
final _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_value_nullable'));
Pointer<Void> smoke_GenericTypesWithBasicTypes_StructWithGenerics_toFfi_nullable(GenericTypesWithBasicTypes_StructWithGenerics? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_GenericTypesWithBasicTypes_StructWithGenerics_toFfi(value);
  final result = _smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle_nullable(_handle);
  smoke_GenericTypesWithBasicTypes_StructWithGenerics_releaseFfiHandle(_handle);
  return result;
}
GenericTypesWithBasicTypes_StructWithGenerics? smoke_GenericTypesWithBasicTypes_StructWithGenerics_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_value_nullable(handle);
  final result = smoke_GenericTypesWithBasicTypes_StructWithGenerics_fromFfi(_handle);
  smoke_GenericTypesWithBasicTypes_StructWithGenerics_releaseFfiHandle(_handle);
  return result;
}
void smoke_GenericTypesWithBasicTypes_StructWithGenerics_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle_nullable(handle);
// End of GenericTypesWithBasicTypes_StructWithGenerics "private" section.
// GenericTypesWithBasicTypes "private" section, not exported.
final _smoke_GenericTypesWithBasicTypes_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_copy_handle'));
final _smoke_GenericTypesWithBasicTypes_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_release_handle'));
class GenericTypesWithBasicTypes$Impl extends __lib.NativeBase implements GenericTypesWithBasicTypes {
  GenericTypesWithBasicTypes$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_GenericTypesWithBasicTypes_release_handle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  List<int> methodWithList(List<int> input) {
    final _methodWithList_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithList__ListOf_1Int'));
    final _input_handle = foobar_ListOf_Int_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithList_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_ListOf_Int_releaseFfiHandle(_input_handle);
    try {
      return foobar_ListOf_Int_fromFfi(__result_handle);
    } finally {
      foobar_ListOf_Int_releaseFfiHandle(__result_handle);
    }
  }
  @override
  Map<int, bool> methodWithMap(Map<int, bool> input) {
    final _methodWithMap_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithMap__MapOf_1Int_1to_1Boolean'));
    final _input_handle = foobar_MapOf_Int_to_Boolean_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithMap_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_input_handle);
    try {
      return foobar_MapOf_Int_to_Boolean_fromFfi(__result_handle);
    } finally {
      foobar_MapOf_Int_to_Boolean_releaseFfiHandle(__result_handle);
    }
  }
  @override
  Set<int> methodWithSet(Set<int> input) {
    final _methodWithSet_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithSet__SetOf_1Int'));
    final _input_handle = foobar_SetOf_Int_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithSet_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_SetOf_Int_releaseFfiHandle(_input_handle);
    try {
      return foobar_SetOf_Int_fromFfi(__result_handle);
    } finally {
      foobar_SetOf_Int_releaseFfiHandle(__result_handle);
    }
  }
  @override
  List<String> methodWithListTypeAlias(List<String> input) {
    final _methodWithListTypeAlias_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithListTypeAlias__ListOf_1String'));
    final _input_handle = foobar_ListOf_String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithListTypeAlias_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_ListOf_String_releaseFfiHandle(_input_handle);
    try {
      return foobar_ListOf_String_fromFfi(__result_handle);
    } finally {
      foobar_ListOf_String_releaseFfiHandle(__result_handle);
    }
  }
  @override
  Map<String, String> methodWithMapTypeAlias(Map<String, String> input) {
    final _methodWithMapTypeAlias_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithMapTypeAlias__MapOf_1String_1to_1String'));
    final _input_handle = foobar_MapOf_String_to_String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithMapTypeAlias_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_MapOf_String_to_String_releaseFfiHandle(_input_handle);
    try {
      return foobar_MapOf_String_to_String_fromFfi(__result_handle);
    } finally {
      foobar_MapOf_String_to_String_releaseFfiHandle(__result_handle);
    }
  }
  @override
  Set<String> methodWithSetTypeAlias(Set<String> input) {
    final _methodWithSetTypeAlias_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithSetTypeAlias__SetOf_1String'));
    final _input_handle = foobar_SetOf_String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _methodWithSetTypeAlias_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    foobar_SetOf_String_releaseFfiHandle(_input_handle);
    try {
      return foobar_SetOf_String_fromFfi(__result_handle);
    } finally {
      foobar_SetOf_String_releaseFfiHandle(__result_handle);
    }
  }
  @override
  List<double> get listProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_GenericTypesWithBasicTypes_listProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_ListOf_Float_fromFfi(__result_handle);
    } finally {
      foobar_ListOf_Float_releaseFfiHandle(__result_handle);
    }
  }
  @override
  set listProperty(List<double> value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_listProperty_set__ListOf_1Float'));
    final _value_handle = foobar_ListOf_Float_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    foobar_ListOf_Float_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  Map<double, double> get mapProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_GenericTypesWithBasicTypes_mapProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_MapOf_Float_to_Double_fromFfi(__result_handle);
    } finally {
      foobar_MapOf_Float_to_Double_releaseFfiHandle(__result_handle);
    }
  }
  @override
  set mapProperty(Map<double, double> value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_mapProperty_set__MapOf_1Float_1to_1Double'));
    final _value_handle = foobar_MapOf_Float_to_Double_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    foobar_MapOf_Float_to_Double_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  Set<double> get setProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_GenericTypesWithBasicTypes_setProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_SetOf_Float_fromFfi(__result_handle);
    } finally {
      foobar_SetOf_Float_releaseFfiHandle(__result_handle);
    }
  }
  @override
  set setProperty(Set<double> value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_setProperty_set__SetOf_1Float'));
    final _value_handle = foobar_SetOf_Float_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    foobar_SetOf_Float_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_GenericTypesWithBasicTypes_toFfi(GenericTypesWithBasicTypes value) =>
  _smoke_GenericTypesWithBasicTypes_copy_handle((value as __lib.NativeBase).handle);
GenericTypesWithBasicTypes smoke_GenericTypesWithBasicTypes_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is GenericTypesWithBasicTypes) return instance;
  final _copied_handle = _smoke_GenericTypesWithBasicTypes_copy_handle(handle);
  final result = GenericTypesWithBasicTypes$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_GenericTypesWithBasicTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_GenericTypesWithBasicTypes_release_handle(handle);
Pointer<Void> smoke_GenericTypesWithBasicTypes_toFfi_nullable(GenericTypesWithBasicTypes? value) =>
  value != null ? smoke_GenericTypesWithBasicTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
GenericTypesWithBasicTypes? smoke_GenericTypesWithBasicTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_GenericTypesWithBasicTypes_fromFfi(handle) : null;
void smoke_GenericTypesWithBasicTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithBasicTypes_release_handle(handle);
// End of GenericTypesWithBasicTypes "private" section.

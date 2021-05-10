import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
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
final _smokeGenerictypeswithbasictypesStructwithgenericsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle'));
final _smokeGenerictypeswithbasictypesStructwithgenericsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle'));
final _smokeGenerictypeswithbasictypesStructwithgenericsGetFieldnumbersList = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersList'));
final _smokeGenerictypeswithbasictypesStructwithgenericsGetFieldnumbersMap = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersMap'));
final _smokeGenerictypeswithbasictypesStructwithgenericsGetFieldnumbersSet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_field_numbersSet'));
Pointer<Void> smoke_GenericTypesWithBasicTypes_StructWithGenerics_toFfi(GenericTypesWithBasicTypes_StructWithGenerics value) {
  final _numbersListHandle = foobar_ListOf_UByte_toFfi(value.numbersList);
  final _numbersMapHandle = foobar_MapOf_UByte_to_String_toFfi(value.numbersMap);
  final _numbersSetHandle = foobar_SetOf_UByte_toFfi(value.numbersSet);
  final _result = _smokeGenerictypeswithbasictypesStructwithgenericsCreateHandle(_numbersListHandle, _numbersMapHandle, _numbersSetHandle);
  foobar_ListOf_UByte_releaseFfiHandle(_numbersListHandle);
  foobar_MapOf_UByte_to_String_releaseFfiHandle(_numbersMapHandle);
  foobar_SetOf_UByte_releaseFfiHandle(_numbersSetHandle);
  return _result;
}
GenericTypesWithBasicTypes_StructWithGenerics smoke_GenericTypesWithBasicTypes_StructWithGenerics_fromFfi(Pointer<Void> handle) {
  final _numbersListHandle = _smokeGenerictypeswithbasictypesStructwithgenericsGetFieldnumbersList(handle);
  final _numbersMapHandle = _smokeGenerictypeswithbasictypesStructwithgenericsGetFieldnumbersMap(handle);
  final _numbersSetHandle = _smokeGenerictypeswithbasictypesStructwithgenericsGetFieldnumbersSet(handle);
  try {
    return GenericTypesWithBasicTypes_StructWithGenerics(
      foobar_ListOf_UByte_fromFfi(_numbersListHandle),
      foobar_MapOf_UByte_to_String_fromFfi(_numbersMapHandle),
      foobar_SetOf_UByte_fromFfi(_numbersSetHandle)
    );
  } finally {
    foobar_ListOf_UByte_releaseFfiHandle(_numbersListHandle);
    foobar_MapOf_UByte_to_String_releaseFfiHandle(_numbersMapHandle);
    foobar_SetOf_UByte_releaseFfiHandle(_numbersSetHandle);
  }
}
void smoke_GenericTypesWithBasicTypes_StructWithGenerics_releaseFfiHandle(Pointer<Void> handle) => _smokeGenerictypeswithbasictypesStructwithgenericsReleaseHandle(handle);
// Nullable GenericTypesWithBasicTypes_StructWithGenerics
final _smoke_GenericTypesWithBasicTypes_StructWithGenericsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle_nullable'));
final _smoke_GenericTypesWithBasicTypes_StructWithGenericsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle_nullable'));
final _smoke_GenericTypesWithBasicTypes_StructWithGenericsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_value_nullable'));
Pointer<Void> smoke_GenericTypesWithBasicTypes_StructWithGenerics_toFfi_nullable(GenericTypesWithBasicTypes_StructWithGenerics value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_GenericTypesWithBasicTypes_StructWithGenerics_toFfi(value);
  final result = _smoke_GenericTypesWithBasicTypes_StructWithGenericsCreateHandleNullable(_handle);
  smoke_GenericTypesWithBasicTypes_StructWithGenerics_releaseFfiHandle(_handle);
  return result;
}
GenericTypesWithBasicTypes_StructWithGenerics smoke_GenericTypesWithBasicTypes_StructWithGenerics_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_GenericTypesWithBasicTypes_StructWithGenericsGetValueNullable(handle);
  final result = smoke_GenericTypesWithBasicTypes_StructWithGenerics_fromFfi(_handle);
  smoke_GenericTypesWithBasicTypes_StructWithGenerics_releaseFfiHandle(_handle);
  return result;
}
void smoke_GenericTypesWithBasicTypes_StructWithGenerics_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithBasicTypes_StructWithGenericsReleaseHandleNullable(handle);
// End of GenericTypesWithBasicTypes_StructWithGenerics "private" section.
// GenericTypesWithBasicTypes "private" section, not exported.
final _smokeGenerictypeswithbasictypesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_copy_handle'));
final _smokeGenerictypeswithbasictypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_release_handle'));
class GenericTypesWithBasicTypes$Impl extends __lib.NativeBase implements GenericTypesWithBasicTypes {
  GenericTypesWithBasicTypes$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeGenerictypeswithbasictypesReleaseHandle(handle);
    handle = null;
  }
  @override
  List<int> methodWithList(List<int> input) {
    final _methodWithListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithList__ListOf_1Int'));
    final _inputHandle = foobar_ListOf_Int_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithListFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_ListOf_Int_releaseFfiHandle(_inputHandle);
    try {
      return foobar_ListOf_Int_fromFfi(__resultHandle);
    } finally {
      foobar_ListOf_Int_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<int, bool> methodWithMap(Map<int, bool> input) {
    final _methodWithMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithMap__MapOf_1Int_1to_1Boolean'));
    final _inputHandle = foobar_MapOf_Int_to_Boolean_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithMapFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_inputHandle);
    try {
      return foobar_MapOf_Int_to_Boolean_fromFfi(__resultHandle);
    } finally {
      foobar_MapOf_Int_to_Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  Set<int> methodWithSet(Set<int> input) {
    final _methodWithSetFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithSet__SetOf_1Int'));
    final _inputHandle = foobar_SetOf_Int_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSetFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_SetOf_Int_releaseFfiHandle(_inputHandle);
    try {
      return foobar_SetOf_Int_fromFfi(__resultHandle);
    } finally {
      foobar_SetOf_Int_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  List<String> methodWithListTypeAlias(List<String> input) {
    final _methodWithListTypeAliasFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithListTypeAlias__ListOf_1String'));
    final _inputHandle = foobar_ListOf_String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithListTypeAliasFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_ListOf_String_releaseFfiHandle(_inputHandle);
    try {
      return foobar_ListOf_String_fromFfi(__resultHandle);
    } finally {
      foobar_ListOf_String_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<String, String> methodWithMapTypeAlias(Map<String, String> input) {
    final _methodWithMapTypeAliasFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithMapTypeAlias__MapOf_1String_1to_1String'));
    final _inputHandle = foobar_MapOf_String_to_String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithMapTypeAliasFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_MapOf_String_to_String_releaseFfiHandle(_inputHandle);
    try {
      return foobar_MapOf_String_to_String_fromFfi(__resultHandle);
    } finally {
      foobar_MapOf_String_to_String_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  Set<String> methodWithSetTypeAlias(Set<String> input) {
    final _methodWithSetTypeAliasFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithSetTypeAlias__SetOf_1String'));
    final _inputHandle = foobar_SetOf_String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSetTypeAliasFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_SetOf_String_releaseFfiHandle(_inputHandle);
    try {
      return foobar_SetOf_String_fromFfi(__resultHandle);
    } finally {
      foobar_SetOf_String_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  List<double> get listProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_GenericTypesWithBasicTypes_listProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_ListOf_Float_fromFfi(__resultHandle);
    } finally {
      foobar_ListOf_Float_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set listProperty(List<double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_listProperty_set__ListOf_1Float'));
    final _valueHandle = foobar_ListOf_Float_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobar_ListOf_Float_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  Map<double, double> get mapProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_GenericTypesWithBasicTypes_mapProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_MapOf_Float_to_Double_fromFfi(__resultHandle);
    } finally {
      foobar_MapOf_Float_to_Double_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set mapProperty(Map<double, double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_mapProperty_set__MapOf_1Float_1to_1Double'));
    final _valueHandle = foobar_MapOf_Float_to_Double_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobar_MapOf_Float_to_Double_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  Set<double> get setProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_GenericTypesWithBasicTypes_setProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_SetOf_Float_fromFfi(__resultHandle);
    } finally {
      foobar_SetOf_Float_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set setProperty(Set<double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_setProperty_set__SetOf_1Float'));
    final _valueHandle = foobar_SetOf_Float_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobar_SetOf_Float_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_GenericTypesWithBasicTypes_toFfi(GenericTypesWithBasicTypes value) =>
  _smokeGenerictypeswithbasictypesCopyHandle((value as __lib.NativeBase).handle);
GenericTypesWithBasicTypes smoke_GenericTypesWithBasicTypes_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as GenericTypesWithBasicTypes;
  if (instance != null) return instance;
  final _copiedHandle = _smokeGenerictypeswithbasictypesCopyHandle(handle);
  final result = GenericTypesWithBasicTypes$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_GenericTypesWithBasicTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeGenerictypeswithbasictypesReleaseHandle(handle);
Pointer<Void> smoke_GenericTypesWithBasicTypes_toFfi_nullable(GenericTypesWithBasicTypes value) =>
  value != null ? smoke_GenericTypesWithBasicTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
GenericTypesWithBasicTypes smoke_GenericTypesWithBasicTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_GenericTypesWithBasicTypes_fromFfi(handle) : null;
void smoke_GenericTypesWithBasicTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeGenerictypeswithbasictypesReleaseHandle(handle);
// End of GenericTypesWithBasicTypes "private" section.

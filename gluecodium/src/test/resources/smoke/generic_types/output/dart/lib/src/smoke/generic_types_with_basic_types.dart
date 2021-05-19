import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
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
Pointer<Void> smokeGenerictypeswithbasictypesStructwithgenericsToFfi(GenericTypesWithBasicTypes_StructWithGenerics value) {
  final _numbersListHandle = foobarListofUbyteToFfi(value.numbersList);
  final _numbersMapHandle = foobarMapofUbyteToStringToFfi(value.numbersMap);
  final _numbersSetHandle = foobarSetofUbyteToFfi(value.numbersSet);
  final _result = _smokeGenerictypeswithbasictypesStructwithgenericsCreateHandle(_numbersListHandle, _numbersMapHandle, _numbersSetHandle);
  foobarListofUbyteReleaseFfiHandle(_numbersListHandle);
  foobarMapofUbyteToStringReleaseFfiHandle(_numbersMapHandle);
  foobarSetofUbyteReleaseFfiHandle(_numbersSetHandle);
  return _result;
}
GenericTypesWithBasicTypes_StructWithGenerics smokeGenerictypeswithbasictypesStructwithgenericsFromFfi(Pointer<Void> handle) {
  final _numbersListHandle = _smokeGenerictypeswithbasictypesStructwithgenericsGetFieldnumbersList(handle);
  final _numbersMapHandle = _smokeGenerictypeswithbasictypesStructwithgenericsGetFieldnumbersMap(handle);
  final _numbersSetHandle = _smokeGenerictypeswithbasictypesStructwithgenericsGetFieldnumbersSet(handle);
  try {
    return GenericTypesWithBasicTypes_StructWithGenerics(
      foobarListofUbyteFromFfi(_numbersListHandle),
      foobarMapofUbyteToStringFromFfi(_numbersMapHandle),
      foobarSetofUbyteFromFfi(_numbersSetHandle)
    );
  } finally {
    foobarListofUbyteReleaseFfiHandle(_numbersListHandle);
    foobarMapofUbyteToStringReleaseFfiHandle(_numbersMapHandle);
    foobarSetofUbyteReleaseFfiHandle(_numbersSetHandle);
  }
}
void smokeGenerictypeswithbasictypesStructwithgenericsReleaseFfiHandle(Pointer<Void> handle) => _smokeGenerictypeswithbasictypesStructwithgenericsReleaseHandle(handle);
// Nullable GenericTypesWithBasicTypes_StructWithGenerics
final _smokeGenerictypeswithbasictypesStructwithgenericsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle_nullable'));
final _smokeGenerictypeswithbasictypesStructwithgenericsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle_nullable'));
final _smokeGenerictypeswithbasictypesStructwithgenericsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithBasicTypes_StructWithGenerics_get_value_nullable'));
Pointer<Void> smokeGenerictypeswithbasictypesStructwithgenericsToFfiNullable(GenericTypesWithBasicTypes_StructWithGenerics? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeGenerictypeswithbasictypesStructwithgenericsToFfi(value);
  final result = _smokeGenerictypeswithbasictypesStructwithgenericsCreateHandleNullable(_handle);
  smokeGenerictypeswithbasictypesStructwithgenericsReleaseFfiHandle(_handle);
  return result;
}
GenericTypesWithBasicTypes_StructWithGenerics? smokeGenerictypeswithbasictypesStructwithgenericsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeGenerictypeswithbasictypesStructwithgenericsGetValueNullable(handle);
  final result = smokeGenerictypeswithbasictypesStructwithgenericsFromFfi(_handle);
  smokeGenerictypeswithbasictypesStructwithgenericsReleaseFfiHandle(_handle);
  return result;
}
void smokeGenerictypeswithbasictypesStructwithgenericsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeGenerictypeswithbasictypesStructwithgenericsReleaseHandleNullable(handle);
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
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeGenerictypeswithbasictypesReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  List<int> methodWithList(List<int> input) {
    final _methodWithListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithList__ListOf_1Int'));
    final _inputHandle = foobarListofIntToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithListFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofIntReleaseFfiHandle(_inputHandle);
    try {
      return foobarListofIntFromFfi(__resultHandle);
    } finally {
      foobarListofIntReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<int, bool> methodWithMap(Map<int, bool> input) {
    final _methodWithMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithMap__MapOf_1Int_1to_1Boolean'));
    final _inputHandle = foobarMapofIntToBooleanToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithMapFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarMapofIntToBooleanReleaseFfiHandle(_inputHandle);
    try {
      return foobarMapofIntToBooleanFromFfi(__resultHandle);
    } finally {
      foobarMapofIntToBooleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  Set<int> methodWithSet(Set<int> input) {
    final _methodWithSetFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithSet__SetOf_1Int'));
    final _inputHandle = foobarSetofIntToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSetFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarSetofIntReleaseFfiHandle(_inputHandle);
    try {
      return foobarSetofIntFromFfi(__resultHandle);
    } finally {
      foobarSetofIntReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  List<String> methodWithListTypeAlias(List<String> input) {
    final _methodWithListTypeAliasFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithListTypeAlias__ListOf_1String'));
    final _inputHandle = foobarListofStringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithListTypeAliasFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofStringReleaseFfiHandle(_inputHandle);
    try {
      return foobarListofStringFromFfi(__resultHandle);
    } finally {
      foobarListofStringReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<String, String> methodWithMapTypeAlias(Map<String, String> input) {
    final _methodWithMapTypeAliasFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithMapTypeAlias__MapOf_1String_1to_1String'));
    final _inputHandle = foobarMapofStringToStringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithMapTypeAliasFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarMapofStringToStringReleaseFfiHandle(_inputHandle);
    try {
      return foobarMapofStringToStringFromFfi(__resultHandle);
    } finally {
      foobarMapofStringToStringReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  Set<String> methodWithSetTypeAlias(Set<String> input) {
    final _methodWithSetTypeAliasFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_methodWithSetTypeAlias__SetOf_1String'));
    final _inputHandle = foobarSetofStringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSetTypeAliasFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarSetofStringReleaseFfiHandle(_inputHandle);
    try {
      return foobarSetofStringFromFfi(__resultHandle);
    } finally {
      foobarSetofStringReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  List<double> get listProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_GenericTypesWithBasicTypes_listProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarListofFloatFromFfi(__resultHandle);
    } finally {
      foobarListofFloatReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  set listProperty(List<double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_listProperty_set__ListOf_1Float'));
    final _valueHandle = foobarListofFloatToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarListofFloatReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  Map<double, double> get mapProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_GenericTypesWithBasicTypes_mapProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarMapofFloatToDoubleFromFfi(__resultHandle);
    } finally {
      foobarMapofFloatToDoubleReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  set mapProperty(Map<double, double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_mapProperty_set__MapOf_1Float_1to_1Double'));
    final _valueHandle = foobarMapofFloatToDoubleToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarMapofFloatToDoubleReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  Set<double> get setProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_GenericTypesWithBasicTypes_setProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarSetofFloatFromFfi(__resultHandle);
    } finally {
      foobarSetofFloatReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  set setProperty(Set<double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithBasicTypes_setProperty_set__SetOf_1Float'));
    final _valueHandle = foobarSetofFloatToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarSetofFloatReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
Pointer<Void> smokeGenerictypeswithbasictypesToFfi(GenericTypesWithBasicTypes value) =>
  _smokeGenerictypeswithbasictypesCopyHandle((value as __lib.NativeBase).handle);
GenericTypesWithBasicTypes smokeGenerictypeswithbasictypesFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is GenericTypesWithBasicTypes) return instance;
  final _copiedHandle = _smokeGenerictypeswithbasictypesCopyHandle(handle);
  final result = GenericTypesWithBasicTypes$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeGenerictypeswithbasictypesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeGenerictypeswithbasictypesReleaseHandle(handle);
Pointer<Void> smokeGenerictypeswithbasictypesToFfiNullable(GenericTypesWithBasicTypes? value) =>
  value != null ? smokeGenerictypeswithbasictypesToFfi(value) : Pointer<Void>.fromAddress(0);
GenericTypesWithBasicTypes? smokeGenerictypeswithbasictypesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeGenerictypeswithbasictypesFromFfi(handle) : null;
void smokeGenerictypeswithbasictypesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeGenerictypeswithbasictypesReleaseHandle(handle);
// End of GenericTypesWithBasicTypes "private" section.

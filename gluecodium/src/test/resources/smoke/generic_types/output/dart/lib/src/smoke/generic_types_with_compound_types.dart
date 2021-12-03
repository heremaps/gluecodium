import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/dummy_class.dart';
import 'package:library/src/smoke/dummy_interface.dart';
abstract class GenericTypesWithCompoundTypes {
  /// @nodoc
  @Deprecated("Does nothing")
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
int smokeGenerictypeswithcompoundtypesSomeenumToFfi(GenericTypesWithCompoundTypes_SomeEnum value) {
  switch (value) {
  case GenericTypesWithCompoundTypes_SomeEnum.foo:
    return 0;
  case GenericTypesWithCompoundTypes_SomeEnum.bar:
    return 1;
  default:
    throw StateError("Invalid enum value $value for GenericTypesWithCompoundTypes_SomeEnum enum.");
  }
}
GenericTypesWithCompoundTypes_SomeEnum smokeGenerictypeswithcompoundtypesSomeenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return GenericTypesWithCompoundTypes_SomeEnum.foo;
  case 1:
    return GenericTypesWithCompoundTypes_SomeEnum.bar;
  default:
    throw StateError("Invalid numeric value $handle for GenericTypesWithCompoundTypes_SomeEnum enum.");
  }
}
void smokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(int handle) {}
final _smokeGenerictypeswithcompoundtypesSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable'));
final _smokeGenerictypeswithcompoundtypesSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable'));
final _smokeGenerictypeswithcompoundtypesSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable'));
Pointer<Void> smokeGenerictypeswithcompoundtypesSomeenumToFfiNullable(GenericTypesWithCompoundTypes_SomeEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeGenerictypeswithcompoundtypesSomeenumToFfi(value);
  final result = _smokeGenerictypeswithcompoundtypesSomeenumCreateHandleNullable(_handle);
  smokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_handle);
  return result;
}
GenericTypesWithCompoundTypes_SomeEnum? smokeGenerictypeswithcompoundtypesSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeGenerictypeswithcompoundtypesSomeenumGetValueNullable(handle);
  final result = smokeGenerictypeswithcompoundtypesSomeenumFromFfi(_handle);
  smokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_handle);
  return result;
}
void smokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeGenerictypeswithcompoundtypesSomeenumReleaseHandleNullable(handle);
// End of GenericTypesWithCompoundTypes_SomeEnum "private" section.
enum GenericTypesWithCompoundTypes_ExternalEnum {
    on,
    off
}
// GenericTypesWithCompoundTypes_ExternalEnum "private" section, not exported.
int smokeGenerictypeswithcompoundtypesExternalenumToFfi(GenericTypesWithCompoundTypes_ExternalEnum value) {
  switch (value) {
  case GenericTypesWithCompoundTypes_ExternalEnum.on:
    return 0;
  case GenericTypesWithCompoundTypes_ExternalEnum.off:
    return 1;
  default:
    throw StateError("Invalid enum value $value for GenericTypesWithCompoundTypes_ExternalEnum enum.");
  }
}
GenericTypesWithCompoundTypes_ExternalEnum smokeGenerictypeswithcompoundtypesExternalenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return GenericTypesWithCompoundTypes_ExternalEnum.on;
  case 1:
    return GenericTypesWithCompoundTypes_ExternalEnum.off;
  default:
    throw StateError("Invalid numeric value $handle for GenericTypesWithCompoundTypes_ExternalEnum enum.");
  }
}
void smokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(int handle) {}
final _smokeGenerictypeswithcompoundtypesExternalenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable'));
final _smokeGenerictypeswithcompoundtypesExternalenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable'));
final _smokeGenerictypeswithcompoundtypesExternalenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable'));
Pointer<Void> smokeGenerictypeswithcompoundtypesExternalenumToFfiNullable(GenericTypesWithCompoundTypes_ExternalEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeGenerictypeswithcompoundtypesExternalenumToFfi(value);
  final result = _smokeGenerictypeswithcompoundtypesExternalenumCreateHandleNullable(_handle);
  smokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_handle);
  return result;
}
GenericTypesWithCompoundTypes_ExternalEnum? smokeGenerictypeswithcompoundtypesExternalenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeGenerictypeswithcompoundtypesExternalenumGetValueNullable(handle);
  final result = smokeGenerictypeswithcompoundtypesExternalenumFromFfi(_handle);
  smokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_handle);
  return result;
}
void smokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeGenerictypeswithcompoundtypesExternalenumReleaseHandleNullable(handle);
// End of GenericTypesWithCompoundTypes_ExternalEnum "private" section.
class GenericTypesWithCompoundTypes_BasicStruct {
  double value;
  GenericTypesWithCompoundTypes_BasicStruct(this.value);
}
// GenericTypesWithCompoundTypes_BasicStruct "private" section, not exported.
final _smokeGenerictypeswithcompoundtypesBasicstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle'));
final _smokeGenerictypeswithcompoundtypesBasicstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle'));
final _smokeGenerictypeswithcompoundtypesBasicstructGetFieldvalue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_field_value'));
Pointer<Void> smokeGenerictypeswithcompoundtypesBasicstructToFfi(GenericTypesWithCompoundTypes_BasicStruct value) {
  final _valueHandle = (value.value);
  final _result = _smokeGenerictypeswithcompoundtypesBasicstructCreateHandle(_valueHandle);
  return _result;
}
GenericTypesWithCompoundTypes_BasicStruct smokeGenerictypeswithcompoundtypesBasicstructFromFfi(Pointer<Void> handle) {
  final _valueHandle = _smokeGenerictypeswithcompoundtypesBasicstructGetFieldvalue(handle);
  try {
    return GenericTypesWithCompoundTypes_BasicStruct(
      (_valueHandle)
    );
  } finally {
  }
}
void smokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(Pointer<Void> handle) => _smokeGenerictypeswithcompoundtypesBasicstructReleaseHandle(handle);
// Nullable GenericTypesWithCompoundTypes_BasicStruct
final _smokeGenerictypeswithcompoundtypesBasicstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable'));
final _smokeGenerictypeswithcompoundtypesBasicstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable'));
final _smokeGenerictypeswithcompoundtypesBasicstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable'));
Pointer<Void> smokeGenerictypeswithcompoundtypesBasicstructToFfiNullable(GenericTypesWithCompoundTypes_BasicStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeGenerictypeswithcompoundtypesBasicstructToFfi(value);
  final result = _smokeGenerictypeswithcompoundtypesBasicstructCreateHandleNullable(_handle);
  smokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(_handle);
  return result;
}
GenericTypesWithCompoundTypes_BasicStruct? smokeGenerictypeswithcompoundtypesBasicstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeGenerictypeswithcompoundtypesBasicstructGetValueNullable(handle);
  final result = smokeGenerictypeswithcompoundtypesBasicstructFromFfi(_handle);
  smokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(_handle);
  return result;
}
void smokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeGenerictypeswithcompoundtypesBasicstructReleaseHandleNullable(handle);
// End of GenericTypesWithCompoundTypes_BasicStruct "private" section.
class GenericTypesWithCompoundTypes_ExternalStruct {
  String string;
  GenericTypesWithCompoundTypes_ExternalStruct(this.string);
}
// GenericTypesWithCompoundTypes_ExternalStruct "private" section, not exported.
final _smokeGenerictypeswithcompoundtypesExternalstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle'));
final _smokeGenerictypeswithcompoundtypesExternalstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle'));
final _smokeGenerictypeswithcompoundtypesExternalstructGetFieldstring = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_field_string'));
Pointer<Void> smokeGenerictypeswithcompoundtypesExternalstructToFfi(GenericTypesWithCompoundTypes_ExternalStruct value) {
  final _stringHandle = stringToFfi(value.string);
  final _result = _smokeGenerictypeswithcompoundtypesExternalstructCreateHandle(_stringHandle);
  stringReleaseFfiHandle(_stringHandle);
  return _result;
}
GenericTypesWithCompoundTypes_ExternalStruct smokeGenerictypeswithcompoundtypesExternalstructFromFfi(Pointer<Void> handle) {
  final _stringHandle = _smokeGenerictypeswithcompoundtypesExternalstructGetFieldstring(handle);
  try {
    return GenericTypesWithCompoundTypes_ExternalStruct(
      stringFromFfi(_stringHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringHandle);
  }
}
void smokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(Pointer<Void> handle) => _smokeGenerictypeswithcompoundtypesExternalstructReleaseHandle(handle);
// Nullable GenericTypesWithCompoundTypes_ExternalStruct
final _smokeGenerictypeswithcompoundtypesExternalstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable'));
final _smokeGenerictypeswithcompoundtypesExternalstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable'));
final _smokeGenerictypeswithcompoundtypesExternalstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable'));
Pointer<Void> smokeGenerictypeswithcompoundtypesExternalstructToFfiNullable(GenericTypesWithCompoundTypes_ExternalStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeGenerictypeswithcompoundtypesExternalstructToFfi(value);
  final result = _smokeGenerictypeswithcompoundtypesExternalstructCreateHandleNullable(_handle);
  smokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(_handle);
  return result;
}
GenericTypesWithCompoundTypes_ExternalStruct? smokeGenerictypeswithcompoundtypesExternalstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeGenerictypeswithcompoundtypesExternalstructGetValueNullable(handle);
  final result = smokeGenerictypeswithcompoundtypesExternalstructFromFfi(_handle);
  smokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(_handle);
  return result;
}
void smokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeGenerictypeswithcompoundtypesExternalstructReleaseHandleNullable(handle);
// End of GenericTypesWithCompoundTypes_ExternalStruct "private" section.
// GenericTypesWithCompoundTypes "private" section, not exported.
final _smokeGenerictypeswithcompoundtypesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_GenericTypesWithCompoundTypes_register_finalizer'));
final _smokeGenerictypeswithcompoundtypesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_copy_handle'));
final _smokeGenerictypeswithcompoundtypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_release_handle'));
class GenericTypesWithCompoundTypes$Impl extends __lib.NativeBase implements GenericTypesWithCompoundTypes {
  GenericTypesWithCompoundTypes$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  List<GenericTypesWithCompoundTypes_ExternalStruct> methodWithStructList(List<GenericTypesWithCompoundTypes_BasicStruct> input) {
    final _methodWithStructListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithStructList__ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct'));
    final _inputHandle = foobarListofSmokeGenerictypeswithcompoundtypesBasicstructToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithStructListFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofSmokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(_inputHandle);
    try {
      return foobarListofSmokeGenerictypeswithcompoundtypesExternalstructFromFfi(__resultHandle);
    } finally {
      foobarListofSmokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<String, GenericTypesWithCompoundTypes_ExternalStruct> methodWithStructMap(Map<String, GenericTypesWithCompoundTypes_BasicStruct> input) {
    final _methodWithStructMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithStructMap__MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct'));
    final _inputHandle = foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithStructMapFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(_inputHandle);
    try {
      return foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructFromFfi(__resultHandle);
    } finally {
      foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  List<GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumList(List<GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithEnumList__ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum'));
    final _inputHandle = foobarListofSmokeGenerictypeswithcompoundtypesSomeenumToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithEnumListFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_inputHandle);
    try {
      return foobarListofSmokeGenerictypeswithcompoundtypesExternalenumFromFfi(__resultHandle);
    } finally {
      foobarListofSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> methodWithEnumMapKey(Map<GenericTypesWithCompoundTypes_SomeEnum, bool> input) {
    final _methodWithEnumMapKeyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithEnumMapKey__MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean'));
    final _inputHandle = foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithEnumMapKeyFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanReleaseFfiHandle(_inputHandle);
    try {
      return foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanFromFfi(__resultHandle);
    } finally {
      foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<int, GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumMapValue(Map<int, GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumMapValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithEnumMapValue__MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum'));
    final _inputHandle = foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithEnumMapValueFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_inputHandle);
    try {
      return foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumFromFfi(__resultHandle);
    } finally {
      foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  Set<GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumSet(Set<GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumSetFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithEnumSet__SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum'));
    final _inputHandle = foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithEnumSetFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_inputHandle);
    try {
      return foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumFromFfi(__resultHandle);
    } finally {
      foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  List<DummyInterface> methodWithInstancesList(List<DummyClass> input) {
    final _methodWithInstancesListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithInstancesList__ListOf_smoke_DummyClass'));
    final _inputHandle = foobarListofSmokeDummyclassToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithInstancesListFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofSmokeDummyclassReleaseFfiHandle(_inputHandle);
    try {
      return foobarListofSmokeDummyinterfaceFromFfi(__resultHandle);
    } finally {
      foobarListofSmokeDummyinterfaceReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<int, DummyInterface> methodWithInstancesMap(Map<int, DummyClass> input) {
    final _methodWithInstancesMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithInstancesMap__MapOf_Int_to_smoke_DummyClass'));
    final _inputHandle = foobarMapofIntToSmokeDummyclassToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithInstancesMapFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarMapofIntToSmokeDummyclassReleaseFfiHandle(_inputHandle);
    try {
      return foobarMapofIntToSmokeDummyinterfaceFromFfi(__resultHandle);
    } finally {
      foobarMapofIntToSmokeDummyinterfaceReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeGenerictypeswithcompoundtypesToFfi(GenericTypesWithCompoundTypes value) =>
  _smokeGenerictypeswithcompoundtypesCopyHandle((value as __lib.NativeBase).handle);
GenericTypesWithCompoundTypes smokeGenerictypeswithcompoundtypesFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is GenericTypesWithCompoundTypes) return instance;
  final _copiedHandle = _smokeGenerictypeswithcompoundtypesCopyHandle(handle);
  final result = GenericTypesWithCompoundTypes$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeGenerictypeswithcompoundtypesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeGenerictypeswithcompoundtypesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeGenerictypeswithcompoundtypesReleaseHandle(handle);
Pointer<Void> smokeGenerictypeswithcompoundtypesToFfiNullable(GenericTypesWithCompoundTypes? value) =>
  value != null ? smokeGenerictypeswithcompoundtypesToFfi(value) : Pointer<Void>.fromAddress(0);
GenericTypesWithCompoundTypes? smokeGenerictypeswithcompoundtypesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeGenerictypeswithcompoundtypesFromFfi(handle) : null;
void smokeGenerictypeswithcompoundtypesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeGenerictypeswithcompoundtypesReleaseHandle(handle);
// End of GenericTypesWithCompoundTypes "private" section.

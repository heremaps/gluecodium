import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/dummy_class.dart';
import 'package:library/src/smoke/dummy_interface.dart';
import 'dart:ffi';
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
final _smoke_GenericTypesWithCompoundTypes_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable'));
final _smoke_GenericTypesWithCompoundTypes_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable'));
final _smoke_GenericTypesWithCompoundTypes_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi_nullable(GenericTypesWithCompoundTypes_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(value);
  final result = _smoke_GenericTypesWithCompoundTypes_SomeEnumCreateHandleNullable(_handle);
  smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
GenericTypesWithCompoundTypes_SomeEnum smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_GenericTypesWithCompoundTypes_SomeEnumGetValueNullable(handle);
  final result = smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_handle);
  smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithCompoundTypes_SomeEnumReleaseHandleNullable(handle);
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
final _smoke_GenericTypesWithCompoundTypes_ExternalEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable'));
final _smoke_GenericTypesWithCompoundTypes_ExternalEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable'));
final _smoke_GenericTypesWithCompoundTypes_ExternalEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable'));
Pointer<Void> smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi_nullable(GenericTypesWithCompoundTypes_ExternalEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(value);
  final result = _smoke_GenericTypesWithCompoundTypes_ExternalEnumCreateHandleNullable(_handle);
  smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
GenericTypesWithCompoundTypes_ExternalEnum smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_GenericTypesWithCompoundTypes_ExternalEnumGetValueNullable(handle);
  final result = smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_handle);
  smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithCompoundTypes_ExternalEnumReleaseHandleNullable(handle);
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
Pointer<Void> smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(GenericTypesWithCompoundTypes_BasicStruct value) {
  final _valueHandle = (value.value);
  final _result = _smokeGenerictypeswithcompoundtypesBasicstructCreateHandle(_valueHandle);
  (_valueHandle);
  return _result;
}
GenericTypesWithCompoundTypes_BasicStruct smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(Pointer<Void> handle) {
  final _valueHandle = _smokeGenerictypeswithcompoundtypesBasicstructGetFieldvalue(handle);
  try {
    return GenericTypesWithCompoundTypes_BasicStruct(
      (_valueHandle)
    );
  } finally {
    (_valueHandle);
  }
}
void smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeGenerictypeswithcompoundtypesBasicstructReleaseHandle(handle);
// Nullable GenericTypesWithCompoundTypes_BasicStruct
final _smoke_GenericTypesWithCompoundTypes_BasicStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable'));
final _smoke_GenericTypesWithCompoundTypes_BasicStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable'));
final _smoke_GenericTypesWithCompoundTypes_BasicStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable'));
Pointer<Void> smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi_nullable(GenericTypesWithCompoundTypes_BasicStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(value);
  final result = _smoke_GenericTypesWithCompoundTypes_BasicStructCreateHandleNullable(_handle);
  smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
GenericTypesWithCompoundTypes_BasicStruct smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_GenericTypesWithCompoundTypes_BasicStructGetValueNullable(handle);
  final result = smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(_handle);
  smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithCompoundTypes_BasicStructReleaseHandleNullable(handle);
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
Pointer<Void> smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(GenericTypesWithCompoundTypes_ExternalStruct value) {
  final _stringHandle = String_toFfi(value.string);
  final _result = _smokeGenerictypeswithcompoundtypesExternalstructCreateHandle(_stringHandle);
  String_releaseFfiHandle(_stringHandle);
  return _result;
}
GenericTypesWithCompoundTypes_ExternalStruct smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(Pointer<Void> handle) {
  final _stringHandle = _smokeGenerictypeswithcompoundtypesExternalstructGetFieldstring(handle);
  try {
    return GenericTypesWithCompoundTypes_ExternalStruct(
      String_fromFfi(_stringHandle)
    );
  } finally {
    String_releaseFfiHandle(_stringHandle);
  }
}
void smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeGenerictypeswithcompoundtypesExternalstructReleaseHandle(handle);
// Nullable GenericTypesWithCompoundTypes_ExternalStruct
final _smoke_GenericTypesWithCompoundTypes_ExternalStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable'));
final _smoke_GenericTypesWithCompoundTypes_ExternalStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable'));
final _smoke_GenericTypesWithCompoundTypes_ExternalStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable'));
Pointer<Void> smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi_nullable(GenericTypesWithCompoundTypes_ExternalStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(value);
  final result = _smoke_GenericTypesWithCompoundTypes_ExternalStructCreateHandleNullable(_handle);
  smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
GenericTypesWithCompoundTypes_ExternalStruct smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_GenericTypesWithCompoundTypes_ExternalStructGetValueNullable(handle);
  final result = smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(_handle);
  smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_GenericTypesWithCompoundTypes_ExternalStructReleaseHandleNullable(handle);
// End of GenericTypesWithCompoundTypes_ExternalStruct "private" section.
// GenericTypesWithCompoundTypes "private" section, not exported.
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
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeGenerictypeswithcompoundtypesReleaseHandle(handle);
    handle = null;
  }
  @override
  List<GenericTypesWithCompoundTypes_ExternalStruct> methodWithStructList(List<GenericTypesWithCompoundTypes_BasicStruct> input) {
    final _methodWithStructListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithStructList__ListOf_1smoke_1GenericTypesWithCompoundTypes_1BasicStruct'));
    final _inputHandle = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithStructListFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_inputHandle);
    try {
      return foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(__resultHandle);
    } finally {
      foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<String, GenericTypesWithCompoundTypes_ExternalStruct> methodWithStructMap(Map<String, GenericTypesWithCompoundTypes_BasicStruct> input) {
    final _methodWithStructMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithStructMap__MapOf_1String_1to_1smoke_1GenericTypesWithCompoundTypes_1BasicStruct'));
    final _inputHandle = foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithStructMapFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_inputHandle);
    try {
      return foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(__resultHandle);
    } finally {
      foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  List<GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumList(List<GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithEnumList__ListOf_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum'));
    final _inputHandle = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithEnumListFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_inputHandle);
    try {
      return foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(__resultHandle);
    } finally {
      foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> methodWithEnumMapKey(Map<GenericTypesWithCompoundTypes_SomeEnum, bool> input) {
    final _methodWithEnumMapKeyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithEnumMapKey__MapOf_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum_1to_1Boolean'));
    final _inputHandle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithEnumMapKeyFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_releaseFfiHandle(_inputHandle);
    try {
      return foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_fromFfi(__resultHandle);
    } finally {
      foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<int, GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumMapValue(Map<int, GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumMapValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithEnumMapValue__MapOf_1Int_1to_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum'));
    final _inputHandle = foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithEnumMapValueFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_inputHandle);
    try {
      return foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(__resultHandle);
    } finally {
      foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  Set<GenericTypesWithCompoundTypes_ExternalEnum> methodWithEnumSet(Set<GenericTypesWithCompoundTypes_SomeEnum> input) {
    final _methodWithEnumSetFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithEnumSet__SetOf_1smoke_1GenericTypesWithCompoundTypes_1SomeEnum'));
    final _inputHandle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithEnumSetFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_inputHandle);
    try {
      return foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(__resultHandle);
    } finally {
      foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  List<DummyInterface> methodWithInstancesList(List<DummyClass> input) {
    final _methodWithInstancesListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithInstancesList__ListOf_1smoke_1DummyClass'));
    final _inputHandle = foobar_ListOf_smoke_DummyClass_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithInstancesListFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_ListOf_smoke_DummyClass_releaseFfiHandle(_inputHandle);
    try {
      return foobar_ListOf_smoke_DummyInterface_fromFfi(__resultHandle);
    } finally {
      foobar_ListOf_smoke_DummyInterface_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<int, DummyInterface> methodWithInstancesMap(Map<int, DummyClass> input) {
    final _methodWithInstancesMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_GenericTypesWithCompoundTypes_methodWithInstancesMap__MapOf_1Int_1to_1smoke_1DummyClass'));
    final _inputHandle = foobar_MapOf_Int_to_smoke_DummyClass_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithInstancesMapFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_MapOf_Int_to_smoke_DummyClass_releaseFfiHandle(_inputHandle);
    try {
      return foobar_MapOf_Int_to_smoke_DummyInterface_fromFfi(__resultHandle);
    } finally {
      foobar_MapOf_Int_to_smoke_DummyInterface_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_GenericTypesWithCompoundTypes_toFfi(GenericTypesWithCompoundTypes value) =>
  _smokeGenerictypeswithcompoundtypesCopyHandle((value as __lib.NativeBase).handle);
GenericTypesWithCompoundTypes smoke_GenericTypesWithCompoundTypes_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as GenericTypesWithCompoundTypes;
  if (instance != null) return instance;
  final _copiedHandle = _smokeGenerictypeswithcompoundtypesCopyHandle(handle);
  final result = GenericTypesWithCompoundTypes$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_GenericTypesWithCompoundTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeGenerictypeswithcompoundtypesReleaseHandle(handle);
Pointer<Void> smoke_GenericTypesWithCompoundTypes_toFfi_nullable(GenericTypesWithCompoundTypes value) =>
  value != null ? smoke_GenericTypesWithCompoundTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
GenericTypesWithCompoundTypes smoke_GenericTypesWithCompoundTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_GenericTypesWithCompoundTypes_fromFfi(handle) : null;
void smoke_GenericTypesWithCompoundTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeGenerictypeswithcompoundtypesReleaseHandle(handle);
// End of GenericTypesWithCompoundTypes "private" section.

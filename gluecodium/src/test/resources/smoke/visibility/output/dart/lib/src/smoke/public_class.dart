import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class PublicClass {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  /// @nodoc
  PublicClass_InternalStruct internal_internalMethod(PublicClass_InternalStruct input);
  /// @nodoc
  PublicClass_InternalStruct get internal_internalStructProperty;
  /// @nodoc
  set internal_internalStructProperty(PublicClass_InternalStruct value);
  String get internalSetterProperty;
  /// @nodoc
  set internal_internalSetterProperty(String value);
}
/// @nodoc
enum PublicClass_InternalEnum {
    foo,
    bar
}
// PublicClass_InternalEnum "private" section, not exported.
int smokePublicclassInternalenumToFfi(PublicClass_InternalEnum value) {
  switch (value) {
  case PublicClass_InternalEnum.foo:
    return 0;
  break;
  case PublicClass_InternalEnum.bar:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for PublicClass_InternalEnum enum.");
  }
}
PublicClass_InternalEnum smokePublicclassInternalenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return PublicClass_InternalEnum.foo;
  break;
  case 1:
    return PublicClass_InternalEnum.bar;
  break;
  default:
    throw StateError("Invalid numeric value $handle for PublicClass_InternalEnum enum.");
  }
}
void smokePublicclassInternalenumReleaseFfiHandle(int handle) {}
final _smokePublicclassInternalenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_PublicClass_InternalEnum_create_handle_nullable'));
final _smokePublicclassInternalenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalEnum_release_handle_nullable'));
final _smokePublicclassInternalenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalEnum_get_value_nullable'));
Pointer<Void> smokePublicclassInternalenumToFfiNullable(PublicClass_InternalEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublicclassInternalenumToFfi(value);
  final result = _smokePublicclassInternalenumCreateHandleNullable(_handle);
  smokePublicclassInternalenumReleaseFfiHandle(_handle);
  return result;
}
PublicClass_InternalEnum? smokePublicclassInternalenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublicclassInternalenumGetValueNullable(handle);
  final result = smokePublicclassInternalenumFromFfi(_handle);
  smokePublicclassInternalenumReleaseFfiHandle(_handle);
  return result;
}
void smokePublicclassInternalenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicclassInternalenumReleaseHandleNullable(handle);
// End of PublicClass_InternalEnum "private" section.
/// @nodoc
class PublicClass_InternalStruct {
  /// @nodoc
  String internal_stringField;
  PublicClass_InternalStruct(this.internal_stringField);
}
// PublicClass_InternalStruct "private" section, not exported.
final _smokePublicclassInternalstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalStruct_create_handle'));
final _smokePublicclassInternalstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalStruct_release_handle'));
final _smokePublicclassInternalstructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalStruct_get_field_stringField'));
Pointer<Void> smokePublicclassInternalstructToFfi(PublicClass_InternalStruct value) {
  final _stringFieldHandle = stringToFfi(value.internal_stringField);
  final _result = _smokePublicclassInternalstructCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
PublicClass_InternalStruct smokePublicclassInternalstructFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokePublicclassInternalstructGetFieldstringField(handle);
  try {
    return PublicClass_InternalStruct(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokePublicclassInternalstructReleaseFfiHandle(Pointer<Void> handle) => _smokePublicclassInternalstructReleaseHandle(handle);
// Nullable PublicClass_InternalStruct
final _smokePublicclassInternalstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalStruct_create_handle_nullable'));
final _smokePublicclassInternalstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalStruct_release_handle_nullable'));
final _smokePublicclassInternalstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_InternalStruct_get_value_nullable'));
Pointer<Void> smokePublicclassInternalstructToFfiNullable(PublicClass_InternalStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublicclassInternalstructToFfi(value);
  final result = _smokePublicclassInternalstructCreateHandleNullable(_handle);
  smokePublicclassInternalstructReleaseFfiHandle(_handle);
  return result;
}
PublicClass_InternalStruct? smokePublicclassInternalstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublicclassInternalstructGetValueNullable(handle);
  final result = smokePublicclassInternalstructFromFfi(_handle);
  smokePublicclassInternalstructReleaseFfiHandle(_handle);
  return result;
}
void smokePublicclassInternalstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicclassInternalstructReleaseHandleNullable(handle);
// End of PublicClass_InternalStruct "private" section.
class PublicClass_PublicStruct {
  /// @nodoc
  PublicClass_InternalStruct internal_internalField;
  PublicClass_PublicStruct(this.internal_internalField);
}
// PublicClass_PublicStruct "private" section, not exported.
final _smokePublicclassPublicstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStruct_create_handle'));
final _smokePublicclassPublicstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStruct_release_handle'));
final _smokePublicclassPublicstructGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStruct_get_field_internalField'));
Pointer<Void> smokePublicclassPublicstructToFfi(PublicClass_PublicStruct value) {
  final _internalFieldHandle = smokePublicclassInternalstructToFfi(value.internal_internalField);
  final _result = _smokePublicclassPublicstructCreateHandle(_internalFieldHandle);
  smokePublicclassInternalstructReleaseFfiHandle(_internalFieldHandle);
  return _result;
}
PublicClass_PublicStruct smokePublicclassPublicstructFromFfi(Pointer<Void> handle) {
  final _internalFieldHandle = _smokePublicclassPublicstructGetFieldinternalField(handle);
  try {
    return PublicClass_PublicStruct(
      smokePublicclassInternalstructFromFfi(_internalFieldHandle)
    );
  } finally {
    smokePublicclassInternalstructReleaseFfiHandle(_internalFieldHandle);
  }
}
void smokePublicclassPublicstructReleaseFfiHandle(Pointer<Void> handle) => _smokePublicclassPublicstructReleaseHandle(handle);
// Nullable PublicClass_PublicStruct
final _smokePublicclassPublicstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStruct_create_handle_nullable'));
final _smokePublicclassPublicstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStruct_release_handle_nullable'));
final _smokePublicclassPublicstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStruct_get_value_nullable'));
Pointer<Void> smokePublicclassPublicstructToFfiNullable(PublicClass_PublicStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublicclassPublicstructToFfi(value);
  final result = _smokePublicclassPublicstructCreateHandleNullable(_handle);
  smokePublicclassPublicstructReleaseFfiHandle(_handle);
  return result;
}
PublicClass_PublicStruct? smokePublicclassPublicstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublicclassPublicstructGetValueNullable(handle);
  final result = smokePublicclassPublicstructFromFfi(_handle);
  smokePublicclassPublicstructReleaseFfiHandle(_handle);
  return result;
}
void smokePublicclassPublicstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicclassPublicstructReleaseHandleNullable(handle);
// End of PublicClass_PublicStruct "private" section.
class PublicClass_PublicStructWithInternalDefaults {
  /// @nodoc
  String internal_internalField;
  double publicField;
  PublicClass_PublicStructWithInternalDefaults(this.internal_internalField, this.publicField);
  PublicClass_PublicStructWithInternalDefaults.withDefaults(double publicField)
    : internal_internalField = "foo", publicField = publicField;
}
// PublicClass_PublicStructWithInternalDefaults "private" section, not exported.
final _smokePublicclassPublicstructwithinternaldefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Float),
    Pointer<Void> Function(Pointer<Void>, double)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_create_handle'));
final _smokePublicclassPublicstructwithinternaldefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_release_handle'));
final _smokePublicclassPublicstructwithinternaldefaultsGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_get_field_internalField'));
final _smokePublicclassPublicstructwithinternaldefaultsGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_get_field_publicField'));
Pointer<Void> smokePublicclassPublicstructwithinternaldefaultsToFfi(PublicClass_PublicStructWithInternalDefaults value) {
  final _internalFieldHandle = stringToFfi(value.internal_internalField);
  final _publicFieldHandle = (value.publicField);
  final _result = _smokePublicclassPublicstructwithinternaldefaultsCreateHandle(_internalFieldHandle, _publicFieldHandle);
  stringReleaseFfiHandle(_internalFieldHandle);
  return _result;
}
PublicClass_PublicStructWithInternalDefaults smokePublicclassPublicstructwithinternaldefaultsFromFfi(Pointer<Void> handle) {
  final _internalFieldHandle = _smokePublicclassPublicstructwithinternaldefaultsGetFieldinternalField(handle);
  final _publicFieldHandle = _smokePublicclassPublicstructwithinternaldefaultsGetFieldpublicField(handle);
  try {
    return PublicClass_PublicStructWithInternalDefaults(
      stringFromFfi(_internalFieldHandle),
      (_publicFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_internalFieldHandle);
  }
}
void smokePublicclassPublicstructwithinternaldefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokePublicclassPublicstructwithinternaldefaultsReleaseHandle(handle);
// Nullable PublicClass_PublicStructWithInternalDefaults
final _smokePublicclassPublicstructwithinternaldefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_create_handle_nullable'));
final _smokePublicclassPublicstructwithinternaldefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_release_handle_nullable'));
final _smokePublicclassPublicstructwithinternaldefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_PublicStructWithInternalDefaults_get_value_nullable'));
Pointer<Void> smokePublicclassPublicstructwithinternaldefaultsToFfiNullable(PublicClass_PublicStructWithInternalDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublicclassPublicstructwithinternaldefaultsToFfi(value);
  final result = _smokePublicclassPublicstructwithinternaldefaultsCreateHandleNullable(_handle);
  smokePublicclassPublicstructwithinternaldefaultsReleaseFfiHandle(_handle);
  return result;
}
PublicClass_PublicStructWithInternalDefaults? smokePublicclassPublicstructwithinternaldefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublicclassPublicstructwithinternaldefaultsGetValueNullable(handle);
  final result = smokePublicclassPublicstructwithinternaldefaultsFromFfi(_handle);
  smokePublicclassPublicstructwithinternaldefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokePublicclassPublicstructwithinternaldefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicclassPublicstructwithinternaldefaultsReleaseHandleNullable(handle);
// End of PublicClass_PublicStructWithInternalDefaults "private" section.
// PublicClass "private" section, not exported.
final _smokePublicclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_PublicClass_register_finalizer'));
final _smokePublicclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicClass_copy_handle'));
final _smokePublicclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicClass_release_handle'));
class PublicClass$Impl extends __lib.NativeBase implements PublicClass {
  PublicClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  PublicClass_InternalStruct internal_internalMethod(PublicClass_InternalStruct input) {
    final _internalMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PublicClass_internalMethod__InternalStruct'));
    final _inputHandle = smokePublicclassInternalstructToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _internalMethodFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smokePublicclassInternalstructReleaseFfiHandle(_inputHandle);
    try {
      return smokePublicclassInternalstructFromFfi(__resultHandle);
    } finally {
      smokePublicclassInternalstructReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  PublicClass_InternalStruct get internal_internalStructProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_PublicClass_internalStructProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokePublicclassInternalstructFromFfi(__resultHandle);
    } finally {
      smokePublicclassInternalstructReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  set internal_internalStructProperty(PublicClass_InternalStruct value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PublicClass_internalStructProperty_set__InternalStruct'));
    final _valueHandle = smokePublicclassInternalstructToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokePublicclassInternalstructReleaseFfiHandle(_valueHandle);
  }
  @override
  String get internalSetterProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_PublicClass_internalSetterProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  set internal_internalSetterProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PublicClass_internalSetterProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
}
Pointer<Void> smokePublicclassToFfi(PublicClass value) =>
  _smokePublicclassCopyHandle((value as __lib.NativeBase).handle);
PublicClass smokePublicclassFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PublicClass) return instance as PublicClass;
  final _copiedHandle = _smokePublicclassCopyHandle(handle);
  final result = PublicClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokePublicclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokePublicclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokePublicclassReleaseHandle(handle);
Pointer<Void> smokePublicclassToFfiNullable(PublicClass? value) =>
  value != null ? smokePublicclassToFfi(value) : Pointer<Void>.fromAddress(0);
PublicClass? smokePublicclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokePublicclassFromFfi(handle) : null;
void smokePublicclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicclassReleaseHandle(handle);
// End of PublicClass "private" section.

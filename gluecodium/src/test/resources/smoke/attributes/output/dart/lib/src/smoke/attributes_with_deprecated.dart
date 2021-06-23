import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
@Deprecated("")
@OnClass
abstract class AttributesWithDeprecated {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  @Deprecated("")
  @OnConstInClass
  static final bool pi = false;
  @Deprecated("")
  @OnFunctionInClass
  void veryFun();
  @Deprecated("")
  @OnPropertyInClass
  String get prop;
  @Deprecated("")
  @OnPropertyInClass
  set prop(String value);
}
class AttributesWithDeprecated_SomeStruct {
  @Deprecated("")
  @OnField
  String field;
  AttributesWithDeprecated_SomeStruct(this.field);
}
// AttributesWithDeprecated_SomeStruct "private" section, not exported.
final _smokeAttributeswithdeprecatedSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_create_handle'));
final _smokeAttributeswithdeprecatedSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_release_handle'));
final _smokeAttributeswithdeprecatedSomestructGetFieldfield = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_get_field_field'));
Pointer<Void> smokeAttributeswithdeprecatedSomestructToFfi(AttributesWithDeprecated_SomeStruct value) {
  final _fieldHandle = stringToFfi(value.field);
  final _result = _smokeAttributeswithdeprecatedSomestructCreateHandle(_fieldHandle);
  stringReleaseFfiHandle(_fieldHandle);
  return _result;
}
AttributesWithDeprecated_SomeStruct smokeAttributeswithdeprecatedSomestructFromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeAttributeswithdeprecatedSomestructGetFieldfield(handle);
  try {
    return AttributesWithDeprecated_SomeStruct(
      stringFromFfi(_fieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_fieldHandle);
  }
}
void smokeAttributeswithdeprecatedSomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeAttributeswithdeprecatedSomestructReleaseHandle(handle);
// Nullable AttributesWithDeprecated_SomeStruct
final _smokeAttributeswithdeprecatedSomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_create_handle_nullable'));
final _smokeAttributeswithdeprecatedSomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_release_handle_nullable'));
final _smokeAttributeswithdeprecatedSomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_get_value_nullable'));
Pointer<Void> smokeAttributeswithdeprecatedSomestructToFfiNullable(AttributesWithDeprecated_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeAttributeswithdeprecatedSomestructToFfi(value);
  final result = _smokeAttributeswithdeprecatedSomestructCreateHandleNullable(_handle);
  smokeAttributeswithdeprecatedSomestructReleaseFfiHandle(_handle);
  return result;
}
AttributesWithDeprecated_SomeStruct? smokeAttributeswithdeprecatedSomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeAttributeswithdeprecatedSomestructGetValueNullable(handle);
  final result = smokeAttributeswithdeprecatedSomestructFromFfi(_handle);
  smokeAttributeswithdeprecatedSomestructReleaseFfiHandle(_handle);
  return result;
}
void smokeAttributeswithdeprecatedSomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAttributeswithdeprecatedSomestructReleaseHandleNullable(handle);
// End of AttributesWithDeprecated_SomeStruct "private" section.
// AttributesWithDeprecated "private" section, not exported.
final _smokeAttributeswithdeprecatedRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_AttributesWithDeprecated_register_finalizer'));
final _smokeAttributeswithdeprecatedCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_copy_handle'));
final _smokeAttributeswithdeprecatedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_release_handle'));
class AttributesWithDeprecated$Impl extends __lib.NativeBase implements AttributesWithDeprecated {
  AttributesWithDeprecated$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  void veryFun() {
    final _veryFunFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AttributesWithDeprecated_veryFun'));
    final _handle = this.handle;
    _veryFunFfi(_handle, __lib.LibraryContext.isolateId);
  }
  @OnPropertyInClass
  @override
  String get prop {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_AttributesWithDeprecated_prop_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @OnPropertyInClass
  @override
  set prop(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesWithDeprecated_prop_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
}
Pointer<Void> smokeAttributeswithdeprecatedToFfi(AttributesWithDeprecated value) =>
  _smokeAttributeswithdeprecatedCopyHandle((value as __lib.NativeBase).handle);
AttributesWithDeprecated smokeAttributeswithdeprecatedFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is AttributesWithDeprecated) return instance as AttributesWithDeprecated;
  final _copiedHandle = _smokeAttributeswithdeprecatedCopyHandle(handle);
  final result = AttributesWithDeprecated$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeAttributeswithdeprecatedRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeAttributeswithdeprecatedReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAttributeswithdeprecatedReleaseHandle(handle);
Pointer<Void> smokeAttributeswithdeprecatedToFfiNullable(AttributesWithDeprecated? value) =>
  value != null ? smokeAttributeswithdeprecatedToFfi(value) : Pointer<Void>.fromAddress(0);
AttributesWithDeprecated? smokeAttributeswithdeprecatedFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeAttributeswithdeprecatedFromFfi(handle) : null;
void smokeAttributeswithdeprecatedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAttributeswithdeprecatedReleaseHandle(handle);
// End of AttributesWithDeprecated "private" section.

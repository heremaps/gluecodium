import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@Deprecated("Unfortunately, this interface is deprecated.")
abstract class DeprecationCommentsOnly {
  DeprecationCommentsOnly();
  factory DeprecationCommentsOnly.fromLambdas({
    @required bool Function(String) lambda_someMethodWithAllComments,
    @required bool Function() lambda_isSomeProperty_get,
    @required void Function(bool) lambda_isSomeProperty_set
  }) => DeprecationCommentsOnly$Lambdas(
    lambda_someMethodWithAllComments,
    lambda_isSomeProperty_get,
    lambda_isSomeProperty_set
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  @Deprecated("Unfortunately, this constant is deprecated.")
  static final bool veryUseful = true;
  /// [input] Very useful input parameter
  ///
  /// Returns [bool]. Usefulness of the input
  ///
  @Deprecated("Unfortunately, this method is deprecated.")
  bool someMethodWithAllComments(String input);
  @Deprecated("Unfortunately, this property's getter is deprecated.")
  bool get isSomeProperty;
  @Deprecated("Unfortunately, this property's setter is deprecated.")
  set isSomeProperty(bool value);
}
@Deprecated("Unfortunately, this enum is deprecated.")
enum DeprecationCommentsOnly_SomeEnum {
    @Deprecated("Unfortunately, this item is deprecated.")
    useless
}
// DeprecationCommentsOnly_SomeEnum "private" section, not exported.
int smoke_DeprecationCommentsOnly_SomeEnum_toFfi(DeprecationCommentsOnly_SomeEnum value) {
  switch (value) {
  case DeprecationCommentsOnly_SomeEnum.useless:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for DeprecationCommentsOnly_SomeEnum enum.");
  }
}
DeprecationCommentsOnly_SomeEnum smoke_DeprecationCommentsOnly_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return DeprecationCommentsOnly_SomeEnum.useless;
  break;
  default:
    throw StateError("Invalid numeric value $handle for DeprecationCommentsOnly_SomeEnum enum.");
  }
}
void smoke_DeprecationCommentsOnly_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_DeprecationCommentsOnly_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_create_handle_nullable'));
final _smoke_DeprecationCommentsOnly_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_release_handle_nullable'));
final _smoke_DeprecationCommentsOnly_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_DeprecationCommentsOnly_SomeEnum_toFfi_nullable(DeprecationCommentsOnly_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DeprecationCommentsOnly_SomeEnum_toFfi(value);
  final result = _smoke_DeprecationCommentsOnly_SomeEnumCreateHandleNullable(_handle);
  smoke_DeprecationCommentsOnly_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
DeprecationCommentsOnly_SomeEnum smoke_DeprecationCommentsOnly_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DeprecationCommentsOnly_SomeEnumGetValueNullable(handle);
  final result = smoke_DeprecationCommentsOnly_SomeEnum_fromFfi(_handle);
  smoke_DeprecationCommentsOnly_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_DeprecationCommentsOnly_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecationCommentsOnly_SomeEnumReleaseHandleNullable(handle);
// End of DeprecationCommentsOnly_SomeEnum "private" section.
@Deprecated("Unfortunately, this struct is deprecated.")
class DeprecationCommentsOnly_SomeStruct {
  @Deprecated("Unfortunately, this field is deprecated.")
  bool someField;
  DeprecationCommentsOnly_SomeStruct(this.someField);
}
// DeprecationCommentsOnly_SomeStruct "private" section, not exported.
final _smokeDeprecationcommentsonlySomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_create_handle'));
final _smokeDeprecationcommentsonlySomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_release_handle'));
final _smokeDeprecationcommentsonlySomestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_get_field_someField'));
Pointer<Void> smoke_DeprecationCommentsOnly_SomeStruct_toFfi(DeprecationCommentsOnly_SomeStruct value) {
  final _someFieldHandle = Boolean_toFfi(value.someField);
  final _result = _smokeDeprecationcommentsonlySomestructCreateHandle(_someFieldHandle);
  Boolean_releaseFfiHandle(_someFieldHandle);
  return _result;
}
DeprecationCommentsOnly_SomeStruct smoke_DeprecationCommentsOnly_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeDeprecationcommentsonlySomestructGetFieldsomeField(handle);
  try {
    return DeprecationCommentsOnly_SomeStruct(
      Boolean_fromFfi(_someFieldHandle)
    );
  } finally {
    Boolean_releaseFfiHandle(_someFieldHandle);
  }
}
void smoke_DeprecationCommentsOnly_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeDeprecationcommentsonlySomestructReleaseHandle(handle);
// Nullable DeprecationCommentsOnly_SomeStruct
final _smoke_DeprecationCommentsOnly_SomeStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_create_handle_nullable'));
final _smoke_DeprecationCommentsOnly_SomeStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_release_handle_nullable'));
final _smoke_DeprecationCommentsOnly_SomeStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_DeprecationCommentsOnly_SomeStruct_toFfi_nullable(DeprecationCommentsOnly_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DeprecationCommentsOnly_SomeStruct_toFfi(value);
  final result = _smoke_DeprecationCommentsOnly_SomeStructCreateHandleNullable(_handle);
  smoke_DeprecationCommentsOnly_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
DeprecationCommentsOnly_SomeStruct smoke_DeprecationCommentsOnly_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DeprecationCommentsOnly_SomeStructGetValueNullable(handle);
  final result = smoke_DeprecationCommentsOnly_SomeStruct_fromFfi(_handle);
  smoke_DeprecationCommentsOnly_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_DeprecationCommentsOnly_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecationCommentsOnly_SomeStructReleaseHandleNullable(handle);
// End of DeprecationCommentsOnly_SomeStruct "private" section.
// DeprecationCommentsOnly "private" section, not exported.
final _smokeDeprecationcommentsonlyCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_copy_handle'));
final _smokeDeprecationcommentsonlyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_release_handle'));
final _smokeDeprecationcommentsonlyCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_DeprecationCommentsOnly_create_proxy'));
final _smokeDeprecationcommentsonlyGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_get_type_id'));
class DeprecationCommentsOnly$Lambdas implements DeprecationCommentsOnly {
  bool Function(String) lambda_someMethodWithAllComments;
  bool Function() lambda_isSomeProperty_get;
  void Function(bool) lambda_isSomeProperty_set;
  DeprecationCommentsOnly$Lambdas(
    this.lambda_someMethodWithAllComments,
    this.lambda_isSomeProperty_get,
    this.lambda_isSomeProperty_set
  );
  @override
  void release() {}
  @override
  bool someMethodWithAllComments(String input) =>
    lambda_someMethodWithAllComments(input);
  @override
  bool get isSomeProperty => lambda_isSomeProperty_get();
  @override
  set isSomeProperty(bool value) => lambda_isSomeProperty_set(value);
}
class DeprecationCommentsOnly$Impl extends __lib.NativeBase implements DeprecationCommentsOnly {
  DeprecationCommentsOnly$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeDeprecationcommentsonlyReleaseHandle(handle);
    handle = null;
  }
  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DeprecationCommentsOnly_someMethodWithAllComments__String'));
    final _inputHandle = String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _someMethodWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @Deprecated("Unfortunately, this property's getter is deprecated.")
  bool get isSomeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_DeprecationCommentsOnly_isSomeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @Deprecated("Unfortunately, this property's setter is deprecated.")
  set isSomeProperty(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_DeprecationCommentsOnly_isSomeProperty_set__Boolean'));
    final _valueHandle = Boolean_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    Boolean_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _DeprecationCommentsOnly_someMethodWithAllComments_static(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  bool _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as DeprecationCommentsOnly).someMethodWithAllComments(String_fromFfi(input));
    _result.value = Boolean_toFfi(_resultObject);
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
int _DeprecationCommentsOnly_isSomeProperty_get_static(int _token, Pointer<Uint8> _result) {
  _result.value = Boolean_toFfi((__lib.instanceCache[_token] as DeprecationCommentsOnly).isSomeProperty);
  return 0;
}
int _DeprecationCommentsOnly_isSomeProperty_set_static(int _token, int _value) {
  try {
    (__lib.instanceCache[_token] as DeprecationCommentsOnly).isSomeProperty =
      Boolean_fromFfi(_value);
  } finally {
    Boolean_releaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smoke_DeprecationCommentsOnly_toFfi(DeprecationCommentsOnly value) {
  if (value is __lib.NativeBase) return _smokeDeprecationcommentsonlyCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeDeprecationcommentsonlyCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_DeprecationCommentsOnly_someMethodWithAllComments_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint8>)>(_DeprecationCommentsOnly_isSomeProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Uint8)>(_DeprecationCommentsOnly_isSomeProperty_set_static, __lib.unknownError)
  );
  return result;
}
DeprecationCommentsOnly smoke_DeprecationCommentsOnly_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as DeprecationCommentsOnly;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeDeprecationcommentsonlyGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeDeprecationcommentsonlyCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DeprecationCommentsOnly$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_DeprecationCommentsOnly_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeDeprecationcommentsonlyReleaseHandle(handle);
Pointer<Void> smoke_DeprecationCommentsOnly_toFfi_nullable(DeprecationCommentsOnly value) =>
  value != null ? smoke_DeprecationCommentsOnly_toFfi(value) : Pointer<Void>.fromAddress(0);
DeprecationCommentsOnly smoke_DeprecationCommentsOnly_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_DeprecationCommentsOnly_fromFfi(handle) : null;
void smoke_DeprecationCommentsOnly_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeDeprecationcommentsonlyReleaseHandle(handle);
// End of DeprecationCommentsOnly "private" section.

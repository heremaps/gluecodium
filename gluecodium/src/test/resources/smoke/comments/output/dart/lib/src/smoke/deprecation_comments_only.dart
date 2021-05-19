import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
@Deprecated("Unfortunately, this interface is deprecated.")
abstract class DeprecationCommentsOnly {
  DeprecationCommentsOnly();
  factory DeprecationCommentsOnly.fromLambdas({
    required bool Function(String) lambda_someMethodWithAllComments,
    required bool Function() lambda_isSomeProperty_get,
    required void Function(bool) lambda_isSomeProperty_set
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
int smokeDeprecationcommentsonlySomeenumToFfi(DeprecationCommentsOnly_SomeEnum value) {
  switch (value) {
  case DeprecationCommentsOnly_SomeEnum.useless:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for DeprecationCommentsOnly_SomeEnum enum.");
  }
}
DeprecationCommentsOnly_SomeEnum smokeDeprecationcommentsonlySomeenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return DeprecationCommentsOnly_SomeEnum.useless;
  break;
  default:
    throw StateError("Invalid numeric value $handle for DeprecationCommentsOnly_SomeEnum enum.");
  }
}
void smokeDeprecationcommentsonlySomeenumReleaseFfiHandle(int handle) {}
final _smokeDeprecationcommentsonlySomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_create_handle_nullable'));
final _smokeDeprecationcommentsonlySomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_release_handle_nullable'));
final _smokeDeprecationcommentsonlySomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_get_value_nullable'));
Pointer<Void> smokeDeprecationcommentsonlySomeenumToFfiNullable(DeprecationCommentsOnly_SomeEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDeprecationcommentsonlySomeenumToFfi(value);
  final result = _smokeDeprecationcommentsonlySomeenumCreateHandleNullable(_handle);
  smokeDeprecationcommentsonlySomeenumReleaseFfiHandle(_handle);
  return result;
}
DeprecationCommentsOnly_SomeEnum? smokeDeprecationcommentsonlySomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDeprecationcommentsonlySomeenumGetValueNullable(handle);
  final result = smokeDeprecationcommentsonlySomeenumFromFfi(_handle);
  smokeDeprecationcommentsonlySomeenumReleaseFfiHandle(_handle);
  return result;
}
void smokeDeprecationcommentsonlySomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecationcommentsonlySomeenumReleaseHandleNullable(handle);
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
Pointer<Void> smokeDeprecationcommentsonlySomestructToFfi(DeprecationCommentsOnly_SomeStruct value) {
  final _someFieldHandle = booleanToFfi(value.someField);
  final _result = _smokeDeprecationcommentsonlySomestructCreateHandle(_someFieldHandle);
  booleanReleaseFfiHandle(_someFieldHandle);
  return _result;
}
DeprecationCommentsOnly_SomeStruct smokeDeprecationcommentsonlySomestructFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeDeprecationcommentsonlySomestructGetFieldsomeField(handle);
  try {
    return DeprecationCommentsOnly_SomeStruct(
      booleanFromFfi(_someFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_someFieldHandle);
  }
}
void smokeDeprecationcommentsonlySomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeDeprecationcommentsonlySomestructReleaseHandle(handle);
// Nullable DeprecationCommentsOnly_SomeStruct
final _smokeDeprecationcommentsonlySomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_create_handle_nullable'));
final _smokeDeprecationcommentsonlySomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_release_handle_nullable'));
final _smokeDeprecationcommentsonlySomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_get_value_nullable'));
Pointer<Void> smokeDeprecationcommentsonlySomestructToFfiNullable(DeprecationCommentsOnly_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDeprecationcommentsonlySomestructToFfi(value);
  final result = _smokeDeprecationcommentsonlySomestructCreateHandleNullable(_handle);
  smokeDeprecationcommentsonlySomestructReleaseFfiHandle(_handle);
  return result;
}
DeprecationCommentsOnly_SomeStruct? smokeDeprecationcommentsonlySomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDeprecationcommentsonlySomestructGetValueNullable(handle);
  final result = smokeDeprecationcommentsonlySomestructFromFfi(_handle);
  smokeDeprecationcommentsonlySomestructReleaseFfiHandle(_handle);
  return result;
}
void smokeDeprecationcommentsonlySomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecationcommentsonlySomestructReleaseHandleNullable(handle);
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
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeDeprecationcommentsonlyReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DeprecationCommentsOnly_someMethodWithAllComments__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _someMethodWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @Deprecated("Unfortunately, this property's getter is deprecated.")
  bool get isSomeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_DeprecationCommentsOnly_isSomeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @Deprecated("Unfortunately, this property's setter is deprecated.")
  set isSomeProperty(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_DeprecationCommentsOnly_isSomeProperty_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
int _smokeDeprecationcommentsonlysomeMethodWithAllCommentsStatic(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as DeprecationCommentsOnly).someMethodWithAllComments(stringFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
int _smokeDeprecationcommentsonlyisSomePropertyGetStatic(int _token, Pointer<Uint8> _result) {
  _result.value = booleanToFfi((__lib.instanceCache[_token] as DeprecationCommentsOnly).isSomeProperty);
  return 0;
}
int _smokeDeprecationcommentsonlyisSomePropertySetStatic(int _token, int _value) {
  try {
    (__lib.instanceCache[_token] as DeprecationCommentsOnly).isSomeProperty =
      booleanFromFfi(_value);
  } finally {
    booleanReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeDeprecationcommentsonlyToFfi(DeprecationCommentsOnly value) {
  if (value is __lib.NativeBase) return _smokeDeprecationcommentsonlyCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeDeprecationcommentsonlyCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_smokeDeprecationcommentsonlysomeMethodWithAllCommentsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint8>)>(_smokeDeprecationcommentsonlyisSomePropertyGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Uint8)>(_smokeDeprecationcommentsonlyisSomePropertySetStatic, __lib.unknownError)
  );
  return result;
}
DeprecationCommentsOnly smokeDeprecationcommentsonlyFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is DeprecationCommentsOnly) return instance;
  final _typeIdHandle = _smokeDeprecationcommentsonlyGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeDeprecationcommentsonlyCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DeprecationCommentsOnly$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeDeprecationcommentsonlyReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeDeprecationcommentsonlyReleaseHandle(handle);
Pointer<Void> smokeDeprecationcommentsonlyToFfiNullable(DeprecationCommentsOnly? value) =>
  value != null ? smokeDeprecationcommentsonlyToFfi(value) : Pointer<Void>.fromAddress(0);
DeprecationCommentsOnly? smokeDeprecationcommentsonlyFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeDeprecationcommentsonlyFromFfi(handle) : null;
void smokeDeprecationcommentsonlyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecationcommentsonlyReleaseHandle(handle);
// End of DeprecationCommentsOnly "private" section.

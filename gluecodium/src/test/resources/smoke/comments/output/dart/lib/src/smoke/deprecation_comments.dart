import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
/// This is some very useful interface.
@Deprecated("Unfortunately, this interface is deprecated. Use [Comments] instead.")
abstract class DeprecationComments {
  DeprecationComments();
  factory DeprecationComments.fromLambdas({
    @required bool Function(String) lambda_someMethodWithAllComments,
    @required bool Function() lambda_isSomeProperty_get,
    @required void Function(bool) lambda_isSomeProperty_set,
    @required String Function() lambda_propertyButNotAccessors_get,
    @required void Function(String) lambda_propertyButNotAccessors_set
  }) => DeprecationComments$Lambdas(
    lambda_someMethodWithAllComments,
    lambda_isSomeProperty_get,
    lambda_isSomeProperty_set,
    lambda_propertyButNotAccessors_get,
    lambda_propertyButNotAccessors_set
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  /// This is some very useful constant.
  @Deprecated("Unfortunately, this constant is deprecated. Use [Comments.veryUseful] instead.")
  static final bool veryUseful = true;
  /// This is some very useful method that measures the usefulness of its input.
  ///
  /// [input] Very useful input parameter
  ///
  /// Returns [bool]. Usefulness of the input
  ///
  @Deprecated("Unfortunately, this method is deprecated.\nUse [Comments.someMethodWithAllComments] instead.")
  bool someMethodWithAllComments(String input);
  /// Gets some very useful property.
  @Deprecated("Unfortunately, this property's getter is deprecated.\nUse [Comments.isSomeProperty] instead.")
  bool get isSomeProperty;
  /// Sets some very useful property.
  @Deprecated("Unfortunately, this property's setter is deprecated.\nUse [Comments.isSomeProperty] instead.")
  set isSomeProperty(bool value);
  /// Gets the property but not accessors.
  @Deprecated("Will be removed in v3.2.1.")
  String get propertyButNotAccessors;
  @Deprecated("Will be removed in v3.2.1.")
  set propertyButNotAccessors(String value);
}
/// This is some very useful enum.
@Deprecated("Unfortunately, this enum is deprecated. Use [Comments_SomeEnum] instead.")
enum DeprecationComments_SomeEnum {
    /// Not quite useful
    @Deprecated("Unfortunately, this item is deprecated.\nUse [Comments_SomeEnum.useless] instead.")
    useless
}
// DeprecationComments_SomeEnum "private" section, not exported.
int smokeDeprecationcommentsSomeenumToFfi(DeprecationComments_SomeEnum value) {
  switch (value) {
  case DeprecationComments_SomeEnum.useless:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for DeprecationComments_SomeEnum enum.");
  }
}
DeprecationComments_SomeEnum smokeDeprecationcommentsSomeenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return DeprecationComments_SomeEnum.useless;
  break;
  default:
    throw StateError("Invalid numeric value $handle for DeprecationComments_SomeEnum enum.");
  }
}
void smokeDeprecationcommentsSomeenumReleaseFfiHandle(int handle) {}
final _smokeDeprecationcommentsSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationComments_SomeEnum_create_handle_nullable'));
final _smokeDeprecationcommentsSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeEnum_release_handle_nullable'));
final _smokeDeprecationcommentsSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeEnum_get_value_nullable'));
Pointer<Void> smokeDeprecationcommentsSomeenumToFfiNullable(DeprecationComments_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDeprecationcommentsSomeenumToFfi(value);
  final result = _smokeDeprecationcommentsSomeenumCreateHandleNullable(_handle);
  smokeDeprecationcommentsSomeenumReleaseFfiHandle(_handle);
  return result;
}
DeprecationComments_SomeEnum smokeDeprecationcommentsSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDeprecationcommentsSomeenumGetValueNullable(handle);
  final result = smokeDeprecationcommentsSomeenumFromFfi(_handle);
  smokeDeprecationcommentsSomeenumReleaseFfiHandle(_handle);
  return result;
}
void smokeDeprecationcommentsSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecationcommentsSomeenumReleaseHandleNullable(handle);
// End of DeprecationComments_SomeEnum "private" section.
@Deprecated("Unfortunately, this exception is deprecated, please use [Comments_SomethingWrongException] instead.")
class DeprecationComments_SomethingWrongException implements Exception {
  final DeprecationComments_SomeEnum error;
  DeprecationComments_SomethingWrongException(this.error);
}
/// This is some very useful struct.
@Deprecated("Unfortunately, this struct is deprecated. Use [Comments_SomeStruct] instead.")
class DeprecationComments_SomeStruct {
  /// How useful this struct is.
  @Deprecated("Unfortunately, this field is deprecated.\nUse [Comments_SomeStruct.someField] instead.")
  bool someField;
  DeprecationComments_SomeStruct(this.someField);
}
// DeprecationComments_SomeStruct "private" section, not exported.
final _smokeDeprecationcommentsSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationComments_SomeStruct_create_handle'));
final _smokeDeprecationcommentsSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeStruct_release_handle'));
final _smokeDeprecationcommentsSomestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeStruct_get_field_someField'));
Pointer<Void> smokeDeprecationcommentsSomestructToFfi(DeprecationComments_SomeStruct value) {
  final _someFieldHandle = booleanToFfi(value.someField);
  final _result = _smokeDeprecationcommentsSomestructCreateHandle(_someFieldHandle);
  booleanReleaseFfiHandle(_someFieldHandle);
  return _result;
}
DeprecationComments_SomeStruct smokeDeprecationcommentsSomestructFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeDeprecationcommentsSomestructGetFieldsomeField(handle);
  try {
    return DeprecationComments_SomeStruct(
      booleanFromFfi(_someFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_someFieldHandle);
  }
}
void smokeDeprecationcommentsSomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeDeprecationcommentsSomestructReleaseHandle(handle);
// Nullable DeprecationComments_SomeStruct
final _smokeDeprecationcommentsSomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeStruct_create_handle_nullable'));
final _smokeDeprecationcommentsSomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeStruct_release_handle_nullable'));
final _smokeDeprecationcommentsSomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeStruct_get_value_nullable'));
Pointer<Void> smokeDeprecationcommentsSomestructToFfiNullable(DeprecationComments_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDeprecationcommentsSomestructToFfi(value);
  final result = _smokeDeprecationcommentsSomestructCreateHandleNullable(_handle);
  smokeDeprecationcommentsSomestructReleaseFfiHandle(_handle);
  return result;
}
DeprecationComments_SomeStruct smokeDeprecationcommentsSomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDeprecationcommentsSomestructGetValueNullable(handle);
  final result = smokeDeprecationcommentsSomestructFromFfi(_handle);
  smokeDeprecationcommentsSomestructReleaseFfiHandle(_handle);
  return result;
}
void smokeDeprecationcommentsSomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecationcommentsSomestructReleaseHandleNullable(handle);
// End of DeprecationComments_SomeStruct "private" section.
// DeprecationComments "private" section, not exported.
final _smokeDeprecationcommentsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_copy_handle'));
final _smokeDeprecationcommentsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_release_handle'));
final _smokeDeprecationcommentsCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_DeprecationComments_create_proxy'));
final _smokeDeprecationcommentsGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_get_type_id'));
class DeprecationComments$Lambdas implements DeprecationComments {
  bool Function(String) lambda_someMethodWithAllComments;
  bool Function() lambda_isSomeProperty_get;
  void Function(bool) lambda_isSomeProperty_set;
  String Function() lambda_propertyButNotAccessors_get;
  void Function(String) lambda_propertyButNotAccessors_set;
  DeprecationComments$Lambdas(
    this.lambda_someMethodWithAllComments,
    this.lambda_isSomeProperty_get,
    this.lambda_isSomeProperty_set,
    this.lambda_propertyButNotAccessors_get,
    this.lambda_propertyButNotAccessors_set
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
  @override
  String get propertyButNotAccessors => lambda_propertyButNotAccessors_get();
  @override
  set propertyButNotAccessors(String value) => lambda_propertyButNotAccessors_set(value);
}
class DeprecationComments$Impl extends __lib.NativeBase implements DeprecationComments {
  DeprecationComments$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeDeprecationcommentsReleaseHandle(handle);
    handle = null;
  }
  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DeprecationComments_someMethodWithAllComments__String'));
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
  /// Gets some very useful property.
  @Deprecated("Unfortunately, this property's getter is deprecated.\nUse [Comments.isSomeProperty] instead.")
  bool get isSomeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_DeprecationComments_isSomeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  /// Sets some very useful property.
  @Deprecated("Unfortunately, this property's setter is deprecated.\nUse [Comments.isSomeProperty] instead.")
  set isSomeProperty(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_DeprecationComments_isSomeProperty_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  /// Gets the property but not accessors.
  @Deprecated("Will be removed in v3.2.1.")
  String get propertyButNotAccessors {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_DeprecationComments_propertyButNotAccessors_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @Deprecated("Will be removed in v3.2.1.")
  set propertyButNotAccessors(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DeprecationComments_propertyButNotAccessors_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
int _DeprecationCommentssomeMethodWithAllCommentsStatic(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  bool _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as DeprecationComments).someMethodWithAllComments(stringFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
int _DeprecationCommentsisSomePropertyGetStatic(int _token, Pointer<Uint8> _result) {
  _result.value = booleanToFfi((__lib.instanceCache[_token] as DeprecationComments).isSomeProperty);
  return 0;
}
int _DeprecationCommentsisSomePropertySetStatic(int _token, int _value) {
  try {
    (__lib.instanceCache[_token] as DeprecationComments).isSomeProperty =
      booleanFromFfi(_value);
  } finally {
    booleanReleaseFfiHandle(_value);
  }
  return 0;
}
int _DeprecationCommentspropertyButNotAccessorsGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((__lib.instanceCache[_token] as DeprecationComments).propertyButNotAccessors);
  return 0;
}
int _DeprecationCommentspropertyButNotAccessorsSetStatic(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as DeprecationComments).propertyButNotAccessors =
      stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeDeprecationcommentsToFfi(DeprecationComments value) {
  if (value is __lib.NativeBase) return _smokeDeprecationcommentsCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeDeprecationcommentsCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_DeprecationCommentssomeMethodWithAllCommentsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint8>)>(_DeprecationCommentsisSomePropertyGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Uint8)>(_DeprecationCommentsisSomePropertySetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_DeprecationCommentspropertyButNotAccessorsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_DeprecationCommentspropertyButNotAccessorsSetStatic, __lib.unknownError)
  );
  return result;
}
DeprecationComments smokeDeprecationcommentsFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as DeprecationComments;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeDeprecationcommentsGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeDeprecationcommentsCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DeprecationComments$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeDeprecationcommentsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeDeprecationcommentsReleaseHandle(handle);
Pointer<Void> smokeDeprecationcommentsToFfiNullable(DeprecationComments value) =>
  value != null ? smokeDeprecationcommentsToFfi(value) : Pointer<Void>.fromAddress(0);
DeprecationComments smokeDeprecationcommentsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeDeprecationcommentsFromFfi(handle) : null;
void smokeDeprecationcommentsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecationcommentsReleaseHandle(handle);
// End of DeprecationComments "private" section.

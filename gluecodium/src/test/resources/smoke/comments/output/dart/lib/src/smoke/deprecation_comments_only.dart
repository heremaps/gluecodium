import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
@Deprecated("Unfortunately, this interface is deprecated.")
abstract class DeprecationCommentsOnly {
  factory DeprecationCommentsOnly(
    bool Function(String) someMethodWithAllCommentsLambda,
    bool Function() isSomePropertyGetLambda,
    void Function(bool) isSomePropertySetLambda
  ) => DeprecationCommentsOnly$Lambdas(
    someMethodWithAllCommentsLambda,
    isSomePropertyGetLambda,
    isSomePropertySetLambda
  );
  /// @nodoc
  @Deprecated("Does nothing")
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
  // ignore: deprecated_member_use_from_same_package
    return 0;
  default:
    throw StateError("Invalid enum value $value for DeprecationCommentsOnly_SomeEnum enum.");
  }
}
DeprecationCommentsOnly_SomeEnum smokeDeprecationcommentsonlySomeenumFromFfi(int handle) {
  switch (handle) {
  // ignore: deprecated_member_use_from_same_package
  case 0:
    return DeprecationCommentsOnly_SomeEnum.useless;
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
final _smokeDeprecationcommentsonlyRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_DeprecationCommentsOnly_register_finalizer'));
final _smokeDeprecationcommentsonlyCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_copy_handle'));
final _smokeDeprecationcommentsonlyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_release_handle'));
final _smokeDeprecationcommentsonlyCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
  >('library_smoke_DeprecationCommentsOnly_create_proxy'));
final _smokeDeprecationcommentsonlyGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_get_type_id'));
class DeprecationCommentsOnly$Lambdas implements DeprecationCommentsOnly {
  bool Function(String) someMethodWithAllCommentsLambda;
  bool Function() isSomePropertyGetLambda;
  void Function(bool) isSomePropertySetLambda;
  DeprecationCommentsOnly$Lambdas(
    this.someMethodWithAllCommentsLambda,
    this.isSomePropertyGetLambda,
    this.isSomePropertySetLambda
  );
  @override
  void release() {}
  @override
  bool someMethodWithAllComments(String input) =>
    someMethodWithAllCommentsLambda(input);
  @override
  bool get isSomeProperty => isSomePropertyGetLambda();
  @override
  set isSomeProperty(bool value) => isSomePropertySetLambda(value);
}
class DeprecationCommentsOnly$Impl extends __lib.NativeBase implements DeprecationCommentsOnly {
  DeprecationCommentsOnly$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
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
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);
  }
}
int _smokeDeprecationcommentsonlysomeMethodWithAllCommentsStatic(Object _obj, Pointer<Void> input, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as DeprecationCommentsOnly).someMethodWithAllComments(stringFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
int _smokeDeprecationcommentsonlyisSomePropertyGetStatic(Object _obj, Pointer<Uint8> _result) {
  _result.value = booleanToFfi((_obj as DeprecationCommentsOnly).isSomeProperty);
  return 0;
}
int _smokeDeprecationcommentsonlyisSomePropertySetStatic(Object _obj, int _value) {
  try {
    (_obj as DeprecationCommentsOnly).isSomeProperty =
      booleanFromFfi(_value);
  } finally {
    booleanReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeDeprecationcommentsonlyToFfi(DeprecationCommentsOnly value) {
  if (value is __lib.NativeBase) return _smokeDeprecationcommentsonlyCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeDeprecationcommentsonlyCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Uint8>)>(_smokeDeprecationcommentsonlysomeMethodWithAllCommentsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_smokeDeprecationcommentsonlyisSomePropertyGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint8)>(_smokeDeprecationcommentsonlyisSomePropertySetStatic, __lib.unknownError)
  );
  return result;
}
DeprecationCommentsOnly smokeDeprecationcommentsonlyFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DeprecationCommentsOnly) return instance;
  final _typeIdHandle = _smokeDeprecationcommentsonlyGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeDeprecationcommentsonlyCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DeprecationCommentsOnly$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeDeprecationcommentsonlyRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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

import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@Deprecated("Unfortunately, this interface is deprecated.")
abstract class DeprecationCommentsOnly {
  DeprecationCommentsOnly() {}
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
  /// Returns [bool]. Usefulness of the input
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
final _smoke_DeprecationCommentsOnly_SomeEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_create_handle_nullable'));
final _smoke_DeprecationCommentsOnly_SomeEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_release_handle_nullable'));
final _smoke_DeprecationCommentsOnly_SomeEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_DeprecationCommentsOnly_SomeEnum_toFfi_nullable(DeprecationCommentsOnly_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DeprecationCommentsOnly_SomeEnum_toFfi(value);
  final result = _smoke_DeprecationCommentsOnly_SomeEnum_create_handle_nullable(_handle);
  smoke_DeprecationCommentsOnly_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
DeprecationCommentsOnly_SomeEnum smoke_DeprecationCommentsOnly_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DeprecationCommentsOnly_SomeEnum_get_value_nullable(handle);
  final result = smoke_DeprecationCommentsOnly_SomeEnum_fromFfi(_handle);
  smoke_DeprecationCommentsOnly_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_DeprecationCommentsOnly_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecationCommentsOnly_SomeEnum_release_handle_nullable(handle);
// End of DeprecationCommentsOnly_SomeEnum "private" section.
@Deprecated("Unfortunately, this struct is deprecated.")
class DeprecationCommentsOnly_SomeStruct {
  @Deprecated("Unfortunately, this field is deprecated.")
  bool someField;
  DeprecationCommentsOnly_SomeStruct(this.someField);
}
// DeprecationCommentsOnly_SomeStruct "private" section, not exported.
final _smoke_DeprecationCommentsOnly_SomeStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_create_handle'));
final _smoke_DeprecationCommentsOnly_SomeStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_release_handle'));
final _smoke_DeprecationCommentsOnly_SomeStruct_get_field_someField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_get_field_someField'));
Pointer<Void> smoke_DeprecationCommentsOnly_SomeStruct_toFfi(DeprecationCommentsOnly_SomeStruct value) {
  final _someField_handle = Boolean_toFfi(value.someField);
  final _result = _smoke_DeprecationCommentsOnly_SomeStruct_create_handle(_someField_handle);
  Boolean_releaseFfiHandle(_someField_handle);
  return _result;
}
DeprecationCommentsOnly_SomeStruct smoke_DeprecationCommentsOnly_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_DeprecationCommentsOnly_SomeStruct_get_field_someField(handle);
  try {
    return DeprecationCommentsOnly_SomeStruct(
      Boolean_fromFfi(_someField_handle)
    );
  } finally {
    Boolean_releaseFfiHandle(_someField_handle);
  }
}
void smoke_DeprecationCommentsOnly_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_DeprecationCommentsOnly_SomeStruct_release_handle(handle);
// Nullable DeprecationCommentsOnly_SomeStruct
final _smoke_DeprecationCommentsOnly_SomeStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_create_handle_nullable'));
final _smoke_DeprecationCommentsOnly_SomeStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_release_handle_nullable'));
final _smoke_DeprecationCommentsOnly_SomeStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_DeprecationCommentsOnly_SomeStruct_toFfi_nullable(DeprecationCommentsOnly_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DeprecationCommentsOnly_SomeStruct_toFfi(value);
  final result = _smoke_DeprecationCommentsOnly_SomeStruct_create_handle_nullable(_handle);
  smoke_DeprecationCommentsOnly_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
DeprecationCommentsOnly_SomeStruct smoke_DeprecationCommentsOnly_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DeprecationCommentsOnly_SomeStruct_get_value_nullable(handle);
  final result = smoke_DeprecationCommentsOnly_SomeStruct_fromFfi(_handle);
  smoke_DeprecationCommentsOnly_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_DeprecationCommentsOnly_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecationCommentsOnly_SomeStruct_release_handle_nullable(handle);
// End of DeprecationCommentsOnly_SomeStruct "private" section.
// DeprecationCommentsOnly "private" section, not exported.
final _smoke_DeprecationCommentsOnly_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_copy_handle'));
final _smoke_DeprecationCommentsOnly_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_release_handle'));
final _smoke_DeprecationCommentsOnly_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_DeprecationCommentsOnly_create_proxy'));
final _smoke_DeprecationCommentsOnly_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_DeprecationCommentsOnly_get_raw_pointer'));
final _smoke_DeprecationCommentsOnly_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_get_type_id'));
class DeprecationCommentsOnly$Lambdas implements DeprecationCommentsOnly {
  bool Function(String) lambda_someMethodWithAllComments;
  bool Function() lambda_isSomeProperty_get;
  void Function(bool) lambda_isSomeProperty_set;
  DeprecationCommentsOnly$Lambdas(
    bool Function(String) lambda_someMethodWithAllComments,
    bool Function() lambda_isSomeProperty_get,
    void Function(bool) lambda_isSomeProperty_set
  ) {
    this.lambda_someMethodWithAllComments = lambda_someMethodWithAllComments;
    this.lambda_isSomeProperty_get = lambda_isSomeProperty_get;
    this.lambda_isSomeProperty_set = lambda_isSomeProperty_set;
  }
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
class DeprecationCommentsOnly$Impl implements DeprecationCommentsOnly {
  @protected
  Pointer<Void> handle;
  DeprecationCommentsOnly$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_DeprecationCommentsOnly_get_raw_pointer(handle));
    _smoke_DeprecationCommentsOnly_release_handle(handle);
    handle = null;
  }
  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllComments_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DeprecationCommentsOnly_someMethodWithAllComments__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithAllComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  @Deprecated("Unfortunately, this property's getter is deprecated.")
  bool get isSomeProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_DeprecationCommentsOnly_isSomeProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  @Deprecated("Unfortunately, this property's setter is deprecated.")
  set isSomeProperty(bool value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_DeprecationCommentsOnly_isSomeProperty_set__Boolean'));
    final _value_handle = Boolean_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    Boolean_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
int _DeprecationCommentsOnly_someMethodWithAllComments_static(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  bool _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as DeprecationCommentsOnly).someMethodWithAllComments(String_fromFfi(input));
    _result.value = Boolean_toFfi(_result_object);
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
  if (value is DeprecationCommentsOnly$Impl) return _smoke_DeprecationCommentsOnly_copy_handle(value.handle);
  final result = _smoke_DeprecationCommentsOnly_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_DeprecationCommentsOnly_someMethodWithAllComments_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint8>)>(_DeprecationCommentsOnly_isSomeProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Uint8)>(_DeprecationCommentsOnly_isSomeProperty_set_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_DeprecationCommentsOnly_get_raw_pointer(result)] = value;
  return result;
}
DeprecationCommentsOnly smoke_DeprecationCommentsOnly_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_DeprecationCommentsOnly_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as DeprecationCommentsOnly;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_DeprecationCommentsOnly_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_DeprecationCommentsOnly_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : DeprecationCommentsOnly$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_DeprecationCommentsOnly_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_DeprecationCommentsOnly_release_handle(handle);
Pointer<Void> smoke_DeprecationCommentsOnly_toFfi_nullable(DeprecationCommentsOnly value) =>
  value != null ? smoke_DeprecationCommentsOnly_toFfi(value) : Pointer<Void>.fromAddress(0);
DeprecationCommentsOnly smoke_DeprecationCommentsOnly_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_DeprecationCommentsOnly_fromFfi(handle) : null;
void smoke_DeprecationCommentsOnly_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecationCommentsOnly_release_handle(handle);
// End of DeprecationCommentsOnly "private" section.

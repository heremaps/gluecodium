import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
/// Class comment
@OnClass
abstract class AttributesWithComments {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// Const comment
  @OnConstInClass
  static final bool pi = false;
  /// Function comment
  ///
  @OnFunctionInClass
  veryFun();
  /// Getter comment
  @OnPropertyInClass
  String get prop;
  /// Setter comment
  @OnPropertyInClass
  set prop(String value);
}
class AttributesWithComments_SomeStruct {
  /// Field comment
  @OnField
  String field;
  AttributesWithComments_SomeStruct(this.field);
}
// AttributesWithComments_SomeStruct "private" section, not exported.
final _smokeAttributeswithcommentsSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_SomeStruct_create_handle'));
final _smokeAttributeswithcommentsSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_SomeStruct_release_handle'));
final _smokeAttributeswithcommentsSomestructGetFieldfield = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_SomeStruct_get_field_field'));
Pointer<Void> smokeAttributeswithcommentsSomestructToFfi(AttributesWithComments_SomeStruct value) {
  final _fieldHandle = stringToFfi(value.field);
  final _result = _smokeAttributeswithcommentsSomestructCreateHandle(_fieldHandle);
  stringReleaseFfiHandle(_fieldHandle);
  return _result;
}
AttributesWithComments_SomeStruct smokeAttributeswithcommentsSomestructFromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeAttributeswithcommentsSomestructGetFieldfield(handle);
  try {
    return AttributesWithComments_SomeStruct(
      stringFromFfi(_fieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_fieldHandle);
  }
}
void smokeAttributeswithcommentsSomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeAttributeswithcommentsSomestructReleaseHandle(handle);
// Nullable AttributesWithComments_SomeStruct
final _smokeAttributeswithcommentsSomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_SomeStruct_create_handle_nullable'));
final _smokeAttributeswithcommentsSomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_SomeStruct_release_handle_nullable'));
final _smokeAttributeswithcommentsSomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_SomeStruct_get_value_nullable'));
Pointer<Void> smokeAttributeswithcommentsSomestructToFfiNullable(AttributesWithComments_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeAttributeswithcommentsSomestructToFfi(value);
  final result = _smokeAttributeswithcommentsSomestructCreateHandleNullable(_handle);
  smokeAttributeswithcommentsSomestructReleaseFfiHandle(_handle);
  return result;
}
AttributesWithComments_SomeStruct smokeAttributeswithcommentsSomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeAttributeswithcommentsSomestructGetValueNullable(handle);
  final result = smokeAttributeswithcommentsSomestructFromFfi(_handle);
  smokeAttributeswithcommentsSomestructReleaseFfiHandle(_handle);
  return result;
}
void smokeAttributeswithcommentsSomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAttributeswithcommentsSomestructReleaseHandleNullable(handle);
// End of AttributesWithComments_SomeStruct "private" section.
// AttributesWithComments "private" section, not exported.
final _smokeAttributeswithcommentsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_copy_handle'));
final _smokeAttributeswithcommentsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_release_handle'));
class AttributesWithComments$Impl extends __lib.NativeBase implements AttributesWithComments {
  AttributesWithComments$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeAttributeswithcommentsReleaseHandle(handle);
    handle = null;
  }
  @override
  veryFun() {
    final _veryFunFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AttributesWithComments_veryFun'));
    final _handle = this.handle;
    final __resultHandle = _veryFunFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @OnPropertyInClass
  @override
  String get prop {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_AttributesWithComments_prop_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesWithComments_prop_set__String'));
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
Pointer<Void> smokeAttributeswithcommentsToFfi(AttributesWithComments value) =>
  _smokeAttributeswithcommentsCopyHandle((value as __lib.NativeBase).handle);
AttributesWithComments smokeAttributeswithcommentsFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as AttributesWithComments;
  if (instance != null) return instance;
  final _copiedHandle = _smokeAttributeswithcommentsCopyHandle(handle);
  final result = AttributesWithComments$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeAttributeswithcommentsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAttributeswithcommentsReleaseHandle(handle);
Pointer<Void> smokeAttributeswithcommentsToFfiNullable(AttributesWithComments value) =>
  value != null ? smokeAttributeswithcommentsToFfi(value) : Pointer<Void>.fromAddress(0);
AttributesWithComments smokeAttributeswithcommentsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeAttributeswithcommentsFromFfi(handle) : null;
void smokeAttributeswithcommentsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAttributeswithcommentsReleaseHandle(handle);
// End of AttributesWithComments "private" section.

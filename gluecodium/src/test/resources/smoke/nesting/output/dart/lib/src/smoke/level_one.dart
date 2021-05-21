import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/outer_class.dart';
import 'package:library/src/smoke/outer_interface.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
abstract class LevelOne {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
}
abstract class LevelOne_LevelTwo {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
}
abstract class LevelOne_LevelTwo_LevelThree {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  OuterInterface_InnerClass foo(OuterClass_InnerInterface input);
}
enum LevelOne_LevelTwo_LevelThree_LevelFourEnum {
    none
}
// LevelOne_LevelTwo_LevelThree_LevelFourEnum "private" section, not exported.
int smokeLeveloneLeveltwoLevelthreeLevelfourenumToFfi(LevelOne_LevelTwo_LevelThree_LevelFourEnum value) {
  switch (value) {
  case LevelOne_LevelTwo_LevelThree_LevelFourEnum.none:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for LevelOne_LevelTwo_LevelThree_LevelFourEnum enum.");
  }
}
LevelOne_LevelTwo_LevelThree_LevelFourEnum smokeLeveloneLeveltwoLevelthreeLevelfourenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LevelOne_LevelTwo_LevelThree_LevelFourEnum.none;
  break;
  default:
    throw StateError("Invalid numeric value $handle for LevelOne_LevelTwo_LevelThree_LevelFourEnum enum.");
  }
}
void smokeLeveloneLeveltwoLevelthreeLevelfourenumReleaseFfiHandle(int handle) {}
final _smokeLeveloneLeveltwoLevelthreeLevelfourenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_create_handle_nullable'));
final _smokeLeveloneLeveltwoLevelthreeLevelfourenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_release_handle_nullable'));
final _smokeLeveloneLeveltwoLevelthreeLevelfourenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_get_value_nullable'));
Pointer<Void> smokeLeveloneLeveltwoLevelthreeLevelfourenumToFfiNullable(LevelOne_LevelTwo_LevelThree_LevelFourEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLeveloneLeveltwoLevelthreeLevelfourenumToFfi(value);
  final result = _smokeLeveloneLeveltwoLevelthreeLevelfourenumCreateHandleNullable(_handle);
  smokeLeveloneLeveltwoLevelthreeLevelfourenumReleaseFfiHandle(_handle);
  return result;
}
LevelOne_LevelTwo_LevelThree_LevelFourEnum smokeLeveloneLeveltwoLevelthreeLevelfourenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLeveloneLeveltwoLevelthreeLevelfourenumGetValueNullable(handle);
  final result = smokeLeveloneLeveltwoLevelthreeLevelfourenumFromFfi(_handle);
  smokeLeveloneLeveltwoLevelthreeLevelfourenumReleaseFfiHandle(_handle);
  return result;
}
void smokeLeveloneLeveltwoLevelthreeLevelfourenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLeveloneLeveltwoLevelthreeLevelfourenumReleaseHandleNullable(handle);
// End of LevelOne_LevelTwo_LevelThree_LevelFourEnum "private" section.
class LevelOne_LevelTwo_LevelThree_LevelFour {
  String stringField;
  LevelOne_LevelTwo_LevelThree_LevelFour(this.stringField);
  static final bool foo = false;
  static LevelOne_LevelTwo_LevelThree_LevelFour fooFactory() {
    final _fooFactoryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_fooFactory'));
    final __resultHandle = _fooFactoryFfi(__lib.LibraryContext.isolateId);
    try {
      return smokeLeveloneLeveltwoLevelthreeLevelfourFromFfi(__resultHandle);
    } finally {
      smokeLeveloneLeveltwoLevelthreeLevelfourReleaseFfiHandle(__resultHandle);
    }
  }
}
// LevelOne_LevelTwo_LevelThree_LevelFour "private" section, not exported.
final _smokeLeveloneLeveltwoLevelthreeLevelfourCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle'));
final _smokeLeveloneLeveltwoLevelthreeLevelfourReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle'));
final _smokeLeveloneLeveltwoLevelthreeLevelfourGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_get_field_stringField'));
Pointer<Void> smokeLeveloneLeveltwoLevelthreeLevelfourToFfi(LevelOne_LevelTwo_LevelThree_LevelFour value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeLeveloneLeveltwoLevelthreeLevelfourCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
LevelOne_LevelTwo_LevelThree_LevelFour smokeLeveloneLeveltwoLevelthreeLevelfourFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeLeveloneLeveltwoLevelthreeLevelfourGetFieldstringField(handle);
  try {
    return LevelOne_LevelTwo_LevelThree_LevelFour(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeLeveloneLeveltwoLevelthreeLevelfourReleaseFfiHandle(Pointer<Void> handle) => _smokeLeveloneLeveltwoLevelthreeLevelfourReleaseHandle(handle);
// Nullable LevelOne_LevelTwo_LevelThree_LevelFour
final _smokeLeveloneLeveltwoLevelthreeLevelfourCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle_nullable'));
final _smokeLeveloneLeveltwoLevelthreeLevelfourReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle_nullable'));
final _smokeLeveloneLeveltwoLevelthreeLevelfourGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_get_value_nullable'));
Pointer<Void> smokeLeveloneLeveltwoLevelthreeLevelfourToFfiNullable(LevelOne_LevelTwo_LevelThree_LevelFour value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLeveloneLeveltwoLevelthreeLevelfourToFfi(value);
  final result = _smokeLeveloneLeveltwoLevelthreeLevelfourCreateHandleNullable(_handle);
  smokeLeveloneLeveltwoLevelthreeLevelfourReleaseFfiHandle(_handle);
  return result;
}
LevelOne_LevelTwo_LevelThree_LevelFour smokeLeveloneLeveltwoLevelthreeLevelfourFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLeveloneLeveltwoLevelthreeLevelfourGetValueNullable(handle);
  final result = smokeLeveloneLeveltwoLevelthreeLevelfourFromFfi(_handle);
  smokeLeveloneLeveltwoLevelthreeLevelfourReleaseFfiHandle(_handle);
  return result;
}
void smokeLeveloneLeveltwoLevelthreeLevelfourReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLeveloneLeveltwoLevelthreeLevelfourReleaseHandleNullable(handle);
// End of LevelOne_LevelTwo_LevelThree_LevelFour "private" section.
// LevelOne_LevelTwo_LevelThree "private" section, not exported.
final _smokeLeveloneLeveltwoLevelthreeCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_copy_handle'));
final _smokeLeveloneLeveltwoLevelthreeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_release_handle'));
class LevelOne_LevelTwo_LevelThree$Impl extends __lib.NativeBase implements LevelOne_LevelTwo_LevelThree {
  LevelOne_LevelTwo_LevelThree$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeLeveloneLeveltwoLevelthreeReleaseHandle(handle);
    handle = null;
  }
  @override
  OuterInterface_InnerClass foo(OuterClass_InnerInterface input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LevelOne_LevelTwo_LevelThree_foo__InnerInterface'));
    final _inputHandle = smokeOuterclassInnerinterfaceToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _fooFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smokeOuterclassInnerinterfaceReleaseFfiHandle(_inputHandle);
    try {
      return smokeOuterinterfaceInnerclassFromFfi(__resultHandle);
    } finally {
      smokeOuterinterfaceInnerclassReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeLeveloneLeveltwoLevelthreeToFfi(LevelOne_LevelTwo_LevelThree value) =>
  _smokeLeveloneLeveltwoLevelthreeCopyHandle((value as __lib.NativeBase).handle);
LevelOne_LevelTwo_LevelThree smokeLeveloneLeveltwoLevelthreeFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as LevelOne_LevelTwo_LevelThree;
  if (instance != null) return instance;
  final _copiedHandle = _smokeLeveloneLeveltwoLevelthreeCopyHandle(handle);
  final result = LevelOne_LevelTwo_LevelThree$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeLeveloneLeveltwoLevelthreeReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLeveloneLeveltwoLevelthreeReleaseHandle(handle);
Pointer<Void> smokeLeveloneLeveltwoLevelthreeToFfiNullable(LevelOne_LevelTwo_LevelThree value) =>
  value != null ? smokeLeveloneLeveltwoLevelthreeToFfi(value) : Pointer<Void>.fromAddress(0);
LevelOne_LevelTwo_LevelThree smokeLeveloneLeveltwoLevelthreeFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeLeveloneLeveltwoLevelthreeFromFfi(handle) : null;
void smokeLeveloneLeveltwoLevelthreeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLeveloneLeveltwoLevelthreeReleaseHandle(handle);
// End of LevelOne_LevelTwo_LevelThree "private" section.
// LevelOne_LevelTwo "private" section, not exported.
final _smokeLeveloneLeveltwoCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_copy_handle'));
final _smokeLeveloneLeveltwoReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_release_handle'));
class LevelOne_LevelTwo$Impl extends __lib.NativeBase implements LevelOne_LevelTwo {
  LevelOne_LevelTwo$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeLeveloneLeveltwoReleaseHandle(handle);
    handle = null;
  }
}
Pointer<Void> smokeLeveloneLeveltwoToFfi(LevelOne_LevelTwo value) =>
  _smokeLeveloneLeveltwoCopyHandle((value as __lib.NativeBase).handle);
LevelOne_LevelTwo smokeLeveloneLeveltwoFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as LevelOne_LevelTwo;
  if (instance != null) return instance;
  final _copiedHandle = _smokeLeveloneLeveltwoCopyHandle(handle);
  final result = LevelOne_LevelTwo$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeLeveloneLeveltwoReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLeveloneLeveltwoReleaseHandle(handle);
Pointer<Void> smokeLeveloneLeveltwoToFfiNullable(LevelOne_LevelTwo value) =>
  value != null ? smokeLeveloneLeveltwoToFfi(value) : Pointer<Void>.fromAddress(0);
LevelOne_LevelTwo smokeLeveloneLeveltwoFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeLeveloneLeveltwoFromFfi(handle) : null;
void smokeLeveloneLeveltwoReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLeveloneLeveltwoReleaseHandle(handle);
// End of LevelOne_LevelTwo "private" section.
// LevelOne "private" section, not exported.
final _smokeLeveloneCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_copy_handle'));
final _smokeLeveloneReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LevelOne_release_handle'));
class LevelOne$Impl extends __lib.NativeBase implements LevelOne {
  LevelOne$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeLeveloneReleaseHandle(handle);
    handle = null;
  }
}
Pointer<Void> smokeLeveloneToFfi(LevelOne value) =>
  _smokeLeveloneCopyHandle((value as __lib.NativeBase).handle);
LevelOne smokeLeveloneFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as LevelOne;
  if (instance != null) return instance;
  final _copiedHandle = _smokeLeveloneCopyHandle(handle);
  final result = LevelOne$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeLeveloneReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLeveloneReleaseHandle(handle);
Pointer<Void> smokeLeveloneToFfiNullable(LevelOne value) =>
  value != null ? smokeLeveloneToFfi(value) : Pointer<Void>.fromAddress(0);
LevelOne smokeLeveloneFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeLeveloneFromFfi(handle) : null;
void smokeLeveloneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLeveloneReleaseHandle(handle);
// End of LevelOne "private" section.

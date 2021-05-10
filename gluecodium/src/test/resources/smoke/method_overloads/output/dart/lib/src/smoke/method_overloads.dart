import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class MethodOverloads {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  bool isBoolean(bool input);
  bool isBooleanByte(int input);
  bool isBooleanString(String input);
  bool isBooleanPoint(MethodOverloads_Point input);
  bool isBooleanMulti(bool input1, int input2, String input3, MethodOverloads_Point input4);
  bool isBooleanStringArray(List<String> input);
  bool isBooleanIntArray(List<int> input);
  bool isBooleanConst();
  bool isFloatString(String input);
  bool isFloatList(List<int> input);
}
class MethodOverloads_Point {
  double x;
  double y;
  MethodOverloads_Point(this.x, this.y);
}
// MethodOverloads_Point "private" section, not exported.
final _smokeMethodoverloadsPointCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('library_smoke_MethodOverloads_Point_create_handle'));
final _smokeMethodoverloadsPointReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_release_handle'));
final _smokeMethodoverloadsPointGetFieldx = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_get_field_x'));
final _smokeMethodoverloadsPointGetFieldy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_get_field_y'));
Pointer<Void> smoke_MethodOverloads_Point_toFfi(MethodOverloads_Point value) {
  final _xHandle = (value.x);
  final _yHandle = (value.y);
  final _result = _smokeMethodoverloadsPointCreateHandle(_xHandle, _yHandle);
  (_xHandle);
  (_yHandle);
  return _result;
}
MethodOverloads_Point smoke_MethodOverloads_Point_fromFfi(Pointer<Void> handle) {
  final _xHandle = _smokeMethodoverloadsPointGetFieldx(handle);
  final _yHandle = _smokeMethodoverloadsPointGetFieldy(handle);
  try {
    return MethodOverloads_Point(
      (_xHandle),
      (_yHandle)
    );
  } finally {
    (_xHandle);
    (_yHandle);
  }
}
void smoke_MethodOverloads_Point_releaseFfiHandle(Pointer<Void> handle) => _smokeMethodoverloadsPointReleaseHandle(handle);
// Nullable MethodOverloads_Point
final _smoke_MethodOverloads_PointCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_create_handle_nullable'));
final _smoke_MethodOverloads_PointReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_release_handle_nullable'));
final _smoke_MethodOverloads_PointGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_get_value_nullable'));
Pointer<Void> smoke_MethodOverloads_Point_toFfi_nullable(MethodOverloads_Point value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_MethodOverloads_Point_toFfi(value);
  final result = _smoke_MethodOverloads_PointCreateHandleNullable(_handle);
  smoke_MethodOverloads_Point_releaseFfiHandle(_handle);
  return result;
}
MethodOverloads_Point smoke_MethodOverloads_Point_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_MethodOverloads_PointGetValueNullable(handle);
  final result = smoke_MethodOverloads_Point_fromFfi(_handle);
  smoke_MethodOverloads_Point_releaseFfiHandle(_handle);
  return result;
}
void smoke_MethodOverloads_Point_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_MethodOverloads_PointReleaseHandleNullable(handle);
// End of MethodOverloads_Point "private" section.
// MethodOverloads "private" section, not exported.
final _smokeMethodoverloadsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_copy_handle'));
final _smokeMethodoverloadsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_release_handle'));
class MethodOverloads$Impl extends __lib.NativeBase implements MethodOverloads {
  MethodOverloads$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeMethodoverloadsReleaseHandle(handle);
    handle = null;
  }
  @override
  bool isBoolean(bool input) {
    final _isBooleanFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint8), int Function(Pointer<Void>, int, int)>('library_smoke_MethodOverloads_isBoolean__Boolean'));
    final _inputHandle = Boolean_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isBooleanFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    Boolean_releaseFfiHandle(_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanByte(int input) {
    final _isBooleanByteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Int8), int Function(Pointer<Void>, int, int)>('library_smoke_MethodOverloads_isBoolean__Byte'));
    final _inputHandle = (input);
    final _handle = this.handle;
    final __resultHandle = _isBooleanByteFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanString(String input) {
    final _isBooleanStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__String'));
    final _inputHandle = String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isBooleanStringFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanPoint(MethodOverloads_Point input) {
    final _isBooleanPointFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__Point'));
    final _inputHandle = smoke_MethodOverloads_Point_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isBooleanPointFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smoke_MethodOverloads_Point_releaseFfiHandle(_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanMulti(bool input1, int input2, String input3, MethodOverloads_Point input4) {
    final _isBooleanMultiFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint8, Int8, Pointer<Void>, Pointer<Void>), int Function(Pointer<Void>, int, int, int, Pointer<Void>, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__Boolean_Byte_String_Point'));
    final _input1Handle = Boolean_toFfi(input1);
    final _input2Handle = (input2);
    final _input3Handle = String_toFfi(input3);
    final _input4Handle = smoke_MethodOverloads_Point_toFfi(input4);
    final _handle = this.handle;
    final __resultHandle = _isBooleanMultiFfi(_handle, __lib.LibraryContext.isolateId, _input1Handle, _input2Handle, _input3Handle, _input4Handle);
    Boolean_releaseFfiHandle(_input1Handle);
    (_input2Handle);
    String_releaseFfiHandle(_input3Handle);
    smoke_MethodOverloads_Point_releaseFfiHandle(_input4Handle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanStringArray(List<String> input) {
    final _isBooleanStringArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__ListOf_1String'));
    final _inputHandle = foobar_ListOf_String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isBooleanStringArrayFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_ListOf_String_releaseFfiHandle(_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanIntArray(List<int> input) {
    final _isBooleanIntArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__ListOf_1Byte'));
    final _inputHandle = foobar_ListOf_Byte_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isBooleanIntArrayFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_ListOf_Byte_releaseFfiHandle(_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanConst() {
    final _isBooleanConstFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_MethodOverloads_isBoolean'));
    final _handle = this.handle;
    final __resultHandle = _isBooleanConstFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isFloatString(String input) {
    final _isFloatStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isFloat__String'));
    final _inputHandle = String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isFloatStringFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isFloatList(List<int> input) {
    final _isFloatListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isFloat__ListOf_1Byte'));
    final _inputHandle = foobar_ListOf_Byte_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isFloatListFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_ListOf_Byte_releaseFfiHandle(_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_MethodOverloads_toFfi(MethodOverloads value) =>
  _smokeMethodoverloadsCopyHandle((value as __lib.NativeBase).handle);
MethodOverloads smoke_MethodOverloads_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as MethodOverloads;
  if (instance != null) return instance;
  final _copiedHandle = _smokeMethodoverloadsCopyHandle(handle);
  final result = MethodOverloads$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_MethodOverloads_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeMethodoverloadsReleaseHandle(handle);
Pointer<Void> smoke_MethodOverloads_toFfi_nullable(MethodOverloads value) =>
  value != null ? smoke_MethodOverloads_toFfi(value) : Pointer<Void>.fromAddress(0);
MethodOverloads smoke_MethodOverloads_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_MethodOverloads_fromFfi(handle) : null;
void smoke_MethodOverloads_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeMethodoverloadsReleaseHandle(handle);
// End of MethodOverloads "private" section.

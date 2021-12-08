import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
abstract class MethodOverloads {

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
Pointer<Void> smokeMethodoverloadsPointToFfi(MethodOverloads_Point value) {
  final _xHandle = (value.x);
  final _yHandle = (value.y);
  final _result = _smokeMethodoverloadsPointCreateHandle(_xHandle, _yHandle);
  return _result;
}
MethodOverloads_Point smokeMethodoverloadsPointFromFfi(Pointer<Void> handle) {
  final _xHandle = _smokeMethodoverloadsPointGetFieldx(handle);
  final _yHandle = _smokeMethodoverloadsPointGetFieldy(handle);
  try {
    return MethodOverloads_Point(
      (_xHandle),
      (_yHandle)
    );
  } finally {
  }
}
void smokeMethodoverloadsPointReleaseFfiHandle(Pointer<Void> handle) => _smokeMethodoverloadsPointReleaseHandle(handle);
// Nullable MethodOverloads_Point
final _smokeMethodoverloadsPointCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_create_handle_nullable'));
final _smokeMethodoverloadsPointReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_release_handle_nullable'));
final _smokeMethodoverloadsPointGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_get_value_nullable'));
Pointer<Void> smokeMethodoverloadsPointToFfiNullable(MethodOverloads_Point? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeMethodoverloadsPointToFfi(value);
  final result = _smokeMethodoverloadsPointCreateHandleNullable(_handle);
  smokeMethodoverloadsPointReleaseFfiHandle(_handle);
  return result;
}
MethodOverloads_Point? smokeMethodoverloadsPointFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeMethodoverloadsPointGetValueNullable(handle);
  final result = smokeMethodoverloadsPointFromFfi(_handle);
  smokeMethodoverloadsPointReleaseFfiHandle(_handle);
  return result;
}
void smokeMethodoverloadsPointReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeMethodoverloadsPointReleaseHandleNullable(handle);
// End of MethodOverloads_Point "private" section.
// MethodOverloads "private" section, not exported.
final _smokeMethodoverloadsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_MethodOverloads_register_finalizer'));
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
  bool isBoolean(bool input) {
    final _isBooleanFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint8), int Function(Pointer<Void>, int, int)>('library_smoke_MethodOverloads_isBoolean__Boolean'));
    final _inputHandle = booleanToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isBooleanFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    booleanReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanByte(int input) {
    final _isBooleanByteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Int8), int Function(Pointer<Void>, int, int)>('library_smoke_MethodOverloads_isBoolean__Byte'));
    final _inputHandle = (input);
    final _handle = this.handle;
    final __resultHandle = _isBooleanByteFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanString(String input) {
    final _isBooleanStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isBooleanStringFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanPoint(MethodOverloads_Point input) {
    final _isBooleanPointFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__Point'));
    final _inputHandle = smokeMethodoverloadsPointToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isBooleanPointFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smokeMethodoverloadsPointReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanMulti(bool input1, int input2, String input3, MethodOverloads_Point input4) {
    final _isBooleanMultiFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint8, Int8, Pointer<Void>, Pointer<Void>), int Function(Pointer<Void>, int, int, int, Pointer<Void>, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__Boolean_Byte_String_Point'));
    final _input1Handle = booleanToFfi(input1);
    final _input2Handle = (input2);
    final _input3Handle = stringToFfi(input3);
    final _input4Handle = smokeMethodoverloadsPointToFfi(input4);
    final _handle = this.handle;
    final __resultHandle = _isBooleanMultiFfi(_handle, __lib.LibraryContext.isolateId, _input1Handle, _input2Handle, _input3Handle, _input4Handle);
    booleanReleaseFfiHandle(_input1Handle);
    stringReleaseFfiHandle(_input3Handle);
    smokeMethodoverloadsPointReleaseFfiHandle(_input4Handle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanStringArray(List<String> input) {
    final _isBooleanStringArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__ListOf_String'));
    final _inputHandle = foobarListofStringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isBooleanStringArrayFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofStringReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanIntArray(List<int> input) {
    final _isBooleanIntArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__ListOf_Byte'));
    final _inputHandle = foobarListofByteToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isBooleanIntArrayFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofByteReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isBooleanConst() {
    final _isBooleanConstFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_MethodOverloads_isBoolean'));
    final _handle = this.handle;
    final __resultHandle = _isBooleanConstFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isFloatString(String input) {
    final _isFloatStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isFloat__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isFloatStringFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool isFloatList(List<int> input) {
    final _isFloatListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isFloat__ListOf_Byte'));
    final _inputHandle = foobarListofByteToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _isFloatListFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofByteReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeMethodoverloadsToFfi(MethodOverloads value) =>
  _smokeMethodoverloadsCopyHandle((value as __lib.NativeBase).handle);
MethodOverloads smokeMethodoverloadsFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MethodOverloads) return instance;
  final _copiedHandle = _smokeMethodoverloadsCopyHandle(handle);
  final result = MethodOverloads$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeMethodoverloadsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeMethodoverloadsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeMethodoverloadsReleaseHandle(handle);
Pointer<Void> smokeMethodoverloadsToFfiNullable(MethodOverloads? value) =>
  value != null ? smokeMethodoverloadsToFfi(value) : Pointer<Void>.fromAddress(0);
MethodOverloads? smokeMethodoverloadsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeMethodoverloadsFromFfi(handle) : null;
void smokeMethodoverloadsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeMethodoverloadsReleaseHandle(handle);
// End of MethodOverloads "private" section.

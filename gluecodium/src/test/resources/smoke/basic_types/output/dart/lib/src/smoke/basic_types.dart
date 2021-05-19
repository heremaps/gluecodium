import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class BasicTypes {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static String stringFunction(String input) => BasicTypes$Impl.stringFunction(input);
  static bool boolFunction(bool input) => BasicTypes$Impl.boolFunction(input);
  static double floatFunction(double input) => BasicTypes$Impl.floatFunction(input);
  static double doubleFunction(double input) => BasicTypes$Impl.doubleFunction(input);
  static int byteFunction(int input) => BasicTypes$Impl.byteFunction(input);
  static int shortFunction(int input) => BasicTypes$Impl.shortFunction(input);
  static int intFunction(int input) => BasicTypes$Impl.intFunction(input);
  static int longFunction(int input) => BasicTypes$Impl.longFunction(input);
  static int ubyteFunction(int input) => BasicTypes$Impl.ubyteFunction(input);
  static int ushortFunction(int input) => BasicTypes$Impl.ushortFunction(input);
  static int uintFunction(int input) => BasicTypes$Impl.uintFunction(input);
  static int ulongFunction(int input) => BasicTypes$Impl.ulongFunction(input);
}
// BasicTypes "private" section, not exported.
final _smokeBasictypesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_BasicTypes_copy_handle'));
final _smokeBasictypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_BasicTypes_release_handle'));
class BasicTypes$Impl extends __lib.NativeBase implements BasicTypes {
  BasicTypes$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeBasictypesReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  static String stringFunction(String input) {
    final _stringFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_BasicTypes_stringFunction__String'));
    final _inputHandle = stringToFfi(input);
    final __resultHandle = _stringFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  static bool boolFunction(bool input) {
    final _boolFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Uint8), int Function(int, int)>('library_smoke_BasicTypes_boolFunction__Boolean'));
    final _inputHandle = booleanToFfi(input);
    final __resultHandle = _boolFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    booleanReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  static double floatFunction(double input) {
    final _floatFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Int32, Float), double Function(int, double)>('library_smoke_BasicTypes_floatFunction__Float'));
    final _inputHandle = (input);
    final __resultHandle = _floatFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static double doubleFunction(double input) {
    final _doubleFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Int32, Double), double Function(int, double)>('library_smoke_BasicTypes_doubleFunction__Double'));
    final _inputHandle = (input);
    final __resultHandle = _doubleFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static int byteFunction(int input) {
    final _byteFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int8 Function(Int32, Int8), int Function(int, int)>('library_smoke_BasicTypes_byteFunction__Byte'));
    final _inputHandle = (input);
    final __resultHandle = _byteFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static int shortFunction(int input) {
    final _shortFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int16 Function(Int32, Int16), int Function(int, int)>('library_smoke_BasicTypes_shortFunction__Short'));
    final _inputHandle = (input);
    final __resultHandle = _shortFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static int intFunction(int input) {
    final _intFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Int32, Int32), int Function(int, int)>('library_smoke_BasicTypes_intFunction__Int'));
    final _inputHandle = (input);
    final __resultHandle = _intFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static int longFunction(int input) {
    final _longFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int64 Function(Int32, Int64), int Function(int, int)>('library_smoke_BasicTypes_longFunction__Long'));
    final _inputHandle = (input);
    final __resultHandle = _longFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static int ubyteFunction(int input) {
    final _ubyteFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Uint8), int Function(int, int)>('library_smoke_BasicTypes_ubyteFunction__UByte'));
    final _inputHandle = (input);
    final __resultHandle = _ubyteFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static int ushortFunction(int input) {
    final _ushortFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint16 Function(Int32, Uint16), int Function(int, int)>('library_smoke_BasicTypes_ushortFunction__UShort'));
    final _inputHandle = (input);
    final __resultHandle = _ushortFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static int uintFunction(int input) {
    final _uintFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_BasicTypes_uintFunction__UInt'));
    final _inputHandle = (input);
    final __resultHandle = _uintFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static int ulongFunction(int input) {
    final _ulongFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Int32, Uint64), int Function(int, int)>('library_smoke_BasicTypes_ulongFunction__ULong'));
    final _inputHandle = (input);
    final __resultHandle = _ulongFunctionFfi(__lib.LibraryContext.isolateId, _inputHandle);
    (_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smokeBasictypesToFfi(BasicTypes value) =>
  _smokeBasictypesCopyHandle((value as __lib.NativeBase).handle);
BasicTypes smokeBasictypesFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is BasicTypes) return instance;
  final _copiedHandle = _smokeBasictypesCopyHandle(handle);
  final result = BasicTypes$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeBasictypesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeBasictypesReleaseHandle(handle);
Pointer<Void> smokeBasictypesToFfiNullable(BasicTypes? value) =>
  value != null ? smokeBasictypesToFfi(value) : Pointer<Void>.fromAddress(0);
BasicTypes? smokeBasictypesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeBasictypesFromFfi(handle) : null;
void smokeBasictypesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeBasictypesReleaseHandle(handle);
// End of BasicTypes "private" section.

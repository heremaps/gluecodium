import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
final _smoke_BasicTypes_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_BasicTypes_copy_handle'));
final _smoke_BasicTypes_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_BasicTypes_release_handle'));
class BasicTypes$Impl extends __lib.NativeBase implements BasicTypes {
  BasicTypes$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_BasicTypes_release_handle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  static String stringFunction(String input) {
    final _stringFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_BasicTypes_stringFunction__String'));
    final _input_handle = String_toFfi(input);
    final __result_handle = _stringFunction_ffi(__lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  static bool boolFunction(bool input) {
    final _boolFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Uint8), int Function(int, int)>('library_smoke_BasicTypes_boolFunction__Boolean'));
    final _input_handle = Boolean_toFfi(input);
    final __result_handle = _boolFunction_ffi(__lib.LibraryContext.isolateId, _input_handle);
    Boolean_releaseFfiHandle(_input_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  static double floatFunction(double input) {
    final _floatFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Int32, Float), double Function(int, double)>('library_smoke_BasicTypes_floatFunction__Float'));
    final _input_handle = (input);
    final __result_handle = _floatFunction_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static double doubleFunction(double input) {
    final _doubleFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Int32, Double), double Function(int, double)>('library_smoke_BasicTypes_doubleFunction__Double'));
    final _input_handle = (input);
    final __result_handle = _doubleFunction_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static int byteFunction(int input) {
    final _byteFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int8 Function(Int32, Int8), int Function(int, int)>('library_smoke_BasicTypes_byteFunction__Byte'));
    final _input_handle = (input);
    final __result_handle = _byteFunction_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static int shortFunction(int input) {
    final _shortFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int16 Function(Int32, Int16), int Function(int, int)>('library_smoke_BasicTypes_shortFunction__Short'));
    final _input_handle = (input);
    final __result_handle = _shortFunction_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static int intFunction(int input) {
    final _intFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Int32, Int32), int Function(int, int)>('library_smoke_BasicTypes_intFunction__Int'));
    final _input_handle = (input);
    final __result_handle = _intFunction_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static int longFunction(int input) {
    final _longFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int64 Function(Int32, Int64), int Function(int, int)>('library_smoke_BasicTypes_longFunction__Long'));
    final _input_handle = (input);
    final __result_handle = _longFunction_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static int ubyteFunction(int input) {
    final _ubyteFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Uint8), int Function(int, int)>('library_smoke_BasicTypes_ubyteFunction__UByte'));
    final _input_handle = (input);
    final __result_handle = _ubyteFunction_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static int ushortFunction(int input) {
    final _ushortFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint16 Function(Int32, Uint16), int Function(int, int)>('library_smoke_BasicTypes_ushortFunction__UShort'));
    final _input_handle = (input);
    final __result_handle = _ushortFunction_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static int uintFunction(int input) {
    final _uintFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_BasicTypes_uintFunction__UInt'));
    final _input_handle = (input);
    final __result_handle = _uintFunction_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static int ulongFunction(int input) {
    final _ulongFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Int32, Uint64), int Function(int, int)>('library_smoke_BasicTypes_ulongFunction__ULong'));
    final _input_handle = (input);
    final __result_handle = _ulongFunction_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_BasicTypes_toFfi(BasicTypes value) =>
  _smoke_BasicTypes_copy_handle((value as __lib.NativeBase).handle);
BasicTypes smoke_BasicTypes_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is BasicTypes) return instance;
  final _copied_handle = _smoke_BasicTypes_copy_handle(handle);
  final result = BasicTypes$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_BasicTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_BasicTypes_release_handle(handle);
Pointer<Void> smoke_BasicTypes_toFfi_nullable(BasicTypes? value) =>
  value != null ? smoke_BasicTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
BasicTypes? smoke_BasicTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_BasicTypes_fromFfi(handle) : null;
void smoke_BasicTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_BasicTypes_release_handle(handle);
// End of BasicTypes "private" section.

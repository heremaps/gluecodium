

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';

abstract class BasicTypes implements Finalizable {


  static String stringFunction(String input) => $prototype.stringFunction(input);

  static bool boolFunction(bool input) => $prototype.boolFunction(input);

  static double floatFunction(double input) => $prototype.floatFunction(input);

  static double doubleFunction(double input) => $prototype.doubleFunction(input);

  static int byteFunction(int input) => $prototype.byteFunction(input);

  static int shortFunction(int input) => $prototype.shortFunction(input);

  static int intFunction(int input) => $prototype.intFunction(input);

  static int longFunction(int input) => $prototype.longFunction(input);

  static int ubyteFunction(int input) => $prototype.ubyteFunction(input);

  static int ushortFunction(int input) => $prototype.ushortFunction(input);

  static int uintFunction(int input) => $prototype.uintFunction(input);

  static int ulongFunction(int input) => $prototype.ulongFunction(input);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = BasicTypes$Impl(Pointer<Void>.fromAddress(0));
}


// BasicTypes "private" section, not exported.

final _smokeBasictypesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_BasicTypes_register_finalizer'));
final _smokeBasictypesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_BasicTypes_copy_handle'));
final _smokeBasictypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_BasicTypes_release_handle'));


final __ffiPtr_library_smoke_BasicTypes_stringFunction__String = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_BasicTypes_stringFunction__String'));


final __ffiPtr_library_smoke_BasicTypes_boolFunction__Boolean = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Uint8), int Function(int, int)>('library_smoke_BasicTypes_boolFunction__Boolean'));


final __ffiPtr_library_smoke_BasicTypes_floatFunction__Float = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Float Function(Int32, Float), double Function(int, double)>('library_smoke_BasicTypes_floatFunction__Float'));


final __ffiPtr_library_smoke_BasicTypes_doubleFunction__Double = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Double Function(Int32, Double), double Function(int, double)>('library_smoke_BasicTypes_doubleFunction__Double'));


final __ffiPtr_library_smoke_BasicTypes_byteFunction__Byte = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Int8 Function(Int32, Int8), int Function(int, int)>('library_smoke_BasicTypes_byteFunction__Byte'));


final __ffiPtr_library_smoke_BasicTypes_shortFunction__Short = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Int16 Function(Int32, Int16), int Function(int, int)>('library_smoke_BasicTypes_shortFunction__Short'));


final __ffiPtr_library_smoke_BasicTypes_intFunction__Int = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Int32 Function(Int32, Int32), int Function(int, int)>('library_smoke_BasicTypes_intFunction__Int'));


final __ffiPtr_library_smoke_BasicTypes_longFunction__Long = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Int64 Function(Int32, Int64), int Function(int, int)>('library_smoke_BasicTypes_longFunction__Long'));


final __ffiPtr_library_smoke_BasicTypes_ubyteFunction__UByte = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Uint8), int Function(int, int)>('library_smoke_BasicTypes_ubyteFunction__UByte'));


final __ffiPtr_library_smoke_BasicTypes_ushortFunction__UShort = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Uint16 Function(Int32, Uint16), int Function(int, int)>('library_smoke_BasicTypes_ushortFunction__UShort'));


final __ffiPtr_library_smoke_BasicTypes_uintFunction__UInt = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_BasicTypes_uintFunction__UInt'));


final __ffiPtr_library_smoke_BasicTypes_ulongFunction__ULong = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Uint64 Function(Int32, Uint64), int Function(int, int)>('library_smoke_BasicTypes_ulongFunction__ULong'));



/// @nodoc
@visibleForTesting

class BasicTypes$Impl extends __lib.NativeBase implements BasicTypes {

  BasicTypes$Impl(Pointer<Void> handle) : super(handle);

  String stringFunction(String input) {
    final _inputHandle = stringToFfi(input);
    final __resultHandle = __ffiPtr_library_smoke_BasicTypes_stringFunction__String(__lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  bool boolFunction(bool input) {
    final _inputHandle = booleanToFfi(input);
    final __resultHandle = __ffiPtr_library_smoke_BasicTypes_boolFunction__Boolean(__lib.LibraryContext.isolateId, _inputHandle);
    booleanReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  double floatFunction(double input) {
    final _inputHandle = (input);
    final __resultHandle = __ffiPtr_library_smoke_BasicTypes_floatFunction__Float(__lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  double doubleFunction(double input) {
    final _inputHandle = (input);
    final __resultHandle = __ffiPtr_library_smoke_BasicTypes_doubleFunction__Double(__lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  int byteFunction(int input) {
    final _inputHandle = (input);
    final __resultHandle = __ffiPtr_library_smoke_BasicTypes_byteFunction__Byte(__lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  int shortFunction(int input) {
    final _inputHandle = (input);
    final __resultHandle = __ffiPtr_library_smoke_BasicTypes_shortFunction__Short(__lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  int intFunction(int input) {
    final _inputHandle = (input);
    final __resultHandle = __ffiPtr_library_smoke_BasicTypes_intFunction__Int(__lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  int longFunction(int input) {
    final _inputHandle = (input);
    final __resultHandle = __ffiPtr_library_smoke_BasicTypes_longFunction__Long(__lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  int ubyteFunction(int input) {
    final _inputHandle = (input);
    final __resultHandle = __ffiPtr_library_smoke_BasicTypes_ubyteFunction__UByte(__lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  int ushortFunction(int input) {
    final _inputHandle = (input);
    final __resultHandle = __ffiPtr_library_smoke_BasicTypes_ushortFunction__UShort(__lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  int uintFunction(int input) {
    final _inputHandle = (input);
    final __resultHandle = __ffiPtr_library_smoke_BasicTypes_uintFunction__UInt(__lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  int ulongFunction(int input) {
    final _inputHandle = (input);
    final __resultHandle = __ffiPtr_library_smoke_BasicTypes_ulongFunction__ULong(__lib.LibraryContext.isolateId, _inputHandle);

    try {
      return (__resultHandle);
    } finally {


    }

  }


}

Pointer<Void> smokeBasictypesToFfi(BasicTypes value) =>
  _smokeBasictypesCopyHandle((value as __lib.NativeBase).handle);

BasicTypes smokeBasictypesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is BasicTypes) return instance;

  final _copiedHandle = _smokeBasictypesCopyHandle(handle);
  final result = BasicTypes$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeBasictypesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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



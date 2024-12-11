

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:meta/meta.dart';

abstract class NoCacheClass implements Finalizable {

  factory NoCacheClass() => $prototype.make();


  void foo();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = NoCacheClass$Impl(Pointer<Void>.fromAddress(0));
}


// NoCacheClass "private" section, not exported.

final _smokeNocacheclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_NoCacheClass_register_finalizer'));
final _smokeNocacheclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_NoCacheClass_copy_handle'));
final _smokeNocacheclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_NoCacheClass_release_handle'));




/// @nodoc
@visibleForTesting
class NoCacheClass$Impl extends __lib.NativeBase implements NoCacheClass {

  NoCacheClass$Impl(Pointer<Void> handle) : super(handle);


  NoCacheClass make() {
    final _result_handle = _make();
    final _result = NoCacheClass$Impl(_result_handle);

    _smokeNocacheclassRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make() {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_NoCacheClass_make'));
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  @override
  void foo() {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_NoCacheClass_foo'));
    final _handle = this.handle;
    _fooFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

Pointer<Void> smokeNocacheclassToFfi(NoCacheClass value) =>
  _smokeNocacheclassCopyHandle((value as __lib.NativeBase).handle);

NoCacheClass smokeNocacheclassFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");

  final _copiedHandle = _smokeNocacheclassCopyHandle(handle);
  final result = NoCacheClass$Impl(_copiedHandle);
  _smokeNocacheclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeNocacheclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeNocacheclassReleaseHandle(handle);

Pointer<Void> smokeNocacheclassToFfiNullable(NoCacheClass? value) =>
  value != null ? smokeNocacheclassToFfi(value) : Pointer<Void>.fromAddress(0);

NoCacheClass? smokeNocacheclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeNocacheclassFromFfi(handle) : null;

void smokeNocacheclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeNocacheclassReleaseHandle(handle);

// End of NoCacheClass "private" section.





import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';

abstract class CtorLinks implements Finalizable {

}

/// This class has just one constructor [CtorLinks_SingleCtor.CtorLinks_SingleCtor()].
abstract class CtorLinks_SingleCtor implements Finalizable {

  factory CtorLinks_SingleCtor() => $prototype.create();


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = CtorLinks_SingleCtor$Impl(Pointer<Void>.fromAddress(0));
}


// CtorLinks_SingleCtor "private" section, not exported.

final _smokeCtorlinksSinglectorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_CtorLinks_SingleCtor_register_finalizer'));
final _smokeCtorlinksSinglectorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CtorLinks_SingleCtor_copy_handle'));
final _smokeCtorlinksSinglectorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CtorLinks_SingleCtor_release_handle'));



/// @nodoc
@visibleForTesting
class CtorLinks_SingleCtor$Impl extends __lib.NativeBase implements CtorLinks_SingleCtor {

  CtorLinks_SingleCtor$Impl(Pointer<Void> handle) : super(handle);


  CtorLinks_SingleCtor create() {
    final _result_handle = _create();
    final _result = CtorLinks_SingleCtor$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeCtorlinksSinglectorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _create() {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_CtorLinks_SingleCtor_create'));
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }


}

Pointer<Void> smokeCtorlinksSinglectorToFfi(CtorLinks_SingleCtor value) =>
  _smokeCtorlinksSinglectorCopyHandle((value as __lib.NativeBase).handle);

CtorLinks_SingleCtor smokeCtorlinksSinglectorFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CtorLinks_SingleCtor) return instance;

  final _copiedHandle = _smokeCtorlinksSinglectorCopyHandle(handle);
  final result = CtorLinks_SingleCtor$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeCtorlinksSinglectorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeCtorlinksSinglectorReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeCtorlinksSinglectorReleaseHandle(handle);

Pointer<Void> smokeCtorlinksSinglectorToFfiNullable(CtorLinks_SingleCtor? value) =>
  value != null ? smokeCtorlinksSinglectorToFfi(value) : Pointer<Void>.fromAddress(0);

CtorLinks_SingleCtor? smokeCtorlinksSinglectorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeCtorlinksSinglectorFromFfi(handle) : null;

void smokeCtorlinksSinglectorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCtorlinksSinglectorReleaseHandle(handle);

// End of CtorLinks_SingleCtor "private" section.
/// This class has just one constructor with one argument [CtorLinks_SingleCtorWithOneArgument.CtorLinks_SingleCtorWithOneArgument()].
abstract class CtorLinks_SingleCtorWithOneArgument implements Finalizable {

  factory CtorLinks_SingleCtorWithOneArgument(int arg) => $prototype.create(arg);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = CtorLinks_SingleCtorWithOneArgument$Impl(Pointer<Void>.fromAddress(0));
}


// CtorLinks_SingleCtorWithOneArgument "private" section, not exported.

final _smokeCtorlinksSinglectorwithoneargumentRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_CtorLinks_SingleCtorWithOneArgument_register_finalizer'));
final _smokeCtorlinksSinglectorwithoneargumentCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CtorLinks_SingleCtorWithOneArgument_copy_handle'));
final _smokeCtorlinksSinglectorwithoneargumentReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CtorLinks_SingleCtorWithOneArgument_release_handle'));



/// @nodoc
@visibleForTesting
class CtorLinks_SingleCtorWithOneArgument$Impl extends __lib.NativeBase implements CtorLinks_SingleCtorWithOneArgument {

  CtorLinks_SingleCtorWithOneArgument$Impl(Pointer<Void> handle) : super(handle);


  CtorLinks_SingleCtorWithOneArgument create(int arg) {
    final _result_handle = _create(arg);
    final _result = CtorLinks_SingleCtorWithOneArgument$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeCtorlinksSinglectorwithoneargumentRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _create(int arg) {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Int32), Pointer<Void> Function(int, int)>('library_smoke_CtorLinks_SingleCtorWithOneArgument_create__Int'));
    final _argHandle = (arg);
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId, _argHandle);

    return __resultHandle;
  }


}

Pointer<Void> smokeCtorlinksSinglectorwithoneargumentToFfi(CtorLinks_SingleCtorWithOneArgument value) =>
  _smokeCtorlinksSinglectorwithoneargumentCopyHandle((value as __lib.NativeBase).handle);

CtorLinks_SingleCtorWithOneArgument smokeCtorlinksSinglectorwithoneargumentFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CtorLinks_SingleCtorWithOneArgument) return instance;

  final _copiedHandle = _smokeCtorlinksSinglectorwithoneargumentCopyHandle(handle);
  final result = CtorLinks_SingleCtorWithOneArgument$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeCtorlinksSinglectorwithoneargumentRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeCtorlinksSinglectorwithoneargumentReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeCtorlinksSinglectorwithoneargumentReleaseHandle(handle);

Pointer<Void> smokeCtorlinksSinglectorwithoneargumentToFfiNullable(CtorLinks_SingleCtorWithOneArgument? value) =>
  value != null ? smokeCtorlinksSinglectorwithoneargumentToFfi(value) : Pointer<Void>.fromAddress(0);

CtorLinks_SingleCtorWithOneArgument? smokeCtorlinksSinglectorwithoneargumentFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeCtorlinksSinglectorwithoneargumentFromFfi(handle) : null;

void smokeCtorlinksSinglectorwithoneargumentReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCtorlinksSinglectorwithoneargumentReleaseHandle(handle);

// End of CtorLinks_SingleCtorWithOneArgument "private" section.
/// This class has just one constructor with two argument [CtorLinks_SingleCtorWithTwoArgument.CtorLinks_SingleCtorWithTwoArgument()].
abstract class CtorLinks_SingleCtorWithTwoArgument implements Finalizable {

  factory CtorLinks_SingleCtorWithTwoArgument(int arg, String arg2) => $prototype.create(arg, arg2);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = CtorLinks_SingleCtorWithTwoArgument$Impl(Pointer<Void>.fromAddress(0));
}


// CtorLinks_SingleCtorWithTwoArgument "private" section, not exported.

final _smokeCtorlinksSinglectorwithtwoargumentRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_CtorLinks_SingleCtorWithTwoArgument_register_finalizer'));
final _smokeCtorlinksSinglectorwithtwoargumentCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CtorLinks_SingleCtorWithTwoArgument_copy_handle'));
final _smokeCtorlinksSinglectorwithtwoargumentReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CtorLinks_SingleCtorWithTwoArgument_release_handle'));



/// @nodoc
@visibleForTesting
class CtorLinks_SingleCtorWithTwoArgument$Impl extends __lib.NativeBase implements CtorLinks_SingleCtorWithTwoArgument {

  CtorLinks_SingleCtorWithTwoArgument$Impl(Pointer<Void> handle) : super(handle);


  CtorLinks_SingleCtorWithTwoArgument create(int arg, String arg2) {
    final _result_handle = _create(arg, arg2);
    final _result = CtorLinks_SingleCtorWithTwoArgument$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeCtorlinksSinglectorwithtwoargumentRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _create(int arg, String arg2) {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Int32, Pointer<Void>), Pointer<Void> Function(int, int, Pointer<Void>)>('library_smoke_CtorLinks_SingleCtorWithTwoArgument_create__Int_String'));
    final _argHandle = (arg);
    final _arg2Handle = stringToFfi(arg2);
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId, _argHandle, _arg2Handle);

    stringReleaseFfiHandle(_arg2Handle);
    return __resultHandle;
  }


}

Pointer<Void> smokeCtorlinksSinglectorwithtwoargumentToFfi(CtorLinks_SingleCtorWithTwoArgument value) =>
  _smokeCtorlinksSinglectorwithtwoargumentCopyHandle((value as __lib.NativeBase).handle);

CtorLinks_SingleCtorWithTwoArgument smokeCtorlinksSinglectorwithtwoargumentFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CtorLinks_SingleCtorWithTwoArgument) return instance;

  final _copiedHandle = _smokeCtorlinksSinglectorwithtwoargumentCopyHandle(handle);
  final result = CtorLinks_SingleCtorWithTwoArgument$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeCtorlinksSinglectorwithtwoargumentRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeCtorlinksSinglectorwithtwoargumentReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeCtorlinksSinglectorwithtwoargumentReleaseHandle(handle);

Pointer<Void> smokeCtorlinksSinglectorwithtwoargumentToFfiNullable(CtorLinks_SingleCtorWithTwoArgument? value) =>
  value != null ? smokeCtorlinksSinglectorwithtwoargumentToFfi(value) : Pointer<Void>.fromAddress(0);

CtorLinks_SingleCtorWithTwoArgument? smokeCtorlinksSinglectorwithtwoargumentFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeCtorlinksSinglectorwithtwoargumentFromFfi(handle) : null;

void smokeCtorlinksSinglectorwithtwoargumentReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCtorlinksSinglectorwithtwoargumentReleaseHandle(handle);

// End of CtorLinks_SingleCtorWithTwoArgument "private" section.
abstract class CtorLinks_OverloadedCtors implements Finalizable {

  factory CtorLinks_OverloadedCtors.withString(String input) => $prototype.withString(input);

  @Deprecated("Use [CtorLinks_OverloadedCtors.withString] instead.")

  factory CtorLinks_OverloadedCtors(String input, bool flag) => $prototype.$init(input, flag);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = CtorLinks_OverloadedCtors$Impl(Pointer<Void>.fromAddress(0));
}


// CtorLinks_OverloadedCtors "private" section, not exported.

final _smokeCtorlinksOverloadedctorsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_CtorLinks_OverloadedCtors_register_finalizer'));
final _smokeCtorlinksOverloadedctorsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CtorLinks_OverloadedCtors_copy_handle'));
final _smokeCtorlinksOverloadedctorsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CtorLinks_OverloadedCtors_release_handle'));




/// @nodoc
@visibleForTesting
class CtorLinks_OverloadedCtors$Impl extends __lib.NativeBase implements CtorLinks_OverloadedCtors {

  CtorLinks_OverloadedCtors$Impl(Pointer<Void> handle) : super(handle);


  CtorLinks_OverloadedCtors withString(String input) {
    final _result_handle = _withString(input);
    final _result = CtorLinks_OverloadedCtors$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeCtorlinksOverloadedctorsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  CtorLinks_OverloadedCtors $init(String input, bool flag) {
    final _result_handle = _$init(input, flag);
    final _result = CtorLinks_OverloadedCtors$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeCtorlinksOverloadedctorsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _withString(String input) {
    final _withStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_CtorLinks_OverloadedCtors_create__String'));
    final _inputHandle = stringToFfi(input);
    final __resultHandle = _withStringFfi(__lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    return __resultHandle;
  }

  static Pointer<Void> _$init(String input, bool flag) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint8), Pointer<Void> Function(int, Pointer<Void>, int)>('library_smoke_CtorLinks_OverloadedCtors_create__String_Boolean'));
    final _inputHandle = stringToFfi(input);
    final _flagHandle = booleanToFfi(flag);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _inputHandle, _flagHandle);
    stringReleaseFfiHandle(_inputHandle);
    booleanReleaseFfiHandle(_flagHandle);
    return __resultHandle;
  }


}

Pointer<Void> smokeCtorlinksOverloadedctorsToFfi(CtorLinks_OverloadedCtors value) =>
  _smokeCtorlinksOverloadedctorsCopyHandle((value as __lib.NativeBase).handle);

CtorLinks_OverloadedCtors smokeCtorlinksOverloadedctorsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CtorLinks_OverloadedCtors) return instance;

  final _copiedHandle = _smokeCtorlinksOverloadedctorsCopyHandle(handle);
  final result = CtorLinks_OverloadedCtors$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeCtorlinksOverloadedctorsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeCtorlinksOverloadedctorsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeCtorlinksOverloadedctorsReleaseHandle(handle);

Pointer<Void> smokeCtorlinksOverloadedctorsToFfiNullable(CtorLinks_OverloadedCtors? value) =>
  value != null ? smokeCtorlinksOverloadedctorsToFfi(value) : Pointer<Void>.fromAddress(0);

CtorLinks_OverloadedCtors? smokeCtorlinksOverloadedctorsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeCtorlinksOverloadedctorsFromFfi(handle) : null;

void smokeCtorlinksOverloadedctorsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCtorlinksOverloadedctorsReleaseHandle(handle);

// End of CtorLinks_OverloadedCtors "private" section.

// CtorLinks "private" section, not exported.

final _smokeCtorlinksRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_CtorLinks_register_finalizer'));
final _smokeCtorlinksCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CtorLinks_copy_handle'));
final _smokeCtorlinksReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CtorLinks_release_handle'));


class CtorLinks$Impl extends __lib.NativeBase implements CtorLinks {

  CtorLinks$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> smokeCtorlinksToFfi(CtorLinks value) =>
  _smokeCtorlinksCopyHandle((value as __lib.NativeBase).handle);

CtorLinks smokeCtorlinksFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CtorLinks) return instance;

  final _copiedHandle = _smokeCtorlinksCopyHandle(handle);
  final result = CtorLinks$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeCtorlinksRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeCtorlinksReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeCtorlinksReleaseHandle(handle);

Pointer<Void> smokeCtorlinksToFfiNullable(CtorLinks? value) =>
  value != null ? smokeCtorlinksToFfi(value) : Pointer<Void>.fromAddress(0);

CtorLinks? smokeCtorlinksFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeCtorlinksFromFfi(handle) : null;

void smokeCtorlinksReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCtorlinksReleaseHandle(handle);

// End of CtorLinks "private" section.



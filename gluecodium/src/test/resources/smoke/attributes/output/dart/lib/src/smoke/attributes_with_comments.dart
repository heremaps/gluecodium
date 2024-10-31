

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

/// Class comment
@OnClass
abstract class AttributesWithComments {

  /// Const comment
  @OnConstInClass
  static final bool pi = false;

  /// Function comment
  ///
  @OnFunctionInClass
  void veryFun();
  /// Property comment
  /// Getter comment
  @OnPropertyInClass
  String get prop;
  /// Property comment
  /// Setter comment
  @OnPropertyInClass
  set prop(String value);

}


class AttributesWithComments_SomeStruct {
  /// Field comment
  @OnField
  String field;

  AttributesWithComments_SomeStruct._(this.field);
  AttributesWithComments_SomeStruct()
    : field = "";
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
    return AttributesWithComments_SomeStruct._(
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

Pointer<Void> smokeAttributeswithcommentsSomestructToFfiNullable(AttributesWithComments_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeAttributeswithcommentsSomestructToFfi(value);
  final result = _smokeAttributeswithcommentsSomestructCreateHandleNullable(_handle);
  smokeAttributeswithcommentsSomestructReleaseFfiHandle(_handle);
  return result;
}

AttributesWithComments_SomeStruct? smokeAttributeswithcommentsSomestructFromFfiNullable(Pointer<Void> handle) {
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

final _smokeAttributeswithcommentsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_AttributesWithComments_register_finalizer'));
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
  void veryFun() {
    final _veryFunFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AttributesWithComments_veryFun'));
    final _handle = this.handle;
    _veryFunFfi(_handle, __lib.LibraryContext.isolateId);

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
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> smokeAttributeswithcommentsToFfi(AttributesWithComments value) =>
  _smokeAttributeswithcommentsCopyHandle((value as __lib.NativeBase).handle);

AttributesWithComments smokeAttributeswithcommentsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is AttributesWithComments) return instance;

  final _copiedHandle = _smokeAttributeswithcommentsCopyHandle(handle);
  final result = AttributesWithComments$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeAttributeswithcommentsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeAttributeswithcommentsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAttributeswithcommentsReleaseHandle(handle);

Pointer<Void> smokeAttributeswithcommentsToFfiNullable(AttributesWithComments? value) =>
  value != null ? smokeAttributeswithcommentsToFfi(value) : Pointer<Void>.fromAddress(0);

AttributesWithComments? smokeAttributeswithcommentsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeAttributeswithcommentsFromFfi(handle) : null;

void smokeAttributeswithcommentsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAttributeswithcommentsReleaseHandle(handle);

// End of AttributesWithComments "private" section.



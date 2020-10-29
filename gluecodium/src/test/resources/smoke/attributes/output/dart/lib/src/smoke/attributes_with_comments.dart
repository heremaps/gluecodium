import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
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
final _smoke_AttributesWithComments_SomeStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_SomeStruct_create_handle'));
final _smoke_AttributesWithComments_SomeStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_SomeStruct_release_handle'));
final _smoke_AttributesWithComments_SomeStruct_get_field_field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_SomeStruct_get_field_field'));
Pointer<Void> smoke_AttributesWithComments_SomeStruct_toFfi(AttributesWithComments_SomeStruct value) {
  final _field_handle = String_toFfi(value.field);
  final _result = _smoke_AttributesWithComments_SomeStruct_create_handle(_field_handle);
  String_releaseFfiHandle(_field_handle);
  return _result;
}
AttributesWithComments_SomeStruct smoke_AttributesWithComments_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _field_handle = _smoke_AttributesWithComments_SomeStruct_get_field_field(handle);
  try {
    return AttributesWithComments_SomeStruct(
      String_fromFfi(_field_handle)
    );
  } finally {
    String_releaseFfiHandle(_field_handle);
  }
}
void smoke_AttributesWithComments_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_AttributesWithComments_SomeStruct_release_handle(handle);
// Nullable AttributesWithComments_SomeStruct
final _smoke_AttributesWithComments_SomeStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_SomeStruct_create_handle_nullable'));
final _smoke_AttributesWithComments_SomeStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_SomeStruct_release_handle_nullable'));
final _smoke_AttributesWithComments_SomeStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_AttributesWithComments_SomeStruct_toFfi_nullable(AttributesWithComments_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_AttributesWithComments_SomeStruct_toFfi(value);
  final result = _smoke_AttributesWithComments_SomeStruct_create_handle_nullable(_handle);
  smoke_AttributesWithComments_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
AttributesWithComments_SomeStruct smoke_AttributesWithComments_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_AttributesWithComments_SomeStruct_get_value_nullable(handle);
  final result = smoke_AttributesWithComments_SomeStruct_fromFfi(_handle);
  smoke_AttributesWithComments_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_AttributesWithComments_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_AttributesWithComments_SomeStruct_release_handle_nullable(handle);
// End of AttributesWithComments_SomeStruct "private" section.
// AttributesWithComments "private" section, not exported.
final _smoke_AttributesWithComments_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_copy_handle'));
final _smoke_AttributesWithComments_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithComments_release_handle'));
final _smoke_AttributesWithComments_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_AttributesWithComments_get_raw_pointer'));
class AttributesWithComments$Impl implements AttributesWithComments {
  @protected
  Pointer<Void> handle;
  AttributesWithComments$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_AttributesWithComments_get_raw_pointer(handle));
    _smoke_AttributesWithComments_release_handle(handle);
    handle = null;
  }
  @override
  veryFun() {
    final _veryFun_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AttributesWithComments_veryFun'));
    final _handle = this.handle;
    final __result_handle = _veryFun_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @OnPropertyInClass
  @override
  String get prop {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_AttributesWithComments_prop_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  @OnPropertyInClass
  @override
  set prop(String value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesWithComments_prop_set__String'));
    final _value_handle = String_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    String_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_AttributesWithComments_toFfi(AttributesWithComments value) =>
  _smoke_AttributesWithComments_copy_handle((value as AttributesWithComments$Impl).handle);
AttributesWithComments smoke_AttributesWithComments_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_AttributesWithComments_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as AttributesWithComments;
  if (instance != null) return instance;
  final _copied_handle = _smoke_AttributesWithComments_copy_handle(handle);
  final result = AttributesWithComments$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_AttributesWithComments_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_AttributesWithComments_release_handle(handle);
Pointer<Void> smoke_AttributesWithComments_toFfi_nullable(AttributesWithComments value) =>
  value != null ? smoke_AttributesWithComments_toFfi(value) : Pointer<Void>.fromAddress(0);
AttributesWithComments smoke_AttributesWithComments_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_AttributesWithComments_fromFfi(handle) : null;
void smoke_AttributesWithComments_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_AttributesWithComments_release_handle(handle);
// End of AttributesWithComments "private" section.

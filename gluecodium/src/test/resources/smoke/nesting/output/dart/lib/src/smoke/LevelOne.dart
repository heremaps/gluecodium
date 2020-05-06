import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/smoke/OuterClass.dart';
import 'package:library/src/smoke/OuterInterface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class LevelOne {
  void release();
}
abstract class LevelOne_LevelTwo {
  void release();
}
abstract class LevelOne_LevelTwo_LevelThree {
  void release();
  OuterInterface_InnerClass foo(OuterClass_InnerInterface input);
}
enum LevelOne_LevelTwo_LevelThree_LevelFourEnum {
    none
}
// LevelOne_LevelTwo_LevelThree_LevelFourEnum "private" section, not exported.
int smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_toFfi(LevelOne_LevelTwo_LevelThree_LevelFourEnum value) {
  switch (value) {
  case LevelOne_LevelTwo_LevelThree_LevelFourEnum.none:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for LevelOne_LevelTwo_LevelThree_LevelFourEnum enum.");
  }
}
LevelOne_LevelTwo_LevelThree_LevelFourEnum smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return LevelOne_LevelTwo_LevelThree_LevelFourEnum.none;
  break;
  default:
    throw StateError("Invalid numeric value $handle for LevelOne_LevelTwo_LevelThree_LevelFourEnum enum.");
  }
}
void smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_releaseFfiHandle(int handle) {}
final _smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_create_handle_nullable');
final _smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_release_handle_nullable');
final _smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_get_value_nullable');
Pointer<Void> smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_toFfi_nullable(LevelOne_LevelTwo_LevelThree_LevelFourEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_toFfi(value);
  final result = _smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_create_handle_nullable(_handle);
  smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_releaseFfiHandle(_handle);
  return result;
}
LevelOne_LevelTwo_LevelThree_LevelFourEnum smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_get_value_nullable(handle);
  final result = smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_fromFfi(_handle);
  smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum_release_handle_nullable(handle);
// End of LevelOne_LevelTwo_LevelThree_LevelFourEnum "private" section.
class LevelOne_LevelTwo_LevelThree_LevelFour {
  String stringField;
  LevelOne_LevelTwo_LevelThree_LevelFour(this.stringField);
  static final bool foo = false;
  static LevelOne_LevelTwo_LevelThree_LevelFour fooFactory() {
    final _fooFactory_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_fooFactory');
    final __result_handle = _fooFactory_ffi(__lib.LibraryContext.isolateId);
    final _result = smoke_LevelOne_LevelTwo_LevelThree_LevelFour_fromFfi(__result_handle);
    smoke_LevelOne_LevelTwo_LevelThree_LevelFour_releaseFfiHandle(__result_handle);
    return _result;
  }
}
// LevelOne_LevelTwo_LevelThree_LevelFour "private" section, not exported.
final _smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle');
final _smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle');
final _smoke_LevelOne_LevelTwo_LevelThree_LevelFour_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_get_field_stringField');
Pointer<Void> smoke_LevelOne_LevelTwo_LevelThree_LevelFour_toFfi(LevelOne_LevelTwo_LevelThree_LevelFour value) {
  final _stringField_handle = String_toFfi(value.stringField);
  final _result = _smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle(_stringField_handle);
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
LevelOne_LevelTwo_LevelThree_LevelFour smoke_LevelOne_LevelTwo_LevelThree_LevelFour_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_LevelOne_LevelTwo_LevelThree_LevelFour_get_field_stringField(handle);
  final _result = LevelOne_LevelTwo_LevelThree_LevelFour(
    String_fromFfi(_stringField_handle)
  );
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
void smoke_LevelOne_LevelTwo_LevelThree_LevelFour_releaseFfiHandle(Pointer<Void> handle) => _smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle(handle);
// Nullable LevelOne_LevelTwo_LevelThree_LevelFour
final _smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle_nullable');
final _smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle_nullable');
final _smoke_LevelOne_LevelTwo_LevelThree_LevelFour_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_LevelFour_get_value_nullable');
Pointer<Void> smoke_LevelOne_LevelTwo_LevelThree_LevelFour_toFfi_nullable(LevelOne_LevelTwo_LevelThree_LevelFour value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_LevelOne_LevelTwo_LevelThree_LevelFour_toFfi(value);
  final result = _smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle_nullable(_handle);
  smoke_LevelOne_LevelTwo_LevelThree_LevelFour_releaseFfiHandle(_handle);
  return result;
}
LevelOne_LevelTwo_LevelThree_LevelFour smoke_LevelOne_LevelTwo_LevelThree_LevelFour_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_LevelOne_LevelTwo_LevelThree_LevelFour_get_value_nullable(handle);
  final result = smoke_LevelOne_LevelTwo_LevelThree_LevelFour_fromFfi(_handle);
  smoke_LevelOne_LevelTwo_LevelThree_LevelFour_releaseFfiHandle(_handle);
  return result;
}
void smoke_LevelOne_LevelTwo_LevelThree_LevelFour_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle_nullable(handle);
// End of LevelOne_LevelTwo_LevelThree_LevelFour "private" section.
// LevelOne_LevelTwo_LevelThree "private" section, not exported.
final _smoke_LevelOne_LevelTwo_LevelThree_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_copy_handle');
final _smoke_LevelOne_LevelTwo_LevelThree_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_LevelThree_release_handle');
final _smoke_LevelOne_LevelTwo_LevelThree_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_LevelOne_LevelTwo_LevelThree_get_raw_pointer');
class LevelOne_LevelTwo_LevelThree$Impl implements LevelOne_LevelTwo_LevelThree {
  @protected
  Pointer<Void> handle;
  LevelOne_LevelTwo_LevelThree$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_LevelOne_LevelTwo_LevelThree_get_raw_pointer(handle));
    _smoke_LevelOne_LevelTwo_LevelThree_release_handle(handle);
    handle = null;
  }
  @override
  OuterInterface_InnerClass foo(OuterClass_InnerInterface input) {
    final _foo_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LevelOne_LevelTwo_LevelThree_foo__InnerInterface');
    final _input_handle = smoke_OuterClass_InnerInterface_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _foo_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    smoke_OuterClass_InnerInterface_releaseFfiHandle(_input_handle);
    final _result = smoke_OuterInterface_InnerClass_fromFfi(__result_handle);
    smoke_OuterInterface_InnerClass_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_LevelOne_LevelTwo_LevelThree_toFfi(LevelOne_LevelTwo_LevelThree value) =>
  _smoke_LevelOne_LevelTwo_LevelThree_copy_handle((value as LevelOne_LevelTwo_LevelThree$Impl).handle);
LevelOne_LevelTwo_LevelThree smoke_LevelOne_LevelTwo_LevelThree_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_LevelOne_LevelTwo_LevelThree_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as LevelOne_LevelTwo_LevelThree;
  if (instance != null) return instance;
  final _copied_handle = _smoke_LevelOne_LevelTwo_LevelThree_copy_handle(handle);
  final result = LevelOne_LevelTwo_LevelThree$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_LevelOne_LevelTwo_LevelThree_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_LevelOne_LevelTwo_LevelThree_release_handle(handle);
Pointer<Void> smoke_LevelOne_LevelTwo_LevelThree_toFfi_nullable(LevelOne_LevelTwo_LevelThree value) =>
  value != null ? smoke_LevelOne_LevelTwo_LevelThree_toFfi(value) : Pointer<Void>.fromAddress(0);
LevelOne_LevelTwo_LevelThree smoke_LevelOne_LevelTwo_LevelThree_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_LevelOne_LevelTwo_LevelThree_fromFfi(handle) : null;
void smoke_LevelOne_LevelTwo_LevelThree_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_LevelOne_LevelTwo_LevelThree_release_handle(handle);
// End of LevelOne_LevelTwo_LevelThree "private" section.
// LevelOne_LevelTwo "private" section, not exported.
final _smoke_LevelOne_LevelTwo_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_copy_handle');
final _smoke_LevelOne_LevelTwo_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LevelOne_LevelTwo_release_handle');
final _smoke_LevelOne_LevelTwo_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_LevelOne_LevelTwo_get_raw_pointer');
class LevelOne_LevelTwo$Impl implements LevelOne_LevelTwo {
  @protected
  Pointer<Void> handle;
  LevelOne_LevelTwo$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_LevelOne_LevelTwo_get_raw_pointer(handle));
    _smoke_LevelOne_LevelTwo_release_handle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_LevelOne_LevelTwo_toFfi(LevelOne_LevelTwo value) =>
  _smoke_LevelOne_LevelTwo_copy_handle((value as LevelOne_LevelTwo$Impl).handle);
LevelOne_LevelTwo smoke_LevelOne_LevelTwo_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_LevelOne_LevelTwo_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as LevelOne_LevelTwo;
  if (instance != null) return instance;
  final _copied_handle = _smoke_LevelOne_LevelTwo_copy_handle(handle);
  final result = LevelOne_LevelTwo$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_LevelOne_LevelTwo_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_LevelOne_LevelTwo_release_handle(handle);
Pointer<Void> smoke_LevelOne_LevelTwo_toFfi_nullable(LevelOne_LevelTwo value) =>
  value != null ? smoke_LevelOne_LevelTwo_toFfi(value) : Pointer<Void>.fromAddress(0);
LevelOne_LevelTwo smoke_LevelOne_LevelTwo_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_LevelOne_LevelTwo_fromFfi(handle) : null;
void smoke_LevelOne_LevelTwo_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_LevelOne_LevelTwo_release_handle(handle);
// End of LevelOne_LevelTwo "private" section.
// LevelOne "private" section, not exported.
final _smoke_LevelOne_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LevelOne_copy_handle');
final _smoke_LevelOne_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LevelOne_release_handle');
final _smoke_LevelOne_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_LevelOne_get_raw_pointer');
class LevelOne$Impl implements LevelOne {
  @protected
  Pointer<Void> handle;
  LevelOne$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_LevelOne_get_raw_pointer(handle));
    _smoke_LevelOne_release_handle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_LevelOne_toFfi(LevelOne value) =>
  _smoke_LevelOne_copy_handle((value as LevelOne$Impl).handle);
LevelOne smoke_LevelOne_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_LevelOne_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as LevelOne;
  if (instance != null) return instance;
  final _copied_handle = _smoke_LevelOne_copy_handle(handle);
  final result = LevelOne$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_LevelOne_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_LevelOne_release_handle(handle);
Pointer<Void> smoke_LevelOne_toFfi_nullable(LevelOne value) =>
  value != null ? smoke_LevelOne_toFfi(value) : Pointer<Void>.fromAddress(0);
LevelOne smoke_LevelOne_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_LevelOne_fromFfi(handle) : null;
void smoke_LevelOne_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_LevelOne_release_handle(handle);
// End of LevelOne "private" section.

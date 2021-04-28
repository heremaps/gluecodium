import 'package:library/src/_lazy_list.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/unreasonably_lazy_class.dart';
import 'package:library/src/smoke/very_big_struct.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@immutable
class UseOptimizedListStruct {
  final List<VeryBigStruct> structs;
  final List<UnreasonablyLazyClass> classes;
  const UseOptimizedListStruct(this.structs, this.classes);
}
// UseOptimizedListStruct "private" section, not exported.
final _smoke_UseOptimizedListStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_create_handle'));
final _smoke_UseOptimizedListStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_release_handle'));
final _smoke_UseOptimizedListStruct_get_field_structs = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_get_field_structs'));
final _smoke_UseOptimizedListStruct_get_field_classes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_get_field_classes'));
final _smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get_size = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get_size'));
final _smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('library_smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get'));
final _smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_release_handle'));
final _smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get_size = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get_size'));
final _smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('library_smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get'));
final _smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_release_handle'));
Pointer<Void> smoke_UseOptimizedListStruct_toFfi(UseOptimizedListStruct value) {
  final _structs_handle = (value.structs as __lib.LazyList).handle;
  final _classes_handle = (value.classes as __lib.LazyList).handle;
  final _result = _smoke_UseOptimizedListStruct_create_handle(_structs_handle, _classes_handle);
  return _result;
}
UseOptimizedListStruct smoke_UseOptimizedListStruct_fromFfi(Pointer<Void> handle) {
  final _structs_handle = _smoke_UseOptimizedListStruct_get_field_structs(handle);
  final _classes_handle = _smoke_UseOptimizedListStruct_get_field_classes(handle);
  try {
    return UseOptimizedListStruct(
      __lib.LazyList(
        _structs_handle,
        _smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get_size(_structs_handle),
        (index) {
          final __element_handle = _smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get(_structs_handle, index);
          final __element_result = smoke_VeryBigStruct_fromFfi(__element_handle);
          smoke_VeryBigStruct_releaseFfiHandle(__element_handle);
          return __element_result;
        },
        () => _smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_release_handle(_structs_handle)
      ),
      __lib.LazyList(
        _classes_handle,
        _smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get_size(_classes_handle),
        (index) {
          final __element_handle = _smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get(_classes_handle, index);
          final __element_result = smoke_UnreasonablyLazyClass_fromFfi(__element_handle);
          smoke_UnreasonablyLazyClass_releaseFfiHandle(__element_handle);
          return __element_result;
        },
        () => _smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_release_handle(_classes_handle)
      )
    );
  } finally {
  }
}
void smoke_UseOptimizedListStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_UseOptimizedListStruct_release_handle(handle);
// Nullable UseOptimizedListStruct
final _smoke_UseOptimizedListStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_create_handle_nullable'));
final _smoke_UseOptimizedListStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_release_handle_nullable'));
final _smoke_UseOptimizedListStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_get_value_nullable'));
Pointer<Void> smoke_UseOptimizedListStruct_toFfi_nullable(UseOptimizedListStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_UseOptimizedListStruct_toFfi(value);
  final result = _smoke_UseOptimizedListStruct_create_handle_nullable(_handle);
  smoke_UseOptimizedListStruct_releaseFfiHandle(_handle);
  return result;
}
UseOptimizedListStruct? smoke_UseOptimizedListStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_UseOptimizedListStruct_get_value_nullable(handle);
  final result = smoke_UseOptimizedListStruct_fromFfi(_handle);
  smoke_UseOptimizedListStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_UseOptimizedListStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_UseOptimizedListStruct_release_handle_nullable(handle);
// End of UseOptimizedListStruct "private" section.

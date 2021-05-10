import 'package:library/src/_lazy_list.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/unreasonably_lazy_class.dart';
import 'package:library/src/smoke/very_big_struct.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@immutable
class UseOptimizedListStruct {
  final List<VeryBigStruct> structs;
  final List<UnreasonablyLazyClass> classes;
  const UseOptimizedListStruct(this.structs, this.classes);
}
// UseOptimizedListStruct "private" section, not exported.
final _smokeUseoptimizedliststructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_create_handle'));
final _smokeUseoptimizedliststructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_release_handle'));
final _smokeUseoptimizedliststructGetFieldstructs = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_get_field_structs'));
final _smokeUseoptimizedliststructGetFieldclasses = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
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
  final _structsHandle = (value.structs as __lib.LazyList).handle;
  final _classesHandle = (value.classes as __lib.LazyList).handle;
  final _result = _smokeUseoptimizedliststructCreateHandle(_structsHandle, _classesHandle);
  return _result;
}
UseOptimizedListStruct smoke_UseOptimizedListStruct_fromFfi(Pointer<Void> handle) {
  final _structsHandle = _smokeUseoptimizedliststructGetFieldstructs(handle);
  final _classesHandle = _smokeUseoptimizedliststructGetFieldclasses(handle);
  try {
    return UseOptimizedListStruct(
      __lib.LazyList(
        _structsHandle,
        _smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get_size(_structsHandle),
        (index) {
          final __elementHandle = _smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get(_structsHandle, index);
          final __elementResult = smoke_VeryBigStruct_fromFfi(__elementHandle);
          smoke_VeryBigStruct_releaseFfiHandle(__elementHandle);
          return __elementResult;
        },
        () => _smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_release_handle(_structsHandle)
      ),
      __lib.LazyList(
        _classesHandle,
        _smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get_size(_classesHandle),
        (index) {
          final __elementHandle = _smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get(_classesHandle, index);
          final __elementResult = smoke_UnreasonablyLazyClass_fromFfi(__elementHandle);
          smoke_UnreasonablyLazyClass_releaseFfiHandle(__elementHandle);
          return __elementResult;
        },
        () => _smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_release_handle(_classesHandle)
      )
    );
  } finally {
  }
}
void smoke_UseOptimizedListStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeUseoptimizedliststructReleaseHandle(handle);
// Nullable UseOptimizedListStruct
final _smoke_UseOptimizedListStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_create_handle_nullable'));
final _smoke_UseOptimizedListStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_release_handle_nullable'));
final _smoke_UseOptimizedListStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_get_value_nullable'));
Pointer<Void> smoke_UseOptimizedListStruct_toFfi_nullable(UseOptimizedListStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_UseOptimizedListStruct_toFfi(value);
  final result = _smoke_UseOptimizedListStructCreateHandleNullable(_handle);
  smoke_UseOptimizedListStruct_releaseFfiHandle(_handle);
  return result;
}
UseOptimizedListStruct smoke_UseOptimizedListStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_UseOptimizedListStructGetValueNullable(handle);
  final result = smoke_UseOptimizedListStruct_fromFfi(_handle);
  smoke_UseOptimizedListStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_UseOptimizedListStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_UseOptimizedListStructReleaseHandleNullable(handle);
// End of UseOptimizedListStruct "private" section.

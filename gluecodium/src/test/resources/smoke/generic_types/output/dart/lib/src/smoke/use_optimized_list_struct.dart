import 'package:library/src/_lazy_list.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/unreasonably_lazy_class.dart';
import 'package:library/src/smoke/very_big_struct.dart';
import 'package:meta/meta.dart';
import 'dart:ffi';
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
final _smokeUseoptimizedliststructsmokeVerybigstructLazyListGetSize = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get_size'));
final _smokeUseoptimizedliststructsmokeVerybigstructLazyListGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('library_smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_get'));
final _smokeUseoptimizedliststructsmokeVerybigstructLazyListReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_smoke_VeryBigStructLazyList_release_handle'));
final _smokeUseoptimizedliststructsmokeUnreasonablylazyclassLazyListGetSize = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get_size'));
final _smokeUseoptimizedliststructsmokeUnreasonablylazyclassLazyListGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('library_smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_get'));
final _smokeUseoptimizedliststructsmokeUnreasonablylazyclassLazyListReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_smoke_UnreasonablyLazyClassLazyList_release_handle'));
Pointer<Void> smokeUseoptimizedliststructToFfi(UseOptimizedListStruct value) {
  final _structsHandle = (value.structs as __lib.LazyList).handle;
  final _classesHandle = (value.classes as __lib.LazyList).handle;
  final _result = _smokeUseoptimizedliststructCreateHandle(_structsHandle, _classesHandle);
  return _result;
}
UseOptimizedListStruct smokeUseoptimizedliststructFromFfi(Pointer<Void> handle) {
  final _structsHandle = _smokeUseoptimizedliststructGetFieldstructs(handle);
  final _classesHandle = _smokeUseoptimizedliststructGetFieldclasses(handle);
  try {
    return UseOptimizedListStruct(
      __lib.LazyList(
        _structsHandle,
        _smokeUseoptimizedliststructsmokeVerybigstructLazyListGetSize(_structsHandle),
        (index) {
          final __elementHandle = _smokeUseoptimizedliststructsmokeVerybigstructLazyListGet(_structsHandle, index);
          final __elementResult = smokeVerybigstructFromFfi(__elementHandle);
          smokeVerybigstructReleaseFfiHandle(__elementHandle);
          return __elementResult;
        },
        () => _smokeUseoptimizedliststructsmokeVerybigstructLazyListReleaseHandle(_structsHandle)
      ),
      __lib.LazyList(
        _classesHandle,
        _smokeUseoptimizedliststructsmokeUnreasonablylazyclassLazyListGetSize(_classesHandle),
        (index) {
          final __elementHandle = _smokeUseoptimizedliststructsmokeUnreasonablylazyclassLazyListGet(_classesHandle, index);
          final __elementResult = smokeUnreasonablylazyclassFromFfi(__elementHandle);
          smokeUnreasonablylazyclassReleaseFfiHandle(__elementHandle);
          return __elementResult;
        },
        () => _smokeUseoptimizedliststructsmokeUnreasonablylazyclassLazyListReleaseHandle(_classesHandle)
      )
    );
  } finally {
  }
}
void smokeUseoptimizedliststructReleaseFfiHandle(Pointer<Void> handle) => _smokeUseoptimizedliststructReleaseHandle(handle);
// Nullable UseOptimizedListStruct
final _smokeUseoptimizedliststructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_create_handle_nullable'));
final _smokeUseoptimizedliststructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_release_handle_nullable'));
final _smokeUseoptimizedliststructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseOptimizedListStruct_get_value_nullable'));
Pointer<Void> smokeUseoptimizedliststructToFfiNullable(UseOptimizedListStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeUseoptimizedliststructToFfi(value);
  final result = _smokeUseoptimizedliststructCreateHandleNullable(_handle);
  smokeUseoptimizedliststructReleaseFfiHandle(_handle);
  return result;
}
UseOptimizedListStruct smokeUseoptimizedliststructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeUseoptimizedliststructGetValueNullable(handle);
  final result = smokeUseoptimizedliststructFromFfi(_handle);
  smokeUseoptimizedliststructReleaseFfiHandle(_handle);
  return result;
}
void smokeUseoptimizedliststructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeUseoptimizedliststructReleaseHandleNullable(handle);
// End of UseOptimizedListStruct "private" section.

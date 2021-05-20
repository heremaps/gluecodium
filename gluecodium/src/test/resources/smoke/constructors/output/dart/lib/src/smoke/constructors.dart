import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Constructors {
  factory Constructors() => Constructors$Impl.$init();
  factory Constructors.fromOther(Constructors other) => Constructors$Impl.fromOther(other);
  factory Constructors.fromMulti(String foo, int bar) => Constructors$Impl.fromMulti(foo, bar);
  factory Constructors.fromString(String input) => Constructors$Impl.fromString(input);
  factory Constructors.fromList(List<double> input) => Constructors$Impl.fromList(input);
  factory Constructors.create(int input) => Constructors$Impl.create(input);
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
}
enum Constructors_ErrorEnum {
    none,
    crashed
}
// Constructors_ErrorEnum "private" section, not exported.
int smokeConstructorsErrorenumToFfi(Constructors_ErrorEnum value) {
  switch (value) {
  case Constructors_ErrorEnum.none:
    return 0;
  break;
  case Constructors_ErrorEnum.crashed:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Constructors_ErrorEnum enum.");
  }
}
Constructors_ErrorEnum smokeConstructorsErrorenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Constructors_ErrorEnum.none;
  break;
  case 1:
    return Constructors_ErrorEnum.crashed;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Constructors_ErrorEnum enum.");
  }
}
void smokeConstructorsErrorenumReleaseFfiHandle(int handle) {}
final _smokeConstructorsErrorenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Constructors_ErrorEnum_create_handle_nullable'));
final _smokeConstructorsErrorenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Constructors_ErrorEnum_release_handle_nullable'));
final _smokeConstructorsErrorenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Constructors_ErrorEnum_get_value_nullable'));
Pointer<Void> smokeConstructorsErrorenumToFfiNullable(Constructors_ErrorEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeConstructorsErrorenumToFfi(value);
  final result = _smokeConstructorsErrorenumCreateHandleNullable(_handle);
  smokeConstructorsErrorenumReleaseFfiHandle(_handle);
  return result;
}
Constructors_ErrorEnum smokeConstructorsErrorenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeConstructorsErrorenumGetValueNullable(handle);
  final result = smokeConstructorsErrorenumFromFfi(_handle);
  smokeConstructorsErrorenumReleaseFfiHandle(_handle);
  return result;
}
void smokeConstructorsErrorenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeConstructorsErrorenumReleaseHandleNullable(handle);
// End of Constructors_ErrorEnum "private" section.
class Constructors_ConstructorExplodedException implements Exception {
  final Constructors_ErrorEnum error;
  Constructors_ConstructorExplodedException(this.error);
}
// Constructors "private" section, not exported.
final _smokeConstructorsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Constructors_copy_handle'));
final _smokeConstructorsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Constructors_release_handle'));
final _smokeConstructorsGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Constructors_get_type_id'));
final _fromStringReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Constructors_create__String_return_release_handle'));
final _fromStringReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Constructors_create__String_return_get_result'));
final _fromStringReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Constructors_create__String_return_get_error'));
final _fromStringReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Constructors_create__String_return_has_error'));
class Constructors$Impl extends __lib.NativeBase implements Constructors {
  Constructors$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeConstructorsReleaseHandle(handle);
    handle = null;
  }
  Constructors$Impl.$init() : super(_$init()) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  Constructors$Impl.fromOther(Constructors other) : super(_fromOther(other)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  Constructors$Impl.fromMulti(String foo, int bar) : super(_fromMulti(foo, bar)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  Constructors$Impl.fromString(String input) : super(_fromString(input)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  Constructors$Impl.fromList(List<double> input) : super(_fromList(input)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  Constructors$Impl.create(int input) : super(_create(input)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Constructors_create'));
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }
  static Pointer<Void> _fromOther(Constructors other) {
    final _fromOtherFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Constructors_create__Constructors'));
    final _otherHandle = smokeConstructorsToFfi(other);
    final __resultHandle = _fromOtherFfi(__lib.LibraryContext.isolateId, _otherHandle);
    smokeConstructorsReleaseFfiHandle(_otherHandle);
    return __resultHandle;
  }
  static Pointer<Void> _fromMulti(String foo, int bar) {
    final _fromMultiFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint64), Pointer<Void> Function(int, Pointer<Void>, int)>('library_smoke_Constructors_create__String_ULong'));
    final _fooHandle = stringToFfi(foo);
    final _barHandle = (bar);
    final __resultHandle = _fromMultiFfi(__lib.LibraryContext.isolateId, _fooHandle, _barHandle);
    stringReleaseFfiHandle(_fooHandle);
    return __resultHandle;
  }
  static Pointer<Void> _fromString(String input) {
    final _fromStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Constructors_create__String'));
    final _inputHandle = stringToFfi(input);
    final __callResultHandle = _fromStringFfi(__lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    if (_fromStringReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _fromStringReturnGetError(__callResultHandle);
        _fromStringReturnReleaseHandle(__callResultHandle);
        try {
          throw Constructors_ConstructorExplodedException(smokeConstructorsErrorenumFromFfi(__errorHandle));
        } finally {
          smokeConstructorsErrorenumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _fromStringReturnGetResult(__callResultHandle);
    _fromStringReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }
  static Pointer<Void> _fromList(List<double> input) {
    final _fromListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Constructors_create__ListOf_1Double'));
    final _inputHandle = foobarListofDoubleToFfi(input);
    final __resultHandle = _fromListFfi(__lib.LibraryContext.isolateId, _inputHandle);
    foobarListofDoubleReleaseFfiHandle(_inputHandle);
    return __resultHandle;
  }
  static Pointer<Void> _create(int input) {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint64), Pointer<Void> Function(int, int)>('library_smoke_Constructors_create__ULong'));
    final _inputHandle = (input);
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId, _inputHandle);
    return __resultHandle;
  }
}
Pointer<Void> smokeConstructorsToFfi(Constructors value) =>
  _smokeConstructorsCopyHandle((value as __lib.NativeBase).handle);
Constructors smokeConstructorsFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Constructors;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeConstructorsGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeConstructorsCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : Constructors$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeConstructorsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeConstructorsReleaseHandle(handle);
Pointer<Void> smokeConstructorsToFfiNullable(Constructors value) =>
  value != null ? smokeConstructorsToFfi(value) : Pointer<Void>.fromAddress(0);
Constructors smokeConstructorsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeConstructorsFromFfi(handle) : null;
void smokeConstructorsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeConstructorsReleaseHandle(handle);
// End of Constructors "private" section.

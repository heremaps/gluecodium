import 'dart:ffi';
import 'dart:typed_data';
import 'package:intl/locale.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:meta/meta.dart';
final _doNothingReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_doNothing_return_release_handle'));
final _doNothingReturnGetResult = (Pointer) {};
final _doNothingReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_OuterStruct_doNothing_return_get_error'));
final _doNothingReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_OuterStruct_doNothing_return_has_error'));
class OuterStruct {
  String field;
  OuterStruct(this.field);
  doNothing() {
    final _doNothingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_OuterStruct_doNothing'));
    final _handle = smokeOuterstructToFfi(this);
    final __callResultHandle = _doNothingFfi(_handle, __lib.LibraryContext.isolateId);
    smokeOuterstructReleaseFfiHandle(_handle);
    if (_doNothingReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _doNothingReturnGetError(__callResultHandle);
        _doNothingReturnReleaseHandle(__callResultHandle);
        try {
          throw OuterStruct_InstantiationException(smokeOuterstructInnerenumFromFfi(__errorHandle));
        } finally {
          smokeOuterstructInnerenumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _doNothingReturnGetResult(__callResultHandle);
    _doNothingReturnReleaseHandle(__callResultHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
enum OuterStruct_InnerEnum {
    foo,
    bar
}
// OuterStruct_InnerEnum "private" section, not exported.
int smokeOuterstructInnerenumToFfi(OuterStruct_InnerEnum value) {
  switch (value) {
  case OuterStruct_InnerEnum.foo:
    return 0;
  break;
  case OuterStruct_InnerEnum.bar:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for OuterStruct_InnerEnum enum.");
  }
}
OuterStruct_InnerEnum smokeOuterstructInnerenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return OuterStruct_InnerEnum.foo;
  break;
  case 1:
    return OuterStruct_InnerEnum.bar;
  break;
  default:
    throw StateError("Invalid numeric value $handle for OuterStruct_InnerEnum enum.");
  }
}
void smokeOuterstructInnerenumReleaseFfiHandle(int handle) {}
final _smokeOuterstructInnerenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_OuterStruct_InnerEnum_create_handle_nullable'));
final _smokeOuterstructInnerenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerEnum_release_handle_nullable'));
final _smokeOuterstructInnerenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerEnum_get_value_nullable'));
Pointer<Void> smokeOuterstructInnerenumToFfiNullable(OuterStruct_InnerEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOuterstructInnerenumToFfi(value);
  final result = _smokeOuterstructInnerenumCreateHandleNullable(_handle);
  smokeOuterstructInnerenumReleaseFfiHandle(_handle);
  return result;
}
OuterStruct_InnerEnum? smokeOuterstructInnerenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOuterstructInnerenumGetValueNullable(handle);
  final result = smokeOuterstructInnerenumFromFfi(_handle);
  smokeOuterstructInnerenumReleaseFfiHandle(_handle);
  return result;
}
void smokeOuterstructInnerenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterstructInnerenumReleaseHandleNullable(handle);
// End of OuterStruct_InnerEnum "private" section.
class OuterStruct_InstantiationException implements Exception {
  final OuterStruct_InnerEnum error;
  OuterStruct_InstantiationException(this.error);
}
class OuterStruct_InnerStruct {
  List<DateTime> otherField;
  OuterStruct_InnerStruct(this.otherField);
  doSomething() {
    final _doSomethingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_OuterStruct_InnerStruct_doSomething'));
    final _handle = smokeOuterstructInnerstructToFfi(this);
    final __resultHandle = _doSomethingFfi(_handle, __lib.LibraryContext.isolateId);
    smokeOuterstructInnerstructReleaseFfiHandle(_handle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
// OuterStruct_InnerStruct "private" section, not exported.
final _smokeOuterstructInnerstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerStruct_create_handle'));
final _smokeOuterstructInnerstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerStruct_release_handle'));
final _smokeOuterstructInnerstructGetFieldotherField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerStruct_get_field_otherField'));
Pointer<Void> smokeOuterstructInnerstructToFfi(OuterStruct_InnerStruct value) {
  final _otherFieldHandle = foobarListofDateToFfi(value.otherField);
  final _result = _smokeOuterstructInnerstructCreateHandle(_otherFieldHandle);
  foobarListofDateReleaseFfiHandle(_otherFieldHandle);
  return _result;
}
OuterStruct_InnerStruct smokeOuterstructInnerstructFromFfi(Pointer<Void> handle) {
  final _otherFieldHandle = _smokeOuterstructInnerstructGetFieldotherField(handle);
  try {
    return OuterStruct_InnerStruct(
      foobarListofDateFromFfi(_otherFieldHandle)
    );
  } finally {
    foobarListofDateReleaseFfiHandle(_otherFieldHandle);
  }
}
void smokeOuterstructInnerstructReleaseFfiHandle(Pointer<Void> handle) => _smokeOuterstructInnerstructReleaseHandle(handle);
// Nullable OuterStruct_InnerStruct
final _smokeOuterstructInnerstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerStruct_create_handle_nullable'));
final _smokeOuterstructInnerstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerStruct_release_handle_nullable'));
final _smokeOuterstructInnerstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerStruct_get_value_nullable'));
Pointer<Void> smokeOuterstructInnerstructToFfiNullable(OuterStruct_InnerStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOuterstructInnerstructToFfi(value);
  final result = _smokeOuterstructInnerstructCreateHandleNullable(_handle);
  smokeOuterstructInnerstructReleaseFfiHandle(_handle);
  return result;
}
OuterStruct_InnerStruct? smokeOuterstructInnerstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOuterstructInnerstructGetValueNullable(handle);
  final result = smokeOuterstructInnerstructFromFfi(_handle);
  smokeOuterstructInnerstructReleaseFfiHandle(_handle);
  return result;
}
void smokeOuterstructInnerstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterstructInnerstructReleaseHandleNullable(handle);
// End of OuterStruct_InnerStruct "private" section.
abstract class OuterStruct_InnerClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  Set<Locale> fooBar();
}
// OuterStruct_InnerClass "private" section, not exported.
final _smokeOuterstructInnerclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerClass_copy_handle'));
final _smokeOuterstructInnerclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerClass_release_handle'));
class OuterStruct_InnerClass$Impl extends __lib.NativeBase implements OuterStruct_InnerClass {
  OuterStruct_InnerClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheInstance(handle);
    _smokeOuterstructInnerclassReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  Set<Locale> fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_OuterStruct_InnerClass_fooBar'));
    final _handle = this.handle;
    final __resultHandle = _fooBarFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarSetofLocaleFromFfi(__resultHandle);
    } finally {
      foobarSetofLocaleReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeOuterstructInnerclassToFfi(OuterStruct_InnerClass value) =>
  _smokeOuterstructInnerclassCopyHandle((value as __lib.NativeBase).handle);
OuterStruct_InnerClass smokeOuterstructInnerclassFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OuterStruct_InnerClass) return instance as OuterStruct_InnerClass;
  final _copiedHandle = _smokeOuterstructInnerclassCopyHandle(handle);
  final result = OuterStruct_InnerClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  return result;
}
void smokeOuterstructInnerclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterstructInnerclassReleaseHandle(handle);
Pointer<Void> smokeOuterstructInnerclassToFfiNullable(OuterStruct_InnerClass? value) =>
  value != null ? smokeOuterstructInnerclassToFfi(value) : Pointer<Void>.fromAddress(0);
OuterStruct_InnerClass? smokeOuterstructInnerclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterstructInnerclassFromFfi(handle) : null;
void smokeOuterstructInnerclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterstructInnerclassReleaseHandle(handle);
// End of OuterStruct_InnerClass "private" section.
abstract class OuterStruct_InnerInterface {
  factory OuterStruct_InnerInterface(
    Map<String, Uint8List> Function() barBazLambda,
  ) => OuterStruct_InnerInterface$Lambdas(
    barBazLambda,
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  Map<String, Uint8List> barBaz();
}
// OuterStruct_InnerInterface "private" section, not exported.
final _smokeOuterstructInnerinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerInterface_copy_handle'));
final _smokeOuterstructInnerinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerInterface_release_handle'));
final _smokeOuterstructInnerinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_OuterStruct_InnerInterface_create_proxy'));
final _smokeOuterstructInnerinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerInterface_get_type_id'));
class OuterStruct_InnerInterface$Lambdas implements OuterStruct_InnerInterface {
  Map<String, Uint8List> Function() barBazLambda;
  OuterStruct_InnerInterface$Lambdas(
    this.barBazLambda,
  );
  @override
  void release() {}
  @override
  Map<String, Uint8List> barBaz() =>
    barBazLambda();
}
class OuterStruct_InnerInterface$Impl extends __lib.NativeBase implements OuterStruct_InnerInterface {
  OuterStruct_InnerInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheInstance(handle);
    _smokeOuterstructInnerinterfaceReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  Map<String, Uint8List> barBaz() {
    final _barBazFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_OuterStruct_InnerInterface_barBaz'));
    final _handle = this.handle;
    final __resultHandle = _barBazFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarMapofStringToBlobFromFfi(__resultHandle);
    } finally {
      foobarMapofStringToBlobReleaseFfiHandle(__resultHandle);
    }
  }
}
int _smokeOuterstructInnerinterfacebarBazStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  Map<String, Uint8List>? _resultObject;
  try {
    _resultObject = (_obj as OuterStruct_InnerInterface).barBaz();
    _result.value = foobarMapofStringToBlobToFfi(_resultObject);
  } finally {
  }
  return 0;
}
Pointer<Void> smokeOuterstructInnerinterfaceToFfi(OuterStruct_InnerInterface value) {
  if (value is __lib.NativeBase) return _smokeOuterstructInnerinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeOuterstructInnerinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeOuterstructInnerinterfacebarBazStatic, __lib.unknownError)
  );
  return result;
}
OuterStruct_InnerInterface smokeOuterstructInnerinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OuterStruct_InnerInterface) return instance as OuterStruct_InnerInterface;
  final _typeIdHandle = _smokeOuterstructInnerinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeOuterstructInnerinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OuterStruct_InnerInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  return result;
}
void smokeOuterstructInnerinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterstructInnerinterfaceReleaseHandle(handle);
Pointer<Void> smokeOuterstructInnerinterfaceToFfiNullable(OuterStruct_InnerInterface? value) =>
  value != null ? smokeOuterstructInnerinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
OuterStruct_InnerInterface? smokeOuterstructInnerinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterstructInnerinterfaceFromFfi(handle) : null;
void smokeOuterstructInnerinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterstructInnerinterfaceReleaseHandle(handle);
// End of OuterStruct_InnerInterface "private" section.
// OuterStruct "private" section, not exported.
final _smokeOuterstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_create_handle'));
final _smokeOuterstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_release_handle'));
final _smokeOuterstructGetFieldfield = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_get_field_field'));
Pointer<Void> smokeOuterstructToFfi(OuterStruct value) {
  final _fieldHandle = stringToFfi(value.field);
  final _result = _smokeOuterstructCreateHandle(_fieldHandle);
  stringReleaseFfiHandle(_fieldHandle);
  return _result;
}
OuterStruct smokeOuterstructFromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeOuterstructGetFieldfield(handle);
  try {
    return OuterStruct(
      stringFromFfi(_fieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_fieldHandle);
  }
}
void smokeOuterstructReleaseFfiHandle(Pointer<Void> handle) => _smokeOuterstructReleaseHandle(handle);
// Nullable OuterStruct
final _smokeOuterstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_create_handle_nullable'));
final _smokeOuterstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_release_handle_nullable'));
final _smokeOuterstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_get_value_nullable'));
Pointer<Void> smokeOuterstructToFfiNullable(OuterStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOuterstructToFfi(value);
  final result = _smokeOuterstructCreateHandleNullable(_handle);
  smokeOuterstructReleaseFfiHandle(_handle);
  return result;
}
OuterStruct? smokeOuterstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOuterstructGetValueNullable(handle);
  final result = smokeOuterstructFromFfi(_handle);
  smokeOuterstructReleaseFfiHandle(_handle);
  return result;
}
void smokeOuterstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterstructReleaseHandleNullable(handle);
// End of OuterStruct "private" section.

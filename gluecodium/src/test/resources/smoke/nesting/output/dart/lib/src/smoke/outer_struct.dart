

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

final _doNothingsmokeOuterstructDonothingReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_doNothing_return_release_handle'));
final _doNothingsmokeOuterstructDonothingReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_OuterStruct_doNothing_return_get_error'));
final _doNothingsmokeOuterstructDonothingReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_OuterStruct_doNothing_return_has_error'));



class OuterStruct {
  String field;

  OuterStruct(this.field);

  void doNothing() => $prototype.doNothing(this);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = OuterStruct$Impl();
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
  case OuterStruct_InnerEnum.bar:
    return 1;
  }
}

OuterStruct_InnerEnum smokeOuterstructInnerenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return OuterStruct_InnerEnum.foo;
  case 1:
    return OuterStruct_InnerEnum.bar;
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

  void doSomething() => $prototype.doSomething(this);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = OuterStruct_InnerStruct$Impl();
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



/// @nodoc
@visibleForTesting
class OuterStruct_InnerStruct$Impl {
  void doSomething(OuterStruct_InnerStruct $that) {
    final _doSomethingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_OuterStruct_InnerStruct_doSomething'));
    final _handle = smokeOuterstructInnerstructToFfi($that);
    _doSomethingFfi(_handle, __lib.LibraryContext.isolateId);
    smokeOuterstructInnerstructReleaseFfiHandle(_handle);

  }

}

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
abstract class OuterStruct_InnerClass implements Finalizable {


  Set<Locale> fooBar();
}


// OuterStruct_InnerClass "private" section, not exported.

final _smokeOuterstructInnerclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_OuterStruct_InnerClass_register_finalizer'));
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
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OuterStruct_InnerClass) return instance;

  final _copiedHandle = _smokeOuterstructInnerclassCopyHandle(handle);
  final result = OuterStruct_InnerClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeOuterstructInnerclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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
abstract class OuterStruct_InnerInterface implements Finalizable {

  factory OuterStruct_InnerInterface(
    Map<String, Uint8List> Function() barBazLambda,

  ) => OuterStruct_InnerInterface$Lambdas(
    barBazLambda,

  );


  Map<String, Uint8List> barBaz();
}


// OuterStruct_InnerInterface "private" section, not exported.

final _smokeOuterstructInnerinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_OuterStruct_InnerInterface_register_finalizer'));
final _smokeOuterstructInnerinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerInterface_copy_handle'));
final _smokeOuterstructInnerinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerInterface_release_handle'));
final _smokeOuterstructInnerinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
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
  Map<String, Uint8List> barBaz() =>
    barBazLambda();
}

class OuterStruct_InnerInterface$Impl extends __lib.NativeBase implements OuterStruct_InnerInterface {

  OuterStruct_InnerInterface$Impl(Pointer<Void> handle) : super(handle);

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

void _smokeOuterstructInnerinterfacebarBazStatic(OuterStruct_InnerInterface _obj, Pointer<Pointer<Void>> _result) {
  Map<String, Uint8List>? _resultObject;
  try {
    _resultObject = _obj.barBaz();
    _result.value = foobarMapofStringToBlobToFfi(_resultObject);
  } finally {
  }
}


Pointer<Void> smokeOuterstructInnerinterfaceToFfi(OuterStruct_InnerInterface value) {
  if (value is __lib.NativeBase) return _smokeOuterstructInnerinterfaceCopyHandle((value as __lib.NativeBase).handle);

  void __barBazCaller(Pointer<Pointer<Void>> _result) { _smokeOuterstructInnerinterfacebarBazStatic(value, _result); }
  final __barBazCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__barBazCaller);
  __barBazCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __barBazCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeOuterstructInnerinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    __closeAllCallback.nativeFunction,
    __barBazCallback.nativeFunction
  );

  return result;
}

OuterStruct_InnerInterface smokeOuterstructInnerinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OuterStruct_InnerInterface) return instance;

  final _typeIdHandle = _smokeOuterstructInnerinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeOuterstructInnerinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OuterStruct_InnerInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeOuterstructInnerinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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
typedef OuterStruct_InnerLambda = void Function();

// OuterStruct_InnerLambda "private" section, not exported.

final _smokeOuterstructInnerlambdaRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_OuterStruct_InnerLambda_register_finalizer'));
final _smokeOuterstructInnerlambdaCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerLambda_copy_handle'));
final _smokeOuterstructInnerlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerLambda_release_handle'));
final _smokeOuterstructInnerlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_OuterStruct_InnerLambda_create_proxy'));

class OuterStruct_InnerLambda$Impl implements Finalizable {
  final Pointer<Void> handle;
  OuterStruct_InnerLambda$Impl(this.handle);

  void call() {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_OuterStruct_InnerLambda_call'));
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId);

  }

}

void _smokeOuterstructInnerlambdacallStatic(OuterStruct_InnerLambda _obj) {
  
  try {
    _obj();
  } finally {
  }
}

Pointer<Void> smokeOuterstructInnerlambdaToFfi(OuterStruct_InnerLambda value) {
  void __lambdaCaller() { _smokeOuterstructInnerlambdacallStatic(value); }
  final __lambdaCallback = NativeCallable<Void Function()>.isolateLocal(__lambdaCaller);
  __lambdaCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __lambdaCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  return _smokeOuterstructInnerlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    __closeAllCallback.nativeFunction,
    __lambdaCallback.nativeFunction
  );
}

OuterStruct_InnerLambda smokeOuterstructInnerlambdaFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeOuterstructInnerlambdaCopyHandle(handle);
  final _impl = OuterStruct_InnerLambda$Impl(_copiedHandle);
  final result = () => _impl.call();
  _smokeOuterstructInnerlambdaRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeOuterstructInnerlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterstructInnerlambdaReleaseHandle(handle);

// Nullable OuterStruct_InnerLambda

final _smokeOuterstructInnerlambdaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerLambda_create_handle_nullable'));
final _smokeOuterstructInnerlambdaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerLambda_release_handle_nullable'));
final _smokeOuterstructInnerlambdaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStruct_InnerLambda_get_value_nullable'));

Pointer<Void> smokeOuterstructInnerlambdaToFfiNullable(OuterStruct_InnerLambda? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOuterstructInnerlambdaToFfi(value);
  final result = _smokeOuterstructInnerlambdaCreateHandleNullable(_handle);
  smokeOuterstructInnerlambdaReleaseFfiHandle(_handle);
  return result;
}

OuterStruct_InnerLambda? smokeOuterstructInnerlambdaFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOuterstructInnerlambdaGetValueNullable(handle);
  final result = smokeOuterstructInnerlambdaFromFfi(_handle);
  smokeOuterstructInnerlambdaReleaseFfiHandle(_handle);
  return result;
}

void smokeOuterstructInnerlambdaReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterstructInnerlambdaReleaseHandleNullable(handle);

// End of OuterStruct_InnerLambda "private" section.

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



/// @nodoc
@visibleForTesting
class OuterStruct$Impl {
  void doNothing(OuterStruct $that) {
    final _doNothingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_OuterStruct_doNothing'));
    final _handle = smokeOuterstructToFfi($that);
    final __callResultHandle = _doNothingFfi(_handle, __lib.LibraryContext.isolateId);
    smokeOuterstructReleaseFfiHandle(_handle);
    if (_doNothingsmokeOuterstructDonothingReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _doNothingsmokeOuterstructDonothingReturnGetError(__callResultHandle);
        _doNothingsmokeOuterstructDonothingReturnReleaseHandle(__callResultHandle);
        try {
          throw OuterStruct_InstantiationException(smokeOuterstructInnerenumFromFfi(__errorHandle));
        } finally {
          smokeOuterstructInnerenumReleaseFfiHandle(__errorHandle);
        }
    }
    _doNothingsmokeOuterstructDonothingReturnReleaseHandle(__callResultHandle);

  }

}

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



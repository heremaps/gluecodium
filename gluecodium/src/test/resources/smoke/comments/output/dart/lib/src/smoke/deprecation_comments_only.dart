

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

@Deprecated("Unfortunately, this interface is deprecated.")
abstract class DeprecationCommentsOnly implements Finalizable {
  @Deprecated("Unfortunately, this interface is deprecated.")

  factory DeprecationCommentsOnly(
    DeprecationCommentsOnly_Usefulness Function(String) someMethodWithAllCommentsLambda,
    DeprecationCommentsOnly_Usefulness Function() isSomePropertyGetLambda,
    void Function(DeprecationCommentsOnly_Usefulness) isSomePropertySetLambda
  ) => DeprecationCommentsOnly$Lambdas(
    someMethodWithAllCommentsLambda,
    isSomePropertyGetLambda,
    isSomePropertySetLambda
  );

  @Deprecated("Unfortunately, this constant is deprecated.")
  static final DeprecationCommentsOnly_Usefulness veryUseful = true;


  /// - [input] Very useful input parameter
  ///
  /// Returns [DeprecationCommentsOnly_Usefulness]. Usefulness of the input
  ///
  @Deprecated("Unfortunately, this method is deprecated.")

  DeprecationCommentsOnly_Usefulness someMethodWithAllComments(String input);
  @Deprecated("Unfortunately, this property's getter is deprecated.")
  DeprecationCommentsOnly_Usefulness get isSomeProperty;
  @Deprecated("Unfortunately, this property's setter is deprecated.")
  set isSomeProperty(DeprecationCommentsOnly_Usefulness value);

}

@Deprecated("Unfortunately, this typedef is deprecated.")
typedef DeprecationCommentsOnly_Usefulness = bool;
@Deprecated("Unfortunately, this enum is deprecated.")
enum DeprecationCommentsOnly_SomeEnum {
    @Deprecated("Unfortunately, this item is deprecated.")
    useless
}

// DeprecationCommentsOnly_SomeEnum "private" section, not exported.

int smokeDeprecationcommentsonlySomeenumToFfi(DeprecationCommentsOnly_SomeEnum value) {
  switch (value) {
  case DeprecationCommentsOnly_SomeEnum.useless:
    return 0;
  }
}

DeprecationCommentsOnly_SomeEnum smokeDeprecationcommentsonlySomeenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return DeprecationCommentsOnly_SomeEnum.useless;
  default:
    throw StateError("Invalid numeric value $handle for DeprecationCommentsOnly_SomeEnum enum.");
  }
}

void smokeDeprecationcommentsonlySomeenumReleaseFfiHandle(int handle) {}

final _smokeDeprecationcommentsonlySomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_create_handle_nullable'));
final _smokeDeprecationcommentsonlySomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_release_handle_nullable'));
final _smokeDeprecationcommentsonlySomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_get_value_nullable'));

Pointer<Void> smokeDeprecationcommentsonlySomeenumToFfiNullable(DeprecationCommentsOnly_SomeEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDeprecationcommentsonlySomeenumToFfi(value);
  final result = _smokeDeprecationcommentsonlySomeenumCreateHandleNullable(_handle);
  smokeDeprecationcommentsonlySomeenumReleaseFfiHandle(_handle);
  return result;
}

DeprecationCommentsOnly_SomeEnum? smokeDeprecationcommentsonlySomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDeprecationcommentsonlySomeenumGetValueNullable(handle);
  final result = smokeDeprecationcommentsonlySomeenumFromFfi(_handle);
  smokeDeprecationcommentsonlySomeenumReleaseFfiHandle(_handle);
  return result;
}

void smokeDeprecationcommentsonlySomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecationcommentsonlySomeenumReleaseHandleNullable(handle);

// End of DeprecationCommentsOnly_SomeEnum "private" section.
@Deprecated("Unfortunately, this struct is deprecated.")

class DeprecationCommentsOnly_SomeStruct {
  @Deprecated("Unfortunately, this field is deprecated.")
  DeprecationCommentsOnly_Usefulness someField;

  DeprecationCommentsOnly_SomeStruct._(this.someField);
  DeprecationCommentsOnly_SomeStruct()
    : someField = false;
}


// DeprecationCommentsOnly_SomeStruct "private" section, not exported.

final _smokeDeprecationcommentsonlySomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_create_handle'));
final _smokeDeprecationcommentsonlySomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_release_handle'));
final _smokeDeprecationcommentsonlySomestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_get_field_someField'));



Pointer<Void> smokeDeprecationcommentsonlySomestructToFfi(DeprecationCommentsOnly_SomeStruct value) {
  final _someFieldHandle = booleanToFfi(value.someField);
  final _result = _smokeDeprecationcommentsonlySomestructCreateHandle(_someFieldHandle);
  booleanReleaseFfiHandle(_someFieldHandle);
  return _result;
}

DeprecationCommentsOnly_SomeStruct smokeDeprecationcommentsonlySomestructFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeDeprecationcommentsonlySomestructGetFieldsomeField(handle);
  try {
    return DeprecationCommentsOnly_SomeStruct._(
      booleanFromFfi(_someFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_someFieldHandle);
  }
}

void smokeDeprecationcommentsonlySomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeDeprecationcommentsonlySomestructReleaseHandle(handle);

// Nullable DeprecationCommentsOnly_SomeStruct

final _smokeDeprecationcommentsonlySomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_create_handle_nullable'));
final _smokeDeprecationcommentsonlySomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_release_handle_nullable'));
final _smokeDeprecationcommentsonlySomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_get_value_nullable'));

Pointer<Void> smokeDeprecationcommentsonlySomestructToFfiNullable(DeprecationCommentsOnly_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDeprecationcommentsonlySomestructToFfi(value);
  final result = _smokeDeprecationcommentsonlySomestructCreateHandleNullable(_handle);
  smokeDeprecationcommentsonlySomestructReleaseFfiHandle(_handle);
  return result;
}

DeprecationCommentsOnly_SomeStruct? smokeDeprecationcommentsonlySomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDeprecationcommentsonlySomestructGetValueNullable(handle);
  final result = smokeDeprecationcommentsonlySomestructFromFfi(_handle);
  smokeDeprecationcommentsonlySomestructReleaseFfiHandle(_handle);
  return result;
}

void smokeDeprecationcommentsonlySomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecationcommentsonlySomestructReleaseHandleNullable(handle);

// End of DeprecationCommentsOnly_SomeStruct "private" section.

// DeprecationCommentsOnly "private" section, not exported.

final _smokeDeprecationcommentsonlyRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_DeprecationCommentsOnly_register_finalizer'));
final _smokeDeprecationcommentsonlyCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_copy_handle'));
final _smokeDeprecationcommentsonlyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_release_handle'));
final _smokeDeprecationcommentsonlyCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_DeprecationCommentsOnly_create_proxy'));
final _smokeDeprecationcommentsonlyGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_get_type_id'));


class DeprecationCommentsOnly$Lambdas implements DeprecationCommentsOnly {
  DeprecationCommentsOnly_Usefulness Function(String) someMethodWithAllCommentsLambda;
  DeprecationCommentsOnly_Usefulness Function() isSomePropertyGetLambda;
  void Function(DeprecationCommentsOnly_Usefulness) isSomePropertySetLambda;

  DeprecationCommentsOnly$Lambdas(
    this.someMethodWithAllCommentsLambda,
    this.isSomePropertyGetLambda,
    this.isSomePropertySetLambda
  );

  @override
  DeprecationCommentsOnly_Usefulness someMethodWithAllComments(String input) =>
    someMethodWithAllCommentsLambda(input);
  @override
  DeprecationCommentsOnly_Usefulness get isSomeProperty => isSomePropertyGetLambda();
  @override
  set isSomeProperty(DeprecationCommentsOnly_Usefulness value) => isSomePropertySetLambda(value);
}

class DeprecationCommentsOnly$Impl extends __lib.NativeBase implements DeprecationCommentsOnly {

  DeprecationCommentsOnly$Impl(Pointer<Void> handle) : super(handle);

  @override
  DeprecationCommentsOnly_Usefulness someMethodWithAllComments(String input) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DeprecationCommentsOnly_someMethodWithAllComments__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _someMethodWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @Deprecated("Unfortunately, this property's getter is deprecated.")
  DeprecationCommentsOnly_Usefulness get isSomeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_DeprecationCommentsOnly_isSomeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }


  @Deprecated("Unfortunately, this property's setter is deprecated.")

  set isSomeProperty(DeprecationCommentsOnly_Usefulness value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_DeprecationCommentsOnly_isSomeProperty_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }



}

void _smokeDeprecationcommentsonlysomeMethodWithAllCommentsStatic(DeprecationCommentsOnly _obj, Pointer<Void> input, Pointer<Uint8> _result) {
  DeprecationCommentsOnly_Usefulness? _resultObject;
  try {
    _resultObject = _obj.someMethodWithAllComments(stringFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
}

void _smokeDeprecationcommentsonlyisSomePropertyGetStatic(DeprecationCommentsOnly _obj, Pointer<Uint8> _result) {
  _result.value = booleanToFfi(_obj.isSomeProperty);
}

void _smokeDeprecationcommentsonlyisSomePropertySetStatic(DeprecationCommentsOnly _obj, int _value) {
  try {
    _obj.isSomeProperty = booleanFromFfi(_value);
  } finally {
    booleanReleaseFfiHandle(_value);
  }
}

Pointer<Void> smokeDeprecationcommentsonlyToFfi(DeprecationCommentsOnly __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeDeprecationcommentsonlyCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __someMethodWithAllCommentsCaller(Pointer<Void> input, Pointer<Uint8> _result) { _smokeDeprecationcommentsonlysomeMethodWithAllCommentsStatic(__interfaceObj, input, _result); }
  final __someMethodWithAllCommentsCallback = NativeCallable<Void Function(Pointer<Void>, Pointer<Uint8>)>.isolateLocal(__someMethodWithAllCommentsCaller);
  __someMethodWithAllCommentsCallback.keepIsolateAlive = false;

  void __smokeDeprecationcommentsonlyisSomePropertyGetCaller(Pointer<Uint8> _result) { _smokeDeprecationcommentsonlyisSomePropertyGetStatic(__interfaceObj, _result); }
  final __smokeDeprecationcommentsonlyisSomePropertyGetCallback = NativeCallable<Void Function(Pointer<Uint8>)>.isolateLocal(__smokeDeprecationcommentsonlyisSomePropertyGetCaller);
  __smokeDeprecationcommentsonlyisSomePropertyGetCallback.keepIsolateAlive = false;

  void __smokeDeprecationcommentsonlyisSomePropertySetCaller(int _value) { _smokeDeprecationcommentsonlyisSomePropertySetStatic(__interfaceObj, _value); }
  final __smokeDeprecationcommentsonlyisSomePropertySetCallback = NativeCallable<Void Function(Uint8)>.isolateLocal(__smokeDeprecationcommentsonlyisSomePropertySetCaller);
  __smokeDeprecationcommentsonlyisSomePropertySetCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __someMethodWithAllCommentsCallback.close();
    __smokeDeprecationcommentsonlyisSomePropertyGetCallback.close();
    __smokeDeprecationcommentsonlyisSomePropertySetCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeDeprecationcommentsonlyCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __someMethodWithAllCommentsCallback.nativeFunction,
    __smokeDeprecationcommentsonlyisSomePropertyGetCallback.nativeFunction,
    __smokeDeprecationcommentsonlyisSomePropertySetCallback.nativeFunction
  );

  return result;
}

DeprecationCommentsOnly smokeDeprecationcommentsonlyFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DeprecationCommentsOnly) return instance;

  final _typeIdHandle = _smokeDeprecationcommentsonlyGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeDeprecationcommentsonlyCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DeprecationCommentsOnly$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeDeprecationcommentsonlyRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeDeprecationcommentsonlyReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeDeprecationcommentsonlyReleaseHandle(handle);

Pointer<Void> smokeDeprecationcommentsonlyToFfiNullable(DeprecationCommentsOnly? value) =>
  value != null ? smokeDeprecationcommentsonlyToFfi(value) : Pointer<Void>.fromAddress(0);

DeprecationCommentsOnly? smokeDeprecationcommentsonlyFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeDeprecationcommentsonlyFromFfi(handle) : null;

void smokeDeprecationcommentsonlyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecationcommentsonlyReleaseHandle(handle);

// End of DeprecationCommentsOnly "private" section.



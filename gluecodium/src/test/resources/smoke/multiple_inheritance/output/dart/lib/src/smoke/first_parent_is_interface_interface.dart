import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_interface.dart';
import 'package:library/src/smoke/parent_narrow_one.dart';
abstract class FirstParentIsInterfaceInterface implements ParentInterface, ParentNarrowOne {
  factory FirstParentIsInterfaceInterface(
    void Function() parentFunctionLambda,
    void Function() parentFunctionOneLambda,
    void Function() childFunctionLambda,
    String Function() parentPropertyGetLambda,
    void Function(String) parentPropertySetLambda,
    String Function() parentPropertyOneGetLambda,
    void Function(String) parentPropertyOneSetLambda,
    String Function() childPropertyGetLambda,
    void Function(String) childPropertySetLambda
  ) => FirstParentIsInterfaceInterface$Lambdas(
    parentFunctionLambda,
    parentFunctionOneLambda,
    childFunctionLambda,
    parentPropertyGetLambda,
    parentPropertySetLambda,
    parentPropertyOneGetLambda,
    parentPropertyOneSetLambda,
    childPropertyGetLambda,
    childPropertySetLambda
  );
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
  void childFunction();
  String get childProperty;
  set childProperty(String value);
}
// FirstParentIsInterfaceInterface "private" section, not exported.
final _smokeFirstparentisinterfaceinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_FirstParentIsInterfaceInterface_register_finalizer'));
final _smokeFirstparentisinterfaceinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FirstParentIsInterfaceInterface_copy_handle'));
final _smokeFirstparentisinterfaceinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FirstParentIsInterfaceInterface_release_handle'));
final _smokeFirstparentisinterfaceinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_FirstParentIsInterfaceInterface_create_proxy'));
final _smokeFirstparentisinterfaceinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FirstParentIsInterfaceInterface_get_type_id'));
class FirstParentIsInterfaceInterface$Lambdas implements FirstParentIsInterfaceInterface {
  void Function() parentFunctionLambda;
  void Function() parentFunctionOneLambda;
  void Function() childFunctionLambda;
  String Function() parentPropertyGetLambda;
  void Function(String) parentPropertySetLambda;
  String Function() parentPropertyOneGetLambda;
  void Function(String) parentPropertyOneSetLambda;
  String Function() childPropertyGetLambda;
  void Function(String) childPropertySetLambda;
  FirstParentIsInterfaceInterface$Lambdas(
    this.parentFunctionLambda,
    this.parentFunctionOneLambda,
    this.childFunctionLambda,
    this.parentPropertyGetLambda,
    this.parentPropertySetLambda,
    this.parentPropertyOneGetLambda,
    this.parentPropertyOneSetLambda,
    this.childPropertyGetLambda,
    this.childPropertySetLambda
  );
  @override
  void release() {}
  @override
  void parentFunction() =>
    parentFunctionLambda();
  @override
  void parentFunctionOne() =>
    parentFunctionOneLambda();
  @override
  void childFunction() =>
    childFunctionLambda();
  @override
  String get parentProperty => parentPropertyGetLambda();
  @override
  set parentProperty(String value) => parentPropertySetLambda(value);
  @override
  String get parentPropertyOne => parentPropertyOneGetLambda();
  @override
  set parentPropertyOne(String value) => parentPropertyOneSetLambda(value);
  @override
  String get childProperty => childPropertyGetLambda();
  @override
  set childProperty(String value) => childPropertySetLambda(value);
}
class FirstParentIsInterfaceInterface$Impl extends __lib.NativeBase implements FirstParentIsInterfaceInterface {
  FirstParentIsInterfaceInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  void parentFunction() {
    final _parentFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentInterface_parentFunction'));
    final _handle = this.handle;
    _parentFunctionFfi(_handle, __lib.LibraryContext.isolateId);
  }
  @override
  void parentFunctionOne() {
    final _parentFunctionOneFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentNarrowOne_parentFunctionOne'));
    final _handle = this.handle;
    _parentFunctionOneFfi(_handle, __lib.LibraryContext.isolateId);
  }
  @override
  void childFunction() {
    final _childFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_FirstParentIsInterfaceInterface_childFunction'));
    final _handle = this.handle;
    _childFunctionFfi(_handle, __lib.LibraryContext.isolateId);
  }
  String get parentProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentInterface_parentProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  set parentProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentInterface_parentProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
  String get parentPropertyOne {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentNarrowOne_parentPropertyOne_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  set parentPropertyOne(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentNarrowOne_parentPropertyOne_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
  String get childProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_FirstParentIsInterfaceInterface_childProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  set childProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_FirstParentIsInterfaceInterface_childProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
}
int _smokeFirstparentisinterfaceinterfaceparentFunctionStatic(Object _obj) {
  try {
    (_obj as FirstParentIsInterfaceInterface).parentFunction();
  } finally {
  }
  return 0;
}
int _smokeFirstparentisinterfaceinterfaceparentFunctionOneStatic(Object _obj) {
  try {
    (_obj as FirstParentIsInterfaceInterface).parentFunctionOne();
  } finally {
  }
  return 0;
}
int _smokeFirstparentisinterfaceinterfacechildFunctionStatic(Object _obj) {
  try {
    (_obj as FirstParentIsInterfaceInterface).childFunction();
  } finally {
  }
  return 0;
}
int _smokeFirstparentisinterfaceinterfaceparentPropertyGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((_obj as FirstParentIsInterfaceInterface).parentProperty);
  return 0;
}
int _smokeFirstparentisinterfaceinterfaceparentPropertySetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as FirstParentIsInterfaceInterface).parentProperty =
      stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
  return 0;
}
int _smokeFirstparentisinterfaceinterfaceparentPropertyOneGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((_obj as FirstParentIsInterfaceInterface).parentPropertyOne);
  return 0;
}
int _smokeFirstparentisinterfaceinterfaceparentPropertyOneSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as FirstParentIsInterfaceInterface).parentPropertyOne =
      stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
  return 0;
}
int _smokeFirstparentisinterfaceinterfacechildPropertyGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((_obj as FirstParentIsInterfaceInterface).childProperty);
  return 0;
}
int _smokeFirstparentisinterfaceinterfacechildPropertySetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as FirstParentIsInterfaceInterface).childProperty =
      stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeFirstparentisinterfaceinterfaceToFfi(FirstParentIsInterfaceInterface value) {
  if (value is __lib.NativeBase) return _smokeFirstparentisinterfaceinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeFirstparentisinterfaceinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle)>(_smokeFirstparentisinterfaceinterfaceparentFunctionStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_smokeFirstparentisinterfaceinterfaceparentFunctionOneStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_smokeFirstparentisinterfaceinterfacechildFunctionStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeFirstparentisinterfaceinterfaceparentPropertyGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeFirstparentisinterfaceinterfaceparentPropertySetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeFirstparentisinterfaceinterfaceparentPropertyOneGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeFirstparentisinterfaceinterfaceparentPropertyOneSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeFirstparentisinterfaceinterfacechildPropertyGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeFirstparentisinterfaceinterfacechildPropertySetStatic, __lib.unknownError)
  );
  return result;
}
FirstParentIsInterfaceInterface smokeFirstparentisinterfaceinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is FirstParentIsInterfaceInterface) return instance;
  final _typeIdHandle = _smokeFirstparentisinterfaceinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeFirstparentisinterfaceinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : FirstParentIsInterfaceInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeFirstparentisinterfaceinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeFirstparentisinterfaceinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeFirstparentisinterfaceinterfaceReleaseHandle(handle);
Pointer<Void> smokeFirstparentisinterfaceinterfaceToFfiNullable(FirstParentIsInterfaceInterface? value) =>
  value != null ? smokeFirstparentisinterfaceinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
FirstParentIsInterfaceInterface? smokeFirstparentisinterfaceinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeFirstparentisinterfaceinterfaceFromFfi(handle) : null;
void smokeFirstparentisinterfaceinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFirstparentisinterfaceinterfaceReleaseHandle(handle);
// End of FirstParentIsInterfaceInterface "private" section.

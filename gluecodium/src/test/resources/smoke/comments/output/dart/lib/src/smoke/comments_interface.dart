import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
/// This is some very useful interface.
abstract class CommentsInterface {
  /// This is some very useful interface.
  factory CommentsInterface(
    bool Function(String) someMethodWithAllCommentsLambda,
    bool Function(String) someMethodWithInputCommentsLambda,
    bool Function(String) someMethodWithOutputCommentsLambda,
    bool Function(String) someMethodWithNoCommentsLambda,
    void Function(String) someMethodWithoutReturnTypeWithAllCommentsLambda,
    void Function(String) someMethodWithoutReturnTypeWithNoCommentsLambda,
    bool Function() someMethodWithoutInputParametersWithAllCommentsLambda,
    bool Function() someMethodWithoutInputParametersWithNoCommentsLambda,
    void Function() someMethodWithNothingLambda,
    void Function() someMethodWithoutReturnTypeOrInputParametersLambda,
    bool Function() isSomePropertyGetLambda,
    void Function(bool) isSomePropertySetLambda
  ) => CommentsInterface$Lambdas(
    someMethodWithAllCommentsLambda,
    someMethodWithInputCommentsLambda,
    someMethodWithOutputCommentsLambda,
    someMethodWithNoCommentsLambda,
    someMethodWithoutReturnTypeWithAllCommentsLambda,
    someMethodWithoutReturnTypeWithNoCommentsLambda,
    someMethodWithoutInputParametersWithAllCommentsLambda,
    someMethodWithoutInputParametersWithNoCommentsLambda,
    someMethodWithNothingLambda,
    someMethodWithoutReturnTypeOrInputParametersLambda,
    isSomePropertyGetLambda,
    isSomePropertySetLambda
  );

  /// This is some very useful constant.
  static final bool veryUseful = true;
  /// This is some very useful method that measures the usefulness of its input.
  ///
  /// [input] Very useful input parameter
  ///
  /// Returns [bool]. Usefulness of the input
  ///
  bool someMethodWithAllComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  ///
  /// [input] Very useful input parameter
  ///
  bool someMethodWithInputComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  ///
  /// Returns [bool]. Usefulness of the input
  ///
  bool someMethodWithOutputComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  ///
  bool someMethodWithNoComments(String input);
  /// This is some very useful method that does not measure the usefulness of its input.
  ///
  /// [input] Very useful input parameter
  ///
  void someMethodWithoutReturnTypeWithAllComments(String input);
  /// This is some very useful method that does not measure the usefulness of its input.
  ///
  void someMethodWithoutReturnTypeWithNoComments(String input);
  /// This is some very useful method that measures the usefulness of something.
  ///
  /// Returns [bool]. Usefulness of the input
  ///
  bool someMethodWithoutInputParametersWithAllComments();
  /// This is some very useful method that measures the usefulness of something.
  ///
  bool someMethodWithoutInputParametersWithNoComments();
  void someMethodWithNothing();
  /// This is some very useful method that does nothing.
  ///
  void someMethodWithoutReturnTypeOrInputParameters();
  /// Gets some very useful property.
  bool get isSomeProperty;
  /// Sets some very useful property.
  set isSomeProperty(bool value);
}
/// This is some very useful enum.
enum CommentsInterface_SomeEnum {
    /// Not quite useful
    useless,
    /// Somewhat useful
    useful
}
// CommentsInterface_SomeEnum "private" section, not exported.
int smokeCommentsinterfaceSomeenumToFfi(CommentsInterface_SomeEnum value) {
  switch (value) {
  case CommentsInterface_SomeEnum.useless:
    return 0;
  case CommentsInterface_SomeEnum.useful:
    return 1;
  default:
    throw StateError("Invalid enum value $value for CommentsInterface_SomeEnum enum.");
  }
}
CommentsInterface_SomeEnum smokeCommentsinterfaceSomeenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return CommentsInterface_SomeEnum.useless;
  case 1:
    return CommentsInterface_SomeEnum.useful;
  default:
    throw StateError("Invalid numeric value $handle for CommentsInterface_SomeEnum enum.");
  }
}
void smokeCommentsinterfaceSomeenumReleaseFfiHandle(int handle) {}
final _smokeCommentsinterfaceSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_CommentsInterface_SomeEnum_create_handle_nullable'));
final _smokeCommentsinterfaceSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeEnum_release_handle_nullable'));
final _smokeCommentsinterfaceSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeEnum_get_value_nullable'));
Pointer<Void> smokeCommentsinterfaceSomeenumToFfiNullable(CommentsInterface_SomeEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeCommentsinterfaceSomeenumToFfi(value);
  final result = _smokeCommentsinterfaceSomeenumCreateHandleNullable(_handle);
  smokeCommentsinterfaceSomeenumReleaseFfiHandle(_handle);
  return result;
}
CommentsInterface_SomeEnum? smokeCommentsinterfaceSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeCommentsinterfaceSomeenumGetValueNullable(handle);
  final result = smokeCommentsinterfaceSomeenumFromFfi(_handle);
  smokeCommentsinterfaceSomeenumReleaseFfiHandle(_handle);
  return result;
}
void smokeCommentsinterfaceSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCommentsinterfaceSomeenumReleaseHandleNullable(handle);
// End of CommentsInterface_SomeEnum "private" section.
/// This is some very useful struct.
class CommentsInterface_SomeStruct {
  /// How useful this struct is
  bool someField;
  CommentsInterface_SomeStruct(this.someField);
}
// CommentsInterface_SomeStruct "private" section, not exported.
final _smokeCommentsinterfaceSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_CommentsInterface_SomeStruct_create_handle'));
final _smokeCommentsinterfaceSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_release_handle'));
final _smokeCommentsinterfaceSomestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_get_field_someField'));
Pointer<Void> smokeCommentsinterfaceSomestructToFfi(CommentsInterface_SomeStruct value) {
  final _someFieldHandle = booleanToFfi(value.someField);
  final _result = _smokeCommentsinterfaceSomestructCreateHandle(_someFieldHandle);
  booleanReleaseFfiHandle(_someFieldHandle);
  return _result;
}
CommentsInterface_SomeStruct smokeCommentsinterfaceSomestructFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeCommentsinterfaceSomestructGetFieldsomeField(handle);
  try {
    return CommentsInterface_SomeStruct(
      booleanFromFfi(_someFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_someFieldHandle);
  }
}
void smokeCommentsinterfaceSomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeCommentsinterfaceSomestructReleaseHandle(handle);
// Nullable CommentsInterface_SomeStruct
final _smokeCommentsinterfaceSomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_create_handle_nullable'));
final _smokeCommentsinterfaceSomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_release_handle_nullable'));
final _smokeCommentsinterfaceSomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_get_value_nullable'));
Pointer<Void> smokeCommentsinterfaceSomestructToFfiNullable(CommentsInterface_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeCommentsinterfaceSomestructToFfi(value);
  final result = _smokeCommentsinterfaceSomestructCreateHandleNullable(_handle);
  smokeCommentsinterfaceSomestructReleaseFfiHandle(_handle);
  return result;
}
CommentsInterface_SomeStruct? smokeCommentsinterfaceSomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeCommentsinterfaceSomestructGetValueNullable(handle);
  final result = smokeCommentsinterfaceSomestructFromFfi(_handle);
  smokeCommentsinterfaceSomestructReleaseFfiHandle(_handle);
  return result;
}
void smokeCommentsinterfaceSomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCommentsinterfaceSomestructReleaseHandleNullable(handle);
// End of CommentsInterface_SomeStruct "private" section.
// CommentsInterface "private" section, not exported.
final _smokeCommentsinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_CommentsInterface_register_finalizer'));
final _smokeCommentsinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_copy_handle'));
final _smokeCommentsinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_release_handle'));
final _smokeCommentsinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_CommentsInterface_create_proxy'));
final _smokeCommentsinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_get_type_id'));
class CommentsInterface$Lambdas implements CommentsInterface {
  bool Function(String) someMethodWithAllCommentsLambda;
  bool Function(String) someMethodWithInputCommentsLambda;
  bool Function(String) someMethodWithOutputCommentsLambda;
  bool Function(String) someMethodWithNoCommentsLambda;
  void Function(String) someMethodWithoutReturnTypeWithAllCommentsLambda;
  void Function(String) someMethodWithoutReturnTypeWithNoCommentsLambda;
  bool Function() someMethodWithoutInputParametersWithAllCommentsLambda;
  bool Function() someMethodWithoutInputParametersWithNoCommentsLambda;
  void Function() someMethodWithNothingLambda;
  void Function() someMethodWithoutReturnTypeOrInputParametersLambda;
  bool Function() isSomePropertyGetLambda;
  void Function(bool) isSomePropertySetLambda;
  CommentsInterface$Lambdas(
    this.someMethodWithAllCommentsLambda,
    this.someMethodWithInputCommentsLambda,
    this.someMethodWithOutputCommentsLambda,
    this.someMethodWithNoCommentsLambda,
    this.someMethodWithoutReturnTypeWithAllCommentsLambda,
    this.someMethodWithoutReturnTypeWithNoCommentsLambda,
    this.someMethodWithoutInputParametersWithAllCommentsLambda,
    this.someMethodWithoutInputParametersWithNoCommentsLambda,
    this.someMethodWithNothingLambda,
    this.someMethodWithoutReturnTypeOrInputParametersLambda,
    this.isSomePropertyGetLambda,
    this.isSomePropertySetLambda
  );

  @override
  bool someMethodWithAllComments(String input) =>
    someMethodWithAllCommentsLambda(input);
  @override
  bool someMethodWithInputComments(String input) =>
    someMethodWithInputCommentsLambda(input);
  @override
  bool someMethodWithOutputComments(String input) =>
    someMethodWithOutputCommentsLambda(input);
  @override
  bool someMethodWithNoComments(String input) =>
    someMethodWithNoCommentsLambda(input);
  @override
  void someMethodWithoutReturnTypeWithAllComments(String input) =>
    someMethodWithoutReturnTypeWithAllCommentsLambda(input);
  @override
  void someMethodWithoutReturnTypeWithNoComments(String input) =>
    someMethodWithoutReturnTypeWithNoCommentsLambda(input);
  @override
  bool someMethodWithoutInputParametersWithAllComments() =>
    someMethodWithoutInputParametersWithAllCommentsLambda();
  @override
  bool someMethodWithoutInputParametersWithNoComments() =>
    someMethodWithoutInputParametersWithNoCommentsLambda();
  @override
  void someMethodWithNothing() =>
    someMethodWithNothingLambda();
  @override
  void someMethodWithoutReturnTypeOrInputParameters() =>
    someMethodWithoutReturnTypeOrInputParametersLambda();
  @override
  bool get isSomeProperty => isSomePropertyGetLambda();
  @override
  set isSomeProperty(bool value) => isSomePropertySetLambda(value);
}
class CommentsInterface$Impl extends __lib.NativeBase implements CommentsInterface {
  CommentsInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithAllComments__String'));
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
  @override
  bool someMethodWithInputComments(String input) {
    final _someMethodWithInputCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithInputComments__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _someMethodWithInputCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool someMethodWithOutputComments(String input) {
    final _someMethodWithOutputCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithOutputComments__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _someMethodWithOutputCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool someMethodWithNoComments(String input) {
    final _someMethodWithNoCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithNoComments__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _someMethodWithNoCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  void someMethodWithoutReturnTypeWithAllComments(String input) {
    final _someMethodWithoutReturnTypeWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithoutReturnTypeWithAllComments__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    _someMethodWithoutReturnTypeWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
  }
  @override
  void someMethodWithoutReturnTypeWithNoComments(String input) {
    final _someMethodWithoutReturnTypeWithNoCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithoutReturnTypeWithNoComments__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    _someMethodWithoutReturnTypeWithNoCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
  }
  @override
  bool someMethodWithoutInputParametersWithAllComments() {
    final _someMethodWithoutInputParametersWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_someMethodWithoutInputParametersWithAllComments'));
    final _handle = this.handle;
    final __resultHandle = _someMethodWithoutInputParametersWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool someMethodWithoutInputParametersWithNoComments() {
    final _someMethodWithoutInputParametersWithNoCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_someMethodWithoutInputParametersWithNoComments'));
    final _handle = this.handle;
    final __resultHandle = _someMethodWithoutInputParametersWithNoCommentsFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  void someMethodWithNothing() {
    final _someMethodWithNothingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_someMethodWithNothing'));
    final _handle = this.handle;
    _someMethodWithNothingFfi(_handle, __lib.LibraryContext.isolateId);
  }
  @override
  void someMethodWithoutReturnTypeOrInputParameters() {
    final _someMethodWithoutReturnTypeOrInputParametersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_someMethodWithoutReturnTypeOrInputParameters'));
    final _handle = this.handle;
    _someMethodWithoutReturnTypeOrInputParametersFfi(_handle, __lib.LibraryContext.isolateId);
  }
  /// Gets some very useful property.
  bool get isSomeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_isSomeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  /// Sets some very useful property.
  ///
  /// [value] Some very useful property.
  ///
  set isSomeProperty(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_CommentsInterface_isSomeProperty_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);
  }
}
int _smokeCommentsinterfacesomeMethodWithAllCommentsStatic(Object _obj, Pointer<Void> input, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as CommentsInterface).someMethodWithAllComments(stringFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
int _smokeCommentsinterfacesomeMethodWithInputCommentsStatic(Object _obj, Pointer<Void> input, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as CommentsInterface).someMethodWithInputComments(stringFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
int _smokeCommentsinterfacesomeMethodWithOutputCommentsStatic(Object _obj, Pointer<Void> input, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as CommentsInterface).someMethodWithOutputComments(stringFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
int _smokeCommentsinterfacesomeMethodWithNoCommentsStatic(Object _obj, Pointer<Void> input, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as CommentsInterface).someMethodWithNoComments(stringFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
int _smokeCommentsinterfacesomeMethodWithoutReturnTypeWithAllCommentsStatic(Object _obj, Pointer<Void> input) {
  try {
    (_obj as CommentsInterface).someMethodWithoutReturnTypeWithAllComments(stringFromFfi(input));
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
int _smokeCommentsinterfacesomeMethodWithoutReturnTypeWithNoCommentsStatic(Object _obj, Pointer<Void> input) {
  try {
    (_obj as CommentsInterface).someMethodWithoutReturnTypeWithNoComments(stringFromFfi(input));
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
int _smokeCommentsinterfacesomeMethodWithoutInputParametersWithAllCommentsStatic(Object _obj, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as CommentsInterface).someMethodWithoutInputParametersWithAllComments();
    _result.value = booleanToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _smokeCommentsinterfacesomeMethodWithoutInputParametersWithNoCommentsStatic(Object _obj, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as CommentsInterface).someMethodWithoutInputParametersWithNoComments();
    _result.value = booleanToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _smokeCommentsinterfacesomeMethodWithNothingStatic(Object _obj) {
  try {
    (_obj as CommentsInterface).someMethodWithNothing();
  } finally {
  }
  return 0;
}
int _smokeCommentsinterfacesomeMethodWithoutReturnTypeOrInputParametersStatic(Object _obj) {
  try {
    (_obj as CommentsInterface).someMethodWithoutReturnTypeOrInputParameters();
  } finally {
  }
  return 0;
}
int _smokeCommentsinterfaceisSomePropertyGetStatic(Object _obj, Pointer<Uint8> _result) {
  _result.value = booleanToFfi((_obj as CommentsInterface).isSomeProperty);
  return 0;
}
int _smokeCommentsinterfaceisSomePropertySetStatic(Object _obj, int _value) {
  try {
    (_obj as CommentsInterface).isSomeProperty =
      booleanFromFfi(_value);
  } finally {
    booleanReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeCommentsinterfaceToFfi(CommentsInterface value) {
  if (value is __lib.NativeBase) return _smokeCommentsinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeCommentsinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Uint8>)>(_smokeCommentsinterfacesomeMethodWithAllCommentsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Uint8>)>(_smokeCommentsinterfacesomeMethodWithInputCommentsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Uint8>)>(_smokeCommentsinterfacesomeMethodWithOutputCommentsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Uint8>)>(_smokeCommentsinterfacesomeMethodWithNoCommentsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeCommentsinterfacesomeMethodWithoutReturnTypeWithAllCommentsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeCommentsinterfacesomeMethodWithoutReturnTypeWithNoCommentsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_smokeCommentsinterfacesomeMethodWithoutInputParametersWithAllCommentsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_smokeCommentsinterfacesomeMethodWithoutInputParametersWithNoCommentsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_smokeCommentsinterfacesomeMethodWithNothingStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_smokeCommentsinterfacesomeMethodWithoutReturnTypeOrInputParametersStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_smokeCommentsinterfaceisSomePropertyGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint8)>(_smokeCommentsinterfaceisSomePropertySetStatic, __lib.unknownError)
  );
  return result;
}
CommentsInterface smokeCommentsinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CommentsInterface) return instance;
  final _typeIdHandle = _smokeCommentsinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeCommentsinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : CommentsInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeCommentsinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeCommentsinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeCommentsinterfaceReleaseHandle(handle);
Pointer<Void> smokeCommentsinterfaceToFfiNullable(CommentsInterface? value) =>
  value != null ? smokeCommentsinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
CommentsInterface? smokeCommentsinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeCommentsinterfaceFromFfi(handle) : null;
void smokeCommentsinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCommentsinterfaceReleaseHandle(handle);
// End of CommentsInterface "private" section.

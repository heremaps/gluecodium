

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

/// This is some very useful interface.
abstract class CommentsInterface implements Finalizable {
  /// This is some very useful interface.

  factory CommentsInterface(
    CommentsInterface_Usefulness Function(String) someMethodWithAllCommentsLambda,
    CommentsInterface_Usefulness Function(String) someMethodWithInputCommentsLambda,
    CommentsInterface_Usefulness Function(String) someMethodWithOutputCommentsLambda,
    CommentsInterface_Usefulness Function(String) someMethodWithNoCommentsLambda,
    void Function(String) someMethodWithoutReturnTypeWithAllCommentsLambda,
    void Function(String) someMethodWithoutReturnTypeWithNoCommentsLambda,
    CommentsInterface_Usefulness Function() someMethodWithoutInputParametersWithAllCommentsLambda,
    CommentsInterface_Usefulness Function() someMethodWithoutInputParametersWithNoCommentsLambda,
    void Function() someMethodWithNothingLambda,
    void Function() someMethodWithoutReturnTypeOrInputParametersLambda,
    CommentsInterface_Usefulness Function() isSomePropertyGetLambda,
    void Function(CommentsInterface_Usefulness) isSomePropertySetLambda
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
  static final CommentsInterface_Usefulness veryUseful = true;

  /// This is some very useful method that measures the usefulness of its input.
  ///
  /// - [input] Very useful input parameter
  ///
  /// Returns [CommentsInterface_Usefulness]. Usefulness of the input
  ///
  CommentsInterface_Usefulness someMethodWithAllComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  ///
  /// - [input] Very useful input parameter
  ///
  CommentsInterface_Usefulness someMethodWithInputComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  ///
  /// Returns [CommentsInterface_Usefulness]. Usefulness of the input
  ///
  CommentsInterface_Usefulness someMethodWithOutputComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  ///
  CommentsInterface_Usefulness someMethodWithNoComments(String input);
  /// This is some very useful method that does not measure the usefulness of its input.
  ///
  /// - [input] Very useful input parameter
  ///
  void someMethodWithoutReturnTypeWithAllComments(String input);
  /// This is some very useful method that does not measure the usefulness of its input.
  ///
  void someMethodWithoutReturnTypeWithNoComments(String input);
  /// This is some very useful method that measures the usefulness of something.
  ///
  /// Returns [CommentsInterface_Usefulness]. Usefulness of the input
  ///
  CommentsInterface_Usefulness someMethodWithoutInputParametersWithAllComments();
  /// This is some very useful method that measures the usefulness of something.
  ///
  CommentsInterface_Usefulness someMethodWithoutInputParametersWithNoComments();

  void someMethodWithNothing();
  /// This is some very useful method that does nothing.
  ///
  void someMethodWithoutReturnTypeOrInputParameters();
  /// Some very useful property.
  /// Gets some very useful property.
  CommentsInterface_Usefulness get isSomeProperty;
  /// Some very useful property.
  /// Sets some very useful property.
  set isSomeProperty(CommentsInterface_Usefulness value);

}

/// This is some very useful typedef.
typedef CommentsInterface_Usefulness = bool;
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
  CommentsInterface_Usefulness someField;

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
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_CommentsInterface_create_proxy'));
final _smokeCommentsinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_get_type_id'));











class CommentsInterface$Lambdas implements CommentsInterface {
  CommentsInterface_Usefulness Function(String) someMethodWithAllCommentsLambda;
  CommentsInterface_Usefulness Function(String) someMethodWithInputCommentsLambda;
  CommentsInterface_Usefulness Function(String) someMethodWithOutputCommentsLambda;
  CommentsInterface_Usefulness Function(String) someMethodWithNoCommentsLambda;
  void Function(String) someMethodWithoutReturnTypeWithAllCommentsLambda;
  void Function(String) someMethodWithoutReturnTypeWithNoCommentsLambda;
  CommentsInterface_Usefulness Function() someMethodWithoutInputParametersWithAllCommentsLambda;
  CommentsInterface_Usefulness Function() someMethodWithoutInputParametersWithNoCommentsLambda;
  void Function() someMethodWithNothingLambda;
  void Function() someMethodWithoutReturnTypeOrInputParametersLambda;
  CommentsInterface_Usefulness Function() isSomePropertyGetLambda;
  void Function(CommentsInterface_Usefulness) isSomePropertySetLambda;

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
  CommentsInterface_Usefulness someMethodWithAllComments(String input) =>
    someMethodWithAllCommentsLambda(input);
  @override
  CommentsInterface_Usefulness someMethodWithInputComments(String input) =>
    someMethodWithInputCommentsLambda(input);
  @override
  CommentsInterface_Usefulness someMethodWithOutputComments(String input) =>
    someMethodWithOutputCommentsLambda(input);
  @override
  CommentsInterface_Usefulness someMethodWithNoComments(String input) =>
    someMethodWithNoCommentsLambda(input);
  @override
  void someMethodWithoutReturnTypeWithAllComments(String input) =>
    someMethodWithoutReturnTypeWithAllCommentsLambda(input);
  @override
  void someMethodWithoutReturnTypeWithNoComments(String input) =>
    someMethodWithoutReturnTypeWithNoCommentsLambda(input);
  @override
  CommentsInterface_Usefulness someMethodWithoutInputParametersWithAllComments() =>
    someMethodWithoutInputParametersWithAllCommentsLambda();
  @override
  CommentsInterface_Usefulness someMethodWithoutInputParametersWithNoComments() =>
    someMethodWithoutInputParametersWithNoCommentsLambda();
  @override
  void someMethodWithNothing() =>
    someMethodWithNothingLambda();
  @override
  void someMethodWithoutReturnTypeOrInputParameters() =>
    someMethodWithoutReturnTypeOrInputParametersLambda();
  @override
  CommentsInterface_Usefulness get isSomeProperty => isSomePropertyGetLambda();
  @override
  set isSomeProperty(CommentsInterface_Usefulness value) => isSomePropertySetLambda(value);
}

class CommentsInterface$Impl extends __lib.NativeBase implements CommentsInterface {

  CommentsInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  CommentsInterface_Usefulness someMethodWithAllComments(String input) {
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
  CommentsInterface_Usefulness someMethodWithInputComments(String input) {
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
  CommentsInterface_Usefulness someMethodWithOutputComments(String input) {
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
  CommentsInterface_Usefulness someMethodWithNoComments(String input) {
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
  CommentsInterface_Usefulness someMethodWithoutInputParametersWithAllComments() {
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
  CommentsInterface_Usefulness someMethodWithoutInputParametersWithNoComments() {
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
  CommentsInterface_Usefulness get isSomeProperty {
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
  /// - [value] Some very useful property.
  ///
  set isSomeProperty(CommentsInterface_Usefulness value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_CommentsInterface_isSomeProperty_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }



}

void _smokeCommentsinterfacesomeMethodWithAllCommentsStatic(CommentsInterface _obj, Pointer<Void> input, Pointer<Uint8> _result) {
  CommentsInterface_Usefulness? _resultObject;
  try {
    _resultObject = _obj.someMethodWithAllComments(stringFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
}
void _smokeCommentsinterfacesomeMethodWithInputCommentsStatic(CommentsInterface _obj, Pointer<Void> input, Pointer<Uint8> _result) {
  CommentsInterface_Usefulness? _resultObject;
  try {
    _resultObject = _obj.someMethodWithInputComments(stringFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
}
void _smokeCommentsinterfacesomeMethodWithOutputCommentsStatic(CommentsInterface _obj, Pointer<Void> input, Pointer<Uint8> _result) {
  CommentsInterface_Usefulness? _resultObject;
  try {
    _resultObject = _obj.someMethodWithOutputComments(stringFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
}
void _smokeCommentsinterfacesomeMethodWithNoCommentsStatic(CommentsInterface _obj, Pointer<Void> input, Pointer<Uint8> _result) {
  CommentsInterface_Usefulness? _resultObject;
  try {
    _resultObject = _obj.someMethodWithNoComments(stringFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
}
void _smokeCommentsinterfacesomeMethodWithoutReturnTypeWithAllCommentsStatic(CommentsInterface _obj, Pointer<Void> input) {

  try {
    _obj.someMethodWithoutReturnTypeWithAllComments(stringFromFfi(input));
  } finally {
    stringReleaseFfiHandle(input);
  }
}
void _smokeCommentsinterfacesomeMethodWithoutReturnTypeWithNoCommentsStatic(CommentsInterface _obj, Pointer<Void> input) {

  try {
    _obj.someMethodWithoutReturnTypeWithNoComments(stringFromFfi(input));
  } finally {
    stringReleaseFfiHandle(input);
  }
}
void _smokeCommentsinterfacesomeMethodWithoutInputParametersWithAllCommentsStatic(CommentsInterface _obj, Pointer<Uint8> _result) {
  CommentsInterface_Usefulness? _resultObject;
  try {
    _resultObject = _obj.someMethodWithoutInputParametersWithAllComments();
    _result.value = booleanToFfi(_resultObject);
  } finally {
  }
}
void _smokeCommentsinterfacesomeMethodWithoutInputParametersWithNoCommentsStatic(CommentsInterface _obj, Pointer<Uint8> _result) {
  CommentsInterface_Usefulness? _resultObject;
  try {
    _resultObject = _obj.someMethodWithoutInputParametersWithNoComments();
    _result.value = booleanToFfi(_resultObject);
  } finally {
  }
}
void _smokeCommentsinterfacesomeMethodWithNothingStatic(CommentsInterface _obj) {

  try {
    _obj.someMethodWithNothing();
  } finally {
  }
}
void _smokeCommentsinterfacesomeMethodWithoutReturnTypeOrInputParametersStatic(CommentsInterface _obj) {

  try {
    _obj.someMethodWithoutReturnTypeOrInputParameters();
  } finally {
  }
}

void _smokeCommentsinterfaceisSomePropertyGetStatic(CommentsInterface _obj, Pointer<Uint8> _result) {
  _result.value = booleanToFfi(_obj.isSomeProperty);
}

void _smokeCommentsinterfaceisSomePropertySetStatic(CommentsInterface _obj, int _value) {
  try {
    _obj.isSomeProperty = booleanFromFfi(_value);
  } finally {
    booleanReleaseFfiHandle(_value);
  }
}

Pointer<Void> smokeCommentsinterfaceToFfi(CommentsInterface __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeCommentsinterfaceCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __someMethodWithAllCommentsCaller(Pointer<Void> input, Pointer<Uint8> _result) { _smokeCommentsinterfacesomeMethodWithAllCommentsStatic(__interfaceObj, input, _result); }
  final __someMethodWithAllCommentsCallback = NativeCallable<Void Function(Pointer<Void>, Pointer<Uint8>)>.isolateLocal(__someMethodWithAllCommentsCaller);
  __someMethodWithAllCommentsCallback.keepIsolateAlive = false;

  void __someMethodWithInputCommentsCaller(Pointer<Void> input, Pointer<Uint8> _result) { _smokeCommentsinterfacesomeMethodWithInputCommentsStatic(__interfaceObj, input, _result); }
  final __someMethodWithInputCommentsCallback = NativeCallable<Void Function(Pointer<Void>, Pointer<Uint8>)>.isolateLocal(__someMethodWithInputCommentsCaller);
  __someMethodWithInputCommentsCallback.keepIsolateAlive = false;

  void __someMethodWithOutputCommentsCaller(Pointer<Void> input, Pointer<Uint8> _result) { _smokeCommentsinterfacesomeMethodWithOutputCommentsStatic(__interfaceObj, input, _result); }
  final __someMethodWithOutputCommentsCallback = NativeCallable<Void Function(Pointer<Void>, Pointer<Uint8>)>.isolateLocal(__someMethodWithOutputCommentsCaller);
  __someMethodWithOutputCommentsCallback.keepIsolateAlive = false;

  void __someMethodWithNoCommentsCaller(Pointer<Void> input, Pointer<Uint8> _result) { _smokeCommentsinterfacesomeMethodWithNoCommentsStatic(__interfaceObj, input, _result); }
  final __someMethodWithNoCommentsCallback = NativeCallable<Void Function(Pointer<Void>, Pointer<Uint8>)>.isolateLocal(__someMethodWithNoCommentsCaller);
  __someMethodWithNoCommentsCallback.keepIsolateAlive = false;

  void __someMethodWithoutReturnTypeWithAllCommentsCaller(Pointer<Void> input) { _smokeCommentsinterfacesomeMethodWithoutReturnTypeWithAllCommentsStatic(__interfaceObj, input); }
  final __someMethodWithoutReturnTypeWithAllCommentsCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__someMethodWithoutReturnTypeWithAllCommentsCaller);
  __someMethodWithoutReturnTypeWithAllCommentsCallback.keepIsolateAlive = false;

  void __someMethodWithoutReturnTypeWithNoCommentsCaller(Pointer<Void> input) { _smokeCommentsinterfacesomeMethodWithoutReturnTypeWithNoCommentsStatic(__interfaceObj, input); }
  final __someMethodWithoutReturnTypeWithNoCommentsCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__someMethodWithoutReturnTypeWithNoCommentsCaller);
  __someMethodWithoutReturnTypeWithNoCommentsCallback.keepIsolateAlive = false;

  void __someMethodWithoutInputParametersWithAllCommentsCaller(Pointer<Uint8> _result) { _smokeCommentsinterfacesomeMethodWithoutInputParametersWithAllCommentsStatic(__interfaceObj, _result); }
  final __someMethodWithoutInputParametersWithAllCommentsCallback = NativeCallable<Void Function(Pointer<Uint8>)>.isolateLocal(__someMethodWithoutInputParametersWithAllCommentsCaller);
  __someMethodWithoutInputParametersWithAllCommentsCallback.keepIsolateAlive = false;

  void __someMethodWithoutInputParametersWithNoCommentsCaller(Pointer<Uint8> _result) { _smokeCommentsinterfacesomeMethodWithoutInputParametersWithNoCommentsStatic(__interfaceObj, _result); }
  final __someMethodWithoutInputParametersWithNoCommentsCallback = NativeCallable<Void Function(Pointer<Uint8>)>.isolateLocal(__someMethodWithoutInputParametersWithNoCommentsCaller);
  __someMethodWithoutInputParametersWithNoCommentsCallback.keepIsolateAlive = false;

  void __someMethodWithNothingCaller() { _smokeCommentsinterfacesomeMethodWithNothingStatic(__interfaceObj); }
  final __someMethodWithNothingCallback = NativeCallable<Void Function()>.isolateLocal(__someMethodWithNothingCaller);
  __someMethodWithNothingCallback.keepIsolateAlive = false;

  void __someMethodWithoutReturnTypeOrInputParametersCaller() { _smokeCommentsinterfacesomeMethodWithoutReturnTypeOrInputParametersStatic(__interfaceObj); }
  final __someMethodWithoutReturnTypeOrInputParametersCallback = NativeCallable<Void Function()>.isolateLocal(__someMethodWithoutReturnTypeOrInputParametersCaller);
  __someMethodWithoutReturnTypeOrInputParametersCallback.keepIsolateAlive = false;

  void __smokeCommentsinterfaceisSomePropertyGetCaller(Pointer<Uint8> _result) { _smokeCommentsinterfaceisSomePropertyGetStatic(__interfaceObj, _result); }
  final __smokeCommentsinterfaceisSomePropertyGetCallback = NativeCallable<Void Function(Pointer<Uint8>)>.isolateLocal(__smokeCommentsinterfaceisSomePropertyGetCaller);
  __smokeCommentsinterfaceisSomePropertyGetCallback.keepIsolateAlive = false;

  void __smokeCommentsinterfaceisSomePropertySetCaller(int _value) { _smokeCommentsinterfaceisSomePropertySetStatic(__interfaceObj, _value); }
  final __smokeCommentsinterfaceisSomePropertySetCallback = NativeCallable<Void Function(Uint8)>.isolateLocal(__smokeCommentsinterfaceisSomePropertySetCaller);
  __smokeCommentsinterfaceisSomePropertySetCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __someMethodWithAllCommentsCallback.close();
    __someMethodWithInputCommentsCallback.close();
    __someMethodWithOutputCommentsCallback.close();
    __someMethodWithNoCommentsCallback.close();
    __someMethodWithoutReturnTypeWithAllCommentsCallback.close();
    __someMethodWithoutReturnTypeWithNoCommentsCallback.close();
    __someMethodWithoutInputParametersWithAllCommentsCallback.close();
    __someMethodWithoutInputParametersWithNoCommentsCallback.close();
    __someMethodWithNothingCallback.close();
    __someMethodWithoutReturnTypeOrInputParametersCallback.close();
    __smokeCommentsinterfaceisSomePropertyGetCallback.close();
    __smokeCommentsinterfaceisSomePropertySetCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeCommentsinterfaceCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __someMethodWithAllCommentsCallback.nativeFunction,
    __someMethodWithInputCommentsCallback.nativeFunction,
    __someMethodWithOutputCommentsCallback.nativeFunction,
    __someMethodWithNoCommentsCallback.nativeFunction,
    __someMethodWithoutReturnTypeWithAllCommentsCallback.nativeFunction,
    __someMethodWithoutReturnTypeWithNoCommentsCallback.nativeFunction,
    __someMethodWithoutInputParametersWithAllCommentsCallback.nativeFunction,
    __someMethodWithoutInputParametersWithNoCommentsCallback.nativeFunction,
    __someMethodWithNothingCallback.nativeFunction,
    __someMethodWithoutReturnTypeOrInputParametersCallback.nativeFunction,
    __smokeCommentsinterfaceisSomePropertyGetCallback.nativeFunction,
    __smokeCommentsinterfaceisSomePropertySetCallback.nativeFunction
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



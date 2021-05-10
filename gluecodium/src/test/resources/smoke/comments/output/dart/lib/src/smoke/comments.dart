import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// This is some very useful interface.
abstract class Comments {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// This is some very useful constant.
  static final bool veryUseful = true;
  /// This is some very useful method that measures the usefulness of its input.
  ///
  /// [inputParameter] Very useful input parameter
  ///
  /// Returns [bool]. Usefulness of the input
  ///
  /// Throws [Comments_SomethingWrongException]. Sometimes it happens.
  ///
  bool someMethodWithAllComments(String inputParameter);
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
  someMethodWithoutReturnTypeWithAllComments(String input);
  /// This is some very useful method that does not measure the usefulness of its input.
  ///
  someMethodWithoutReturnTypeWithNoComments(String input);
  /// This is some very useful method that measures the usefulness of something.
  ///
  /// Returns [bool]. Usefulness of the input
  ///
  bool someMethodWithoutInputParametersWithAllComments();
  /// This is some very useful method that measures the usefulness of something.
  ///
  bool someMethodWithoutInputParametersWithNoComments();
  someMethodWithNothing();
  /// This is some very useful method that does nothing.
  ///
  someMethodWithoutReturnTypeOrInputParameters();
  /// [documented] nicely documented
  ///
  String oneParameterCommentOnly(String undocumented, String documented);
  /// Returns [String]. nicely documented
  ///
  String returnCommentOnly(String undocumented);
  /// Gets some very useful property.
  bool get isSomeProperty;
  /// Sets some very useful property.
  set isSomeProperty(bool value);
}
/// This is some very useful enum.
enum Comments_SomeEnum {
    /// Not quite useful
    useless,
    /// Somewhat useful
    useful
}
// Comments_SomeEnum "private" section, not exported.
int smoke_Comments_SomeEnum_toFfi(Comments_SomeEnum value) {
  switch (value) {
  case Comments_SomeEnum.useless:
    return 0;
  break;
  case Comments_SomeEnum.useful:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Comments_SomeEnum enum.");
  }
}
Comments_SomeEnum smoke_Comments_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Comments_SomeEnum.useless;
  break;
  case 1:
    return Comments_SomeEnum.useful;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Comments_SomeEnum enum.");
  }
}
void smoke_Comments_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_Comments_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Comments_SomeEnum_create_handle_nullable'));
final _smoke_Comments_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_SomeEnum_release_handle_nullable'));
final _smoke_Comments_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Comments_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_Comments_SomeEnum_toFfi_nullable(Comments_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Comments_SomeEnum_toFfi(value);
  final result = _smoke_Comments_SomeEnumCreateHandleNullable(_handle);
  smoke_Comments_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
Comments_SomeEnum smoke_Comments_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Comments_SomeEnumGetValueNullable(handle);
  final result = smoke_Comments_SomeEnum_fromFfi(_handle);
  smoke_Comments_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Comments_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Comments_SomeEnumReleaseHandleNullable(handle);
// End of Comments_SomeEnum "private" section.
/// This is some very useful exception.
class Comments_SomethingWrongException implements Exception {
  final Comments_SomeEnum error;
  Comments_SomethingWrongException(this.error);
}
/// This is some very useful struct.
class Comments_SomeStruct {
  /// How useful this struct is
  /// remains to be seen
  bool someField;
  /// Can be `null`
  String nullableField;
  /// This is how easy it is to construct.
  /// [someField] How useful this struct is
  /// remains to be seen
  /// [nullableField] Can be `null`
  Comments_SomeStruct(this.someField, this.nullableField);
}
// Comments_SomeStruct "private" section, not exported.
final _smokeCommentsSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_create_handle'));
final _smokeCommentsSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_release_handle'));
final _smokeCommentsSomestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_get_field_someField'));
final _smokeCommentsSomestructGetFieldnullableField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_get_field_nullableField'));
Pointer<Void> smoke_Comments_SomeStruct_toFfi(Comments_SomeStruct value) {
  final _someFieldHandle = Boolean_toFfi(value.someField);
  final _nullableFieldHandle = String_toFfi_nullable(value.nullableField);
  final _result = _smokeCommentsSomestructCreateHandle(_someFieldHandle, _nullableFieldHandle);
  Boolean_releaseFfiHandle(_someFieldHandle);
  String_releaseFfiHandle_nullable(_nullableFieldHandle);
  return _result;
}
Comments_SomeStruct smoke_Comments_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeCommentsSomestructGetFieldsomeField(handle);
  final _nullableFieldHandle = _smokeCommentsSomestructGetFieldnullableField(handle);
  try {
    return Comments_SomeStruct(
      Boolean_fromFfi(_someFieldHandle),
      String_fromFfi_nullable(_nullableFieldHandle)
    );
  } finally {
    Boolean_releaseFfiHandle(_someFieldHandle);
    String_releaseFfiHandle_nullable(_nullableFieldHandle);
  }
}
void smoke_Comments_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeCommentsSomestructReleaseHandle(handle);
// Nullable Comments_SomeStruct
final _smoke_Comments_SomeStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_create_handle_nullable'));
final _smoke_Comments_SomeStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_release_handle_nullable'));
final _smoke_Comments_SomeStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_Comments_SomeStruct_toFfi_nullable(Comments_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Comments_SomeStruct_toFfi(value);
  final result = _smoke_Comments_SomeStructCreateHandleNullable(_handle);
  smoke_Comments_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
Comments_SomeStruct smoke_Comments_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Comments_SomeStructGetValueNullable(handle);
  final result = smoke_Comments_SomeStruct_fromFfi(_handle);
  smoke_Comments_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Comments_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Comments_SomeStructReleaseHandleNullable(handle);
// End of Comments_SomeStruct "private" section.
/// This is some very useful lambda that does it.
typedef Comments_SomeLambda = double Function(String, int);
// Comments_SomeLambda "private" section, not exported.
final _smokeCommentsSomelambdaCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_SomeLambda_copy_handle'));
final _smokeCommentsSomelambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_SomeLambda_release_handle'));
final _smokeCommentsSomelambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_Comments_SomeLambda_create_proxy'));
class Comments_SomeLambda$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Comments_SomeLambda$Impl(this.handle);
  void release() => _smokeCommentsSomelambdaReleaseHandle(handle);
  double call(String p0, int p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>, Int32), double Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_Comments_SomeLambda_call__String_Int'));
    final _p0Handle = String_toFfi(p0);
    final _p1Handle = (p1);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    String_releaseFfiHandle(_p0Handle);
    (_p1Handle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _Comments_SomeLambda_call_static(int _token, Pointer<Void> p0, int p1, Pointer<Double> _result) {
  double _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as Comments_SomeLambda)(String_fromFfi(p0), (p1));
    _result.value = (_resultObject);
  } finally {
    String_releaseFfiHandle(p0);
    (p1);
  }
  return 0;
}
Pointer<Void> smoke_Comments_SomeLambda_toFfi(Comments_SomeLambda value) {
  final result = _smokeCommentsSomelambdaCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Int32, Pointer<Double>)>(_Comments_SomeLambda_call_static, __lib.unknownError)
  );
  return result;
}
Comments_SomeLambda smoke_Comments_SomeLambda_fromFfi(Pointer<Void> handle) {
  final _impl = Comments_SomeLambda$Impl(_smokeCommentsSomelambdaCopyHandle(handle));
  return (String p0, int p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}
void smoke_Comments_SomeLambda_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeCommentsSomelambdaReleaseHandle(handle);
// Nullable Comments_SomeLambda
final _smoke_Comments_SomeLambdaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_SomeLambda_create_handle_nullable'));
final _smoke_Comments_SomeLambdaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_SomeLambda_release_handle_nullable'));
final _smoke_Comments_SomeLambdaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_SomeLambda_get_value_nullable'));
Pointer<Void> smoke_Comments_SomeLambda_toFfi_nullable(Comments_SomeLambda value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Comments_SomeLambda_toFfi(value);
  final result = _smoke_Comments_SomeLambdaCreateHandleNullable(_handle);
  smoke_Comments_SomeLambda_releaseFfiHandle(_handle);
  return result;
}
Comments_SomeLambda smoke_Comments_SomeLambda_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Comments_SomeLambdaGetValueNullable(handle);
  final result = smoke_Comments_SomeLambda_fromFfi(_handle);
  smoke_Comments_SomeLambda_releaseFfiHandle(_handle);
  return result;
}
void smoke_Comments_SomeLambda_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Comments_SomeLambdaReleaseHandleNullable(handle);
// End of Comments_SomeLambda "private" section.
// Comments "private" section, not exported.
final _smokeCommentsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_copy_handle'));
final _smokeCommentsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_release_handle'));
final _someMethodWithAllCommentsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_someMethodWithAllComments__String_return_release_handle'));
final _someMethodWithAllCommentsReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Comments_someMethodWithAllComments__String_return_get_result'));
final _someMethodWithAllCommentsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Comments_someMethodWithAllComments__String_return_get_error'));
final _someMethodWithAllCommentsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Comments_someMethodWithAllComments__String_return_has_error'));
class Comments$Impl extends __lib.NativeBase implements Comments {
  Comments$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeCommentsReleaseHandle(handle);
    handle = null;
  }
  @override
  bool someMethodWithAllComments(String inputParameter) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_someMethodWithAllComments__String'));
    final _inputParameterHandle = String_toFfi(inputParameter);
    final _handle = this.handle;
    final __callResultHandle = _someMethodWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputParameterHandle);
    String_releaseFfiHandle(_inputParameterHandle);
    if (_someMethodWithAllCommentsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _someMethodWithAllCommentsReturnGetError(__callResultHandle);
        _someMethodWithAllCommentsReturnReleaseHandle(__callResultHandle);
        try {
          throw Comments_SomethingWrongException(smoke_Comments_SomeEnum_fromFfi(__errorHandle));
        } finally {
          smoke_Comments_SomeEnum_releaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _someMethodWithAllCommentsReturnGetResult(__callResultHandle);
    _someMethodWithAllCommentsReturnReleaseHandle(__callResultHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool someMethodWithInputComments(String input) {
    final _someMethodWithInputCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_someMethodWithInputComments__String'));
    final _inputHandle = String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _someMethodWithInputCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool someMethodWithOutputComments(String input) {
    final _someMethodWithOutputCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_someMethodWithOutputComments__String'));
    final _inputHandle = String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _someMethodWithOutputCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool someMethodWithNoComments(String input) {
    final _someMethodWithNoCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_someMethodWithNoComments__String'));
    final _inputHandle = String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _someMethodWithNoCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  someMethodWithoutReturnTypeWithAllComments(String input) {
    final _someMethodWithoutReturnTypeWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_someMethodWithoutReturnTypeWithAllComments__String'));
    final _inputHandle = String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _someMethodWithoutReturnTypeWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  someMethodWithoutReturnTypeWithNoComments(String input) {
    final _someMethodWithoutReturnTypeWithNoCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_someMethodWithoutReturnTypeWithNoComments__String'));
    final _inputHandle = String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _someMethodWithoutReturnTypeWithNoCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  bool someMethodWithoutInputParametersWithAllComments() {
    final _someMethodWithoutInputParametersWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Comments_someMethodWithoutInputParametersWithAllComments'));
    final _handle = this.handle;
    final __resultHandle = _someMethodWithoutInputParametersWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool someMethodWithoutInputParametersWithNoComments() {
    final _someMethodWithoutInputParametersWithNoCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Comments_someMethodWithoutInputParametersWithNoComments'));
    final _handle = this.handle;
    final __resultHandle = _someMethodWithoutInputParametersWithNoCommentsFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  someMethodWithNothing() {
    final _someMethodWithNothingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_Comments_someMethodWithNothing'));
    final _handle = this.handle;
    final __resultHandle = _someMethodWithNothingFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  someMethodWithoutReturnTypeOrInputParameters() {
    final _someMethodWithoutReturnTypeOrInputParametersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_Comments_someMethodWithoutReturnTypeOrInputParameters'));
    final _handle = this.handle;
    final __resultHandle = _someMethodWithoutReturnTypeOrInputParametersFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  String oneParameterCommentOnly(String undocumented, String documented) {
    final _oneParameterCommentOnlyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('library_smoke_Comments_oneParameterCommentOnly__String_String'));
    final _undocumentedHandle = String_toFfi(undocumented);
    final _documentedHandle = String_toFfi(documented);
    final _handle = this.handle;
    final __resultHandle = _oneParameterCommentOnlyFfi(_handle, __lib.LibraryContext.isolateId, _undocumentedHandle, _documentedHandle);
    String_releaseFfiHandle(_undocumentedHandle);
    String_releaseFfiHandle(_documentedHandle);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  String returnCommentOnly(String undocumented) {
    final _returnCommentOnlyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_returnCommentOnly__String'));
    final _undocumentedHandle = String_toFfi(undocumented);
    final _handle = this.handle;
    final __resultHandle = _returnCommentOnlyFfi(_handle, __lib.LibraryContext.isolateId, _undocumentedHandle);
    String_releaseFfiHandle(_undocumentedHandle);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool get isSomeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Comments_isSomeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set isSomeProperty(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_Comments_isSomeProperty_set__Boolean'));
    final _valueHandle = Boolean_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    Boolean_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_Comments_toFfi(Comments value) =>
  _smokeCommentsCopyHandle((value as __lib.NativeBase).handle);
Comments smoke_Comments_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Comments;
  if (instance != null) return instance;
  final _copiedHandle = _smokeCommentsCopyHandle(handle);
  final result = Comments$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_Comments_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeCommentsReleaseHandle(handle);
Pointer<Void> smoke_Comments_toFfi_nullable(Comments value) =>
  value != null ? smoke_Comments_toFfi(value) : Pointer<Void>.fromAddress(0);
Comments smoke_Comments_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Comments_fromFfi(handle) : null;
void smoke_Comments_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeCommentsReleaseHandle(handle);
// End of Comments "private" section.

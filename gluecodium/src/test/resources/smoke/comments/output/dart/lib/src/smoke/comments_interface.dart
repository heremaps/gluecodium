import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// This is some very useful interface.
abstract class CommentsInterface {
  CommentsInterface() {}
  factory CommentsInterface.fromLambdas({
    @required bool Function(String) lambda_someMethodWithAllComments,
    @required bool Function(String) lambda_someMethodWithInputComments,
    @required bool Function(String) lambda_someMethodWithOutputComments,
    @required bool Function(String) lambda_someMethodWithNoComments,
    @required void Function(String) lambda_someMethodWithoutReturnTypeWithAllComments,
    @required void Function(String) lambda_someMethodWithoutReturnTypeWithNoComments,
    @required bool Function() lambda_someMethodWithoutInputParametersWithAllComments,
    @required bool Function() lambda_someMethodWithoutInputParametersWithNoComments,
    @required void Function() lambda_someMethodWithNothing,
    @required void Function() lambda_someMethodWithoutReturnTypeOrInputParameters,
    @required bool Function() lambda_isSomeProperty_get,
    @required void Function(bool) lambda_isSomeProperty_set
  }) => CommentsInterface$Lambdas(
    lambda_someMethodWithAllComments,
    lambda_someMethodWithInputComments,
    lambda_someMethodWithOutputComments,
    lambda_someMethodWithNoComments,
    lambda_someMethodWithoutReturnTypeWithAllComments,
    lambda_someMethodWithoutReturnTypeWithNoComments,
    lambda_someMethodWithoutInputParametersWithAllComments,
    lambda_someMethodWithoutInputParametersWithNoComments,
    lambda_someMethodWithNothing,
    lambda_someMethodWithoutReturnTypeOrInputParameters,
    lambda_isSomeProperty_get,
    lambda_isSomeProperty_set
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  /// This is some very useful constant.
  static final bool veryUseful = true;
  /// This is some very useful method that measures the usefulness of its input.
  /// [input] Very useful input parameter
  /// Returns [bool]. Usefulness of the input
  bool someMethodWithAllComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  /// [input] Very useful input parameter
  bool someMethodWithInputComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  /// Returns [bool]. Usefulness of the input
  bool someMethodWithOutputComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  bool someMethodWithNoComments(String input);
  /// This is some very useful method that does not measure the usefulness of its input.
  /// [input] Very useful input parameter
  someMethodWithoutReturnTypeWithAllComments(String input);
  /// This is some very useful method that does not measure the usefulness of its input.
  someMethodWithoutReturnTypeWithNoComments(String input);
  /// This is some very useful method that measures the usefulness of something.
  /// Returns [bool]. Usefulness of the input
  bool someMethodWithoutInputParametersWithAllComments();
  /// This is some very useful method that measures the usefulness of something.
  bool someMethodWithoutInputParametersWithNoComments();
  someMethodWithNothing();
  /// This is some very useful method that does nothing.
  someMethodWithoutReturnTypeOrInputParameters();
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
int smoke_CommentsInterface_SomeEnum_toFfi(CommentsInterface_SomeEnum value) {
  switch (value) {
  case CommentsInterface_SomeEnum.useless:
    return 0;
  break;
  case CommentsInterface_SomeEnum.useful:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for CommentsInterface_SomeEnum enum.");
  }
}
CommentsInterface_SomeEnum smoke_CommentsInterface_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return CommentsInterface_SomeEnum.useless;
  break;
  case 1:
    return CommentsInterface_SomeEnum.useful;
  break;
  default:
    throw StateError("Invalid numeric value $handle for CommentsInterface_SomeEnum enum.");
  }
}
void smoke_CommentsInterface_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_CommentsInterface_SomeEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_CommentsInterface_SomeEnum_create_handle_nullable'));
final _smoke_CommentsInterface_SomeEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeEnum_release_handle_nullable'));
final _smoke_CommentsInterface_SomeEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_CommentsInterface_SomeEnum_toFfi_nullable(CommentsInterface_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_CommentsInterface_SomeEnum_toFfi(value);
  final result = _smoke_CommentsInterface_SomeEnum_create_handle_nullable(_handle);
  smoke_CommentsInterface_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
CommentsInterface_SomeEnum smoke_CommentsInterface_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_CommentsInterface_SomeEnum_get_value_nullable(handle);
  final result = smoke_CommentsInterface_SomeEnum_fromFfi(_handle);
  smoke_CommentsInterface_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_CommentsInterface_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CommentsInterface_SomeEnum_release_handle_nullable(handle);
// End of CommentsInterface_SomeEnum "private" section.
/// This is some very useful struct.
class CommentsInterface_SomeStruct {
  /// How useful this struct is
  bool someField;
  CommentsInterface_SomeStruct(this.someField);
}
// CommentsInterface_SomeStruct "private" section, not exported.
final _smoke_CommentsInterface_SomeStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_CommentsInterface_SomeStruct_create_handle'));
final _smoke_CommentsInterface_SomeStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_release_handle'));
final _smoke_CommentsInterface_SomeStruct_get_field_someField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_get_field_someField'));
Pointer<Void> smoke_CommentsInterface_SomeStruct_toFfi(CommentsInterface_SomeStruct value) {
  final _someField_handle = Boolean_toFfi(value.someField);
  final _result = _smoke_CommentsInterface_SomeStruct_create_handle(_someField_handle);
  Boolean_releaseFfiHandle(_someField_handle);
  return _result;
}
CommentsInterface_SomeStruct smoke_CommentsInterface_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_CommentsInterface_SomeStruct_get_field_someField(handle);
  try {
    return CommentsInterface_SomeStruct(
      Boolean_fromFfi(_someField_handle)
    );
  } finally {
    Boolean_releaseFfiHandle(_someField_handle);
  }
}
void smoke_CommentsInterface_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_CommentsInterface_SomeStruct_release_handle(handle);
// Nullable CommentsInterface_SomeStruct
final _smoke_CommentsInterface_SomeStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_create_handle_nullable'));
final _smoke_CommentsInterface_SomeStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_release_handle_nullable'));
final _smoke_CommentsInterface_SomeStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_CommentsInterface_SomeStruct_toFfi_nullable(CommentsInterface_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_CommentsInterface_SomeStruct_toFfi(value);
  final result = _smoke_CommentsInterface_SomeStruct_create_handle_nullable(_handle);
  smoke_CommentsInterface_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
CommentsInterface_SomeStruct smoke_CommentsInterface_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_CommentsInterface_SomeStruct_get_value_nullable(handle);
  final result = smoke_CommentsInterface_SomeStruct_fromFfi(_handle);
  smoke_CommentsInterface_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_CommentsInterface_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CommentsInterface_SomeStruct_release_handle_nullable(handle);
// End of CommentsInterface_SomeStruct "private" section.
// CommentsInterface "private" section, not exported.
final _smoke_CommentsInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_copy_handle'));
final _smoke_CommentsInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_release_handle'));
final _smoke_CommentsInterface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_CommentsInterface_create_proxy'));
final _smoke_CommentsInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_get_type_id'));
class CommentsInterface$Lambdas implements CommentsInterface {
  bool Function(String) lambda_someMethodWithAllComments;
  bool Function(String) lambda_someMethodWithInputComments;
  bool Function(String) lambda_someMethodWithOutputComments;
  bool Function(String) lambda_someMethodWithNoComments;
  void Function(String) lambda_someMethodWithoutReturnTypeWithAllComments;
  void Function(String) lambda_someMethodWithoutReturnTypeWithNoComments;
  bool Function() lambda_someMethodWithoutInputParametersWithAllComments;
  bool Function() lambda_someMethodWithoutInputParametersWithNoComments;
  void Function() lambda_someMethodWithNothing;
  void Function() lambda_someMethodWithoutReturnTypeOrInputParameters;
  bool Function() lambda_isSomeProperty_get;
  void Function(bool) lambda_isSomeProperty_set;
  CommentsInterface$Lambdas(
    this.lambda_someMethodWithAllComments,
    this.lambda_someMethodWithInputComments,
    this.lambda_someMethodWithOutputComments,
    this.lambda_someMethodWithNoComments,
    this.lambda_someMethodWithoutReturnTypeWithAllComments,
    this.lambda_someMethodWithoutReturnTypeWithNoComments,
    this.lambda_someMethodWithoutInputParametersWithAllComments,
    this.lambda_someMethodWithoutInputParametersWithNoComments,
    this.lambda_someMethodWithNothing,
    this.lambda_someMethodWithoutReturnTypeOrInputParameters,
    this.lambda_isSomeProperty_get,
    this.lambda_isSomeProperty_set
  );
  @override
  void release() {}
  @override
  bool someMethodWithAllComments(String input) =>
    lambda_someMethodWithAllComments(input);
  @override
  bool someMethodWithInputComments(String input) =>
    lambda_someMethodWithInputComments(input);
  @override
  bool someMethodWithOutputComments(String input) =>
    lambda_someMethodWithOutputComments(input);
  @override
  bool someMethodWithNoComments(String input) =>
    lambda_someMethodWithNoComments(input);
  @override
  someMethodWithoutReturnTypeWithAllComments(String input) =>
    lambda_someMethodWithoutReturnTypeWithAllComments(input);
  @override
  someMethodWithoutReturnTypeWithNoComments(String input) =>
    lambda_someMethodWithoutReturnTypeWithNoComments(input);
  @override
  bool someMethodWithoutInputParametersWithAllComments() =>
    lambda_someMethodWithoutInputParametersWithAllComments();
  @override
  bool someMethodWithoutInputParametersWithNoComments() =>
    lambda_someMethodWithoutInputParametersWithNoComments();
  @override
  someMethodWithNothing() =>
    lambda_someMethodWithNothing();
  @override
  someMethodWithoutReturnTypeOrInputParameters() =>
    lambda_someMethodWithoutReturnTypeOrInputParameters();
  @override
  bool get isSomeProperty => lambda_isSomeProperty_get();
  @override
  set isSomeProperty(bool value) => lambda_isSomeProperty_set(value);
}
class CommentsInterface$Impl implements CommentsInterface {
  Pointer<Void> handle;
  CommentsInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_CommentsInterface_release_handle(handle);
    handle = null;
  }
  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllComments_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithAllComments__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithAllComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  @override
  bool someMethodWithInputComments(String input) {
    final _someMethodWithInputComments_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithInputComments__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithInputComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  @override
  bool someMethodWithOutputComments(String input) {
    final _someMethodWithOutputComments_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithOutputComments__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithOutputComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  @override
  bool someMethodWithNoComments(String input) {
    final _someMethodWithNoComments_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithNoComments__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithNoComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  @override
  someMethodWithoutReturnTypeWithAllComments(String input) {
    final _someMethodWithoutReturnTypeWithAllComments_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithoutReturnTypeWithAllComments__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutReturnTypeWithAllComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  someMethodWithoutReturnTypeWithNoComments(String input) {
    final _someMethodWithoutReturnTypeWithNoComments_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithoutReturnTypeWithNoComments__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutReturnTypeWithNoComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  bool someMethodWithoutInputParametersWithAllComments() {
    final _someMethodWithoutInputParametersWithAllComments_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_someMethodWithoutInputParametersWithAllComments'));
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutInputParametersWithAllComments_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  @override
  bool someMethodWithoutInputParametersWithNoComments() {
    final _someMethodWithoutInputParametersWithNoComments_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_someMethodWithoutInputParametersWithNoComments'));
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutInputParametersWithNoComments_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  @override
  someMethodWithNothing() {
    final _someMethodWithNothing_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_someMethodWithNothing'));
    final _handle = this.handle;
    final __result_handle = _someMethodWithNothing_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  someMethodWithoutReturnTypeOrInputParameters() {
    final _someMethodWithoutReturnTypeOrInputParameters_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_someMethodWithoutReturnTypeOrInputParameters'));
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutReturnTypeOrInputParameters_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  /// Gets some very useful property.
  bool get isSomeProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_isSomeProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  /// Sets some very useful property.
  set isSomeProperty(bool value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_CommentsInterface_isSomeProperty_set__Boolean'));
    final _value_handle = Boolean_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    Boolean_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
int _CommentsInterface_someMethodWithAllComments_static(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  bool _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as CommentsInterface).someMethodWithAllComments(String_fromFfi(input));
    _result.value = Boolean_toFfi(_result_object);
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
int _CommentsInterface_someMethodWithInputComments_static(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  bool _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as CommentsInterface).someMethodWithInputComments(String_fromFfi(input));
    _result.value = Boolean_toFfi(_result_object);
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
int _CommentsInterface_someMethodWithOutputComments_static(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  bool _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as CommentsInterface).someMethodWithOutputComments(String_fromFfi(input));
    _result.value = Boolean_toFfi(_result_object);
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
int _CommentsInterface_someMethodWithNoComments_static(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  bool _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as CommentsInterface).someMethodWithNoComments(String_fromFfi(input));
    _result.value = Boolean_toFfi(_result_object);
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
int _CommentsInterface_someMethodWithoutReturnTypeWithAllComments_static(int _token, Pointer<Void> input) {
  try {
    (__lib.instanceCache[_token] as CommentsInterface).someMethodWithoutReturnTypeWithAllComments(String_fromFfi(input));
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
int _CommentsInterface_someMethodWithoutReturnTypeWithNoComments_static(int _token, Pointer<Void> input) {
  try {
    (__lib.instanceCache[_token] as CommentsInterface).someMethodWithoutReturnTypeWithNoComments(String_fromFfi(input));
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
int _CommentsInterface_someMethodWithoutInputParametersWithAllComments_static(int _token, Pointer<Uint8> _result) {
  bool _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as CommentsInterface).someMethodWithoutInputParametersWithAllComments();
    _result.value = Boolean_toFfi(_result_object);
  } finally {
  }
  return 0;
}
int _CommentsInterface_someMethodWithoutInputParametersWithNoComments_static(int _token, Pointer<Uint8> _result) {
  bool _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as CommentsInterface).someMethodWithoutInputParametersWithNoComments();
    _result.value = Boolean_toFfi(_result_object);
  } finally {
  }
  return 0;
}
int _CommentsInterface_someMethodWithNothing_static(int _token) {
  try {
    (__lib.instanceCache[_token] as CommentsInterface).someMethodWithNothing();
  } finally {
  }
  return 0;
}
int _CommentsInterface_someMethodWithoutReturnTypeOrInputParameters_static(int _token) {
  try {
    (__lib.instanceCache[_token] as CommentsInterface).someMethodWithoutReturnTypeOrInputParameters();
  } finally {
  }
  return 0;
}
int _CommentsInterface_isSomeProperty_get_static(int _token, Pointer<Uint8> _result) {
  _result.value = Boolean_toFfi((__lib.instanceCache[_token] as CommentsInterface).isSomeProperty);
  return 0;
}
int _CommentsInterface_isSomeProperty_set_static(int _token, int _value) {
  try {
    (__lib.instanceCache[_token] as CommentsInterface).isSomeProperty =
      Boolean_fromFfi(_value);
  } finally {
    Boolean_releaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smoke_CommentsInterface_toFfi(CommentsInterface value) {
  if (value is CommentsInterface$Impl) return _smoke_CommentsInterface_copy_handle(value.handle);
  final result = _smoke_CommentsInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_CommentsInterface_someMethodWithAllComments_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_CommentsInterface_someMethodWithInputComments_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_CommentsInterface_someMethodWithOutputComments_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_CommentsInterface_someMethodWithNoComments_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_CommentsInterface_someMethodWithoutReturnTypeWithAllComments_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_CommentsInterface_someMethodWithoutReturnTypeWithNoComments_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint8>)>(_CommentsInterface_someMethodWithoutInputParametersWithAllComments_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint8>)>(_CommentsInterface_someMethodWithoutInputParametersWithNoComments_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64)>(_CommentsInterface_someMethodWithNothing_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64)>(_CommentsInterface_someMethodWithoutReturnTypeOrInputParameters_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint8>)>(_CommentsInterface_isSomeProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Uint8)>(_CommentsInterface_isSomeProperty_set_static, __lib.unknownError)
  );
  return result;
}
CommentsInterface smoke_CommentsInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as CommentsInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_CommentsInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_CommentsInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : CommentsInterface$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_CommentsInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_CommentsInterface_release_handle(handle);
Pointer<Void> smoke_CommentsInterface_toFfi_nullable(CommentsInterface value) =>
  value != null ? smoke_CommentsInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
CommentsInterface smoke_CommentsInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_CommentsInterface_fromFfi(handle) : null;
void smoke_CommentsInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CommentsInterface_release_handle(handle);
// End of CommentsInterface "private" section.

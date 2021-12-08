import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
/// This is some very useful interface.
///
/// There is a lot to say about this interface.
/// at least it has multiline comments.
///
/// I am a heading
/// --------------
///
/// And now comes a list:
/// * asterisk
/// * needs
/// * escaping
///
/// ```Some example code;```
abstract class MultiLineComments {

  /// This is very important method.
  ///
  /// It has very important parameters.
  /// It has side effects.
  ///
  /// [input] Very useful input parameter.
  /// You must not confuse it with the second parameter.
  /// But they are similar.
  ///
  /// [ratio] Not as useful as the first parameter.
  /// But still useful.
  /// use a positive value for more happiness.
  ///
  /// Returns [double]. If you provide a useful input,
  /// and a useful ratio you can expect a useful output.
  /// Just kidding do not expect anything from a method until
  /// you see its body.
  ///
  double someMethodWithLongComment(String input, double ratio);
}
// MultiLineComments "private" section, not exported.
final _smokeMultilinecommentsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_MultiLineComments_register_finalizer'));
final _smokeMultilinecommentsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MultiLineComments_copy_handle'));
final _smokeMultilinecommentsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MultiLineComments_release_handle'));
class MultiLineComments$Impl extends __lib.NativeBase implements MultiLineComments {
  MultiLineComments$Impl(Pointer<Void> handle) : super(handle);

  @override
  double someMethodWithLongComment(String input, double ratio) {
    final _someMethodWithLongCommentFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32, Pointer<Void>, Double), double Function(Pointer<Void>, int, Pointer<Void>, double)>('library_smoke_MultiLineComments_someMethodWithLongComment__String_Double'));
    final _inputHandle = stringToFfi(input);
    final _ratioHandle = (ratio);
    final _handle = this.handle;
    final __resultHandle = _someMethodWithLongCommentFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle, _ratioHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
Pointer<Void> smokeMultilinecommentsToFfi(MultiLineComments value) =>
  _smokeMultilinecommentsCopyHandle((value as __lib.NativeBase).handle);
MultiLineComments smokeMultilinecommentsFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MultiLineComments) return instance;
  final _copiedHandle = _smokeMultilinecommentsCopyHandle(handle);
  final result = MultiLineComments$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeMultilinecommentsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeMultilinecommentsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeMultilinecommentsReleaseHandle(handle);
Pointer<Void> smokeMultilinecommentsToFfiNullable(MultiLineComments? value) =>
  value != null ? smokeMultilinecommentsToFfi(value) : Pointer<Void>.fromAddress(0);
MultiLineComments? smokeMultilinecommentsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeMultilinecommentsFromFfi(handle) : null;
void smokeMultilinecommentsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeMultilinecommentsReleaseHandle(handle);
// End of MultiLineComments "private" section.

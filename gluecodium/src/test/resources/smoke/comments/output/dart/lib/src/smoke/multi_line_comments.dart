import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
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
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  /// This is very important method.
  ///
  /// It has very important parameters.
  /// It has side effects.
  /// [input] Very useful input parameter.
  /// You must not confuse it with the second parameter.
  /// But they are similar.
  /// [ratio] Not as useful as the first parameter.
  /// But still useful.
  /// use a positive value for more happiness.
  /// Returns [double]. If you provide a useful input,
  /// and a useful ratio you can expect a useful output.
  /// Just kidding do not expect anything from a method until
  /// you see its body.
  double someMethodWithLongComment(String input, double ratio);
}
// MultiLineComments "private" section, not exported.
final _smoke_MultiLineComments_register_finalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_MultiLineComments_register_finalizer'));
final _smoke_MultiLineComments_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MultiLineComments_copy_handle'));
final _smoke_MultiLineComments_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MultiLineComments_release_handle'));
class MultiLineComments$Impl implements MultiLineComments {
  @protected
  Pointer<Void> handle;
  MultiLineComments$Impl(this.handle);
  @override
  void release() {}
  @override
  double someMethodWithLongComment(String input, double ratio) {
    final _someMethodWithLongComment_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32, Pointer<Void>, Double), double Function(Pointer<Void>, int, Pointer<Void>, double)>('library_smoke_MultiLineComments_someMethodWithLongComment__String_Double'));
    final _input_handle = String_toFfi(input);
    final _ratio_handle = (ratio);
    final _handle = this.handle;
    final __result_handle = _someMethodWithLongComment_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle, _ratio_handle);
    String_releaseFfiHandle(_input_handle);
    (_ratio_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_MultiLineComments_toFfi(MultiLineComments value) =>
  _smoke_MultiLineComments_copy_handle((value as MultiLineComments$Impl).handle);
MultiLineComments smoke_MultiLineComments_fromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MultiLineComments) return instance as MultiLineComments;
  final _copied_handle = _smoke_MultiLineComments_copy_handle(handle);
  final result = MultiLineComments$Impl(_copied_handle);
  __lib.cacheInstance(_copied_handle, result, _smoke_MultiLineComments_register_finalizer);
  return result;
}
void smoke_MultiLineComments_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_MultiLineComments_release_handle(handle);
Pointer<Void> smoke_MultiLineComments_toFfi_nullable(MultiLineComments value) =>
  value != null ? smoke_MultiLineComments_toFfi(value) : Pointer<Void>.fromAddress(0);
MultiLineComments smoke_MultiLineComments_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_MultiLineComments_fromFfi(handle) : null;
void smoke_MultiLineComments_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_MultiLineComments_release_handle(handle);
// End of MultiLineComments "private" section.

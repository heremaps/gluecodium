import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// This is some very useful interface.
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
  void release();
  /// This is very important method.
  /// It has very important parameters.
  /// It has side effects.
  /// @param[input] Very useful input parameter.
  /// You must not confuse it with the second parameter.
  /// But they are similar.
  /// @param[ratio] Not as useful as the first parameter.
  /// But still useful.
  /// use a positive value for more happiness.
  /// @return If you provide a useful input,
  /// and a useful ratio you can expect a useful output.
  /// Just kidding do not expect anything from a method until
  /// you see its body.
  double someMethodWithLongComment(String input, double ratio);
}
// MultiLineComments "private" section, not exported.
final _smoke_MultiLineComments_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MultiLineComments_copy_handle');
final _smoke_MultiLineComments_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MultiLineComments_release_handle');
final _smoke_MultiLineComments_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_MultiLineComments_get_raw_pointer');
class MultiLineComments$Impl implements MultiLineComments {
  @protected
  Pointer<Void> handle;
  MultiLineComments$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_MultiLineComments_get_raw_pointer(handle));
    _smoke_MultiLineComments_release_handle(handle);
    handle = null;
  }
  @override
  double someMethodWithLongComment(String input, double ratio) {
    final _someMethodWithLongComment_ffi = __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32, Pointer<Void>, Double), double Function(Pointer<Void>, int, Pointer<Void>, double)>('library_smoke_MultiLineComments_someMethodWithLongComment__String_Double');
    final _input_handle = String_toFfi(input);
    final _ratio_handle = (ratio);
    final _handle = this.handle;
    final __result_handle = _someMethodWithLongComment_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle, _ratio_handle);
    String_releaseFfiHandle(_input_handle);
    (_ratio_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_MultiLineComments_toFfi(MultiLineComments value) =>
  _smoke_MultiLineComments_copy_handle((value as MultiLineComments$Impl).handle);
MultiLineComments smoke_MultiLineComments_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_MultiLineComments_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MultiLineComments;
  if (instance != null) {
                        print("FOOBAR cache hit ${raw_handle.address}");
                        return instance;
                      }
                        print("FOOBAR cache miss ${raw_handle.address}");
  final _copied_handle = _smoke_MultiLineComments_copy_handle(handle);
  final result = MultiLineComments$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
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

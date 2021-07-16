import 'dart:ffi';
import 'package:meta/meta.dart';
/// For internal use only.
/// @nodoc
class NativeBase {
  /// For internal use only.
  /// @nodoc
  Pointer<Void> handle = Pointer<Void>.fromAddress(0);
  /// For internal use only.
  /// @nodoc
  @protected
  NativeBase(this.handle);
}

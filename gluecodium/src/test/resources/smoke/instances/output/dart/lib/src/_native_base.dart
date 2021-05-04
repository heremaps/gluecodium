import 'dart:ffi';
import 'package:meta/meta.dart';
/// @nodoc
class NativeBase {
  @protected
  Pointer<Void> handle = Pointer<Void>.fromAddress(0);
  NativeBase(this.handle);
}

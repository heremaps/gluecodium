import 'package:library/src/smoke/FreeEnum.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
class FreeException implements Exception {
  final FreeEnum error;
  FreeException(this.error);
}

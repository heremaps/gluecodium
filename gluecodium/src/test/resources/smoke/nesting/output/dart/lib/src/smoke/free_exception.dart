import 'package:library/src/smoke/free_enum.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class FreeException implements Exception {
  final FreeEnum error;
  FreeException(this.error);
}

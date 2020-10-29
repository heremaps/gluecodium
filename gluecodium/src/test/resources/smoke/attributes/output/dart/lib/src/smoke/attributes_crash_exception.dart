import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@OnException
class AttributesCrashException implements Exception {
  final String error;
  AttributesCrashException(this.error);
}

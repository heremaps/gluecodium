import 'package:library/src/builtin_types__conversion.dart';
@OnException
class AttributesCrashException implements Exception {
  final String error;
  AttributesCrashException(this.error);
}

import 'package:library/src/smoke/free_enum.dart';
class FreeException implements Exception {
  final FreeEnum error;
  FreeException(this.error);
}

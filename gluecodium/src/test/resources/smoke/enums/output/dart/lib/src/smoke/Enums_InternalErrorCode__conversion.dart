import 'package:library/src/smoke/Enums.dart';
import 'package:library/src/smoke/Enums_InternalErrorCode__conversion.dart';
int smoke_Enums_1InternalErrorCode_toFfi(Enums_InternalErrorCode value) {
  switch (value) {
  case Enums_InternalErrorCode.errorNone:
    return 0;
  break;
  case Enums_InternalErrorCode.errorFatal:
    return 999;
  break;
  default:
    throw StateError("Invalid enum value $value for Enums_InternalErrorCode enum.");
  }
}
Enums_InternalErrorCode smoke_Enums_1InternalErrorCode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enums_InternalErrorCode.errorNone;
  break;
  case 999:
    return Enums_InternalErrorCode.errorFatal;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Enums_InternalErrorCode enum.");
  }
}
void smoke_Enums_1InternalErrorCode_releaseFfiHandle(int handle) {}

import 'dart:ffi';
import 'package:ffi/ffi.dart';
const unknownError = -1;
int _instanceCounter = 1024;
final Map<int, Object> instanceCache = {};
final Map<Pointer<Void>, Object> reverseCache = {};
int getNewToken() => _instanceCounter++;
void uncacheObject(int token, Pointer<Void> rawPointer) {
  instanceCache.remove(token);
  reverseCache.remove(rawPointer);
}
final uncacheObjectFfi = Pointer.fromFunction<Void Function(Uint64, Pointer<Void>)>(uncacheObject);

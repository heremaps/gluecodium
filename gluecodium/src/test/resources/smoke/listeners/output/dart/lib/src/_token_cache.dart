import 'dart:ffi';
import 'package:ffi/ffi.dart';
const unknownError = -1;
int _instanceCounter = 1024;
final Map<int, Object> instanceCache = {};
final Map<Object, int> tokenCache = {};
final Map<Pointer<Void>, Object> reverseCache = {};
int cacheObject(Object obj) {
  int token = tokenCache[obj];
  if (token == null) {
    token = _instanceCounter++;
    instanceCache[token] = obj;
    tokenCache[obj] = token;
  }
  return token;
}
void uncacheObject(int token, Pointer<Void> rawPointer) {
  tokenCache.remove(instanceCache[token]);
  instanceCache.remove(token);
  reverseCache.remove(rawPointer);
}
final uncacheObjectFfi = Pointer.fromFunction<Void Function(Uint64, Pointer<Void>)>(uncacheObject);

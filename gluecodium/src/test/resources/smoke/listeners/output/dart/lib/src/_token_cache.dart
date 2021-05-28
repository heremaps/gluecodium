import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
const unknownError = -1;
int _instanceCounter = 1024;
final Map<int, Object> instanceCache = {};
final Map<Object, int> tokenCache = {};
int cacheObject(Object obj) {
  int? token = tokenCache[obj];
  if (token == null) {
    token = _instanceCounter++;
    instanceCache[token] = obj;
    tokenCache[obj] = token;
  }
  return token;
}
void uncacheObjectByToken(int token) {
  tokenCache.remove(instanceCache[token]);
  instanceCache.remove(token);
}
void uncacheObject(Object object) {
  instanceCache.remove(tokenCache[object]);
  tokenCache.remove(object);
}
final uncacheObjectFfi = Pointer.fromFunction<Void Function(Uint64)>(uncacheObjectByToken);
final ffiGetCachedToken = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Uint64 Function(Pointer<Void>, Int32),
      int Function(Pointer<Void>, int)
    >('library_get_cached_token'));
final ffiCacheToken = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Void Function(Pointer<Void>, Int32, Uint64),
      void Function(Pointer<Void>, int, int)
    >('library_cache_token'));
final ffiUncacheToken = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Void Function(Pointer<Void>, Int32),
      void Function(Pointer<Void>, int)
    >('library_uncache_token'));

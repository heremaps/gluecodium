import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_context.dart' as __lib;
final _ffi_get_cached_dart_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Handle Function(Pointer<Void>, Int32, Handle),
      Object Function(Pointer<Void>, int, Object)
    >('library_get_cached_dart_handle'));
final _ffi_cache_dart_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Void Function(Pointer<Void>, Int32, Handle),
      void Function(Pointer<Void>, int, Object)
    >('library_cache_dart_handle'));
final _ffi_uncache_dart_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Void Function(Pointer<Void>, Int32),
      void Function(Pointer<Void>, int)
    >('library_uncache_dart_handle'));
const unknownError = -1;
int _instanceCounter = 1024;
final Expando<int> tokenCache = Expando<int>();
// "Token" here is a unique-id stand-in for a Dart object on FFI side, to be used as a cache key where necessary.
// Dart_Handle cannot be used as a cache key in FFI due to lack of meaningful FFI-side hash function.
// Currently these tokens are only used for caching "proxy" objects and nothing else.
int getObjectToken(Object obj) {
  int token = tokenCache[obj];
  if (token == null) {
    token = _instanceCounter++;
    tokenCache[obj] = token;
  }
  return token;
}
Object getCachedInstance(Pointer<Void> handle) =>
  _ffi_get_cached_dart_handle(handle, __lib.LibraryContext.isolateId, null);
void cacheInstance(Pointer<Void> handle, Object obj) =>
  _ffi_cache_dart_handle(handle, __lib.LibraryContext.isolateId, obj);
void uncacheInstance(Pointer<Void> handle) =>
  _ffi_uncache_dart_handle(handle, __lib.LibraryContext.isolateId);

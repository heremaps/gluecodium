import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Lambdas {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  Lambdas_Producer deconfuse(String value, Lambdas_Confuser confuser);
  static Map<int, String> fuse(List<String> items, Lambdas_Indexer callback) => Lambdas$Impl.fuse(items, callback);
}
typedef Lambdas_Producer = String Function();
// Lambdas_Producer "private" section, not exported.
final _smokeLambdasProducerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_copy_handle'));
final _smokeLambdasProducerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_release_handle'));
final _smokeLambdasProducerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_Lambdas_Producer_create_proxy'));
class Lambdas_Producer$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Lambdas_Producer$Impl(this.handle);
  void release() => _smokeLambdasProducerReleaseHandle(handle);
  String call() {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Lambdas_Producer_call'));
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
}
int _Lambdas_Producer_call_static(int _token, Pointer<Pointer<Void>> _result) {
  String _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as Lambdas_Producer)();
    _result.value = String_toFfi(_resultObject);
  } finally {
  }
  return 0;
}
Pointer<Void> smoke_Lambdas_Producer_toFfi(Lambdas_Producer value) {
  final result = _smokeLambdasProducerCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Pointer<Void>>)>(_Lambdas_Producer_call_static, __lib.unknownError)
  );
  return result;
}
Lambdas_Producer smoke_Lambdas_Producer_fromFfi(Pointer<Void> handle) {
  final _impl = Lambdas_Producer$Impl(_smokeLambdasProducerCopyHandle(handle));
  return () {
    final _result =_impl.call();
    _impl.release();
    return _result;
  };
}
void smoke_Lambdas_Producer_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdasProducerReleaseHandle(handle);
// Nullable Lambdas_Producer
final _smoke_Lambdas_ProducerCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_create_handle_nullable'));
final _smoke_Lambdas_ProducerReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_release_handle_nullable'));
final _smoke_Lambdas_ProducerGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_get_value_nullable'));
Pointer<Void> smoke_Lambdas_Producer_toFfi_nullable(Lambdas_Producer value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Lambdas_Producer_toFfi(value);
  final result = _smoke_Lambdas_ProducerCreateHandleNullable(_handle);
  smoke_Lambdas_Producer_releaseFfiHandle(_handle);
  return result;
}
Lambdas_Producer smoke_Lambdas_Producer_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Lambdas_ProducerGetValueNullable(handle);
  final result = smoke_Lambdas_Producer_fromFfi(_handle);
  smoke_Lambdas_Producer_releaseFfiHandle(_handle);
  return result;
}
void smoke_Lambdas_Producer_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Lambdas_ProducerReleaseHandleNullable(handle);
// End of Lambdas_Producer "private" section.
/// Should confuse everyone thoroughly
typedef Lambdas_Confuser = Lambdas_Producer Function(String);
// Lambdas_Confuser "private" section, not exported.
final _smokeLambdasConfuserCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_copy_handle'));
final _smokeLambdasConfuserReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_release_handle'));
final _smokeLambdasConfuserCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_Lambdas_Confuser_create_proxy'));
class Lambdas_Confuser$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Lambdas_Confuser$Impl(this.handle);
  void release() => _smokeLambdasConfuserReleaseHandle(handle);
  Lambdas_Producer call(String p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Lambdas_Confuser_call__String'));
    final _p0Handle = String_toFfi(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    String_releaseFfiHandle(_p0Handle);
    try {
      return smoke_Lambdas_Producer_fromFfi(__resultHandle);
    } finally {
      smoke_Lambdas_Producer_releaseFfiHandle(__resultHandle);
    }
  }
}
int _Lambdas_Confuser_call_static(int _token, Pointer<Void> p0, Pointer<Pointer<Void>> _result) {
  Lambdas_Producer _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as Lambdas_Confuser)(String_fromFfi(p0));
    _result.value = smoke_Lambdas_Producer_toFfi(_resultObject);
  } finally {
    String_releaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smoke_Lambdas_Confuser_toFfi(Lambdas_Confuser value) {
  final result = _smokeLambdasConfuserCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_Lambdas_Confuser_call_static, __lib.unknownError)
  );
  return result;
}
Lambdas_Confuser smoke_Lambdas_Confuser_fromFfi(Pointer<Void> handle) {
  final _impl = Lambdas_Confuser$Impl(_smokeLambdasConfuserCopyHandle(handle));
  return (String p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}
void smoke_Lambdas_Confuser_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdasConfuserReleaseHandle(handle);
// Nullable Lambdas_Confuser
final _smoke_Lambdas_ConfuserCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_create_handle_nullable'));
final _smoke_Lambdas_ConfuserReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_release_handle_nullable'));
final _smoke_Lambdas_ConfuserGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_get_value_nullable'));
Pointer<Void> smoke_Lambdas_Confuser_toFfi_nullable(Lambdas_Confuser value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Lambdas_Confuser_toFfi(value);
  final result = _smoke_Lambdas_ConfuserCreateHandleNullable(_handle);
  smoke_Lambdas_Confuser_releaseFfiHandle(_handle);
  return result;
}
Lambdas_Confuser smoke_Lambdas_Confuser_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Lambdas_ConfuserGetValueNullable(handle);
  final result = smoke_Lambdas_Confuser_fromFfi(_handle);
  smoke_Lambdas_Confuser_releaseFfiHandle(_handle);
  return result;
}
void smoke_Lambdas_Confuser_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Lambdas_ConfuserReleaseHandleNullable(handle);
// End of Lambdas_Confuser "private" section.
typedef Lambdas_Consumer = void Function(String);
// Lambdas_Consumer "private" section, not exported.
final _smokeLambdasConsumerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_copy_handle'));
final _smokeLambdasConsumerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_release_handle'));
final _smokeLambdasConsumerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_Lambdas_Consumer_create_proxy'));
class Lambdas_Consumer$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Lambdas_Consumer$Impl(this.handle);
  void release() => _smokeLambdasConsumerReleaseHandle(handle);
  call(String p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Lambdas_Consumer_call__String'));
    final _p0Handle = String_toFfi(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    String_releaseFfiHandle(_p0Handle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _Lambdas_Consumer_call_static(int _token, Pointer<Void> p0) {
  try {
    (__lib.instanceCache[_token] as Lambdas_Consumer)(String_fromFfi(p0));
  } finally {
    String_releaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smoke_Lambdas_Consumer_toFfi(Lambdas_Consumer value) {
  final result = _smokeLambdasConsumerCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_Lambdas_Consumer_call_static, __lib.unknownError)
  );
  return result;
}
Lambdas_Consumer smoke_Lambdas_Consumer_fromFfi(Pointer<Void> handle) {
  final _impl = Lambdas_Consumer$Impl(_smokeLambdasConsumerCopyHandle(handle));
  return (String p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}
void smoke_Lambdas_Consumer_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdasConsumerReleaseHandle(handle);
// Nullable Lambdas_Consumer
final _smoke_Lambdas_ConsumerCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_create_handle_nullable'));
final _smoke_Lambdas_ConsumerReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_release_handle_nullable'));
final _smoke_Lambdas_ConsumerGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_get_value_nullable'));
Pointer<Void> smoke_Lambdas_Consumer_toFfi_nullable(Lambdas_Consumer value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Lambdas_Consumer_toFfi(value);
  final result = _smoke_Lambdas_ConsumerCreateHandleNullable(_handle);
  smoke_Lambdas_Consumer_releaseFfiHandle(_handle);
  return result;
}
Lambdas_Consumer smoke_Lambdas_Consumer_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Lambdas_ConsumerGetValueNullable(handle);
  final result = smoke_Lambdas_Consumer_fromFfi(_handle);
  smoke_Lambdas_Consumer_releaseFfiHandle(_handle);
  return result;
}
void smoke_Lambdas_Consumer_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Lambdas_ConsumerReleaseHandleNullable(handle);
// End of Lambdas_Consumer "private" section.
typedef Lambdas_Indexer = int Function(String, double);
// Lambdas_Indexer "private" section, not exported.
final _smokeLambdasIndexerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_copy_handle'));
final _smokeLambdasIndexerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_release_handle'));
final _smokeLambdasIndexerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_Lambdas_Indexer_create_proxy'));
class Lambdas_Indexer$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Lambdas_Indexer$Impl(this.handle);
  void release() => _smokeLambdasIndexerReleaseHandle(handle);
  int call(String p0, double p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32, Pointer<Void>, Float), int Function(Pointer<Void>, int, Pointer<Void>, double)>('library_smoke_Lambdas_Indexer_call__String_Float'));
    final _p0Handle = String_toFfi(p0);
    final _p1Handle = (p1);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    String_releaseFfiHandle(_p0Handle);
    (_p1Handle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _Lambdas_Indexer_call_static(int _token, Pointer<Void> p0, double p1, Pointer<Int32> _result) {
  int _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as Lambdas_Indexer)(String_fromFfi(p0), (p1));
    _result.value = (_resultObject);
  } finally {
    String_releaseFfiHandle(p0);
    (p1);
  }
  return 0;
}
Pointer<Void> smoke_Lambdas_Indexer_toFfi(Lambdas_Indexer value) {
  final result = _smokeLambdasIndexerCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Float, Pointer<Int32>)>(_Lambdas_Indexer_call_static, __lib.unknownError)
  );
  return result;
}
Lambdas_Indexer smoke_Lambdas_Indexer_fromFfi(Pointer<Void> handle) {
  final _impl = Lambdas_Indexer$Impl(_smokeLambdasIndexerCopyHandle(handle));
  return (String p0, double p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}
void smoke_Lambdas_Indexer_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdasIndexerReleaseHandle(handle);
// Nullable Lambdas_Indexer
final _smoke_Lambdas_IndexerCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_create_handle_nullable'));
final _smoke_Lambdas_IndexerReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_release_handle_nullable'));
final _smoke_Lambdas_IndexerGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_get_value_nullable'));
Pointer<Void> smoke_Lambdas_Indexer_toFfi_nullable(Lambdas_Indexer value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Lambdas_Indexer_toFfi(value);
  final result = _smoke_Lambdas_IndexerCreateHandleNullable(_handle);
  smoke_Lambdas_Indexer_releaseFfiHandle(_handle);
  return result;
}
Lambdas_Indexer smoke_Lambdas_Indexer_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Lambdas_IndexerGetValueNullable(handle);
  final result = smoke_Lambdas_Indexer_fromFfi(_handle);
  smoke_Lambdas_Indexer_releaseFfiHandle(_handle);
  return result;
}
void smoke_Lambdas_Indexer_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Lambdas_IndexerReleaseHandleNullable(handle);
// End of Lambdas_Indexer "private" section.
typedef Lambdas_NullableConfuser = Lambdas_Producer Function(String);
// Lambdas_NullableConfuser "private" section, not exported.
final _smokeLambdasNullableconfuserCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_copy_handle'));
final _smokeLambdasNullableconfuserReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_release_handle'));
final _smokeLambdasNullableconfuserCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_Lambdas_NullableConfuser_create_proxy'));
class Lambdas_NullableConfuser$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Lambdas_NullableConfuser$Impl(this.handle);
  void release() => _smokeLambdasNullableconfuserReleaseHandle(handle);
  Lambdas_Producer call(String p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Lambdas_NullableConfuser_call__String'));
    final _p0Handle = String_toFfi_nullable(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    String_releaseFfiHandle_nullable(_p0Handle);
    try {
      return smoke_Lambdas_Producer_fromFfi_nullable(__resultHandle);
    } finally {
      smoke_Lambdas_Producer_releaseFfiHandle_nullable(__resultHandle);
    }
  }
}
int _Lambdas_NullableConfuser_call_static(int _token, Pointer<Void> p0, Pointer<Pointer<Void>> _result) {
  Lambdas_Producer _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as Lambdas_NullableConfuser)(String_fromFfi_nullable(p0));
    _result.value = smoke_Lambdas_Producer_toFfi_nullable(_resultObject);
  } finally {
    String_releaseFfiHandle_nullable(p0);
  }
  return 0;
}
Pointer<Void> smoke_Lambdas_NullableConfuser_toFfi(Lambdas_NullableConfuser value) {
  final result = _smokeLambdasNullableconfuserCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_Lambdas_NullableConfuser_call_static, __lib.unknownError)
  );
  return result;
}
Lambdas_NullableConfuser smoke_Lambdas_NullableConfuser_fromFfi(Pointer<Void> handle) {
  final _impl = Lambdas_NullableConfuser$Impl(_smokeLambdasNullableconfuserCopyHandle(handle));
  return (String p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}
void smoke_Lambdas_NullableConfuser_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdasNullableconfuserReleaseHandle(handle);
// Nullable Lambdas_NullableConfuser
final _smoke_Lambdas_NullableConfuserCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_create_handle_nullable'));
final _smoke_Lambdas_NullableConfuserReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_release_handle_nullable'));
final _smoke_Lambdas_NullableConfuserGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_get_value_nullable'));
Pointer<Void> smoke_Lambdas_NullableConfuser_toFfi_nullable(Lambdas_NullableConfuser value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Lambdas_NullableConfuser_toFfi(value);
  final result = _smoke_Lambdas_NullableConfuserCreateHandleNullable(_handle);
  smoke_Lambdas_NullableConfuser_releaseFfiHandle(_handle);
  return result;
}
Lambdas_NullableConfuser smoke_Lambdas_NullableConfuser_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Lambdas_NullableConfuserGetValueNullable(handle);
  final result = smoke_Lambdas_NullableConfuser_fromFfi(_handle);
  smoke_Lambdas_NullableConfuser_releaseFfiHandle(_handle);
  return result;
}
void smoke_Lambdas_NullableConfuser_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Lambdas_NullableConfuserReleaseHandleNullable(handle);
// End of Lambdas_NullableConfuser "private" section.
// Lambdas "private" section, not exported.
final _smokeLambdasCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_copy_handle'));
final _smokeLambdasReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_release_handle'));
class Lambdas$Impl extends __lib.NativeBase implements Lambdas {
  Lambdas$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeLambdasReleaseHandle(handle);
    handle = null;
  }
  @override
  Lambdas_Producer deconfuse(String value, Lambdas_Confuser confuser) {
    final _deconfuseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('library_smoke_Lambdas_deconfuse__String_Confuser'));
    final _valueHandle = String_toFfi(value);
    final _confuserHandle = smoke_Lambdas_Confuser_toFfi(confuser);
    final _handle = this.handle;
    final __resultHandle = _deconfuseFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle, _confuserHandle);
    String_releaseFfiHandle(_valueHandle);
    smoke_Lambdas_Confuser_releaseFfiHandle(_confuserHandle);
    try {
      return smoke_Lambdas_Producer_fromFfi(__resultHandle);
    } finally {
      smoke_Lambdas_Producer_releaseFfiHandle(__resultHandle);
    }
  }
  static Map<int, String> fuse(List<String> items, Lambdas_Indexer callback) {
    final _fuseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('library_smoke_Lambdas_fuse__ListOf_1String_Indexer'));
    final _itemsHandle = foobar_ListOf_String_toFfi(items);
    final _callbackHandle = smoke_Lambdas_Indexer_toFfi(callback);
    final __resultHandle = _fuseFfi(__lib.LibraryContext.isolateId, _itemsHandle, _callbackHandle);
    foobar_ListOf_String_releaseFfiHandle(_itemsHandle);
    smoke_Lambdas_Indexer_releaseFfiHandle(_callbackHandle);
    try {
      return foobar_MapOf_Int_to_String_fromFfi(__resultHandle);
    } finally {
      foobar_MapOf_Int_to_String_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_Lambdas_toFfi(Lambdas value) =>
  _smokeLambdasCopyHandle((value as __lib.NativeBase).handle);
Lambdas smoke_Lambdas_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Lambdas;
  if (instance != null) return instance;
  final _copiedHandle = _smokeLambdasCopyHandle(handle);
  final result = Lambdas$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_Lambdas_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdasReleaseHandle(handle);
Pointer<Void> smoke_Lambdas_toFfi_nullable(Lambdas value) =>
  value != null ? smoke_Lambdas_toFfi(value) : Pointer<Void>.fromAddress(0);
Lambdas smoke_Lambdas_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Lambdas_fromFfi(handle) : null;
void smoke_Lambdas_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeLambdasReleaseHandle(handle);
// End of Lambdas "private" section.

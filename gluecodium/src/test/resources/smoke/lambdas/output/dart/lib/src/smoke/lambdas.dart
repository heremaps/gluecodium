

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:meta/meta.dart';

abstract class Lambdas implements Finalizable {


  Lambdas_Producer deconfuse(String value, Lambdas_Confuser confuser);

  static Map<int, String> fuse(List<String> items, Lambdas_Indexer callback) => $prototype.fuse(items, callback);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Lambdas$Impl(Pointer<Void>.fromAddress(0));
}

typedef Lambdas_Producer = String Function();

// Lambdas_Producer "private" section, not exported.

final _smokeLambdasProducerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Lambdas_Producer_register_finalizer'));
final _smokeLambdasProducerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_copy_handle'));
final _smokeLambdasProducerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_release_handle'));
final _smokeLambdasProducerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_Lambdas_Producer_create_proxy'));

class Lambdas_Producer$Impl implements Finalizable {
  final Pointer<Void> handle;
  Lambdas_Producer$Impl(this.handle);

  String call() {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Lambdas_Producer_call'));
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

}

void _smokeLambdasProducercallStatic(Lambdas_Producer _obj, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = _obj();
    _result.value = stringToFfi(_resultObject);
  } finally {
  }
}

Pointer<Void> smokeLambdasProducerToFfi(Lambdas_Producer __lambdaObj) {
  void __lambdaCaller(Pointer<Pointer<Void>> _result) { _smokeLambdasProducercallStatic(__lambdaObj, _result); }
  final __lambdaCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__lambdaCaller);
  __lambdaCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __lambdaCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  return _smokeLambdasProducerCreateProxy(
    __lib.getObjectToken(__lambdaObj),
    __lib.LibraryContext.isolateId,
    __lambdaObj,
    __closeAllCallback.nativeFunction,
    __lambdaCallback.nativeFunction
  );
}

Lambdas_Producer smokeLambdasProducerFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdasProducerCopyHandle(handle);
  final _impl = Lambdas_Producer$Impl(_copiedHandle);
  final result = () => _impl.call();
  _smokeLambdasProducerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeLambdasProducerReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdasProducerReleaseHandle(handle);

// Nullable Lambdas_Producer

final _smokeLambdasProducerCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_create_handle_nullable'));
final _smokeLambdasProducerReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_release_handle_nullable'));
final _smokeLambdasProducerGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_get_value_nullable'));

Pointer<Void> smokeLambdasProducerToFfiNullable(Lambdas_Producer? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdasProducerToFfi(value);
  final result = _smokeLambdasProducerCreateHandleNullable(_handle);
  smokeLambdasProducerReleaseFfiHandle(_handle);
  return result;
}

Lambdas_Producer? smokeLambdasProducerFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdasProducerGetValueNullable(handle);
  final result = smokeLambdasProducerFromFfi(_handle);
  smokeLambdasProducerReleaseFfiHandle(_handle);
  return result;
}

void smokeLambdasProducerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdasProducerReleaseHandleNullable(handle);

// End of Lambdas_Producer "private" section.
/// Should confuse everyone thoroughly
typedef Lambdas_Confuser = Lambdas_Producer Function(String);

// Lambdas_Confuser "private" section, not exported.

final _smokeLambdasConfuserRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Lambdas_Confuser_register_finalizer'));
final _smokeLambdasConfuserCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_copy_handle'));
final _smokeLambdasConfuserReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_release_handle'));
final _smokeLambdasConfuserCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_Lambdas_Confuser_create_proxy'));

class Lambdas_Confuser$Impl implements Finalizable {
  final Pointer<Void> handle;
  Lambdas_Confuser$Impl(this.handle);

  Lambdas_Producer call(String p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Lambdas_Confuser_call__String'));
    final _p0Handle = stringToFfi(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    stringReleaseFfiHandle(_p0Handle);
    try {
      return smokeLambdasProducerFromFfi(__resultHandle);
    } finally {
      smokeLambdasProducerReleaseFfiHandle(__resultHandle);

    }

  }

}

void _smokeLambdasConfusercallStatic(Lambdas_Confuser _obj, Pointer<Void> p0, Pointer<Pointer<Void>> _result) {
  Lambdas_Producer? _resultObject;
  try {
    _resultObject = _obj(stringFromFfi(p0));
    _result.value = smokeLambdasProducerToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(p0);
  }
}

Pointer<Void> smokeLambdasConfuserToFfi(Lambdas_Confuser __lambdaObj) {
  void __lambdaCaller(Pointer<Void> p0, Pointer<Pointer<Void>> _result) { _smokeLambdasConfusercallStatic(__lambdaObj, p0, _result); }
  final __lambdaCallback = NativeCallable<Void Function(Pointer<Void>, Pointer<Pointer<Void>>)>.isolateLocal(__lambdaCaller);
  __lambdaCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __lambdaCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  return _smokeLambdasConfuserCreateProxy(
    __lib.getObjectToken(__lambdaObj),
    __lib.LibraryContext.isolateId,
    __lambdaObj,
    __closeAllCallback.nativeFunction,
    __lambdaCallback.nativeFunction
  );
}

Lambdas_Confuser smokeLambdasConfuserFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdasConfuserCopyHandle(handle);
  final _impl = Lambdas_Confuser$Impl(_copiedHandle);
  final result = (String p0) => _impl.call(p0);
  _smokeLambdasConfuserRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeLambdasConfuserReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdasConfuserReleaseHandle(handle);

// Nullable Lambdas_Confuser

final _smokeLambdasConfuserCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_create_handle_nullable'));
final _smokeLambdasConfuserReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_release_handle_nullable'));
final _smokeLambdasConfuserGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_get_value_nullable'));

Pointer<Void> smokeLambdasConfuserToFfiNullable(Lambdas_Confuser? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdasConfuserToFfi(value);
  final result = _smokeLambdasConfuserCreateHandleNullable(_handle);
  smokeLambdasConfuserReleaseFfiHandle(_handle);
  return result;
}

Lambdas_Confuser? smokeLambdasConfuserFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdasConfuserGetValueNullable(handle);
  final result = smokeLambdasConfuserFromFfi(_handle);
  smokeLambdasConfuserReleaseFfiHandle(_handle);
  return result;
}

void smokeLambdasConfuserReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdasConfuserReleaseHandleNullable(handle);

// End of Lambdas_Confuser "private" section.
typedef Lambdas_Consumer = void Function(String);

// Lambdas_Consumer "private" section, not exported.

final _smokeLambdasConsumerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Lambdas_Consumer_register_finalizer'));
final _smokeLambdasConsumerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_copy_handle'));
final _smokeLambdasConsumerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_release_handle'));
final _smokeLambdasConsumerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_Lambdas_Consumer_create_proxy'));

class Lambdas_Consumer$Impl implements Finalizable {
  final Pointer<Void> handle;
  Lambdas_Consumer$Impl(this.handle);

  void call(String p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Lambdas_Consumer_call__String'));
    final _p0Handle = stringToFfi(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    stringReleaseFfiHandle(_p0Handle);

  }

}

void _smokeLambdasConsumercallStatic(Lambdas_Consumer _obj, Pointer<Void> p0) {
  
  try {
    _obj(stringFromFfi(p0));
  } finally {
    stringReleaseFfiHandle(p0);
  }
}

Pointer<Void> smokeLambdasConsumerToFfi(Lambdas_Consumer __lambdaObj) {
  void __lambdaCaller(Pointer<Void> p0) { _smokeLambdasConsumercallStatic(__lambdaObj, p0); }
  final __lambdaCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__lambdaCaller);
  __lambdaCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __lambdaCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  return _smokeLambdasConsumerCreateProxy(
    __lib.getObjectToken(__lambdaObj),
    __lib.LibraryContext.isolateId,
    __lambdaObj,
    __closeAllCallback.nativeFunction,
    __lambdaCallback.nativeFunction
  );
}

Lambdas_Consumer smokeLambdasConsumerFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdasConsumerCopyHandle(handle);
  final _impl = Lambdas_Consumer$Impl(_copiedHandle);
  final result = (String p0) => _impl.call(p0);
  _smokeLambdasConsumerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeLambdasConsumerReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdasConsumerReleaseHandle(handle);

// Nullable Lambdas_Consumer

final _smokeLambdasConsumerCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_create_handle_nullable'));
final _smokeLambdasConsumerReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_release_handle_nullable'));
final _smokeLambdasConsumerGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_get_value_nullable'));

Pointer<Void> smokeLambdasConsumerToFfiNullable(Lambdas_Consumer? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdasConsumerToFfi(value);
  final result = _smokeLambdasConsumerCreateHandleNullable(_handle);
  smokeLambdasConsumerReleaseFfiHandle(_handle);
  return result;
}

Lambdas_Consumer? smokeLambdasConsumerFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdasConsumerGetValueNullable(handle);
  final result = smokeLambdasConsumerFromFfi(_handle);
  smokeLambdasConsumerReleaseFfiHandle(_handle);
  return result;
}

void smokeLambdasConsumerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdasConsumerReleaseHandleNullable(handle);

// End of Lambdas_Consumer "private" section.
typedef Lambdas_Indexer = int Function(String, double);

// Lambdas_Indexer "private" section, not exported.

final _smokeLambdasIndexerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Lambdas_Indexer_register_finalizer'));
final _smokeLambdasIndexerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_copy_handle'));
final _smokeLambdasIndexerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_release_handle'));
final _smokeLambdasIndexerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_Lambdas_Indexer_create_proxy'));

class Lambdas_Indexer$Impl implements Finalizable {
  final Pointer<Void> handle;
  Lambdas_Indexer$Impl(this.handle);

  int call(String p0, double p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32, Pointer<Void>, Float), int Function(Pointer<Void>, int, Pointer<Void>, double)>('library_smoke_Lambdas_Indexer_call__String_Float'));
    final _p0Handle = stringToFfi(p0);
    final _p1Handle = (p1);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    stringReleaseFfiHandle(_p0Handle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

}

void _smokeLambdasIndexercallStatic(Lambdas_Indexer _obj, Pointer<Void> p0, double p1, Pointer<Int32> _result) {
  int? _resultObject;
  try {
    _resultObject = _obj(stringFromFfi(p0), (p1));
    _result.value = (_resultObject);
  } finally {
    stringReleaseFfiHandle(p0);
    
  }
}

Pointer<Void> smokeLambdasIndexerToFfi(Lambdas_Indexer __lambdaObj) {
  void __lambdaCaller(Pointer<Void> p0, double p1, Pointer<Int32> _result) { _smokeLambdasIndexercallStatic(__lambdaObj, p0, p1, _result); }
  final __lambdaCallback = NativeCallable<Void Function(Pointer<Void>, Float, Pointer<Int32>)>.isolateLocal(__lambdaCaller);
  __lambdaCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __lambdaCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  return _smokeLambdasIndexerCreateProxy(
    __lib.getObjectToken(__lambdaObj),
    __lib.LibraryContext.isolateId,
    __lambdaObj,
    __closeAllCallback.nativeFunction,
    __lambdaCallback.nativeFunction
  );
}

Lambdas_Indexer smokeLambdasIndexerFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdasIndexerCopyHandle(handle);
  final _impl = Lambdas_Indexer$Impl(_copiedHandle);
  final result = (String p0, double p1) => _impl.call(p0, p1);
  _smokeLambdasIndexerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeLambdasIndexerReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdasIndexerReleaseHandle(handle);

// Nullable Lambdas_Indexer

final _smokeLambdasIndexerCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_create_handle_nullable'));
final _smokeLambdasIndexerReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_release_handle_nullable'));
final _smokeLambdasIndexerGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_get_value_nullable'));

Pointer<Void> smokeLambdasIndexerToFfiNullable(Lambdas_Indexer? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdasIndexerToFfi(value);
  final result = _smokeLambdasIndexerCreateHandleNullable(_handle);
  smokeLambdasIndexerReleaseFfiHandle(_handle);
  return result;
}

Lambdas_Indexer? smokeLambdasIndexerFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdasIndexerGetValueNullable(handle);
  final result = smokeLambdasIndexerFromFfi(_handle);
  smokeLambdasIndexerReleaseFfiHandle(_handle);
  return result;
}

void smokeLambdasIndexerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdasIndexerReleaseHandleNullable(handle);

// End of Lambdas_Indexer "private" section.
typedef Lambdas_NullableConfuser = Lambdas_Producer? Function(String?);

// Lambdas_NullableConfuser "private" section, not exported.

final _smokeLambdasNullableconfuserRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Lambdas_NullableConfuser_register_finalizer'));
final _smokeLambdasNullableconfuserCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_copy_handle'));
final _smokeLambdasNullableconfuserReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_release_handle'));
final _smokeLambdasNullableconfuserCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_Lambdas_NullableConfuser_create_proxy'));

class Lambdas_NullableConfuser$Impl implements Finalizable {
  final Pointer<Void> handle;
  Lambdas_NullableConfuser$Impl(this.handle);

  Lambdas_Producer? call(String? p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Lambdas_NullableConfuser_call__String_'));
    final _p0Handle = stringToFfiNullable(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    stringReleaseFfiHandleNullable(_p0Handle);
    try {
      return smokeLambdasProducerFromFfiNullable(__resultHandle);
    } finally {
      smokeLambdasProducerReleaseFfiHandleNullable(__resultHandle);

    }

  }

}

void _smokeLambdasNullableconfusercallStatic(Lambdas_NullableConfuser _obj, Pointer<Void> p0, Pointer<Pointer<Void>> _result) {
  Lambdas_Producer? _resultObject;
  try {
    _resultObject = _obj(stringFromFfiNullable(p0));
    _result.value = smokeLambdasProducerToFfiNullable(_resultObject);
  } finally {
    stringReleaseFfiHandleNullable(p0);
  }
}

Pointer<Void> smokeLambdasNullableconfuserToFfi(Lambdas_NullableConfuser __lambdaObj) {
  void __lambdaCaller(Pointer<Void> p0, Pointer<Pointer<Void>> _result) { _smokeLambdasNullableconfusercallStatic(__lambdaObj, p0, _result); }
  final __lambdaCallback = NativeCallable<Void Function(Pointer<Void>, Pointer<Pointer<Void>>)>.isolateLocal(__lambdaCaller);
  __lambdaCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __lambdaCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  return _smokeLambdasNullableconfuserCreateProxy(
    __lib.getObjectToken(__lambdaObj),
    __lib.LibraryContext.isolateId,
    __lambdaObj,
    __closeAllCallback.nativeFunction,
    __lambdaCallback.nativeFunction
  );
}

Lambdas_NullableConfuser smokeLambdasNullableconfuserFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeLambdasNullableconfuserCopyHandle(handle);
  final _impl = Lambdas_NullableConfuser$Impl(_copiedHandle);
  final result = (String? p0) => _impl.call(p0);
  _smokeLambdasNullableconfuserRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeLambdasNullableconfuserReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdasNullableconfuserReleaseHandle(handle);

// Nullable Lambdas_NullableConfuser

final _smokeLambdasNullableconfuserCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_create_handle_nullable'));
final _smokeLambdasNullableconfuserReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_release_handle_nullable'));
final _smokeLambdasNullableconfuserGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_get_value_nullable'));

Pointer<Void> smokeLambdasNullableconfuserToFfiNullable(Lambdas_NullableConfuser? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdasNullableconfuserToFfi(value);
  final result = _smokeLambdasNullableconfuserCreateHandleNullable(_handle);
  smokeLambdasNullableconfuserReleaseFfiHandle(_handle);
  return result;
}

Lambdas_NullableConfuser? smokeLambdasNullableconfuserFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdasNullableconfuserGetValueNullable(handle);
  final result = smokeLambdasNullableconfuserFromFfi(_handle);
  smokeLambdasNullableconfuserReleaseFfiHandle(_handle);
  return result;
}

void smokeLambdasNullableconfuserReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdasNullableconfuserReleaseHandleNullable(handle);

// End of Lambdas_NullableConfuser "private" section.

// Lambdas "private" section, not exported.

final _smokeLambdasRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Lambdas_register_finalizer'));
final _smokeLambdasCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_copy_handle'));
final _smokeLambdasReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_release_handle'));




/// @nodoc
@visibleForTesting

class Lambdas$Impl extends __lib.NativeBase implements Lambdas {

  Lambdas$Impl(Pointer<Void> handle) : super(handle);

  @override
  Lambdas_Producer deconfuse(String value, Lambdas_Confuser confuser) {
    final _deconfuseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('library_smoke_Lambdas_deconfuse__String_Confuser'));
    final _valueHandle = stringToFfi(value);
    final _confuserHandle = smokeLambdasConfuserToFfi(confuser);
    final _handle = this.handle;
    final __resultHandle = _deconfuseFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle, _confuserHandle);
    stringReleaseFfiHandle(_valueHandle);
    smokeLambdasConfuserReleaseFfiHandle(_confuserHandle);
    try {
      return smokeLambdasProducerFromFfi(__resultHandle);
    } finally {
      smokeLambdasProducerReleaseFfiHandle(__resultHandle);

    }

  }

  Map<int, String> fuse(List<String> items, Lambdas_Indexer callback) {
    final _fuseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('library_smoke_Lambdas_fuse__ListOf_String_Indexer'));
    final _itemsHandle = foobarListofStringToFfi(items);
    final _callbackHandle = smokeLambdasIndexerToFfi(callback);
    final __resultHandle = _fuseFfi(__lib.LibraryContext.isolateId, _itemsHandle, _callbackHandle);
    foobarListofStringReleaseFfiHandle(_itemsHandle);
    smokeLambdasIndexerReleaseFfiHandle(_callbackHandle);
    try {
      return foobarMapofIntToStringFromFfi(__resultHandle);
    } finally {
      foobarMapofIntToStringReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> smokeLambdasToFfi(Lambdas value) =>
  _smokeLambdasCopyHandle((value as __lib.NativeBase).handle);

Lambdas smokeLambdasFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Lambdas) return instance;

  final _copiedHandle = _smokeLambdasCopyHandle(handle);
  final result = Lambdas$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeLambdasRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeLambdasReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdasReleaseHandle(handle);

Pointer<Void> smokeLambdasToFfiNullable(Lambdas? value) =>
  value != null ? smokeLambdasToFfi(value) : Pointer<Void>.fromAddress(0);

Lambdas? smokeLambdasFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeLambdasFromFfi(handle) : null;

void smokeLambdasReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdasReleaseHandle(handle);

// End of Lambdas "private" section.



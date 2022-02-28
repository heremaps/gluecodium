import 'dart:ffi';
import 'dart:typed_data';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class BlobDefaults {
  Uint8List emptyList;
  Uint8List deadBeef;
  BlobDefaults._(this.emptyList, this.deadBeef);
  BlobDefaults()
    : emptyList = Uint8List.fromList([]), deadBeef = Uint8List.fromList([222, 173, 190, 239]);
}
// BlobDefaults "private" section, not exported.
final _smokeBlobdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_BlobDefaults_create_handle'));
final _smokeBlobdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_BlobDefaults_release_handle'));
final _smokeBlobdefaultsGetFieldemptyList = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_BlobDefaults_get_field_emptyList'));
final _smokeBlobdefaultsGetFielddeadBeef = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_BlobDefaults_get_field_deadBeef'));
Pointer<Void> smokeBlobdefaultsToFfi(BlobDefaults value) {
  final _emptyListHandle = blobToFfi(value.emptyList);
  final _deadBeefHandle = blobToFfi(value.deadBeef);
  final _result = _smokeBlobdefaultsCreateHandle(_emptyListHandle, _deadBeefHandle);
  blobReleaseFfiHandle(_emptyListHandle);
  blobReleaseFfiHandle(_deadBeefHandle);
  return _result;
}
BlobDefaults smokeBlobdefaultsFromFfi(Pointer<Void> handle) {
  final _emptyListHandle = _smokeBlobdefaultsGetFieldemptyList(handle);
  final _deadBeefHandle = _smokeBlobdefaultsGetFielddeadBeef(handle);
  try {
    return BlobDefaults._(
      blobFromFfi(_emptyListHandle),
      blobFromFfi(_deadBeefHandle)
    );
  } finally {
    blobReleaseFfiHandle(_emptyListHandle);
    blobReleaseFfiHandle(_deadBeefHandle);
  }
}
void smokeBlobdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeBlobdefaultsReleaseHandle(handle);
// Nullable BlobDefaults
final _smokeBlobdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_BlobDefaults_create_handle_nullable'));
final _smokeBlobdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_BlobDefaults_release_handle_nullable'));
final _smokeBlobdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_BlobDefaults_get_value_nullable'));
Pointer<Void> smokeBlobdefaultsToFfiNullable(BlobDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeBlobdefaultsToFfi(value);
  final result = _smokeBlobdefaultsCreateHandleNullable(_handle);
  smokeBlobdefaultsReleaseFfiHandle(_handle);
  return result;
}
BlobDefaults? smokeBlobdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeBlobdefaultsGetValueNullable(handle);
  final result = smokeBlobdefaultsFromFfi(_handle);
  smokeBlobdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeBlobdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeBlobdefaultsReleaseHandleNullable(handle);
// End of BlobDefaults "private" section.

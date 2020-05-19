import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/route_utils.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class Route {
  String description;
  RouteType type;
  Route(this.description, this.type);
  static final String defaultDescription = "Nonsense";
  static final RouteType defaultType = RouteType.equestrian;
}
// Route "private" section, not exported.
final _smoke_StructsWithConstants_Route_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint32),
    Pointer<Void> Function(Pointer<Void>, int)
  >('library_smoke_StructsWithConstants_Route_create_handle');
final _smoke_StructsWithConstants_Route_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithConstants_Route_release_handle');
final _smoke_StructsWithConstants_Route_get_field_description = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithConstants_Route_get_field_description');
final _smoke_StructsWithConstants_Route_get_field_type = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructsWithConstants_Route_get_field_type');
Pointer<Void> smoke_StructsWithConstants_Route_toFfi(Route value) {
  final _description_handle = String_toFfi(value.description);
  final _type_handle = smoke_RouteUtils_RouteType_toFfi(value.type);
  final _result = _smoke_StructsWithConstants_Route_create_handle(_description_handle, _type_handle);
  String_releaseFfiHandle(_description_handle);
  smoke_RouteUtils_RouteType_releaseFfiHandle(_type_handle);
  return _result;
}
Route smoke_StructsWithConstants_Route_fromFfi(Pointer<Void> handle) {
  final _description_handle = _smoke_StructsWithConstants_Route_get_field_description(handle);
  final _type_handle = _smoke_StructsWithConstants_Route_get_field_type(handle);
  final _result = Route(
    String_fromFfi(_description_handle),
    smoke_RouteUtils_RouteType_fromFfi(_type_handle)
  );
  String_releaseFfiHandle(_description_handle);
  smoke_RouteUtils_RouteType_releaseFfiHandle(_type_handle);
  return _result;
}
void smoke_StructsWithConstants_Route_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructsWithConstants_Route_release_handle(handle);
// Nullable Route
final _smoke_StructsWithConstants_Route_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithConstants_Route_create_handle_nullable');
final _smoke_StructsWithConstants_Route_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithConstants_Route_release_handle_nullable');
final _smoke_StructsWithConstants_Route_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithConstants_Route_get_value_nullable');
Pointer<Void> smoke_StructsWithConstants_Route_toFfi_nullable(Route value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructsWithConstants_Route_toFfi(value);
  final result = _smoke_StructsWithConstants_Route_create_handle_nullable(_handle);
  smoke_StructsWithConstants_Route_releaseFfiHandle(_handle);
  return result;
}
Route smoke_StructsWithConstants_Route_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructsWithConstants_Route_get_value_nullable(handle);
  final result = smoke_StructsWithConstants_Route_fromFfi(_handle);
  smoke_StructsWithConstants_Route_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructsWithConstants_Route_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructsWithConstants_Route_release_handle_nullable(handle);
// End of Route "private" section.

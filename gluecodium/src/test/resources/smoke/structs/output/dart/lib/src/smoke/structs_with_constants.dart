import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/route_utils.dart';
class Route {
  String description;
  RouteType type;
  Route(this.description, this.type);
  static final String defaultDescription = "Nonsense";
  static final RouteType defaultType = RouteType.equestrian;
}
// Route "private" section, not exported.
final _smokeStructswithconstantsRouteCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint32),
    Pointer<Void> Function(Pointer<Void>, int)
  >('library_smoke_StructsWithConstants_Route_create_handle'));
final _smokeStructswithconstantsRouteReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithConstants_Route_release_handle'));
final _smokeStructswithconstantsRouteGetFielddescription = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithConstants_Route_get_field_description'));
final _smokeStructswithconstantsRouteGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructsWithConstants_Route_get_field_type'));
Pointer<Void> smokeStructswithconstantsRouteToFfi(Route value) {
  final _descriptionHandle = stringToFfi(value.description);
  final _typeHandle = smokeRouteutilsRoutetypeToFfi(value.type);
  final _result = _smokeStructswithconstantsRouteCreateHandle(_descriptionHandle, _typeHandle);
  stringReleaseFfiHandle(_descriptionHandle);
  smokeRouteutilsRoutetypeReleaseFfiHandle(_typeHandle);
  return _result;
}
Route smokeStructswithconstantsRouteFromFfi(Pointer<Void> handle) {
  final _descriptionHandle = _smokeStructswithconstantsRouteGetFielddescription(handle);
  final _typeHandle = _smokeStructswithconstantsRouteGetFieldtype(handle);
  try {
    return Route(
      stringFromFfi(_descriptionHandle),
      smokeRouteutilsRoutetypeFromFfi(_typeHandle)
    );
  } finally {
    stringReleaseFfiHandle(_descriptionHandle);
    smokeRouteutilsRoutetypeReleaseFfiHandle(_typeHandle);
  }
}
void smokeStructswithconstantsRouteReleaseFfiHandle(Pointer<Void> handle) => _smokeStructswithconstantsRouteReleaseHandle(handle);
// Nullable Route
final _smokeStructswithconstantsRouteCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithConstants_Route_create_handle_nullable'));
final _smokeStructswithconstantsRouteReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithConstants_Route_release_handle_nullable'));
final _smokeStructswithconstantsRouteGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithConstants_Route_get_value_nullable'));
Pointer<Void> smokeStructswithconstantsRouteToFfiNullable(Route? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructswithconstantsRouteToFfi(value);
  final result = _smokeStructswithconstantsRouteCreateHandleNullable(_handle);
  smokeStructswithconstantsRouteReleaseFfiHandle(_handle);
  return result;
}
Route? smokeStructswithconstantsRouteFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructswithconstantsRouteGetValueNullable(handle);
  final result = smokeStructswithconstantsRouteFromFfi(_handle);
  smokeStructswithconstantsRouteReleaseFfiHandle(_handle);
  return result;
}
void smokeStructswithconstantsRouteReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructswithconstantsRouteReleaseHandleNullable(handle);
// End of Route "private" section.

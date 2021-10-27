//
//
#include "cbridge/include/smoke/cbridge_UseSwiftExternalTypes.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "smoke/DateInterval.h"
#include "smoke/Persistence.h"
#include "smoke/PseudoColor.h"
#include "smoke/SwiftSeason.h"
#include "smoke/UseSwiftExternalTypes.h"
#include <memory>
#include <new>
void smoke_UseSwiftExternalTypes_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::UseSwiftExternalTypes >>(handle);
}
_baseRef smoke_UseSwiftExternalTypes_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::UseSwiftExternalTypes >>(handle)))
        : 0;
}
const void* smoke_UseSwiftExternalTypes_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::UseSwiftExternalTypes >>(handle)->get())
        : nullptr;
}
void smoke_UseSwiftExternalTypes_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::UseSwiftExternalTypes >>(handle)->get(), swift_pointer);
}
void smoke_UseSwiftExternalTypes_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::UseSwiftExternalTypes >>(handle)->get());
}
_baseRef smoke_UseSwiftExternalTypes_dateIntervalRoundTrip(_baseRef input) {
    return Conversion<::smoke::DateInterval>::toBaseRef(::smoke::UseSwiftExternalTypes::date_interval_round_trip(Conversion<::smoke::DateInterval>::toCpp(input)));
}
uint32_t smoke_UseSwiftExternalTypes_persistenceRoundTrip(uint32_t input) {
    return static_cast<uint32_t>(::smoke::UseSwiftExternalTypes::persistence_round_trip(static_cast<::smoke::Persistence>(input)));
}
_baseRef smoke_UseSwiftExternalTypes_colorRoundTrip(_baseRef input) {
    return Conversion<::smoke::PseudoColor>::toBaseRef(::smoke::UseSwiftExternalTypes::color_round_trip(Conversion<::smoke::PseudoColor>::toCpp(input)));
}
uint32_t smoke_UseSwiftExternalTypes_seasonRoundTrip(uint32_t input) {
    return static_cast<uint32_t>(::smoke::UseSwiftExternalTypes::season_round_trip(static_cast<::smoke::SwiftSeason>(input)));
}

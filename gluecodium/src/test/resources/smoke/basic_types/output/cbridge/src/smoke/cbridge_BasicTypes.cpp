//
//
#include "cbridge/include/smoke/cbridge_BasicTypes.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/BasicTypes.h"
#include <memory>
#include <new>
#include <string>
void smoke_BasicTypes_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::BasicTypes >>(handle);
}
_baseRef smoke_BasicTypes_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::BasicTypes >>(handle)))
        : 0;
}
const void* smoke_BasicTypes_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::BasicTypes >>(handle)->get())
        : nullptr;
}
void smoke_BasicTypes_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::BasicTypes >>(handle)->get(), swift_pointer);
}
void smoke_BasicTypes_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::BasicTypes >>(handle)->get());
}
_baseRef smoke_BasicTypes_stringFunction(_baseRef input) {
    return Conversion<::std::string>::toBaseRef(::smoke::BasicTypes::string_function(Conversion<::std::string>::toCpp(input)));
}
bool smoke_BasicTypes_boolFunction(bool input) {
    return ::smoke::BasicTypes::bool_function(input);
}
float smoke_BasicTypes_floatFunction(float input) {
    return ::smoke::BasicTypes::float_function(input);
}
double smoke_BasicTypes_doubleFunction(double input) {
    return ::smoke::BasicTypes::double_function(input);
}
int8_t smoke_BasicTypes_byteFunction(int8_t input) {
    return ::smoke::BasicTypes::byte_function(input);
}
int16_t smoke_BasicTypes_shortFunction(int16_t input) {
    return ::smoke::BasicTypes::short_function(input);
}
int32_t smoke_BasicTypes_intFunction(int32_t input) {
    return ::smoke::BasicTypes::int_function(input);
}
int64_t smoke_BasicTypes_longFunction(int64_t input) {
    return ::smoke::BasicTypes::long_function(input);
}
uint8_t smoke_BasicTypes_ubyteFunction(uint8_t input) {
    return ::smoke::BasicTypes::ubyte_function(input);
}
uint16_t smoke_BasicTypes_ushortFunction(uint16_t input) {
    return ::smoke::BasicTypes::ushort_function(input);
}
uint32_t smoke_BasicTypes_uintFunction(uint32_t input) {
    return ::smoke::BasicTypes::uint_function(input);
}
uint64_t smoke_BasicTypes_ulongFunction(uint64_t input) {
    return ::smoke::BasicTypes::ulong_function(input);
}

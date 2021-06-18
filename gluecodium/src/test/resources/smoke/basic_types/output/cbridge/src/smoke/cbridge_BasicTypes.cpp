#include "cbridge/include/smoke/cbridge_BasicTypes.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "smoke/BasicTypes.h"
#include <cstdint>
#include <memory>
#include <new>
#include <string>

{{SKIP}}

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

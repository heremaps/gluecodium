#include "ffi_smoke_BasicTypes.h"
#include "ConversionBase.h"
#include "smoke/BasicTypes.h"
#include <cstdint>
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
smoke_BasicTypes_stringFunction__String(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        ::smoke::BasicTypes::string_function(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}
bool
smoke_BasicTypes_boolFunction__Boolean(bool input) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        ::smoke::BasicTypes::bool_function(
            gluecodium::ffi::Conversion<bool>::toCpp(input)
        )
    );
}
float
smoke_BasicTypes_floatFunction__Float(float input) {
    return gluecodium::ffi::Conversion<float>::toFfi(
        ::smoke::BasicTypes::float_function(
            gluecodium::ffi::Conversion<float>::toCpp(input)
        )
    );
}
double
smoke_BasicTypes_doubleFunction__Double(double input) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        ::smoke::BasicTypes::double_function(
            gluecodium::ffi::Conversion<double>::toCpp(input)
        )
    );
}
int8_t
smoke_BasicTypes_byteFunction__Byte(int8_t input) {
    return gluecodium::ffi::Conversion<int8_t>::toFfi(
        ::smoke::BasicTypes::byte_function(
            gluecodium::ffi::Conversion<int8_t>::toCpp(input)
        )
    );
}
int16_t
smoke_BasicTypes_shortFunction__Short(int16_t input) {
    return gluecodium::ffi::Conversion<int16_t>::toFfi(
        ::smoke::BasicTypes::short_function(
            gluecodium::ffi::Conversion<int16_t>::toCpp(input)
        )
    );
}
int32_t
smoke_BasicTypes_intFunction__Int(int32_t input) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        ::smoke::BasicTypes::int_function(
            gluecodium::ffi::Conversion<int32_t>::toCpp(input)
        )
    );
}
int64_t
smoke_BasicTypes_longFunction__Long(int64_t input) {
    return gluecodium::ffi::Conversion<int64_t>::toFfi(
        ::smoke::BasicTypes::long_function(
            gluecodium::ffi::Conversion<int64_t>::toCpp(input)
        )
    );
}
uint8_t
smoke_BasicTypes_ubyteFunction__UByte(uint8_t input) {
    return gluecodium::ffi::Conversion<uint8_t>::toFfi(
        ::smoke::BasicTypes::ubyte_function(
            gluecodium::ffi::Conversion<uint8_t>::toCpp(input)
        )
    );
}
uint16_t
smoke_BasicTypes_ushortFunction__UShort(uint16_t input) {
    return gluecodium::ffi::Conversion<uint16_t>::toFfi(
        ::smoke::BasicTypes::ushort_function(
            gluecodium::ffi::Conversion<uint16_t>::toCpp(input)
        )
    );
}
uint32_t
smoke_BasicTypes_uintFunction__UInt(uint32_t input) {
    return gluecodium::ffi::Conversion<uint32_t>::toFfi(
        ::smoke::BasicTypes::uint_function(
            gluecodium::ffi::Conversion<uint32_t>::toCpp(input)
        )
    );
}
uint64_t
smoke_BasicTypes_ulongFunction__ULong(uint64_t input) {
    return gluecodium::ffi::Conversion<uint64_t>::toFfi(
        ::smoke::BasicTypes::ulong_function(
            gluecodium::ffi::Conversion<uint64_t>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_BasicTypes_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::BasicTypes>(
            *reinterpret_cast<std::shared_ptr<::smoke::BasicTypes>*>(handle)
        )
    );
}
void
smoke_BasicTypes_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::BasicTypes>*>(handle);
}
#ifdef __cplusplus
}
#endif

#include "ffi_smoke_BasicTypes.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "smoke/BasicTypes.h"
#include <cstdint>
#include <memory>
#include <stdbool.h>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_BasicTypes_stringFunction__String(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        smoke::BasicTypes::string_function(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}
bool
library_smoke_BasicTypes_boolFunction__Boolean(int32_t _isolate_id, bool input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<bool>::toFfi(
        smoke::BasicTypes::bool_function(
            gluecodium::ffi::Conversion<bool>::toCpp(input)
        )
    );
}
float
library_smoke_BasicTypes_floatFunction__Float(int32_t _isolate_id, float input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<float>::toFfi(
        smoke::BasicTypes::float_function(
            gluecodium::ffi::Conversion<float>::toCpp(input)
        )
    );
}
double
library_smoke_BasicTypes_doubleFunction__Double(int32_t _isolate_id, double input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<double>::toFfi(
        smoke::BasicTypes::double_function(
            gluecodium::ffi::Conversion<double>::toCpp(input)
        )
    );
}
int8_t
library_smoke_BasicTypes_byteFunction__Byte(int32_t _isolate_id, int8_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<int8_t>::toFfi(
        smoke::BasicTypes::byte_function(
            gluecodium::ffi::Conversion<int8_t>::toCpp(input)
        )
    );
}
int16_t
library_smoke_BasicTypes_shortFunction__Short(int32_t _isolate_id, int16_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<int16_t>::toFfi(
        smoke::BasicTypes::short_function(
            gluecodium::ffi::Conversion<int16_t>::toCpp(input)
        )
    );
}
int32_t
library_smoke_BasicTypes_intFunction__Int(int32_t _isolate_id, int32_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        smoke::BasicTypes::int_function(
            gluecodium::ffi::Conversion<int32_t>::toCpp(input)
        )
    );
}
int64_t
library_smoke_BasicTypes_longFunction__Long(int32_t _isolate_id, int64_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<int64_t>::toFfi(
        smoke::BasicTypes::long_function(
            gluecodium::ffi::Conversion<int64_t>::toCpp(input)
        )
    );
}
uint8_t
library_smoke_BasicTypes_ubyteFunction__UByte(int32_t _isolate_id, uint8_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<uint8_t>::toFfi(
        smoke::BasicTypes::ubyte_function(
            gluecodium::ffi::Conversion<uint8_t>::toCpp(input)
        )
    );
}
uint16_t
library_smoke_BasicTypes_ushortFunction__UShort(int32_t _isolate_id, uint16_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<uint16_t>::toFfi(
        smoke::BasicTypes::ushort_function(
            gluecodium::ffi::Conversion<uint16_t>::toCpp(input)
        )
    );
}
uint32_t
library_smoke_BasicTypes_uintFunction__UInt(int32_t _isolate_id, uint32_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<uint32_t>::toFfi(
        smoke::BasicTypes::uint_function(
            gluecodium::ffi::Conversion<uint32_t>::toCpp(input)
        )
    );
}
uint64_t
library_smoke_BasicTypes_ulongFunction__ULong(int32_t _isolate_id, uint64_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<uint64_t>::toFfi(
        smoke::BasicTypes::ulong_function(
            gluecodium::ffi::Conversion<uint64_t>::toCpp(input)
        )
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_BasicTypes_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::BasicTypes>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_BasicTypes_release_handle(handle);
}
void
library_smoke_BasicTypes_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_BasicTypes_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_BasicTypes_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::BasicTypes>(
            *reinterpret_cast<std::shared_ptr<smoke::BasicTypes>*>(handle)
        )
    );
}
void
library_smoke_BasicTypes_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::BasicTypes>*>(handle);
}
#ifdef __cplusplus
}
#endif

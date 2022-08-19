#include "ffi_smoke_DurationExternal.h"
#include "ConversionBase.h"
#include "core/duration.h"
#include <cstdint>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_DurationExternal_create_handle(uint64_t value) {
    auto _result = new (std::nothrow) std::chrono::duration<uint64_t, std::ratio<1,1000>>(gluecodium::ffi::Conversion<uint64_t>::toCpp(value));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_DurationExternal_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::chrono::duration<uint64_t, std::ratio<1,1000>>*>(handle);
}
uint64_t
library_smoke_DurationExternal_get_field_value(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<uint64_t>::toFfi(
        reinterpret_cast<std::chrono::duration<uint64_t, std::ratio<1,1000>>*>(handle)->count()
    );
}
FfiOpaqueHandle
library_smoke_DurationExternal_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>>(
            *reinterpret_cast<std::chrono::duration<uint64_t, std::ratio<1,1000>>*>(value)
        )
    );
}
void
library_smoke_DurationExternal_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>>*>(handle);
}
FfiOpaqueHandle
library_smoke_DurationExternal_get_value_nullable(FfiOpaqueHandle handle)
{
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::chrono::duration<uint64_t, std::ratio<1,1000>>(
        **reinterpret_cast<gluecodium::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>>*>(handle)
    ));
}
#ifdef __cplusplus
}
#endif

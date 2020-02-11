#include "ffi_smoke_Constructors.h"
#include "ConversionBase.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Constructors.h"
#include <cstdint>
#include <memory>
#include <string>
#include <vector>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
smoke_Constructors_create() {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Constructors>>::toFfi(
        ::smoke::Constructors::create()
    );
}
FfiOpaqueHandle
smoke_Constructors_create__Constructors(FfiOpaqueHandle other) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Constructors>>::toFfi(
        ::smoke::Constructors::create(
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Constructors>>::toCpp(other)
        )
    );
}
FfiOpaqueHandle
smoke_Constructors_create__String_ULong(FfiOpaqueHandle foo, uint64_t bar) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Constructors>>::toFfi(
        ::smoke::Constructors::create(
            gluecodium::ffi::Conversion<std::string>::toCpp(foo),
            gluecodium::ffi::Conversion<uint64_t>::toCpp(bar)
        )
    );
}
void
smoke_Constructors_create__String_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<std::shared_ptr<::smoke::Constructors>, ::smoke::Constructors::ErrorEnum>*>(handle);
}
FfiOpaqueHandle
smoke_Constructors_create__String_return_get_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Constructors>>::toFfi(
        reinterpret_cast<gluecodium::Return<std::shared_ptr<::smoke::Constructors>, ::smoke::Constructors::ErrorEnum>*>(handle)->unsafe_value()
    );
}
uint32_t
smoke_Constructors_create__String_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<::smoke::Constructors::ErrorEnum>::toFfi(
        reinterpret_cast<gluecodium::Return<std::shared_ptr<::smoke::Constructors>, ::smoke::Constructors::ErrorEnum>*>(handle)->error()
    );
}
bool
smoke_Constructors_create__String_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<std::shared_ptr<::smoke::Constructors>, ::smoke::Constructors::ErrorEnum>*>(handle)->has_value();
}
FfiOpaqueHandle
smoke_Constructors_create__String(FfiOpaqueHandle input) {
    auto&& _cpp_call_result =         ::smoke::Constructors::create(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        );
    if (_cpp_call_result.has_value()) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::shared_ptr<::smoke::Constructors>, ::smoke::Constructors::ErrorEnum>(
            std::forward<std::shared_ptr<::smoke::Constructors>>(_cpp_call_result.unsafe_value())
        ));
    }
    auto _error_code = _cpp_call_result.error();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::shared_ptr<::smoke::Constructors>, ::smoke::Constructors::ErrorEnum>(
        static_cast<::smoke::Constructors::ErrorEnum>(_error_code.value())
    ));
}
FfiOpaqueHandle
smoke_Constructors_create__ListOf_1Double(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Constructors>>::toFfi(
        ::smoke::Constructors::create(
            gluecodium::ffi::Conversion<std::vector<double>>::toCpp(input)
        )
    );
}
void
smoke_Constructors_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::Constructors>*>(handle);
}
FfiOpaqueHandle
smoke_Constructors_ErrorEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Constructors::ErrorEnum>(
            gluecodium::ffi::Conversion<::smoke::Constructors::ErrorEnum>::toCpp(value)
        )
    );
}
void
smoke_Constructors_ErrorEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Constructors::ErrorEnum>*>(handle);
}
uint32_t
smoke_Constructors_ErrorEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Constructors::ErrorEnum>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Constructors::ErrorEnum>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif

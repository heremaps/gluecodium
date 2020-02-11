#include "ffi_smoke_MethodOverloads.h"
#include "ConversionBase.h"
#include "smoke/MethodOverloads.h"
#include <cstdint>
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
bool
smoke_MethodOverloads_isBoolean__Boolean(FfiOpaqueHandle _self, bool input) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::MethodOverloads>>::toCpp(_self)).is_boolean(
            gluecodium::ffi::Conversion<bool>::toCpp(input)
        )
    );
}
bool
smoke_MethodOverloads_isBoolean__Byte(FfiOpaqueHandle _self, int8_t input) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::MethodOverloads>>::toCpp(_self)).is_boolean(
            gluecodium::ffi::Conversion<int8_t>::toCpp(input)
        )
    );
}
bool
smoke_MethodOverloads_isBoolean__String(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::MethodOverloads>>::toCpp(_self)).is_boolean(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}
bool
smoke_MethodOverloads_isBoolean__Point(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::MethodOverloads>>::toCpp(_self)).is_boolean(
            gluecodium::ffi::Conversion<::smoke::MethodOverloads::Point>::toCpp(input)
        )
    );
}
bool
smoke_MethodOverloads_isBoolean__Boolean_Byte_String_Point(FfiOpaqueHandle _self, bool input1, int8_t input2, FfiOpaqueHandle input3, FfiOpaqueHandle input4) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::MethodOverloads>>::toCpp(_self)).is_boolean(
            gluecodium::ffi::Conversion<bool>::toCpp(input1),
            gluecodium::ffi::Conversion<int8_t>::toCpp(input2),
            gluecodium::ffi::Conversion<std::string>::toCpp(input3),
            gluecodium::ffi::Conversion<::smoke::MethodOverloads::Point>::toCpp(input4)
        )
    );
}
bool
smoke_MethodOverloads_isBoolean__ListOf_1String(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::MethodOverloads>>::toCpp(_self)).is_boolean(
            gluecodium::ffi::Conversion<std::vector<std::string>>::toCpp(input)
        )
    );
}
bool
smoke_MethodOverloads_isBoolean__ListOf_1Byte(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::MethodOverloads>>::toCpp(_self)).is_boolean(
            gluecodium::ffi::Conversion<std::vector<int8_t>>::toCpp(input)
        )
    );
}
bool
smoke_MethodOverloads_isBoolean(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::MethodOverloads>>::toCpp(_self)).is_boolean()
    );
}
bool
smoke_MethodOverloads_isFloat__String(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::MethodOverloads>>::toCpp(_self)).is_float(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}
bool
smoke_MethodOverloads_isFloat__ListOf_1Byte(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::MethodOverloads>>::toCpp(_self)).is_float(
            gluecodium::ffi::Conversion<std::vector<int8_t>>::toCpp(input)
        )
    );
}
void
smoke_MethodOverloads_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::MethodOverloads>*>(handle);
}
FfiOpaqueHandle
smoke_MethodOverloads_Point_create_handle(double x, double y) {
    auto _result = new (std::nothrow) ::smoke::MethodOverloads::Point(gluecodium::ffi::Conversion<double>::toCpp(x), gluecodium::ffi::Conversion<double>::toCpp(y));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
smoke_MethodOverloads_Point_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::MethodOverloads::Point*>(handle);
}
double
smoke_MethodOverloads_Point_get_field_x(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<::smoke::MethodOverloads::Point*>(handle)->x
    );
}
double
smoke_MethodOverloads_Point_get_field_y(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<::smoke::MethodOverloads::Point*>(handle)->y
    );
}
FfiOpaqueHandle
smoke_MethodOverloads_Point_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::MethodOverloads::Point>(
            gluecodium::ffi::Conversion<::smoke::MethodOverloads::Point>::toCpp(value)
        )
    );
}
void
smoke_MethodOverloads_Point_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::MethodOverloads::Point>*>(handle);
}
FfiOpaqueHandle
smoke_MethodOverloads_Point_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::MethodOverloads::Point>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::MethodOverloads::Point>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif

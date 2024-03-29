#include "ffi_smoke_StructsWithMethods.h"
#include "ConversionBase.h"
#include "IsolateContext.h"
#include "smoke/StructsWithMethods.h"
#include "smoke\ValidationUtils.h"
#include <cstdint>
#include <stdbool.h>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
double
library_smoke_StructsWithMethods_Vector_distanceTo__Vector(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle other) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<double>::toFfi(
        gluecodium::ffi::Conversion<smoke::StructsWithMethods::Vector>::toCpp(_self).distance_to(
            gluecodium::ffi::Conversion<smoke::StructsWithMethods::Vector>::toCpp(other)
        )
    );
}
FfiOpaqueHandle
library_smoke_StructsWithMethods_Vector_add__Vector(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle other) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::StructsWithMethods::Vector>::toFfi(
        gluecodium::ffi::Conversion<smoke::StructsWithMethods::Vector>::toCpp(_self).add(
            gluecodium::ffi::Conversion<smoke::StructsWithMethods::Vector>::toCpp(other)
        )
    );
}
bool
library_smoke_StructsWithMethods_Vector_validate__Double_Double(int32_t _isolate_id, double x, double y) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<bool>::toFfi(
        smoke::StructsWithMethods::Vector::validate(
            gluecodium::ffi::Conversion<double>::toCpp(x),
            gluecodium::ffi::Conversion<double>::toCpp(y)
        )
    );
}
FfiOpaqueHandle
library_smoke_StructsWithMethods_Vector_create__Double_Double(int32_t _isolate_id, double x, double y) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::StructsWithMethods::Vector>::toFfi(
        smoke::StructsWithMethods::Vector::create(
            gluecodium::ffi::Conversion<double>::toCpp(x),
            gluecodium::ffi::Conversion<double>::toCpp(y)
        )
    );
}
void
library_smoke_StructsWithMethods_Vector_create__Vector_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<smoke::StructsWithMethods::Vector, smoke::ValidationUtils::ValidationErrorCode>*>(handle);
}
FfiOpaqueHandle
library_smoke_StructsWithMethods_Vector_create__Vector_return_get_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::StructsWithMethods::Vector>::toFfi(
        reinterpret_cast<gluecodium::Return<smoke::StructsWithMethods::Vector, smoke::ValidationUtils::ValidationErrorCode>*>(handle)->unsafe_value()
    );
}
uint32_t
library_smoke_StructsWithMethods_Vector_create__Vector_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::ValidationUtils::ValidationErrorCode>::toFfi(
        reinterpret_cast<gluecodium::Return<smoke::StructsWithMethods::Vector, smoke::ValidationUtils::ValidationErrorCode>*>(handle)->error()
    );
}
bool
library_smoke_StructsWithMethods_Vector_create__Vector_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<smoke::StructsWithMethods::Vector, smoke::ValidationUtils::ValidationErrorCode>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_StructsWithMethods_Vector_create__Vector(int32_t _isolate_id, FfiOpaqueHandle other) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result = smoke::StructsWithMethods::Vector::create(
        gluecodium::ffi::Conversion<smoke::StructsWithMethods::Vector>::toCpp(other)
    );
    if (_cpp_call_result.has_value()) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<smoke::StructsWithMethods::Vector, smoke::ValidationUtils::ValidationErrorCode>(
            std::forward<smoke::StructsWithMethods::Vector>(_cpp_call_result.unsafe_value())
        ));
    }
    auto _error_code = _cpp_call_result.error();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<smoke::StructsWithMethods::Vector, smoke::ValidationUtils::ValidationErrorCode>(
        static_cast<smoke::ValidationUtils::ValidationErrorCode>(_error_code.value())
    ));
}
FfiOpaqueHandle
library_smoke_StructsWithMethods_Vector_create__ULong(int32_t _isolate_id, uint64_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::StructsWithMethods::Vector>::toFfi(
        smoke::StructsWithMethods::Vector::create(
            gluecodium::ffi::Conversion<uint64_t>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_StructsWithMethods_create_handle() {
    auto _result = new (std::nothrow) smoke::StructsWithMethods();
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_StructsWithMethods_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::StructsWithMethods*>(handle);
}
FfiOpaqueHandle
library_smoke_StructsWithMethods_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::StructsWithMethods>(
            gluecodium::ffi::Conversion<smoke::StructsWithMethods>::toCpp(value)
        )
    );
}
void
library_smoke_StructsWithMethods_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::StructsWithMethods>*>(handle);
}
FfiOpaqueHandle
library_smoke_StructsWithMethods_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::StructsWithMethods>::toFfi(
        **reinterpret_cast<std::optional<smoke::StructsWithMethods>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_StructsWithMethods_Vector_create_handle(double x, double y) {
    auto _result = new (std::nothrow) smoke::StructsWithMethods::Vector();
    _result->x = gluecodium::ffi::Conversion<double>::toCpp(x);
    _result->y = gluecodium::ffi::Conversion<double>::toCpp(y);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_StructsWithMethods_Vector_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::StructsWithMethods::Vector*>(handle);
}
double
library_smoke_StructsWithMethods_Vector_get_field_x(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::StructsWithMethods::Vector*>(handle)->x
    );
}
double
library_smoke_StructsWithMethods_Vector_get_field_y(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::StructsWithMethods::Vector*>(handle)->y
    );
}
FfiOpaqueHandle
library_smoke_StructsWithMethods_Vector_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::StructsWithMethods::Vector>(
            gluecodium::ffi::Conversion<smoke::StructsWithMethods::Vector>::toCpp(value)
        )
    );
}
void
library_smoke_StructsWithMethods_Vector_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::StructsWithMethods::Vector>*>(handle);
}
FfiOpaqueHandle
library_smoke_StructsWithMethods_Vector_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::StructsWithMethods::Vector>::toFfi(
        **reinterpret_cast<std::optional<smoke::StructsWithMethods::Vector>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif

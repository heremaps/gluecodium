#include "ffi_smoke_Constructors.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "gluecodium/TypeRepository.h"
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
library_smoke_Constructors_create(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::Constructors>>::toFfi(
        smoke::Constructors::create()
    );
}
FfiOpaqueHandle
library_smoke_Constructors_create__Constructors(int32_t _isolate_id, FfiOpaqueHandle other) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::Constructors>>::toFfi(
        smoke::Constructors::create(
            gluecodium::ffi::Conversion<std::shared_ptr<smoke::Constructors>>::toCpp(other)
        )
    );
}
FfiOpaqueHandle
library_smoke_Constructors_create__String_ULong(int32_t _isolate_id, FfiOpaqueHandle foo, uint64_t bar) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::Constructors>>::toFfi(
        smoke::Constructors::create(
            gluecodium::ffi::Conversion<std::string>::toCpp(foo),
            gluecodium::ffi::Conversion<uint64_t>::toCpp(bar)
        )
    );
}
void
library_smoke_Constructors_create__String_return_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::Constructors>, smoke::Constructors::ErrorEnum>*>(handle);
}
FfiOpaqueHandle
library_smoke_Constructors_create__String_return_get_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::Constructors>>::toFfi(
        reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::Constructors>, smoke::Constructors::ErrorEnum>*>(handle)->unsafe_value()
    );
}
uint32_t
library_smoke_Constructors_create__String_return_get_error(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Constructors::ErrorEnum>::toFfi(
        reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::Constructors>, smoke::Constructors::ErrorEnum>*>(handle)->error()
    );
}
bool
library_smoke_Constructors_create__String_return_has_error(FfiOpaqueHandle handle) {
    return !reinterpret_cast<gluecodium::Return<std::shared_ptr<smoke::Constructors>, smoke::Constructors::ErrorEnum>*>(handle)->has_value();
}
FfiOpaqueHandle
library_smoke_Constructors_create__String(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    auto&& _cpp_call_result = smoke::Constructors::create(
        gluecodium::ffi::Conversion<std::string>::toCpp(input)
    );
    if (_cpp_call_result.has_value()) {
        return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::shared_ptr<smoke::Constructors>, smoke::Constructors::ErrorEnum>(
            std::forward<std::shared_ptr<smoke::Constructors>>(_cpp_call_result.unsafe_value())
        ));
    }
    auto _error_code = _cpp_call_result.error();
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) gluecodium::Return<std::shared_ptr<smoke::Constructors>, smoke::Constructors::ErrorEnum>(
        static_cast<smoke::Constructors::ErrorEnum>(_error_code.value())
    ));
}
FfiOpaqueHandle
library_smoke_Constructors_create__ListOf_Double(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::Constructors>>::toFfi(
        smoke::Constructors::create(
            gluecodium::ffi::Conversion<std::vector<double>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Constructors_create__ULong(int32_t _isolate_id, uint64_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::Constructors>>::toFfi(
        smoke::Constructors::create(
            gluecodium::ffi::Conversion<uint64_t>::toCpp(input)
        )
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Constructors_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::Constructors>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_Constructors_release_handle(handle);
}
void
library_smoke_Constructors_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Constructors_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Constructors_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::Constructors>(
            *reinterpret_cast<std::shared_ptr<smoke::Constructors>*>(handle)
        )
    );
}
void
library_smoke_Constructors_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::Constructors>*>(handle);
}
FfiOpaqueHandle
library_smoke_Constructors_ErrorEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::Constructors::ErrorEnum>(
            gluecodium::ffi::Conversion<smoke::Constructors::ErrorEnum>::toCpp(value)
        )
    );
}
void
library_smoke_Constructors_ErrorEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::Constructors::ErrorEnum>*>(handle);
}
uint32_t
library_smoke_Constructors_ErrorEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Constructors::ErrorEnum>::toFfi(
        **reinterpret_cast<std::optional<smoke::Constructors::ErrorEnum>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_Constructors_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::Constructors>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif

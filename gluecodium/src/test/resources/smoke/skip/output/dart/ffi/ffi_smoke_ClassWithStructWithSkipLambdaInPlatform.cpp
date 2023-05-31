#include "ffi_smoke_ClassWithStructWithSkipLambdaInPlatform.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "smoke\ClassWithStructWithSkipLambdaInPlatform.h"
#include <cstdint>
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_ClassWithStructWithSkipLambdaInPlatform_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::ClassWithStructWithSkipLambdaInPlatform>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_ClassWithStructWithSkipLambdaInPlatform_release_handle(handle);
}
void
library_smoke_ClassWithStructWithSkipLambdaInPlatform_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_ClassWithStructWithSkipLambdaInPlatform_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_ClassWithStructWithSkipLambdaInPlatform_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::ClassWithStructWithSkipLambdaInPlatform>(
            *reinterpret_cast<std::shared_ptr<smoke::ClassWithStructWithSkipLambdaInPlatform>*>(handle)
        )
    );
}
void
library_smoke_ClassWithStructWithSkipLambdaInPlatform_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::ClassWithStructWithSkipLambdaInPlatform>*>(handle);
}
FfiOpaqueHandle
library_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_create_handle(int32_t intField) {
    auto _result = new (std::nothrow) smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform();
    _result->int_field = gluecodium::ffi::Conversion<int32_t>::toCpp(intField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform*>(handle);
}
int32_t
library_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_get_field_intField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        reinterpret_cast<smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform*>(handle)->int_field
    );
}
FfiOpaqueHandle
library_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>(
            gluecodium::ffi::Conversion<smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>::toCpp(value)
        )
    );
}
void
library_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>*>(handle);
}
FfiOpaqueHandle
library_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>::toFfi(
        **reinterpret_cast<std::optional<smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
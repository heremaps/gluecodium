#include "ffi_smoke_UseOptimizedListStruct.h"
#include "ConversionBase.h"
#include "gluecodium/VectorHash.h"
#include "smoke/UnreasonablyLazyClass.h"
#include "smoke/UseOptimizedListStruct.h"
#include "smoke/VeryBigStruct.h"
#include <memory>
#include <vector>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_UseOptimizedListStruct_create_handle(FfiOpaqueHandle structs, FfiOpaqueHandle classes) {
    auto _result = new (std::nothrow) smoke::UseOptimizedListStruct(gluecodium::ffi::Conversion<std::vector<std::shared_ptr<smoke::VeryBigStruct>>>::toCpp(structs), gluecodium::ffi::Conversion<std::vector<std::shared_ptr<smoke::UnreasonablyLazyClass>>>::toCpp(classes));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_UseOptimizedListStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::UseOptimizedListStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_UseOptimizedListStruct_get_field_structs(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<std::vector<std::shared_ptr<smoke::VeryBigStruct>>>(
            new (std::nothrow) std::vector<std::shared_ptr<smoke::VeryBigStruct>>(
                reinterpret_cast<smoke::UseOptimizedListStruct*>(handle)->structs
            )
        )
    );
}
FfiOpaqueHandle
library_smoke_UseOptimizedListStruct_get_field_classes(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<std::vector<std::shared_ptr<smoke::UnreasonablyLazyClass>>>(
            new (std::nothrow) std::vector<std::shared_ptr<smoke::UnreasonablyLazyClass>>(
                reinterpret_cast<smoke::UseOptimizedListStruct*>(handle)->classes
            )
        )
    );
}
FfiOpaqueHandle
library_smoke_UseOptimizedListStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::UseOptimizedListStruct>(
            gluecodium::ffi::Conversion<smoke::UseOptimizedListStruct>::toCpp(value)
        )
    );
}
void
library_smoke_UseOptimizedListStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::UseOptimizedListStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_UseOptimizedListStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::UseOptimizedListStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::UseOptimizedListStruct>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif

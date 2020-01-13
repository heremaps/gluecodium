#include "ffi_smoke_off_NestedPackages.h"
#include "ConversionBase.h"
#include "smoke/off/NestedPackages.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
smoke_off_NestedPackages_basicMethod__SomeStruct(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<smoke::off::NestedPackages::SomeStruct>::toFfi(
        smoke::off::NestedPackages::basic_method(
            gluecodium::ffi::Conversion<smoke::off::NestedPackages::SomeStruct>::toCpp(input)
        )
    );
}
void
smoke_off_NestedPackages_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::off::NestedPackages>*>(handle);
}
FfiOpaqueHandle
smoke_off_NestedPackages_SomeStruct_create_handle(FfiOpaqueHandle someField) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::off::NestedPackages::SomeStruct(
            gluecodium::ffi::Conversion<std::string>::toCpp(someField)
        ));
}
void
smoke_off_NestedPackages_SomeStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::off::NestedPackages::SomeStruct*>(handle);
}
FfiOpaqueHandle
smoke_off_NestedPackages_SomeStruct_get_field_someField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::off::NestedPackages::SomeStruct*>(handle)->some_field
    );
}
#ifdef __cplusplus
}
#endif

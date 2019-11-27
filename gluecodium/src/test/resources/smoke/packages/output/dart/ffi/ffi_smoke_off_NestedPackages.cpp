#include "ffi_smoke_off_NestedPackages.h"
#include "ConversionBase.h"
#include "smoke/off/NestedPackages.h"
#include <memory>
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
#ifdef __cplusplus
}
#endif

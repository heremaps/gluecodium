#include "ffi_smoke_SimpleInterface.h"
#include "ConversionBase.h"
#include "smoke/SimpleInterface.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
smoke_SimpleInterface_getStringValue(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp(_self)).get_string_value()
    );
}
FfiOpaqueHandle
smoke_SimpleInterface_useSimpleInterface__SimpleInterface(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp(_self)).use_simple_interface(
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_SimpleInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::SimpleInterface>(
            *reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*>(handle)
        )
    );
}
void
smoke_SimpleInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*>(handle);
}
#ifdef __cplusplus
}
#endif

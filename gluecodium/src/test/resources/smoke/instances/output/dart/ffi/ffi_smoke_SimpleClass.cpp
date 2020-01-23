#include "ffi_smoke_SimpleClass.h"
#include "ConversionBase.h"
#include "smoke/SimpleClass.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
smoke_SimpleClass_getStringValue(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp(_self)).get_string_value()
    );
}
FfiOpaqueHandle
smoke_SimpleClass_useSimpleClass__SimpleClass(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleClass>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp(_self)).use_simple_class(
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp(input)
        )
    );
}
void
smoke_SimpleClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::SimpleClass>*>(handle);
}
#ifdef __cplusplus
}
#endif

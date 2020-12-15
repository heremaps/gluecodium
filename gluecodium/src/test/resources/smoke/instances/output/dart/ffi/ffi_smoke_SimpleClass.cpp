#include "ffi_smoke_SimpleClass.h"
#include "ConversionBase.h"
#include "ReverseCache.h"
#include "IsolateContext.h"
#include "smoke/SimpleClass.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_SimpleClass_getStringValue(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp(_self)).get_string_value()
    );
}
FfiOpaqueHandle
library_smoke_SimpleClass_useSimpleClass__SimpleClass(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleClass>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp(_self)).use_simple_class(
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_SimpleClass_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::SimpleClass>(
            *reinterpret_cast<std::shared_ptr<::smoke::SimpleClass>*>(handle)
        )
    );
}
void
library_smoke_SimpleClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::SimpleClass>*>(handle);
}
#ifdef __cplusplus
}
#endif

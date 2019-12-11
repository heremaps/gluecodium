#include "ffi_smoke_StructWithClass.h"
#include "ConversionBase.h"
#include "smoke/SimpleClass.h"
#include "smoke/StructWithClass.h"
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
  FfiOpaqueHandle
smoke_StructWithClass_create_handle(FfiOpaqueHandle classInstance) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::StructWithClass(
            gluecodium::ffi::Conversion<std::shared_ptr<smoke::SimpleClass>>::toCpp(classInstance)
        ));
}
void
smoke_StructWithClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::StructWithClass*>(handle);
}
FfiOpaqueHandle
smoke_StructWithClass_get_field_classInstance(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::SimpleClass>>::toFfi(
        reinterpret_cast<smoke::StructWithClass*>(handle)->class_instance
    );
}
#ifdef __cplusplus
}
#endif

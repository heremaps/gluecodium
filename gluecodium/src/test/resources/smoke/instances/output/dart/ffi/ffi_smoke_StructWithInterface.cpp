#include "ffi_smoke_StructWithInterface.h"
#include "ConversionBase.h"
#include "smoke/SimpleInterface.h"
#include "smoke/StructWithInterface.h"
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
smoke_StructWithInterface_create_handle(FfiOpaqueHandle interfaceInstance) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::StructWithInterface(
            gluecodium::ffi::Conversion<std::shared_ptr<smoke::SimpleInterface>>::toCpp(interfaceInstance)
        ));
}
void
smoke_StructWithInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::StructWithInterface*>(handle);
}
FfiOpaqueHandle
smoke_StructWithInterface_get_field_interfaceInstance(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::SimpleInterface>>::toFfi(
        reinterpret_cast<smoke::StructWithInterface*>(handle)->interface_instance
    );
}
#ifdef __cplusplus
}
#endif

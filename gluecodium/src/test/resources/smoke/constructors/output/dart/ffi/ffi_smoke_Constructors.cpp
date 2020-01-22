#include "ffi_smoke_Constructors.h"
#include "ConversionBase.h"
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
smoke_Constructors_create() {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Constructors>>::toFfi(
        ::smoke::Constructors::create()
    );
}
FfiOpaqueHandle
smoke_Constructors_create__Constructors(FfiOpaqueHandle other) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Constructors>>::toFfi(
        ::smoke::Constructors::create(
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Constructors>>::toCpp(other)
        )
    );
}
FfiOpaqueHandle
smoke_Constructors_create__String_ULong(FfiOpaqueHandle foo, uint64_t bar) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Constructors>>::toFfi(
        ::smoke::Constructors::create(
            gluecodium::ffi::Conversion<std::string>::toCpp(foo),
            gluecodium::ffi::Conversion<uint64_t>::toCpp(bar)
        )
    );
}
FfiOpaqueHandle
smoke_Constructors_create__String(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Constructors>>::toFfi(
        ::smoke::Constructors::create(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Constructors_create__ListOf_1Double(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Constructors>>::toFfi(
        ::smoke::Constructors::create(
            gluecodium::ffi::Conversion<std::vector<double>>::toCpp(input)
        )
    );
}
void
smoke_Constructors_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::Constructors>*>(handle);
}
#ifdef __cplusplus
}
#endif

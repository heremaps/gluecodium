#include "ffi_smoke_OuterClass.h"
#include "ConversionBase.h"
#include "smoke/OuterClass.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
class smoke_OuterClass_InnerInterface_Proxy : public ::smoke::OuterClass::InnerInterface {
public:
    smoke_OuterClass_InnerInterface_Proxy(uint64_t token, FfiOpaqueHandle f0)
        : token(token), f0(f0) { }
    std::string
    foo(const std::string& input) override {
        FfiOpaqueHandle _result_handle;
        int64_t _error = (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle, FfiOpaqueHandle*)>(f0))(token,
            gluecodium::ffi::Conversion<std::string>::toFfi(input),
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
private:
    uint64_t token;
    FfiOpaqueHandle f0;
};
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
smoke_OuterClass_foo__String(FfiOpaqueHandle _self, FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::OuterClass>>::toCpp(_self)).foo(
            gluecodium::ffi::Conversion<std::string>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_OuterClass_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::OuterClass>(
            *reinterpret_cast<std::shared_ptr<::smoke::OuterClass>*>(handle)
        )
    );
}
void
smoke_OuterClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::OuterClass>*>(handle);
}
FfiOpaqueHandle
smoke_OuterClass_InnerClass_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::OuterClass::InnerClass>(
            *reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerClass>*>(handle)
        )
    );
}
void
smoke_OuterClass_InnerClass_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerClass>*>(handle);
}
FfiOpaqueHandle
smoke_OuterClass_InnerInterface_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::OuterClass::InnerInterface>(
            *reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerInterface>*>(handle)
        )
    );
}
void
smoke_OuterClass_InnerInterface_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerInterface>*>(handle);
}
FfiOpaqueHandle
smoke_OuterClass_InnerInterface_create_proxy(uint64_t token, FfiOpaqueHandle f0) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::OuterClass::InnerInterface>(
            new (std::nothrow) smoke_OuterClass_InnerInterface_Proxy(token, f0)
        )
    );
}
FfiOpaqueHandle
smoke_OuterClass_InnerInterface_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerInterface>*>(handle)->get()
    );
}
#ifdef __cplusplus
}
#endif

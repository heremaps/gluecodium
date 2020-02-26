#include "ffi_smoke_SimpleInterface.h"
#include "ConversionBase.h"
#include "smoke/SimpleInterface.h"
#include <memory>
#include <string>
#include <memory>
#include <new>
class smoke_SimpleInterface_Proxy : public ::smoke::SimpleInterface {
public:
    smoke_SimpleInterface_Proxy(uint64_t token, FfiOpaqueHandle f0, FfiOpaqueHandle f1)
        : token(token), f0(f0), f1(f1) { }
    std::string
    get_string_value() override {
        FfiOpaqueHandle _result_handle;
        (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(f0))(token,
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
    std::shared_ptr<::smoke::SimpleInterface>
    use_simple_interface(const std::shared_ptr<::smoke::SimpleInterface>& input) override {
        FfiOpaqueHandle _result_handle;
        (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle, FfiOpaqueHandle*)>(f1))(token,
            gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toFfi(input),
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp(_result_handle);
        delete reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*>(_result_handle);
        return _result;
    }
private:
    uint64_t token;
    FfiOpaqueHandle f0;
    FfiOpaqueHandle f1;
};
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
FfiOpaqueHandle
smoke_SimpleInterface_create_proxy(uint64_t token, FfiOpaqueHandle f0, FfiOpaqueHandle f1) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::SimpleInterface>(
            new (std::nothrow) smoke_SimpleInterface_Proxy(token, f0, f1)
        )
    );
}
FfiOpaqueHandle
smoke_SimpleInterface_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*>(handle)->get()
    );
}
FfiOpaqueHandle
smoke_SimpleInterface_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_repository = ::gluecodium::get_type_repository(static_cast<::smoke::SimpleInterface*>(nullptr));
    const auto& type_id = type_repository.get_id(reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif

#include "ffi_smoke_ListenersWithReturnValues.h"
#include "ConversionBase.h"
#include "gluecodium/VectorHash.h"
#include "smoke/CalculationResult.h"
#include "smoke/ListenersWithReturnValues.h"
#include <memory>
#include <string>
#include <vector>
#include <memory>
#include <new>
class smoke_ListenersWithReturnValues_Proxy : public ::smoke::ListenersWithReturnValues {
public:
    smoke_ListenersWithReturnValues_Proxy(uint64_t token, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle f2, FfiOpaqueHandle f3, FfiOpaqueHandle f4, FfiOpaqueHandle f5, FfiOpaqueHandle f6)
        : token(token), f0(f0), f1(f1), f2(f2), f3(f3), f4(f4), f5(f5), f6(f6) { }
    double
    fetch_data_double() override {
        double _result_handle;
        (*reinterpret_cast<int64_t (*)(uint64_t, double*)>(f0))(token,
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<double>::toCpp(_result_handle);
        ;
        return _result;
    }
    std::string
    fetch_data_string() override {
        FfiOpaqueHandle _result_handle;
        (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(f1))(token,
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }
    ::smoke::ListenersWithReturnValues::ResultStruct
    fetch_data_struct() override {
        FfiOpaqueHandle _result_handle;
        (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(f2))(token,
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<::smoke::ListenersWithReturnValues::ResultStruct>::toCpp(_result_handle);
        delete reinterpret_cast<::smoke::ListenersWithReturnValues::ResultStruct*>(_result_handle);
        return _result;
    }
    ::smoke::ListenersWithReturnValues::ResultEnum
    fetch_data_enum() override {
        uint32_t _result_handle;
        (*reinterpret_cast<int64_t (*)(uint64_t, uint32_t*)>(f3))(token,
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<::smoke::ListenersWithReturnValues::ResultEnum>::toCpp(_result_handle);
        ;
        return _result;
    }
    std::vector<double>
    fetch_data_array() override {
        FfiOpaqueHandle _result_handle;
        (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(f4))(token,
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<std::vector<double>>::toCpp(_result_handle);
        delete reinterpret_cast<std::vector<double>*>(_result_handle);
        return _result;
    }
    std::unordered_map<std::string, double>
    fetch_data_map() override {
        FfiOpaqueHandle _result_handle;
        (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(f5))(token,
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toCpp(_result_handle);
        delete reinterpret_cast<std::unordered_map<std::string, double>*>(_result_handle);
        return _result;
    }
    std::shared_ptr<::smoke::CalculationResult>
    fetch_data_instance() override {
        FfiOpaqueHandle _result_handle;
        (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(f6))(token,
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculationResult>>::toCpp(_result_handle);
        delete reinterpret_cast<std::shared_ptr<::smoke::CalculationResult>*>(_result_handle);
        return _result;
    }
private:
    uint64_t token;
    FfiOpaqueHandle f0;
    FfiOpaqueHandle f1;
    FfiOpaqueHandle f2;
    FfiOpaqueHandle f3;
    FfiOpaqueHandle f4;
    FfiOpaqueHandle f5;
    FfiOpaqueHandle f6;
};
#ifdef __cplusplus
extern "C" {
#endif
double
library_smoke_ListenersWithReturnValues_fetchDataDouble(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenersWithReturnValues>>::toCpp(_self)).fetch_data_double()
    );
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_fetchDataString(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenersWithReturnValues>>::toCpp(_self)).fetch_data_string()
    );
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_fetchDataStruct(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<::smoke::ListenersWithReturnValues::ResultStruct>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenersWithReturnValues>>::toCpp(_self)).fetch_data_struct()
    );
}
uint32_t
library_smoke_ListenersWithReturnValues_fetchDataEnum(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<::smoke::ListenersWithReturnValues::ResultEnum>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenersWithReturnValues>>::toCpp(_self)).fetch_data_enum()
    );
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_fetchDataArray(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::vector<double>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenersWithReturnValues>>::toCpp(_self)).fetch_data_array()
    );
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_fetchDataMap(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenersWithReturnValues>>::toCpp(_self)).fetch_data_map()
    );
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_fetchDataInstance(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::shared_ptr<::smoke::CalculationResult>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::ListenersWithReturnValues>>::toCpp(_self)).fetch_data_instance()
    );
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::ListenersWithReturnValues>(
            *reinterpret_cast<std::shared_ptr<::smoke::ListenersWithReturnValues>*>(handle)
        )
    );
}
void
library_smoke_ListenersWithReturnValues_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::ListenersWithReturnValues>*>(handle);
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_create_proxy(uint64_t token, FfiOpaqueHandle f0, FfiOpaqueHandle f1, FfiOpaqueHandle f2, FfiOpaqueHandle f3, FfiOpaqueHandle f4, FfiOpaqueHandle f5, FfiOpaqueHandle f6) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::ListenersWithReturnValues>(
            new (std::nothrow) smoke_ListenersWithReturnValues_Proxy(token, f0, f1, f2, f3, f4, f5, f6)
        )
    );
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_get_raw_pointer(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        reinterpret_cast<std::shared_ptr<::smoke::ListenersWithReturnValues>*>(handle)->get()
    );
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_ResultStruct_create_handle(double result) {
    auto _result = new (std::nothrow) ::smoke::ListenersWithReturnValues::ResultStruct(gluecodium::ffi::Conversion<double>::toCpp(result));
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_ListenersWithReturnValues_ResultStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::ListenersWithReturnValues::ResultStruct*>(handle);
}
double
library_smoke_ListenersWithReturnValues_ResultStruct_get_field_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<::smoke::ListenersWithReturnValues::ResultStruct*>(handle)->result
    );
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_ResultStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::ListenersWithReturnValues::ResultStruct>(
            gluecodium::ffi::Conversion<::smoke::ListenersWithReturnValues::ResultStruct>::toCpp(value)
        )
    );
}
void
library_smoke_ListenersWithReturnValues_ResultStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::ListenersWithReturnValues::ResultStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_ResultStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::ListenersWithReturnValues::ResultStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::ListenersWithReturnValues::ResultStruct>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_ResultEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::ListenersWithReturnValues::ResultEnum>(
            gluecodium::ffi::Conversion<::smoke::ListenersWithReturnValues::ResultEnum>::toCpp(value)
        )
    );
}
void
library_smoke_ListenersWithReturnValues_ResultEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::ListenersWithReturnValues::ResultEnum>*>(handle);
}
uint32_t
library_smoke_ListenersWithReturnValues_ResultEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::ListenersWithReturnValues::ResultEnum>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::ListenersWithReturnValues::ResultEnum>*>(handle)
    );
}
FfiOpaqueHandle
library_smoke_ListenersWithReturnValues_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_repository = ::gluecodium::get_type_repository(static_cast<::smoke::ListenersWithReturnValues*>(nullptr));
    const auto& type_id = type_repository.get_id(reinterpret_cast<std::shared_ptr<::smoke::ListenersWithReturnValues>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}
#ifdef __cplusplus
}
#endif

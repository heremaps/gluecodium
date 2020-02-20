#include "ffi_smoke_Lambdas.h"
#include "ConversionBase.h"
#include "gluecodium/Optional.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/Lambdas.h"
#include <cstdint>
#include <functional>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>
#include <memory>
#include <new>
class smoke_Lambdas_Producer_Proxy {
public:
    smoke_Lambdas_Producer_Proxy(uint64_t token, FfiOpaqueHandle f0)
        : token(token), f0(f0) { }
    std::string
    operator()() {
        FfiOpaqueHandle _result_handle;
        int64_t _error = (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle*)>(f0))(token,
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
class smoke_Lambdas_Confuser_Proxy {
public:
    smoke_Lambdas_Confuser_Proxy(uint64_t token, FfiOpaqueHandle f0)
        : token(token), f0(f0) { }
    ::smoke::Lambdas::Producer
    operator()(const std::string& p0) {
        FfiOpaqueHandle _result_handle;
        int64_t _error = (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle, FfiOpaqueHandle*)>(f0))(token,
            gluecodium::ffi::Conversion<std::string>::toFfi(p0),
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<::smoke::Lambdas::Producer>::toCpp(_result_handle);
        delete reinterpret_cast<::smoke::Lambdas::Producer*>(_result_handle);
        return _result;
    }
private:
    uint64_t token;
    FfiOpaqueHandle f0;
};
class smoke_Lambdas_Consumer_Proxy {
public:
    smoke_Lambdas_Consumer_Proxy(uint64_t token, FfiOpaqueHandle f0)
        : token(token), f0(f0) { }
    void
    operator()(const std::string& p0) {
        int64_t _error = (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle)>(f0))(token,
            gluecodium::ffi::Conversion<std::string>::toFfi(p0)
        );
    }
private:
    uint64_t token;
    FfiOpaqueHandle f0;
};
class smoke_Lambdas_Indexer_Proxy {
public:
    smoke_Lambdas_Indexer_Proxy(uint64_t token, FfiOpaqueHandle f0)
        : token(token), f0(f0) { }
    int32_t
    operator()(const std::string& p0, const float p1) {
        int32_t _result_handle;
        int64_t _error = (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle, float, int32_t*)>(f0))(token,
            gluecodium::ffi::Conversion<std::string>::toFfi(p0),
            gluecodium::ffi::Conversion<float>::toFfi(p1),
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<int32_t>::toCpp(_result_handle);
        ;
        return _result;
    }
private:
    uint64_t token;
    FfiOpaqueHandle f0;
};
class smoke_Lambdas_NullableConfuser_Proxy {
public:
    smoke_Lambdas_NullableConfuser_Proxy(uint64_t token, FfiOpaqueHandle f0)
        : token(token), f0(f0) { }
    gluecodium::optional<::smoke::Lambdas::Producer>
    operator()(const gluecodium::optional<std::string>& p0) {
        FfiOpaqueHandle _result_handle;
        int64_t _error = (*reinterpret_cast<int64_t (*)(uint64_t, FfiOpaqueHandle, FfiOpaqueHandle*)>(f0))(token,
            gluecodium::ffi::Conversion<gluecodium::optional<std::string>>::toFfi(p0),
            &_result_handle
        );
        auto _result = gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Lambdas::Producer>>::toCpp(_result_handle);
        delete reinterpret_cast<gluecodium::optional<::smoke::Lambdas::Producer>*>(_result_handle);
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
smoke_Lambdas_deconfuse__String_Confuser(FfiOpaqueHandle _self, FfiOpaqueHandle value, FfiOpaqueHandle confuser) {
    return gluecodium::ffi::Conversion<::smoke::Lambdas::Producer>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<::smoke::Lambdas>>::toCpp(_self)).deconfuse(
            gluecodium::ffi::Conversion<std::string>::toCpp(value),
            gluecodium::ffi::Conversion<::smoke::Lambdas::Confuser>::toCpp(confuser)
        )
    );
}
FfiOpaqueHandle
smoke_Lambdas_fuse__ListOf_1String_Indexer(FfiOpaqueHandle items, FfiOpaqueHandle callback) {
    return gluecodium::ffi::Conversion<std::unordered_map<int32_t, std::string>>::toFfi(
        ::smoke::Lambdas::fuse(
            gluecodium::ffi::Conversion<std::vector<std::string>>::toCpp(items),
            gluecodium::ffi::Conversion<::smoke::Lambdas::Indexer>::toCpp(callback)
        )
    );
}
FfiOpaqueHandle
smoke_Lambdas_Producer_call(FfiOpaqueHandle _self) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        gluecodium::ffi::Conversion<::smoke::Lambdas::Producer>::toCpp(_self).operator()()
    );
}
FfiOpaqueHandle
smoke_Lambdas_Confuser_call__String(FfiOpaqueHandle _self, FfiOpaqueHandle p0) {
    return gluecodium::ffi::Conversion<::smoke::Lambdas::Producer>::toFfi(
        gluecodium::ffi::Conversion<::smoke::Lambdas::Confuser>::toCpp(_self).operator()(
            gluecodium::ffi::Conversion<std::string>::toCpp(p0)
        )
    );
}
void
smoke_Lambdas_Consumer_call__String(FfiOpaqueHandle _self, FfiOpaqueHandle p0) {
            gluecodium::ffi::Conversion<::smoke::Lambdas::Consumer>::toCpp(_self).operator()(
            gluecodium::ffi::Conversion<std::string>::toCpp(p0)
        );
}
int32_t
smoke_Lambdas_Indexer_call__String_Float(FfiOpaqueHandle _self, FfiOpaqueHandle p0, float p1) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        gluecodium::ffi::Conversion<::smoke::Lambdas::Indexer>::toCpp(_self).operator()(
            gluecodium::ffi::Conversion<std::string>::toCpp(p0),
            gluecodium::ffi::Conversion<float>::toCpp(p1)
        )
    );
}
FfiOpaqueHandle
smoke_Lambdas_NullableConfuser_call__String(FfiOpaqueHandle _self, FfiOpaqueHandle p0) {
    return gluecodium::ffi::Conversion<gluecodium::optional<::smoke::Lambdas::Producer>>::toFfi(
        gluecodium::ffi::Conversion<::smoke::Lambdas::NullableConfuser>::toCpp(_self).operator()(
            gluecodium::ffi::Conversion<gluecodium::optional<std::string>>::toCpp(p0)
        )
    );
}
FfiOpaqueHandle
smoke_Lambdas_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::Lambdas>(
            *reinterpret_cast<std::shared_ptr<::smoke::Lambdas>*>(handle)
        )
    );
}
void
smoke_Lambdas_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::Lambdas>*>(handle);
}
FfiOpaqueHandle
smoke_Lambdas_Producer_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) ::smoke::Lambdas::Producer(
            *reinterpret_cast<::smoke::Lambdas::Producer*>(handle)
        )
    );
}
void
smoke_Lambdas_Producer_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::Lambdas::Producer*>(handle);
}
FfiOpaqueHandle
smoke_Lambdas_Producer_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Lambdas::Producer>(
            gluecodium::ffi::Conversion<::smoke::Lambdas::Producer>::toCpp(value)
        )
    );
}
void
smoke_Lambdas_Producer_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Lambdas::Producer>*>(handle);
}
FfiOpaqueHandle
smoke_Lambdas_Producer_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Lambdas::Producer>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Lambdas::Producer>*>(handle)
    );
}
FfiOpaqueHandle
smoke_Lambdas_Confuser_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) ::smoke::Lambdas::Confuser(
            *reinterpret_cast<::smoke::Lambdas::Confuser*>(handle)
        )
    );
}
void
smoke_Lambdas_Confuser_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::Lambdas::Confuser*>(handle);
}
FfiOpaqueHandle
smoke_Lambdas_Confuser_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Lambdas::Confuser>(
            gluecodium::ffi::Conversion<::smoke::Lambdas::Confuser>::toCpp(value)
        )
    );
}
void
smoke_Lambdas_Confuser_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Lambdas::Confuser>*>(handle);
}
FfiOpaqueHandle
smoke_Lambdas_Confuser_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Lambdas::Confuser>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Lambdas::Confuser>*>(handle)
    );
}
FfiOpaqueHandle
smoke_Lambdas_Consumer_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) ::smoke::Lambdas::Consumer(
            *reinterpret_cast<::smoke::Lambdas::Consumer*>(handle)
        )
    );
}
void
smoke_Lambdas_Consumer_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::Lambdas::Consumer*>(handle);
}
FfiOpaqueHandle
smoke_Lambdas_Consumer_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Lambdas::Consumer>(
            gluecodium::ffi::Conversion<::smoke::Lambdas::Consumer>::toCpp(value)
        )
    );
}
void
smoke_Lambdas_Consumer_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Lambdas::Consumer>*>(handle);
}
FfiOpaqueHandle
smoke_Lambdas_Consumer_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Lambdas::Consumer>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Lambdas::Consumer>*>(handle)
    );
}
FfiOpaqueHandle
smoke_Lambdas_Indexer_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) ::smoke::Lambdas::Indexer(
            *reinterpret_cast<::smoke::Lambdas::Indexer*>(handle)
        )
    );
}
void
smoke_Lambdas_Indexer_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::Lambdas::Indexer*>(handle);
}
FfiOpaqueHandle
smoke_Lambdas_Indexer_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Lambdas::Indexer>(
            gluecodium::ffi::Conversion<::smoke::Lambdas::Indexer>::toCpp(value)
        )
    );
}
void
smoke_Lambdas_Indexer_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Lambdas::Indexer>*>(handle);
}
FfiOpaqueHandle
smoke_Lambdas_Indexer_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Lambdas::Indexer>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Lambdas::Indexer>*>(handle)
    );
}
FfiOpaqueHandle
smoke_Lambdas_NullableConfuser_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) ::smoke::Lambdas::NullableConfuser(
            *reinterpret_cast<::smoke::Lambdas::NullableConfuser*>(handle)
        )
    );
}
void
smoke_Lambdas_NullableConfuser_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<::smoke::Lambdas::NullableConfuser*>(handle);
}
FfiOpaqueHandle
smoke_Lambdas_NullableConfuser_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<::smoke::Lambdas::NullableConfuser>(
            gluecodium::ffi::Conversion<::smoke::Lambdas::NullableConfuser>::toCpp(value)
        )
    );
}
void
smoke_Lambdas_NullableConfuser_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<::smoke::Lambdas::NullableConfuser>*>(handle);
}
FfiOpaqueHandle
smoke_Lambdas_NullableConfuser_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<::smoke::Lambdas::NullableConfuser>::toFfi(
        **reinterpret_cast<gluecodium::optional<::smoke::Lambdas::NullableConfuser>*>(handle)
    );
}
FfiOpaqueHandle
smoke_Lambdas_Producer_create_proxy(uint64_t token, FfiOpaqueHandle f0) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new ::smoke::Lambdas::Producer(
            std::bind(&smoke_Lambdas_Producer_Proxy::operator(), std::make_shared<smoke_Lambdas_Producer_Proxy>(token, f0))
        )
    );
}
FfiOpaqueHandle
smoke_Lambdas_Producer_get_raw_pointer(FfiOpaqueHandle handle) {
    return handle;
}
FfiOpaqueHandle
smoke_Lambdas_Confuser_create_proxy(uint64_t token, FfiOpaqueHandle f0) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new ::smoke::Lambdas::Confuser(
            std::bind(&smoke_Lambdas_Confuser_Proxy::operator(), std::make_shared<smoke_Lambdas_Confuser_Proxy>(token, f0), std::placeholders::_1)
        )
    );
}
FfiOpaqueHandle
smoke_Lambdas_Confuser_get_raw_pointer(FfiOpaqueHandle handle) {
    return handle;
}
FfiOpaqueHandle
smoke_Lambdas_Consumer_create_proxy(uint64_t token, FfiOpaqueHandle f0) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new ::smoke::Lambdas::Consumer(
            std::bind(&smoke_Lambdas_Consumer_Proxy::operator(), std::make_shared<smoke_Lambdas_Consumer_Proxy>(token, f0), std::placeholders::_1)
        )
    );
}
FfiOpaqueHandle
smoke_Lambdas_Consumer_get_raw_pointer(FfiOpaqueHandle handle) {
    return handle;
}
FfiOpaqueHandle
smoke_Lambdas_Indexer_create_proxy(uint64_t token, FfiOpaqueHandle f0) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new ::smoke::Lambdas::Indexer(
            std::bind(&smoke_Lambdas_Indexer_Proxy::operator(), std::make_shared<smoke_Lambdas_Indexer_Proxy>(token, f0), std::placeholders::_1, std::placeholders::_2)
        )
    );
}
FfiOpaqueHandle
smoke_Lambdas_Indexer_get_raw_pointer(FfiOpaqueHandle handle) {
    return handle;
}
FfiOpaqueHandle
smoke_Lambdas_NullableConfuser_create_proxy(uint64_t token, FfiOpaqueHandle f0) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new ::smoke::Lambdas::NullableConfuser(
            std::bind(&smoke_Lambdas_NullableConfuser_Proxy::operator(), std::make_shared<smoke_Lambdas_NullableConfuser_Proxy>(token, f0), std::placeholders::_1)
        )
    );
}
FfiOpaqueHandle
smoke_Lambdas_NullableConfuser_get_raw_pointer(FfiOpaqueHandle handle) {
    return handle;
}
#ifdef __cplusplus
}
#endif

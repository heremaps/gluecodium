//
//
#include "cbridge/include/smoke/cbridge_Lambdas.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/Lambdas.h"
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
#include <vector>
void smoke_Lambdas_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::Lambdas>>(handle);
}
_baseRef smoke_Lambdas_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::Lambdas>>(handle)))
        : 0;
}
const void* smoke_Lambdas_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<std::shared_ptr<::smoke::Lambdas>>(handle)->get())
        : nullptr;
}
void smoke_Lambdas_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<std::shared_ptr<::smoke::Lambdas>>(handle)->get(), swift_pointer);
}
void smoke_Lambdas_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<std::shared_ptr<::smoke::Lambdas>>(handle)->get());
}
_baseRef smoke_Lambdas_deconfuse(_baseRef _instance, _baseRef value, _baseRef confuser) {
    return Conversion<::smoke::Lambdas::Producer>::toBaseRef(get_pointer<std::shared_ptr<::smoke::Lambdas>>(_instance)->get()->deconfuse(Conversion<std::string>::toCpp(value), Conversion<::smoke::Lambdas::Confuser>::toCpp(confuser)));
}
_baseRef smoke_Lambdas_fuse(_baseRef items, _baseRef callback) {
    return Conversion<std::unordered_map<int32_t, std::string>>::toBaseRef(::smoke::Lambdas::fuse(Conversion<std::vector<std::string>>::toCpp(items), Conversion<::smoke::Lambdas::Indexer>::toCpp(callback)));
}
void smoke_Lambdas_Producer_release_handle(_baseRef handle) {
    delete get_pointer<::smoke::Lambdas::Producer>(handle);
}
_baseRef smoke_Lambdas_Producer_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::smoke::Lambdas::Producer>(handle)))
        : 0;
}
_baseRef smoke_Lambdas_Producer_call(_baseRef _instance) {
    return Conversion<std::string>::toBaseRef(get_pointer<::smoke::Lambdas::Producer>(_instance)->operator()());
}
class smoke_Lambdas_ProducerProxy : public CachedProxyBase<smoke_Lambdas_ProducerProxy> {
public:
    smoke_Lambdas_ProducerProxy(smoke_Lambdas_Producer_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_Lambdas_ProducerProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    ::std::string operator()() {
        auto _call_result = mFunctions.smoke_Lambdas_Producer_call(mFunctions.swift_pointer);
        return Conversion<std::string>::toCppReturn(_call_result);
    }
private:
    smoke_Lambdas_Producer_FunctionTable mFunctions;
};
_baseRef smoke_Lambdas_Producer_create_proxy(smoke_Lambdas_Producer_FunctionTable functionTable) {
    auto proxy = smoke_Lambdas_ProducerProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::smoke::Lambdas::Producer(std::bind(&smoke_Lambdas_ProducerProxy::operator(), proxy))) : 0;
}
_baseRef smoke_Lambdas_Producer_create_optional_proxy(smoke_Lambdas_Producer_FunctionTable functionTable) {
    auto proxy = smoke_Lambdas_ProducerProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new (std::nothrow) ::gluecodium::optional<::smoke::Lambdas::Producer>(std::bind(&smoke_Lambdas_ProducerProxy::operator(), proxy))) : 0;
}
const void* smoke_Lambdas_Producer_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_Lambdas_ProducerProxy::get_swift_object(get_pointer<::smoke::Lambdas::Producer>(handle)) : nullptr;
}
void smoke_Lambdas_Confuser_release_handle(_baseRef handle) {
    delete get_pointer<::smoke::Lambdas::Confuser>(handle);
}
_baseRef smoke_Lambdas_Confuser_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::smoke::Lambdas::Confuser>(handle)))
        : 0;
}
_baseRef smoke_Lambdas_Confuser_call(_baseRef _instance, _baseRef p0) {
    return Conversion<::smoke::Lambdas::Producer>::toBaseRef(get_pointer<::smoke::Lambdas::Confuser>(_instance)->operator()(Conversion<std::string>::toCpp(p0)));
}
class smoke_Lambdas_ConfuserProxy : public CachedProxyBase<smoke_Lambdas_ConfuserProxy> {
public:
    smoke_Lambdas_ConfuserProxy(smoke_Lambdas_Confuser_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_Lambdas_ConfuserProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    ::smoke::Lambdas::Producer operator()(const std::string& p0) {
        auto _call_result = mFunctions.smoke_Lambdas_Confuser_call(mFunctions.swift_pointer, Conversion<std::string>::toBaseRef(p0));
        return Conversion<::smoke::Lambdas::Producer>::toCppReturn(_call_result);
    }
private:
    smoke_Lambdas_Confuser_FunctionTable mFunctions;
};
_baseRef smoke_Lambdas_Confuser_create_proxy(smoke_Lambdas_Confuser_FunctionTable functionTable) {
    auto proxy = smoke_Lambdas_ConfuserProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::smoke::Lambdas::Confuser(std::bind(&smoke_Lambdas_ConfuserProxy::operator(), proxy, std::placeholders::_1))) : 0;
}
_baseRef smoke_Lambdas_Confuser_create_optional_proxy(smoke_Lambdas_Confuser_FunctionTable functionTable) {
    auto proxy = smoke_Lambdas_ConfuserProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new (std::nothrow) ::gluecodium::optional<::smoke::Lambdas::Confuser>(std::bind(&smoke_Lambdas_ConfuserProxy::operator(), proxy, std::placeholders::_1))) : 0;
}
const void* smoke_Lambdas_Confuser_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_Lambdas_ConfuserProxy::get_swift_object(get_pointer<::smoke::Lambdas::Confuser>(handle)) : nullptr;
}
void smoke_Lambdas_Consumer_release_handle(_baseRef handle) {
    delete get_pointer<::smoke::Lambdas::Consumer>(handle);
}
_baseRef smoke_Lambdas_Consumer_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::smoke::Lambdas::Consumer>(handle)))
        : 0;
}
void smoke_Lambdas_Consumer_call(_baseRef _instance, _baseRef p0) {
    return get_pointer<::smoke::Lambdas::Consumer>(_instance)->operator()(Conversion<std::string>::toCpp(p0));
}
class smoke_Lambdas_ConsumerProxy : public CachedProxyBase<smoke_Lambdas_ConsumerProxy> {
public:
    smoke_Lambdas_ConsumerProxy(smoke_Lambdas_Consumer_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_Lambdas_ConsumerProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    void operator()(const std::string& p0) {
        mFunctions.smoke_Lambdas_Consumer_call(mFunctions.swift_pointer, Conversion<std::string>::toBaseRef(p0));
    }
private:
    smoke_Lambdas_Consumer_FunctionTable mFunctions;
};
_baseRef smoke_Lambdas_Consumer_create_proxy(smoke_Lambdas_Consumer_FunctionTable functionTable) {
    auto proxy = smoke_Lambdas_ConsumerProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::smoke::Lambdas::Consumer(std::bind(&smoke_Lambdas_ConsumerProxy::operator(), proxy, std::placeholders::_1))) : 0;
}
_baseRef smoke_Lambdas_Consumer_create_optional_proxy(smoke_Lambdas_Consumer_FunctionTable functionTable) {
    auto proxy = smoke_Lambdas_ConsumerProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new (std::nothrow) ::gluecodium::optional<::smoke::Lambdas::Consumer>(std::bind(&smoke_Lambdas_ConsumerProxy::operator(), proxy, std::placeholders::_1))) : 0;
}
const void* smoke_Lambdas_Consumer_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_Lambdas_ConsumerProxy::get_swift_object(get_pointer<::smoke::Lambdas::Consumer>(handle)) : nullptr;
}
void smoke_Lambdas_Indexer_release_handle(_baseRef handle) {
    delete get_pointer<::smoke::Lambdas::Indexer>(handle);
}
_baseRef smoke_Lambdas_Indexer_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::smoke::Lambdas::Indexer>(handle)))
        : 0;
}
int32_t smoke_Lambdas_Indexer_call(_baseRef _instance, _baseRef p0, float p1) {
    return get_pointer<::smoke::Lambdas::Indexer>(_instance)->operator()(Conversion<std::string>::toCpp(p0), p1);
}
class smoke_Lambdas_IndexerProxy : public CachedProxyBase<smoke_Lambdas_IndexerProxy> {
public:
    smoke_Lambdas_IndexerProxy(smoke_Lambdas_Indexer_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_Lambdas_IndexerProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    int32_t operator()(const std::string& p0, float p1) {
        auto _call_result = mFunctions.smoke_Lambdas_Indexer_call(mFunctions.swift_pointer, Conversion<std::string>::toBaseRef(p0), p1);
        return _call_result;
    }
private:
    smoke_Lambdas_Indexer_FunctionTable mFunctions;
};
_baseRef smoke_Lambdas_Indexer_create_proxy(smoke_Lambdas_Indexer_FunctionTable functionTable) {
    auto proxy = smoke_Lambdas_IndexerProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::smoke::Lambdas::Indexer(std::bind(&smoke_Lambdas_IndexerProxy::operator(), proxy, std::placeholders::_1, std::placeholders::_2))) : 0;
}
_baseRef smoke_Lambdas_Indexer_create_optional_proxy(smoke_Lambdas_Indexer_FunctionTable functionTable) {
    auto proxy = smoke_Lambdas_IndexerProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new (std::nothrow) ::gluecodium::optional<::smoke::Lambdas::Indexer>(std::bind(&smoke_Lambdas_IndexerProxy::operator(), proxy, std::placeholders::_1, std::placeholders::_2))) : 0;
}
const void* smoke_Lambdas_Indexer_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_Lambdas_IndexerProxy::get_swift_object(get_pointer<::smoke::Lambdas::Indexer>(handle)) : nullptr;
}
void smoke_Lambdas_NullableConfuser_release_handle(_baseRef handle) {
    delete get_pointer<::smoke::Lambdas::NullableConfuser>(handle);
}
_baseRef smoke_Lambdas_NullableConfuser_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::smoke::Lambdas::NullableConfuser>(handle)))
        : 0;
}
_baseRef smoke_Lambdas_NullableConfuser_call(_baseRef _instance, _baseRef p0) {
    return Conversion<::gluecodium::optional< ::smoke::Lambdas::Producer >>::toBaseRef(get_pointer<::smoke::Lambdas::NullableConfuser>(_instance)->operator()(Conversion<::gluecodium::optional< ::std::string >>::toCpp(p0)));
}
class smoke_Lambdas_NullableConfuserProxy : public CachedProxyBase<smoke_Lambdas_NullableConfuserProxy> {
public:
    smoke_Lambdas_NullableConfuserProxy(smoke_Lambdas_NullableConfuser_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_Lambdas_NullableConfuserProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    ::gluecodium::optional< ::smoke::Lambdas::Producer > operator()(const ::gluecodium::optional< ::std::string >& p0) {
        auto _call_result = mFunctions.smoke_Lambdas_NullableConfuser_call(mFunctions.swift_pointer, Conversion<::gluecodium::optional< ::std::string >>::toBaseRef(p0));
        return Conversion<::gluecodium::optional< ::smoke::Lambdas::Producer >>::toCppReturn(_call_result);
    }
private:
    smoke_Lambdas_NullableConfuser_FunctionTable mFunctions;
};
_baseRef smoke_Lambdas_NullableConfuser_create_proxy(smoke_Lambdas_NullableConfuser_FunctionTable functionTable) {
    auto proxy = smoke_Lambdas_NullableConfuserProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::smoke::Lambdas::NullableConfuser(std::bind(&smoke_Lambdas_NullableConfuserProxy::operator(), proxy, std::placeholders::_1))) : 0;
}
_baseRef smoke_Lambdas_NullableConfuser_create_optional_proxy(smoke_Lambdas_NullableConfuser_FunctionTable functionTable) {
    auto proxy = smoke_Lambdas_NullableConfuserProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new (std::nothrow) ::gluecodium::optional<::smoke::Lambdas::NullableConfuser>(std::bind(&smoke_Lambdas_NullableConfuserProxy::operator(), proxy, std::placeholders::_1))) : 0;
}
const void* smoke_Lambdas_NullableConfuser_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_Lambdas_NullableConfuserProxy::get_swift_object(get_pointer<::smoke::Lambdas::NullableConfuser>(handle)) : nullptr;
}

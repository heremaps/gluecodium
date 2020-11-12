//
//
#include "cbridge/include/smoke/cbridge_ListenersWithReturnValues.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/CalculationResult.h"
#include "smoke/ListenersWithReturnValues.h"
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
#include <vector>
void smoke_ListenersWithReturnValues_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(handle);
}
_baseRef smoke_ListenersWithReturnValues_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(handle)))
        : 0;
}
const void* smoke_ListenersWithReturnValues_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(handle)->get())
        : nullptr;
}
void smoke_ListenersWithReturnValues_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(handle)->get(), swift_pointer);
}
void smoke_ListenersWithReturnValues_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_ListenersWithReturnValues(_baseRef handle);
}
namespace {
struct smoke_ListenersWithReturnValuesRegisterInit {
    smoke_ListenersWithReturnValuesRegisterInit() {
        get_init_repository().add_init("smoke_ListenersWithReturnValues", &_CBridgeInitsmoke_ListenersWithReturnValues);
    }
} s_smoke_ListenersWithReturnValues_register_init;
}
void* smoke_ListenersWithReturnValues_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository(static_cast<::std::shared_ptr< ::smoke::ListenersWithReturnValues >::element_type*>(nullptr)).get_id(get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_ListenersWithReturnValues(handle);
}
_baseRef
smoke_ListenersWithReturnValues_ResultStruct_create_handle( double result )
{
    ::smoke::ListenersWithReturnValues::ResultStruct* _struct = new ( ::std::nothrow ) ::smoke::ListenersWithReturnValues::ResultStruct();
    _struct->result = result;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_ListenersWithReturnValues_ResultStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::ListenersWithReturnValues::ResultStruct>( handle );
}
_baseRef
smoke_ListenersWithReturnValues_ResultStruct_create_optional_handle(double result)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::ListenersWithReturnValues::ResultStruct>( ::smoke::ListenersWithReturnValues::ResultStruct( ) );
    (*_struct)->result = result;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_ListenersWithReturnValues_ResultStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::ListenersWithReturnValues::ResultStruct>*>( handle ) );
}
void smoke_ListenersWithReturnValues_ResultStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::ListenersWithReturnValues::ResultStruct>*>( handle );
}
double smoke_ListenersWithReturnValues_ResultStruct_result_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::ListenersWithReturnValues::ResultStruct>(handle);
    return struct_pointer->result;
}
double smoke_ListenersWithReturnValues_fetchDataDouble(_baseRef _instance) {
    return get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(_instance)->get()->fetch_data_double();
}
_baseRef smoke_ListenersWithReturnValues_fetchDataString(_baseRef _instance) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(_instance)->get()->fetch_data_string());
}
_baseRef smoke_ListenersWithReturnValues_fetchDataStruct(_baseRef _instance) {
    return Conversion<::smoke::ListenersWithReturnValues::ResultStruct>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(_instance)->get()->fetch_data_struct());
}
smoke_ListenersWithReturnValues_ResultEnum smoke_ListenersWithReturnValues_fetchDataEnum(_baseRef _instance) {
    return static_cast<smoke_ListenersWithReturnValues_ResultEnum>(get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(_instance)->get()->fetch_data_enum());
}
_baseRef smoke_ListenersWithReturnValues_fetchDataArray(_baseRef _instance) {
    return Conversion<::std::vector< double >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(_instance)->get()->fetch_data_array());
}
_baseRef smoke_ListenersWithReturnValues_fetchDataMap(_baseRef _instance) {
    return Conversion<::std::unordered_map< ::std::string, double >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(_instance)->get()->fetch_data_map());
}
_baseRef smoke_ListenersWithReturnValues_fetchDataInstance(_baseRef _instance) {
    return Conversion<::std::shared_ptr< ::smoke::CalculationResult >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(_instance)->get()->fetch_data_instance());
}
class smoke_ListenersWithReturnValuesProxy : public ::std::shared_ptr< ::smoke::ListenersWithReturnValues >::element_type, public CachedProxyBase<smoke_ListenersWithReturnValuesProxy> {
public:
    smoke_ListenersWithReturnValuesProxy(smoke_ListenersWithReturnValues_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_ListenersWithReturnValuesProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_ListenersWithReturnValuesProxy(const smoke_ListenersWithReturnValuesProxy&) = delete;
    smoke_ListenersWithReturnValuesProxy& operator=(const smoke_ListenersWithReturnValuesProxy&) = delete;
    double fetch_data_double() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchDataDouble(mFunctions.swift_pointer);
        return _call_result;
    }
    ::std::string fetch_data_string() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchDataString(mFunctions.swift_pointer);
        return Conversion<::std::string>::toCppReturn(_call_result);
    }
    ::smoke::ListenersWithReturnValues::ResultStruct fetch_data_struct() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchDataStruct(mFunctions.swift_pointer);
        return Conversion<::smoke::ListenersWithReturnValues::ResultStruct>::toCppReturn(_call_result);
    }
    ::smoke::ListenersWithReturnValues::ResultEnum fetch_data_enum() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchDataEnum(mFunctions.swift_pointer);
        return static_cast<::smoke::ListenersWithReturnValues::ResultEnum>(_call_result);
    }
    ::std::vector< double > fetch_data_array() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchDataArray(mFunctions.swift_pointer);
        return Conversion<::std::vector< double >>::toCppReturn(_call_result);
    }
    ::smoke::ListenersWithReturnValues::StringToDouble fetch_data_map() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchDataMap(mFunctions.swift_pointer);
        return Conversion<::std::unordered_map< ::std::string, double >>::toCppReturn(_call_result);
    }
    ::std::shared_ptr< ::smoke::CalculationResult > fetch_data_instance() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchDataInstance(mFunctions.swift_pointer);
        return Conversion<::std::shared_ptr< ::smoke::CalculationResult >>::toCppReturn(_call_result);
    }
private:
    smoke_ListenersWithReturnValues_FunctionTable mFunctions;
};
_baseRef smoke_ListenersWithReturnValues_create_proxy(smoke_ListenersWithReturnValues_FunctionTable functionTable) {
    auto proxy = smoke_ListenersWithReturnValuesProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::ListenersWithReturnValues >(proxy)) : 0;
}
const void* smoke_ListenersWithReturnValues_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_ListenersWithReturnValuesProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::ListenersWithReturnValues >>(handle)->get()) : nullptr;
}

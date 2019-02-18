//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_ListenersWithReturnValues.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "smoke/CalculationResult.h"
#include "smoke/ListenersWithReturnValues.h"
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
#include <vector>
void smoke_ListenersWithReturnValues_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(handle);
}
_baseRef smoke_ListenersWithReturnValues_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(handle)))
        : 0;
}
_baseRef
smoke_ListenersWithReturnValues_ResultStruct_create_handle( double result )
{
    ::smoke::ListenersWithReturnValues::ResultStruct* _struct = new ( std::nothrow ) ::smoke::ListenersWithReturnValues::ResultStruct();
    _struct->result = result;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_ListenersWithReturnValues_ResultStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::ListenersWithReturnValues::ResultStruct>( handle );
}
_baseRef
smoke_ListenersWithReturnValues_ResultStruct_make_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<::smoke::ListenersWithReturnValues::ResultStruct>( reinterpret_cast<::smoke::ListenersWithReturnValues::ResultStruct*>( handle ) ) );
}
_baseRef
smoke_ListenersWithReturnValues_ResultStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<::smoke::ListenersWithReturnValues::ResultStruct>*>( handle )->get( ) );
}
void smoke_ListenersWithReturnValues_ResultStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::ListenersWithReturnValues::ResultStruct>*>( handle );
}
double smoke_ListenersWithReturnValues_ResultStruct_result_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::ListenersWithReturnValues::ResultStruct>(handle);
return struct_pointer->result;
}
double smoke_ListenersWithReturnValues_fetchData_double(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data()
;
}
_baseRef smoke_ListenersWithReturnValues_fetchData_string(_baseRef _instance) {
    return Conversion<std::string>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data())
;
}
_baseRef smoke_ListenersWithReturnValues_fetchData_Struct(_baseRef _instance) {
    return Conversion<::smoke::ListenersWithReturnValues::ResultStruct>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data())
;
}
smoke_ListenersWithReturnValues_ResultEnum smoke_ListenersWithReturnValues_fetchData_enum(_baseRef _instance) {
    return static_cast<smoke_ListenersWithReturnValues_ResultEnum>(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data())
;
}
_baseRef smoke_ListenersWithReturnValues_fetchData_Array(_baseRef _instance) {
    return Conversion<std::vector<double>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data())
;
}
_baseRef smoke_ListenersWithReturnValues_fetchData_Map(_baseRef _instance) {
    return Conversion<::smoke::ListenersWithReturnValues::StringToDouble>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data())
;
}
_baseRef smoke_ListenersWithReturnValues_fetchData_instance(_baseRef _instance) {
    return Conversion<std::shared_ptr<::smoke::CalculationResult>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data())
;
}
class smoke_ListenersWithReturnValuesProxy : public std::shared_ptr<::smoke::ListenersWithReturnValues>::element_type, public CachedProxyBase<smoke_ListenersWithReturnValuesProxy> {
public:
    smoke_ListenersWithReturnValuesProxy(smoke_ListenersWithReturnValues_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_ListenersWithReturnValuesProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    double fetch_data() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchData_double(mFunctions.swift_pointer);
        return _call_result;
    }
    ::std::string fetch_data() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchData_string(mFunctions.swift_pointer);
        return Conversion<std::string>::toCppReturn(_call_result);
    }
    ::smoke::ListenersWithReturnValues::ResultStruct fetch_data() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchData_Struct(mFunctions.swift_pointer);
        return Conversion<::smoke::ListenersWithReturnValues::ResultStruct>::toCppReturn(_call_result);
    }
    ::smoke::ListenersWithReturnValues::ResultEnum fetch_data() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchData_enum(mFunctions.swift_pointer);
        return static_cast<::smoke::ListenersWithReturnValues::ResultEnum>(_call_result);
    }
    ::std::vector< double > fetch_data() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchData_Array(mFunctions.swift_pointer);
        return Conversion<std::vector<double>>::toCppReturn(_call_result);
    }
    ::smoke::ListenersWithReturnValues::StringToDouble fetch_data() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchData_Map(mFunctions.swift_pointer);
        return Conversion<::smoke::ListenersWithReturnValues::StringToDouble>::toCppReturn(_call_result);
    }
    ::std::shared_ptr< ::smoke::CalculationResult > fetch_data() override {
        auto _call_result = mFunctions.smoke_ListenersWithReturnValues_fetchData_instance(mFunctions.swift_pointer);
        return Conversion<std::shared_ptr<::smoke::CalculationResult>>::toCppReturn(_call_result);
    }
private:
    smoke_ListenersWithReturnValues_FunctionTable mFunctions;
};
_baseRef smoke_ListenersWithReturnValues_create_proxy(smoke_ListenersWithReturnValues_FunctionTable functionTable) {
    auto proxy = smoke_ListenersWithReturnValuesProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new std::shared_ptr<::smoke::ListenersWithReturnValues>(std::move(proxy))) : 0;
}
const void* smoke_ListenersWithReturnValues_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_ListenersWithReturnValuesProxy::get_swift_object(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(handle)->get()) : nullptr;
}
_baseRef smoke_ListenersWithReturnValues_StringToDouble_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<std::string, double>() );
}
void smoke_ListenersWithReturnValues_StringToDouble_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<std::string, double>>(handle);
}
_baseRef smoke_ListenersWithReturnValues_StringToDouble_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<std::string, double>::iterator( get_pointer<std::unordered_map<std::string, double>>(handle)->begin() ) );
}
void smoke_ListenersWithReturnValues_StringToDouble_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle );
}
void smoke_ListenersWithReturnValues_StringToDouble_put(_baseRef handle, _baseRef key, double value) {
    (*get_pointer<std::unordered_map<std::string, double>>(handle)).emplace(std::move(Conversion<std::string>::toCpp(key)), std::move(value));
}
bool smoke_ListenersWithReturnValues_StringToDouble_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<std::string, double>>(handle)->end();
}
void smoke_ListenersWithReturnValues_StringToDouble_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle );
}
_baseRef smoke_ListenersWithReturnValues_StringToDouble_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ))->first;
    return Conversion<std::string>::toBaseRef(key);
}
double smoke_ListenersWithReturnValues_StringToDouble_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ))->second;
    return value;
}
_baseRef smoke_ListenersWithReturnValues_StringToDouble_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::shared_ptr<std::unordered_map<std::string, double>>( new ( std::nothrow ) std::unordered_map<std::string, double>( ) ) );
}
void smoke_ListenersWithReturnValues_StringToDouble_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::shared_ptr<std::unordered_map<std::string, double>>*>( handle );
}
_baseRef smoke_ListenersWithReturnValues_StringToDouble_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( reinterpret_cast<std::shared_ptr<std::unordered_map<std::string, double>>*>( handle )->get( ) );
}
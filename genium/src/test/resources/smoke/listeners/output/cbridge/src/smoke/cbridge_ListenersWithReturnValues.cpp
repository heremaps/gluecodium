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
void smoke_ListenersWithReturnValues_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(handle);
}
_baseRef smoke_ListenersWithReturnValues_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(handle)))
        : 0;
}
_baseRef smoke_ListenersWithReturnValues_ResultStruct_create(double result) {
    ::smoke::ListenersWithReturnValues::ResultStruct* _struct = new ::smoke::ListenersWithReturnValues::ResultStruct();
    _struct->result = result;
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_ListenersWithReturnValues_ResultStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::ListenersWithReturnValues::ResultStruct>(handle);
}
double smoke_ListenersWithReturnValues_ResultStruct_result_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::ListenersWithReturnValues::ResultStruct>(handle);
    return struct_pointer->result;
}
double smoke_ListenersWithReturnValues_fetchData_double(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data();
}
_baseRef smoke_ListenersWithReturnValues_fetchData_string(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new std::string(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data()) );
}
_baseRef smoke_ListenersWithReturnValues_fetchData_Struct(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new ::smoke::ListenersWithReturnValues::ResultStruct(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data()) );
}
smoke_ListenersWithReturnValues_ResultEnum smoke_ListenersWithReturnValues_fetchData_enum(_baseRef _instance) {
    return static_cast<smoke_ListenersWithReturnValues_ResultEnum>(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data());
}
_baseRef smoke_ListenersWithReturnValues_fetchData_Array(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new std::vector<double>(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data()) );
}
_baseRef smoke_ListenersWithReturnValues_fetchData_Map(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, double>(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data()) );
}
_baseRef smoke_ListenersWithReturnValues_fetchData_instance(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( checked_pointer_copy(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(_instance)->get()->fetch_data()) );
}
class smoke_ListenersWithReturnValuesProxy : public std::shared_ptr<::smoke::ListenersWithReturnValues>::element_type, public CachedProxyBase<smoke_ListenersWithReturnValuesProxy> {
public:
    using function_table_t = smoke_ListenersWithReturnValues_FunctionTable;
    smoke_ListenersWithReturnValuesProxy(smoke_ListenersWithReturnValues_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_ListenersWithReturnValuesProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    double fetch_data() override {
        return mFunctions.smoke_ListenersWithReturnValues_fetchData_double(mFunctions.swift_pointer);
    }
    std::string fetch_data() override {
        auto _return_value_ptr = get_pointer<std::string>(mFunctions.smoke_ListenersWithReturnValues_fetchData_string(mFunctions.swift_pointer));
        auto _return_value(*_return_value_ptr);
        delete _return_value_ptr;
        return _return_value;
    }
    ::smoke::ListenersWithReturnValues::ResultStruct fetch_data() override {
        auto _return_value_ptr = get_pointer<::smoke::ListenersWithReturnValues::ResultStruct>(mFunctions.smoke_ListenersWithReturnValues_fetchData_Struct(mFunctions.swift_pointer));
        auto _return_value(*_return_value_ptr);
        delete _return_value_ptr;
        return _return_value;
    }
    ::smoke::ListenersWithReturnValues::ResultEnum fetch_data() override {
        return static_cast<::smoke::ListenersWithReturnValues::ResultEnum>(mFunctions.smoke_ListenersWithReturnValues_fetchData_enum(mFunctions.swift_pointer));
    }
    std::vector<double> fetch_data() override {
        auto _return_value_ptr = get_pointer<std::vector<double>>(mFunctions.smoke_ListenersWithReturnValues_fetchData_Array(mFunctions.swift_pointer));
        auto _return_value(*_return_value_ptr);
        delete _return_value_ptr;
        return _return_value;
    }
    ::smoke::ListenersWithReturnValues::StringToDouble fetch_data() override {
        auto _return_value_ptr = get_pointer<::smoke::ListenersWithReturnValues::StringToDouble>(mFunctions.smoke_ListenersWithReturnValues_fetchData_Map(mFunctions.swift_pointer));
        auto _return_value(*_return_value_ptr);
        delete _return_value_ptr;
        return _return_value;
    }
    std::shared_ptr<::smoke::CalculationResult> fetch_data() override {
        auto _return_value_ptr = get_pointer<std::shared_ptr<::smoke::CalculationResult>>(mFunctions.smoke_ListenersWithReturnValues_fetchData_instance(mFunctions.swift_pointer));
        auto _return_value(*_return_value_ptr);
        delete _return_value_ptr;
        return _return_value;
    }
private:
    function_table_t mFunctions;
};
_baseRef smoke_ListenersWithReturnValues_createProxy(smoke_ListenersWithReturnValues_FunctionTable functionTable) {
    auto proxy = smoke_ListenersWithReturnValuesProxy::get_proxy(std::move(functionTable));
    if (proxy) {
        return reinterpret_cast<_baseRef>( new std::shared_ptr<::smoke::ListenersWithReturnValues>(std::move(proxy)) );
    } else {
        return 0;
    }
}
const void* smoke_ListenersWithReturnValues_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_ListenersWithReturnValuesProxy::get_swift_object(get_pointer<std::shared_ptr<::smoke::ListenersWithReturnValues>>(handle)->get()) : nullptr;
}
_baseRef smoke_ListenersWithReturnValues_StringToDouble_create() {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, double>() );
}
void smoke_ListenersWithReturnValues_StringToDouble_release(_baseRef handle) {
    delete get_pointer<std::unordered_map<std::string, double>>(handle);
}
_baseRef smoke_ListenersWithReturnValues_StringToDouble_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, double>::iterator( get_pointer<std::unordered_map<std::string, double>>(handle)->begin() ) );
}
void smoke_ListenersWithReturnValues_StringToDouble_iterator_release(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle );
}
void smoke_ListenersWithReturnValues_StringToDouble_put(_baseRef handle, _baseRef key, double value) {
    (*get_pointer<std::unordered_map<std::string, double>>(handle))[*get_pointer<std::string>(key)] = value;
}
bool smoke_ListenersWithReturnValues_StringToDouble_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<std::string, double>>(handle)->end();
}
void smoke_ListenersWithReturnValues_StringToDouble_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle );
}
_baseRef smoke_ListenersWithReturnValues_StringToDouble_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ))->first;
    return reinterpret_cast<_baseRef>(new std::string { key });
}
double smoke_ListenersWithReturnValues_StringToDouble_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ))->second;
    return value;
}

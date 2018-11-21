//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_ListenerWithAttributes.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "smoke/CalculationResult.h"
#include "smoke/ListenerWithAttributes.h"
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
#include <vector>
void smoke_ListenerWithAttributes_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(handle);
}
_baseRef smoke_ListenerWithAttributes_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(handle)))
        : 0;
}
_baseRef smoke_ListenerWithAttributes_ResultStruct_create(double result) {
    ::smoke::ListenerWithAttributes::ResultStruct* _struct = new ::smoke::ListenerWithAttributes::ResultStruct();
    _struct->result = result;
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_ListenerWithAttributes_ResultStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::ListenerWithAttributes::ResultStruct>(handle);
}
double smoke_ListenerWithAttributes_ResultStruct_result_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::ListenerWithAttributes::ResultStruct>(handle);
    return struct_pointer->result;
}
_baseRef smoke_ListenerWithAttributes_message_get(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new std::string(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_message()) );
}
void smoke_ListenerWithAttributes_message_set(_baseRef _instance, const char* newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_message(std::string(newValue));
}
_baseRef smoke_ListenerWithAttributes_packedMessage_get(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( checked_pointer_copy(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_packed_message()) );
}
void smoke_ListenerWithAttributes_packedMessage_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_packed_message(newValue ? *get_pointer<std::shared_ptr<::smoke::CalculationResult>>(newValue) : nullptr);
}
_baseRef smoke_ListenerWithAttributes_structuredMessage_get(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new ::smoke::ListenerWithAttributes::ResultStruct(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_structured_message()) );
}
void smoke_ListenerWithAttributes_structuredMessage_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_structured_message(*get_pointer<::smoke::ListenerWithAttributes::ResultStruct>(newValue));
}
smoke_ListenerWithAttributes_ResultEnum smoke_ListenerWithAttributes_enumeratedMessage_get(_baseRef _instance) {
    return static_cast<smoke_ListenerWithAttributes_ResultEnum>(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_enumerated_message());
}
void smoke_ListenerWithAttributes_enumeratedMessage_set(_baseRef _instance, smoke_ListenerWithAttributes_ResultEnum newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_enumerated_message(static_cast<::smoke::ListenerWithAttributes::ResultEnum>(newValue));
}
_baseRef smoke_ListenerWithAttributes_arrayedMessage_get(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new std::vector<std::string>(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_arrayed_message()) );
}
void smoke_ListenerWithAttributes_arrayedMessage_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_arrayed_message(*get_pointer<std::vector<std::string>>(newValue));
}
_baseRef smoke_ListenerWithAttributes_mappedMessage_get(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, double>(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_mapped_message()) );
}
void smoke_ListenerWithAttributes_mappedMessage_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_mapped_message(*get_pointer<std::unordered_map<std::string, double>>(newValue));
}
_baseRef smoke_ListenerWithAttributes_bufferedMessage_get(_baseRef _instance) {
    return reinterpret_cast<_baseRef>( new ::std::shared_ptr< ::std::vector< uint8_t > >(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_buffered_message()) );
}
void smoke_ListenerWithAttributes_bufferedMessage_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_buffered_message(*get_pointer<::std::shared_ptr< ::std::vector< uint8_t > >>(newValue));
}
class smoke_ListenerWithAttributesProxy : public std::shared_ptr<::smoke::ListenerWithAttributes>::element_type, public CachedProxyBase<smoke_ListenerWithAttributesProxy> {
public:
    using function_table_t = smoke_ListenerWithAttributes_FunctionTable;
    smoke_ListenerWithAttributesProxy(smoke_ListenerWithAttributes_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_ListenerWithAttributesProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    std::string get_message() const override {
        auto _return_value_ptr = get_pointer<std::string>(mFunctions.smoke_ListenerWithAttributes_message_get(mFunctions.swift_pointer));
        auto _return_value(*_return_value_ptr);
        delete _return_value_ptr;
        return _return_value;
    }
    void set_message(const std::string& newValue) override {
        return mFunctions.smoke_ListenerWithAttributes_message_set(mFunctions.swift_pointer, std_string_create(newValue.c_str()));
    }
    std::shared_ptr<::smoke::CalculationResult> get_packed_message() const override {
        auto _return_value_ptr = get_pointer<std::shared_ptr<::smoke::CalculationResult>>(mFunctions.smoke_ListenerWithAttributes_packedMessage_get(mFunctions.swift_pointer));
        auto _return_value(*_return_value_ptr);
        delete _return_value_ptr;
        return _return_value;
    }
    void set_packed_message(const std::shared_ptr<::smoke::CalculationResult>& newValue) override {
        return mFunctions.smoke_ListenerWithAttributes_packedMessage_set(mFunctions.swift_pointer, reinterpret_cast<_baseRef>( new std::shared_ptr<::smoke::CalculationResult>(newValue) ));
    }
    ::smoke::ListenerWithAttributes::ResultStruct get_structured_message() const override {
        auto _return_value_ptr = get_pointer<::smoke::ListenerWithAttributes::ResultStruct>(mFunctions.smoke_ListenerWithAttributes_structuredMessage_get(mFunctions.swift_pointer));
        auto _return_value(*_return_value_ptr);
        delete _return_value_ptr;
        return _return_value;
    }
    void set_structured_message(const ::smoke::ListenerWithAttributes::ResultStruct& newValue) override {
        return mFunctions.smoke_ListenerWithAttributes_structuredMessage_set(mFunctions.swift_pointer, reinterpret_cast<_baseRef>( new ::smoke::ListenerWithAttributes::ResultStruct(newValue) ));
    }
    ::smoke::ListenerWithAttributes::ResultEnum get_enumerated_message() const override {
        return static_cast<::smoke::ListenerWithAttributes::ResultEnum>(mFunctions.smoke_ListenerWithAttributes_enumeratedMessage_get(mFunctions.swift_pointer));
    }
    void set_enumerated_message(const ::smoke::ListenerWithAttributes::ResultEnum newValue) override {
        return mFunctions.smoke_ListenerWithAttributes_enumeratedMessage_set(mFunctions.swift_pointer, static_cast<uint32_t>(newValue));
    }
    std::vector<std::string> get_arrayed_message() const override {
        auto _return_value_ptr = get_pointer<std::vector<std::string>>(mFunctions.smoke_ListenerWithAttributes_arrayedMessage_get(mFunctions.swift_pointer));
        auto _return_value(*_return_value_ptr);
        delete _return_value_ptr;
        return _return_value;
    }
    void set_arrayed_message(const std::vector<std::string>& newValue) override {
        return mFunctions.smoke_ListenerWithAttributes_arrayedMessage_set(mFunctions.swift_pointer, reinterpret_cast<_baseRef>( new std::vector<std::string>(newValue) ));
    }
    ::smoke::ListenerWithAttributes::StringToDouble get_mapped_message() const override {
        auto _return_value_ptr = get_pointer<::smoke::ListenerWithAttributes::StringToDouble>(mFunctions.smoke_ListenerWithAttributes_mappedMessage_get(mFunctions.swift_pointer));
        auto _return_value(*_return_value_ptr);
        delete _return_value_ptr;
        return _return_value;
    }
    void set_mapped_message(const ::smoke::ListenerWithAttributes::StringToDouble& newValue) override {
        return mFunctions.smoke_ListenerWithAttributes_mappedMessage_set(mFunctions.swift_pointer, reinterpret_cast<_baseRef>( new ::smoke::ListenerWithAttributes::StringToDouble(newValue) ));
    }
    ::std::shared_ptr< ::std::vector< uint8_t > > get_buffered_message() const override {
        auto _return_value_ptr = get_pointer<::std::shared_ptr< ::std::vector< uint8_t > >>(mFunctions.smoke_ListenerWithAttributes_bufferedMessage_get(mFunctions.swift_pointer));
        auto _return_value(*_return_value_ptr);
        delete _return_value_ptr;
        return _return_value;
    }
    void set_buffered_message(const ::std::shared_ptr< ::std::vector< uint8_t > >& newValue) override {
        return mFunctions.smoke_ListenerWithAttributes_bufferedMessage_set(mFunctions.swift_pointer, reinterpret_cast<_baseRef>( new ::std::shared_ptr< ::std::vector< uint8_t > >(newValue) ));
    }
private:
    function_table_t mFunctions;
};
_baseRef smoke_ListenerWithAttributes_createProxy(smoke_ListenerWithAttributes_FunctionTable functionTable) {
    auto proxy = smoke_ListenerWithAttributesProxy::get_proxy(std::move(functionTable));
    if (proxy) {
        return reinterpret_cast<_baseRef>( new std::shared_ptr<::smoke::ListenerWithAttributes>(std::move(proxy)) );
    } else {
        return 0;
    }
}
const void* smoke_ListenerWithAttributes_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_ListenerWithAttributesProxy::get_swift_object(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(handle)->get()) : nullptr;
}
_baseRef smoke_ListenerWithAttributes_StringToDouble_create() {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, double>() );
}
void smoke_ListenerWithAttributes_StringToDouble_release(_baseRef handle) {
    delete get_pointer<std::unordered_map<std::string, double>>(handle);
}
_baseRef smoke_ListenerWithAttributes_StringToDouble_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new std::unordered_map<std::string, double>::iterator( get_pointer<std::unordered_map<std::string, double>>(handle)->begin() ) );
}
void smoke_ListenerWithAttributes_StringToDouble_iterator_release(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle );
}
void smoke_ListenerWithAttributes_StringToDouble_put(_baseRef handle, _baseRef key, double value) {
    (*get_pointer<std::unordered_map<std::string, double>>(handle))[*get_pointer<std::string>(key)] = value;
}
bool smoke_ListenerWithAttributes_StringToDouble_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<std::string, double>>(handle)->end();
}
void smoke_ListenerWithAttributes_StringToDouble_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle );
}
_baseRef smoke_ListenerWithAttributes_StringToDouble_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ))->first;
    return reinterpret_cast<_baseRef>(new std::string { key });
}
double smoke_ListenerWithAttributes_StringToDouble_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<std::string, double>::iterator*>( iterator_handle ))->second;
    return value;
}

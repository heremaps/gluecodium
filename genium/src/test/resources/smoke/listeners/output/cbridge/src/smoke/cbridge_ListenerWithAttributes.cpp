//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_ListenerWithAttributes.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "genium/Optional.h"
#include "smoke/CalculationResult.h"
#include "smoke/ListenerWithAttributes.h"
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
#include <vector>
void smoke_ListenerWithAttributes_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(handle);
}
_baseRef smoke_ListenerWithAttributes_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(handle)))
        : 0;
}
_baseRef
smoke_ListenerWithAttributes_ResultStruct_create_handle( double result )
{
    ::smoke::ListenerWithAttributes::ResultStruct* _struct = new ( std::nothrow ) ::smoke::ListenerWithAttributes::ResultStruct();
    _struct->result = result;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_ListenerWithAttributes_ResultStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::ListenerWithAttributes::ResultStruct>( handle );
}
_baseRef
smoke_ListenerWithAttributes_ResultStruct_create_optional_handle(double result)
{
    auto _struct = new ( std::nothrow ) ::genium::optional<::smoke::ListenerWithAttributes::ResultStruct>( ::smoke::ListenerWithAttributes::ResultStruct( ) );
    (*_struct)->result = result;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_ListenerWithAttributes_ResultStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::smoke::ListenerWithAttributes::ResultStruct>*>( handle ) );
}
void smoke_ListenerWithAttributes_ResultStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::smoke::ListenerWithAttributes::ResultStruct>*>( handle );
}
double smoke_ListenerWithAttributes_ResultStruct_result_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::ListenerWithAttributes::ResultStruct>(handle);
return struct_pointer->result;
}
_baseRef smoke_ListenerWithAttributes_message_get(_baseRef _instance) {
    return Conversion<std::string>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_message())
;
}
void smoke_ListenerWithAttributes_message_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_message(Conversion<std::string>::toCpp(newValue))
;
}
_baseRef smoke_ListenerWithAttributes_packedMessage_get(_baseRef _instance) {
    return Conversion<std::shared_ptr<::smoke::CalculationResult>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_packed_message())
;
}
void smoke_ListenerWithAttributes_packedMessage_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_packed_message(Conversion<std::shared_ptr<::smoke::CalculationResult>>::toCpp(newValue))
;
}
_baseRef smoke_ListenerWithAttributes_structuredMessage_get(_baseRef _instance) {
    return Conversion<::smoke::ListenerWithAttributes::ResultStruct>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_structured_message())
;
}
void smoke_ListenerWithAttributes_structuredMessage_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_structured_message(Conversion<::smoke::ListenerWithAttributes::ResultStruct>::toCpp(newValue))
;
}
smoke_ListenerWithAttributes_ResultEnum smoke_ListenerWithAttributes_enumeratedMessage_get(_baseRef _instance) {
    return static_cast<smoke_ListenerWithAttributes_ResultEnum>(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_enumerated_message())
;
}
void smoke_ListenerWithAttributes_enumeratedMessage_set(_baseRef _instance, smoke_ListenerWithAttributes_ResultEnum newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_enumerated_message(static_cast<::smoke::ListenerWithAttributes::ResultEnum>(newValue))
;
}
_baseRef smoke_ListenerWithAttributes_arrayedMessage_get(_baseRef _instance) {
    return Conversion<std::vector<std::string>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_arrayed_message())
;
}
void smoke_ListenerWithAttributes_arrayedMessage_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_arrayed_message(Conversion<std::vector<std::string>>::toCpp(newValue))
;
}
_baseRef smoke_ListenerWithAttributes_mappedMessage_get(_baseRef _instance) {
    return Conversion<::smoke::ListenerWithAttributes::StringToDouble>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_mapped_message())
;
}
void smoke_ListenerWithAttributes_mappedMessage_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_mapped_message(Conversion<::smoke::ListenerWithAttributes::StringToDouble>::toCpp(newValue))
;
}
_baseRef smoke_ListenerWithAttributes_bufferedMessage_get(_baseRef _instance) {
    return Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->get_buffered_message())
;
}
void smoke_ListenerWithAttributes_bufferedMessage_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(_instance)->get()->set_buffered_message(Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toCpp(newValue))
;
}
class smoke_ListenerWithAttributesProxy : public std::shared_ptr<::smoke::ListenerWithAttributes>::element_type, public CachedProxyBase<smoke_ListenerWithAttributesProxy> {
public:
    smoke_ListenerWithAttributesProxy(smoke_ListenerWithAttributes_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_ListenerWithAttributesProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    ::std::string get_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithAttributes_message_get(mFunctions.swift_pointer);
        return Conversion<std::string>::toCppReturn(_call_result);
    }
    void set_message(const std::string& newValue) override {
        mFunctions.smoke_ListenerWithAttributes_message_set(mFunctions.swift_pointer, Conversion<std::string>::toBaseRef(newValue));    }
    ::std::shared_ptr< ::smoke::CalculationResult > get_packed_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithAttributes_packedMessage_get(mFunctions.swift_pointer);
        return Conversion<std::shared_ptr<::smoke::CalculationResult>>::toCppReturn(_call_result);
    }
    void set_packed_message(const std::shared_ptr<::smoke::CalculationResult>& newValue) override {
        mFunctions.smoke_ListenerWithAttributes_packedMessage_set(mFunctions.swift_pointer, Conversion<std::shared_ptr<::smoke::CalculationResult>>::toBaseRef(newValue));    }
    ::smoke::ListenerWithAttributes::ResultStruct get_structured_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithAttributes_structuredMessage_get(mFunctions.swift_pointer);
        return Conversion<::smoke::ListenerWithAttributes::ResultStruct>::toCppReturn(_call_result);
    }
    void set_structured_message(const ::smoke::ListenerWithAttributes::ResultStruct& newValue) override {
        mFunctions.smoke_ListenerWithAttributes_structuredMessage_set(mFunctions.swift_pointer, Conversion<::smoke::ListenerWithAttributes::ResultStruct>::toBaseRef(newValue));    }
    ::smoke::ListenerWithAttributes::ResultEnum get_enumerated_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithAttributes_enumeratedMessage_get(mFunctions.swift_pointer);
        return static_cast<::smoke::ListenerWithAttributes::ResultEnum>(_call_result);
    }
    void set_enumerated_message(const ::smoke::ListenerWithAttributes::ResultEnum newValue) override {
        mFunctions.smoke_ListenerWithAttributes_enumeratedMessage_set(mFunctions.swift_pointer, static_cast<uint32_t>(newValue));    }
    ::std::vector< ::std::string > get_arrayed_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithAttributes_arrayedMessage_get(mFunctions.swift_pointer);
        return Conversion<std::vector<std::string>>::toCppReturn(_call_result);
    }
    void set_arrayed_message(const std::vector<std::string>& newValue) override {
        mFunctions.smoke_ListenerWithAttributes_arrayedMessage_set(mFunctions.swift_pointer, Conversion<std::vector<std::string>>::toBaseRef(newValue));    }
    ::smoke::ListenerWithAttributes::StringToDouble get_mapped_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithAttributes_mappedMessage_get(mFunctions.swift_pointer);
        return Conversion<::smoke::ListenerWithAttributes::StringToDouble>::toCppReturn(_call_result);
    }
    void set_mapped_message(const ::smoke::ListenerWithAttributes::StringToDouble& newValue) override {
        mFunctions.smoke_ListenerWithAttributes_mappedMessage_set(mFunctions.swift_pointer, Conversion<::smoke::ListenerWithAttributes::StringToDouble>::toBaseRef(newValue));    }
    ::std::shared_ptr< ::std::vector< uint8_t > > get_buffered_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithAttributes_bufferedMessage_get(mFunctions.swift_pointer);
        return Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toCppReturn(_call_result);
    }
    void set_buffered_message(const ::std::shared_ptr< ::std::vector< uint8_t > >& newValue) override {
        mFunctions.smoke_ListenerWithAttributes_bufferedMessage_set(mFunctions.swift_pointer, Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toBaseRef(newValue));    }
private:
    smoke_ListenerWithAttributes_FunctionTable mFunctions;
};
_baseRef smoke_ListenerWithAttributes_create_proxy(smoke_ListenerWithAttributes_FunctionTable functionTable) {
    auto proxy = smoke_ListenerWithAttributesProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new std::shared_ptr<::smoke::ListenerWithAttributes>(std::move(proxy))) : 0;
}
const void* smoke_ListenerWithAttributes_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_ListenerWithAttributesProxy::get_swift_object(get_pointer<std::shared_ptr<::smoke::ListenerWithAttributes>>(handle)->get()) : nullptr;
}
_baseRef smoke_ListenerWithAttributes_StringToDouble_create_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<std::string, double >() );
}
void smoke_ListenerWithAttributes_StringToDouble_release_handle(_baseRef handle) {
    delete get_pointer<std::unordered_map<std::string, double >>(handle);
}
_baseRef smoke_ListenerWithAttributes_StringToDouble_iterator(_baseRef handle) {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) std::unordered_map<std::string, double >::iterator( get_pointer<std::unordered_map<std::string, double >>(handle)->begin() ) );
}
void smoke_ListenerWithAttributes_StringToDouble_iterator_release_handle(_baseRef iterator_handle) {
    delete reinterpret_cast<std::unordered_map<std::string, double >::iterator*>( iterator_handle );
}
void smoke_ListenerWithAttributes_StringToDouble_put(_baseRef handle, _baseRef key, double value) {
    (*get_pointer<std::unordered_map<std::string, double >>(handle)).emplace(std::move(Conversion<std::string>::toCpp(key)), std::move(value));
}
bool smoke_ListenerWithAttributes_StringToDouble_iterator_is_valid(_baseRef handle, _baseRef iterator_handle) {
    return *reinterpret_cast<std::unordered_map<std::string, double >::iterator*>( iterator_handle ) != get_pointer<std::unordered_map<std::string, double >>(handle)->end();
}
void smoke_ListenerWithAttributes_StringToDouble_iterator_increment(_baseRef iterator_handle) {
    ++*reinterpret_cast<std::unordered_map<std::string, double >::iterator*>( iterator_handle );
}
_baseRef smoke_ListenerWithAttributes_StringToDouble_iterator_key(_baseRef iterator_handle) {
    auto& key = (*reinterpret_cast<std::unordered_map<std::string, double >::iterator*>( iterator_handle ))->first;
    return Conversion<std::string>::toBaseRef(key);
}
double smoke_ListenerWithAttributes_StringToDouble_iterator_value(_baseRef iterator_handle) {
    auto& value = (*reinterpret_cast<std::unordered_map<std::string, double >::iterator*>( iterator_handle ))->second;
    return value;
}
_baseRef smoke_ListenerWithAttributes_StringToDouble_create_optional_handle() {
    return reinterpret_cast<_baseRef>( new ( std::nothrow ) ::genium::optional<std::unordered_map<std::string, double >>( std::unordered_map<std::string, double >( ) ) );
}
void smoke_ListenerWithAttributes_StringToDouble_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<std::unordered_map<std::string, double >>*>( handle );
}
_baseRef smoke_ListenerWithAttributes_StringToDouble_unwrap_optional_handle(_baseRef handle) {
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<std::unordered_map<std::string, double >>*>( handle ) );
}
//
//
#include "cbridge/include/smoke/cbridge_ListenerWithProperties.h"
#include "cbridge/include/ByteArrayHandle.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/CalculationResult.h"
#include "smoke/ListenerWithProperties.h"
#include <cstdint>
#include <memory>
#include <new>
#include <string>
#include <unordered_map>
#include <vector>
void smoke_ListenerWithProperties_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(handle);
}
_baseRef smoke_ListenerWithProperties_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(handle)))
        : 0;
}
const void* smoke_ListenerWithProperties_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(handle)->get())
        : nullptr;
}
void smoke_ListenerWithProperties_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(handle)->get(), swift_pointer);
}
void smoke_ListenerWithProperties_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(handle)->get());
}
extern "C" {
extern void* _CBridgeInitsmoke_ListenerWithProperties(_baseRef handle);
}
namespace {
struct smoke_ListenerWithPropertiesRegisterInit {
    smoke_ListenerWithPropertiesRegisterInit() {
        get_init_repository().add_init("smoke_ListenerWithProperties", &_CBridgeInitsmoke_ListenerWithProperties);
    }
} s_smoke_ListenerWithProperties_register_init;
}
void* smoke_ListenerWithProperties_get_typed(_baseRef handle) {
    const auto& real_type_id = ::gluecodium::get_type_repository(static_cast<::std::shared_ptr< ::smoke::ListenerWithProperties >::element_type*>(nullptr)).get_id(get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(handle)->get());
    auto init_function = get_init_repository().get_init(real_type_id);
    return init_function ? init_function(handle) : _CBridgeInitsmoke_ListenerWithProperties(handle);
}
_baseRef smoke_ListenerWithProperties_message_get(_baseRef _instance) {
    return Conversion<::std::string>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->get_message());
}
void smoke_ListenerWithProperties_message_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->set_message(Conversion<::std::string>::toCpp(value));
}
_baseRef smoke_ListenerWithProperties_packedMessage_get(_baseRef _instance) {
    return Conversion<::std::shared_ptr< ::smoke::CalculationResult >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->get_packed_message());
}
void smoke_ListenerWithProperties_packedMessage_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->set_packed_message(Conversion<::std::shared_ptr< ::smoke::CalculationResult >>::toCpp(value));
}
_baseRef smoke_ListenerWithProperties_structuredMessage_get(_baseRef _instance) {
    return Conversion<::smoke::ListenerWithProperties::ResultStruct>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->get_structured_message());
}
void smoke_ListenerWithProperties_structuredMessage_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->set_structured_message(Conversion<::smoke::ListenerWithProperties::ResultStruct>::toCpp(value));
}
smoke_ListenerWithProperties_ResultEnum smoke_ListenerWithProperties_enumeratedMessage_get(_baseRef _instance) {
    return static_cast<smoke_ListenerWithProperties_ResultEnum>(get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->get_enumerated_message());
}
void smoke_ListenerWithProperties_enumeratedMessage_set(_baseRef _instance, smoke_ListenerWithProperties_ResultEnum value) {
    return get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->set_enumerated_message(static_cast<::smoke::ListenerWithProperties::ResultEnum>(value));
}
_baseRef smoke_ListenerWithProperties_arrayedMessage_get(_baseRef _instance) {
    return Conversion<::std::vector< ::std::string >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->get_arrayed_message());
}
void smoke_ListenerWithProperties_arrayedMessage_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->set_arrayed_message(Conversion<::std::vector< ::std::string >>::toCpp(value));
}
_baseRef smoke_ListenerWithProperties_mappedMessage_get(_baseRef _instance) {
    return Conversion<::std::unordered_map< ::std::string, double >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->get_mapped_message());
}
void smoke_ListenerWithProperties_mappedMessage_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->set_mapped_message(Conversion<::std::unordered_map< ::std::string, double >>::toCpp(value));
}
_baseRef smoke_ListenerWithProperties_bufferedMessage_get(_baseRef _instance) {
    return Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toBaseRef(get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->get_buffered_message());
}
void smoke_ListenerWithProperties_bufferedMessage_set(_baseRef _instance, _baseRef value) {
    return get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(_instance)->get()->set_buffered_message(Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toCpp(value));
}
class smoke_ListenerWithPropertiesProxy : public ::smoke::ListenerWithProperties, public CachedProxyBase<smoke_ListenerWithPropertiesProxy> {
public:
    smoke_ListenerWithPropertiesProxy(smoke_ListenerWithProperties_FunctionTable&& functions)
     : mFunctions(::std::move(functions))
    {
    }
    virtual ~smoke_ListenerWithPropertiesProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    smoke_ListenerWithPropertiesProxy(const smoke_ListenerWithPropertiesProxy&) = delete;
    smoke_ListenerWithPropertiesProxy& operator=(const smoke_ListenerWithPropertiesProxy&) = delete;
    ::std::string get_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithProperties_message_get(mFunctions.swift_pointer);
        return Conversion<::std::string>::toCppReturn(_call_result);
    }
    void set_message(const ::std::string& value) override {
        mFunctions.smoke_ListenerWithProperties_message_set(mFunctions.swift_pointer, Conversion<::std::string>::toBaseRef(value));
    }
    ::std::shared_ptr< ::smoke::CalculationResult > get_packed_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithProperties_packedMessage_get(mFunctions.swift_pointer);
        return Conversion<::std::shared_ptr< ::smoke::CalculationResult >>::toCppReturn(_call_result);
    }
    void set_packed_message(const ::std::shared_ptr< ::smoke::CalculationResult >& value) override {
        mFunctions.smoke_ListenerWithProperties_packedMessage_set(mFunctions.swift_pointer, Conversion<::std::shared_ptr< ::smoke::CalculationResult >>::toBaseRef(value));
    }
    ::smoke::ListenerWithProperties::ResultStruct get_structured_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithProperties_structuredMessage_get(mFunctions.swift_pointer);
        return Conversion<::smoke::ListenerWithProperties::ResultStruct>::toCppReturn(_call_result);
    }
    void set_structured_message(const ::smoke::ListenerWithProperties::ResultStruct& value) override {
        mFunctions.smoke_ListenerWithProperties_structuredMessage_set(mFunctions.swift_pointer, Conversion<::smoke::ListenerWithProperties::ResultStruct>::toBaseRef(value));
    }
    ::smoke::ListenerWithProperties::ResultEnum get_enumerated_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithProperties_enumeratedMessage_get(mFunctions.swift_pointer);
        return static_cast<::smoke::ListenerWithProperties::ResultEnum>(_call_result);
    }
    void set_enumerated_message(const ::smoke::ListenerWithProperties::ResultEnum value) override {
        mFunctions.smoke_ListenerWithProperties_enumeratedMessage_set(mFunctions.swift_pointer, static_cast<uint32_t>(value));
    }
    ::std::vector< ::std::string > get_arrayed_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithProperties_arrayedMessage_get(mFunctions.swift_pointer);
        return Conversion<::std::vector< ::std::string >>::toCppReturn(_call_result);
    }
    void set_arrayed_message(const ::std::vector< ::std::string >& value) override {
        mFunctions.smoke_ListenerWithProperties_arrayedMessage_set(mFunctions.swift_pointer, Conversion<::std::vector< ::std::string >>::toBaseRef(value));
    }
    ::std::unordered_map< ::std::string, double > get_mapped_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithProperties_mappedMessage_get(mFunctions.swift_pointer);
        return Conversion<::std::unordered_map< ::std::string, double >>::toCppReturn(_call_result);
    }
    void set_mapped_message(const ::std::unordered_map< ::std::string, double >& value) override {
        mFunctions.smoke_ListenerWithProperties_mappedMessage_set(mFunctions.swift_pointer, Conversion<::std::unordered_map< ::std::string, double >>::toBaseRef(value));
    }
    ::std::shared_ptr< ::std::vector< uint8_t > > get_buffered_message() const override {
        auto _call_result = mFunctions.smoke_ListenerWithProperties_bufferedMessage_get(mFunctions.swift_pointer);
        return Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toCppReturn(_call_result);
    }
    void set_buffered_message(const ::std::shared_ptr< ::std::vector< uint8_t > >& value) override {
        mFunctions.smoke_ListenerWithProperties_bufferedMessage_set(mFunctions.swift_pointer, Conversion<::std::shared_ptr< ::std::vector< uint8_t > >>::toBaseRef(value));
    }
private:
    smoke_ListenerWithProperties_FunctionTable mFunctions;
};
_baseRef smoke_ListenerWithProperties_create_proxy(smoke_ListenerWithProperties_FunctionTable functionTable) {
    auto proxy = smoke_ListenerWithPropertiesProxy::get_proxy(::std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new ::std::shared_ptr< ::smoke::ListenerWithProperties >(proxy)) : 0;
}
const void* smoke_ListenerWithProperties_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_ListenerWithPropertiesProxy::get_swift_object(get_pointer<::std::shared_ptr< ::smoke::ListenerWithProperties >>(handle)->get()) : nullptr;
}
_baseRef
smoke_ListenerWithProperties_ResultStruct_create_handle( double result )
{
    ::smoke::ListenerWithProperties::ResultStruct* _struct = new ( ::std::nothrow ) ::smoke::ListenerWithProperties::ResultStruct();
    _struct->result = result;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_ListenerWithProperties_ResultStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::ListenerWithProperties::ResultStruct>( handle );
}
_baseRef
smoke_ListenerWithProperties_ResultStruct_create_optional_handle(double result)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::ListenerWithProperties::ResultStruct>( ::smoke::ListenerWithProperties::ResultStruct( ) );
    (*_struct)->result = result;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_ListenerWithProperties_ResultStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::ListenerWithProperties::ResultStruct>*>( handle ) );
}
void smoke_ListenerWithProperties_ResultStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::ListenerWithProperties::ResultStruct>*>( handle );
}
double smoke_ListenerWithProperties_ResultStruct_result_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::ListenerWithProperties::ResultStruct>(handle);
    return struct_pointer->result;
}

//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_ExternalInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/CachedProxyBase.h"
#include "foo/Bar.h"
#include "genium/Optional.h"
#include <memory>
#include <new>
#include <string>
void smoke_ExternalInterface_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::ExternalInterface>>(handle);
}
_baseRef smoke_ExternalInterface_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::ExternalInterface>>(handle)))
        : 0;
}
_baseRef
smoke_ExternalInterface_SomeStruct_create_handle( _baseRef someField )
{
    ::smoke::ExternalInterface::some_Struct* _struct = new ( std::nothrow ) ::smoke::ExternalInterface::some_Struct();
    _struct->some_Field = Conversion<std::string>::toCpp( someField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_ExternalInterface_SomeStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::ExternalInterface::some_Struct>( handle );
}
_baseRef
smoke_ExternalInterface_SomeStruct_create_optional_handle(_baseRef someField)
{
    auto _struct = new ( std::nothrow ) ::genium::optional<::smoke::ExternalInterface::some_Struct>( ::smoke::ExternalInterface::some_Struct( ) );
    (*_struct)->some_Field = Conversion<std::string>::toCpp( someField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_ExternalInterface_SomeStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::genium::optional<::smoke::ExternalInterface::some_Struct>*>( handle ) );
}
void smoke_ExternalInterface_SomeStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::genium::optional<::smoke::ExternalInterface::some_Struct>*>( handle );
}
_baseRef smoke_ExternalInterface_SomeStruct_someField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::ExternalInterface::some_Struct>(handle);
return Conversion<std::string>::toBaseRef(struct_pointer->some_Field);
}
void smoke_ExternalInterface_someMethod(_baseRef _instance, int8_t someParameter) {
    return get_pointer<std::shared_ptr<::smoke::ExternalInterface>>(_instance)->get()->some_Method(someParameter)
;
}
_baseRef smoke_ExternalInterface_someProperty_get(_baseRef _instance) {
    return Conversion<std::string>::toBaseRef(get_pointer<std::shared_ptr<::smoke::ExternalInterface>>(_instance)->get()->get_Me())
;
}
class smoke_ExternalInterfaceProxy : public std::shared_ptr<::smoke::ExternalInterface>::element_type, public CachedProxyBase<smoke_ExternalInterfaceProxy> {
public:
    smoke_ExternalInterfaceProxy(smoke_ExternalInterface_FunctionTable&& functions)
     : mFunctions(std::move(functions))
    {
    }
    virtual ~smoke_ExternalInterfaceProxy() {
        mFunctions.release(mFunctions.swift_pointer);
    }
    void some_Method(int8_t someParameter) override {
        mFunctions.smoke_ExternalInterface_someMethod(mFunctions.swift_pointer, someParameter);    }
    ::std::string get_Me() const override {
        auto _call_result = mFunctions.smoke_ExternalInterface_someProperty_get(mFunctions.swift_pointer);
        return Conversion<std::string>::toCppReturn(_call_result);
    }
private:
    smoke_ExternalInterface_FunctionTable mFunctions;
};
_baseRef smoke_ExternalInterface_create_proxy(smoke_ExternalInterface_FunctionTable functionTable) {
    auto proxy = smoke_ExternalInterfaceProxy::get_proxy(std::move(functionTable));
    return proxy ? reinterpret_cast<_baseRef>(new std::shared_ptr<::smoke::ExternalInterface>(std::move(proxy))) : 0;
}
const void* smoke_ExternalInterface_get_swift_object_from_cache(_baseRef handle) {
    return handle ? smoke_ExternalInterfaceProxy::get_swift_object(get_pointer<std::shared_ptr<::smoke::ExternalInterface>>(handle)->get()) : nullptr;
}

//
//
#include "cbridge/include/smoke/cbridge_StructWithInstances.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/SimpleClass.h"
#include "smoke/SimpleInterface.h"
#include "smoke/StructWithInstances.h"
#include <memory>
#include <new>
_baseRef
smoke_StructWithInstances_create_handle( _baseRef classInstance, _baseRef interfaceInstance )
{
    ::smoke::StructWithInstances* _struct = new ( std::nothrow ) ::smoke::StructWithInstances();
    _struct->class_instance = Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp( classInstance );
    _struct->interface_instance = Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp( interfaceInstance );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_StructWithInstances_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::StructWithInstances>( handle );
}
_baseRef
smoke_StructWithInstances_create_optional_handle(_baseRef classInstance, _baseRef interfaceInstance)
{
    auto _struct = new ( std::nothrow ) ::gluecodium::optional<::smoke::StructWithInstances>( ::smoke::StructWithInstances( ) );
    (*_struct)->class_instance = Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp( classInstance );
    (*_struct)->interface_instance = Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp( interfaceInstance );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_StructWithInstances_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::StructWithInstances>*>( handle ) );
}
void smoke_StructWithInstances_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::StructWithInstances>*>( handle );
}
_baseRef smoke_StructWithInstances_classInstance_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::StructWithInstances>(handle);
return Conversion<std::shared_ptr<::smoke::SimpleClass>>::toBaseRef(struct_pointer->class_instance);
}
_baseRef smoke_StructWithInstances_interfaceInstance_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::StructWithInstances>(handle);
return Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toBaseRef(struct_pointer->interface_instance);
}
_baseRef smoke_StructWithInstances_useSimpleClass(_baseRef _instance, _baseRef input) {
    return Conversion<std::shared_ptr<::smoke::SimpleClass>>::toBaseRef(get_pointer<::smoke::StructWithInstances>(_instance)->use_simple_class(Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp(input)))
;
}
_baseRef smoke_StructWithInstances_useSimpleInterface(_baseRef _instance, _baseRef input) {
    return Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toBaseRef(get_pointer<::smoke::StructWithInstances>(_instance)->use_simple_interface(Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp(input)))
;
}
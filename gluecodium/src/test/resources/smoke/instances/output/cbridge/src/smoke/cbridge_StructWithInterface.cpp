//
//
#include "cbridge/include/smoke/cbridge_StructWithInterface.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/SimpleInterface.h"
#include "smoke/StructWithInterface.h"
#include <memory>
#include <new>
_baseRef
smoke_StructWithInterface_create_handle( _baseRef interfaceInstance )
{
    ::smoke::StructWithInterface* _struct = new ( std::nothrow ) ::smoke::StructWithInterface();
    _struct->interface_instance = Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp( interfaceInstance );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_StructWithInterface_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::StructWithInterface>( handle );
}
_baseRef
smoke_StructWithInterface_create_optional_handle(_baseRef interfaceInstance)
{
    auto _struct = new ( std::nothrow ) ::gluecodium::optional<::smoke::StructWithInterface>( ::smoke::StructWithInterface( ) );
    (*_struct)->interface_instance = Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toCpp( interfaceInstance );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_StructWithInterface_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::StructWithInterface>*>( handle ) );
}
void smoke_StructWithInterface_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::StructWithInterface>*>( handle );
}
_baseRef smoke_StructWithInterface_interfaceInstance_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::StructWithInterface>(handle);
return Conversion<std::shared_ptr<::smoke::SimpleInterface>>::toBaseRef(struct_pointer->interface_instance);
}

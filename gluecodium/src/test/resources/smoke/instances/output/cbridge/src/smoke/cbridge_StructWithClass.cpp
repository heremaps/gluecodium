//
//
#include "cbridge/include/smoke/cbridge_StructWithClass.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/SimpleClass.h"
#include "smoke/StructWithClass.h"
#include <memory>
#include <new>
_baseRef
smoke_StructWithClass_create_handle( _baseRef classInstance )
{
    ::smoke::StructWithClass* _struct = new ( std::nothrow ) ::smoke::StructWithClass();
    _struct->class_instance = Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp( classInstance );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_StructWithClass_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::StructWithClass>( handle );
}
_baseRef
smoke_StructWithClass_create_optional_handle(_baseRef classInstance)
{
    auto _struct = new ( std::nothrow ) ::gluecodium::optional<::smoke::StructWithClass>( ::smoke::StructWithClass( ) );
    (*_struct)->class_instance = Conversion<std::shared_ptr<::smoke::SimpleClass>>::toCpp( classInstance );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_StructWithClass_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::StructWithClass>*>( handle ) );
}
void smoke_StructWithClass_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::StructWithClass>*>( handle );
}
_baseRef smoke_StructWithClass_classInstance_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::StructWithClass>(handle);
return Conversion<std::shared_ptr<::smoke::SimpleClass>>::toBaseRef(struct_pointer->class_instance);
}

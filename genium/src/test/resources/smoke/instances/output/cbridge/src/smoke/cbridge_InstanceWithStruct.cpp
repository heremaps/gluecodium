//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "Optional.h"
#include "cbridge/include/smoke/cbridge_InstanceWithStruct.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/InstanceWithStruct.h"
#include "smoke/SimpleInstantiable.h"
#include <memory>
#include <new>
void smoke_InstanceWithStruct_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::InstanceWithStruct>>(handle);
}
_baseRef smoke_InstanceWithStruct_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::InstanceWithStruct>>(handle)))
        : 0;
}
_baseRef
smoke_InstanceWithStruct_InnerStruct_create_handle( int8_t value )
{
    ::smoke::InstanceWithStruct::InnerStruct* _struct = new ( std::nothrow ) ::smoke::InstanceWithStruct::InnerStruct();
    _struct->value = value;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_InstanceWithStruct_InnerStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::InstanceWithStruct::InnerStruct>( handle );
}
_baseRef
smoke_InstanceWithStruct_InnerStruct_create_optional_handle(int8_t value)
{
    auto _struct = new ( std::nothrow ) genium::optional<::smoke::InstanceWithStruct::InnerStruct>( ::smoke::InstanceWithStruct::InnerStruct( ) );
    (*_struct)->value = value;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_InstanceWithStruct_InnerStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<genium::optional<::smoke::InstanceWithStruct::InnerStruct>*>( handle ) );
}
void smoke_InstanceWithStruct_InnerStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<genium::optional<::smoke::InstanceWithStruct::InnerStruct>*>( handle );
}
int8_t smoke_InstanceWithStruct_InnerStruct_value_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::InstanceWithStruct::InnerStruct>(handle);
return struct_pointer->value;
}
_baseRef
smoke_InstanceWithStruct_StructWithInstance_create_handle( _baseRef instance, _baseRef instanceWithComment )
{
    ::smoke::InstanceWithStruct::StructWithInstance* _struct = new ( std::nothrow ) ::smoke::InstanceWithStruct::StructWithInstance();
    _struct->instance = Conversion<std::shared_ptr<::smoke::SimpleInstantiable>>::toCpp( instance );
    _struct->instance_with_comment = Conversion<std::shared_ptr<::smoke::SimpleInstantiable>>::toCpp( instanceWithComment );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_InstanceWithStruct_StructWithInstance_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::InstanceWithStruct::StructWithInstance>( handle );
}
_baseRef
smoke_InstanceWithStruct_StructWithInstance_create_optional_handle(_baseRef instance, _baseRef instanceWithComment)
{
    auto _struct = new ( std::nothrow ) genium::optional<::smoke::InstanceWithStruct::StructWithInstance>( ::smoke::InstanceWithStruct::StructWithInstance( ) );
    (*_struct)->instance = Conversion<std::shared_ptr<::smoke::SimpleInstantiable>>::toCpp( instance );
    (*_struct)->instance_with_comment = Conversion<std::shared_ptr<::smoke::SimpleInstantiable>>::toCpp( instanceWithComment );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_InstanceWithStruct_StructWithInstance_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<genium::optional<::smoke::InstanceWithStruct::StructWithInstance>*>( handle ) );
}
void smoke_InstanceWithStruct_StructWithInstance_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<genium::optional<::smoke::InstanceWithStruct::StructWithInstance>*>( handle );
}
_baseRef smoke_InstanceWithStruct_StructWithInstance_instance_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle);
return Conversion<std::shared_ptr<::smoke::SimpleInstantiable>>::toBaseRef(struct_pointer->instance);
}
_baseRef smoke_InstanceWithStruct_StructWithInstance_instanceWithComment_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle);
return Conversion<std::shared_ptr<::smoke::SimpleInstantiable>>::toBaseRef(struct_pointer->instance_with_comment);
}
_baseRef smoke_InstanceWithStruct_innerStructMethod(_baseRef _instance, _baseRef inputStruct) {
    return Conversion<::smoke::InstanceWithStruct::InnerStruct>::toBaseRef(get_pointer<std::shared_ptr<::smoke::InstanceWithStruct>>(_instance)->get()->inner_struct_method(Conversion<::smoke::InstanceWithStruct::InnerStruct>::toCpp(inputStruct)))
;
}
_baseRef smoke_InstanceWithStruct_structWithInstanceMethod(_baseRef _instance, _baseRef input) {
    return Conversion<::smoke::InstanceWithStruct::StructWithInstance>::toBaseRef(get_pointer<std::shared_ptr<::smoke::InstanceWithStruct>>(_instance)->get()->struct_with_instance_method(Conversion<::smoke::InstanceWithStruct::StructWithInstance>::toCpp(input)))
;
}
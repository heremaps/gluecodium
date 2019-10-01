//
//
#include "cbridge/include/smoke/cbridge_NullableCollectionsStruct.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/NullableCollectionsStruct.h"
#include <memory>
#include <new>
#include <unordered_map>
#include <vector>
_baseRef
smoke_NullableCollectionsStruct_create_handle( _baseRef dates, _baseRef structs )
{
    ::smoke::NullableCollectionsStruct* _struct = new ( std::nothrow ) ::smoke::NullableCollectionsStruct();
    _struct->dates = Conversion<std::vector<::gluecodium::optional< ::std::chrono::system_clock::time_point >>>::toCpp( dates );
    _struct->structs = Conversion<std::unordered_map<int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct >>>::toCpp( structs );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_NullableCollectionsStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::NullableCollectionsStruct>( handle );
}
_baseRef
smoke_NullableCollectionsStruct_create_optional_handle(_baseRef dates, _baseRef structs)
{
    auto _struct = new ( std::nothrow ) ::gluecodium::optional<::smoke::NullableCollectionsStruct>( ::smoke::NullableCollectionsStruct( ) );
    (*_struct)->dates = Conversion<std::vector<::gluecodium::optional< ::std::chrono::system_clock::time_point >>>::toCpp( dates );
    (*_struct)->structs = Conversion<std::unordered_map<int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct >>>::toCpp( structs );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_NullableCollectionsStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::NullableCollectionsStruct>*>( handle ) );
}
void smoke_NullableCollectionsStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::NullableCollectionsStruct>*>( handle );
}
_baseRef smoke_NullableCollectionsStruct_dates_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::NullableCollectionsStruct>(handle);
return Conversion<std::vector<::gluecodium::optional< ::std::chrono::system_clock::time_point >>>::toBaseRef(struct_pointer->dates);
}
_baseRef smoke_NullableCollectionsStruct_structs_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::NullableCollectionsStruct>(handle);
return Conversion<std::unordered_map<int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct >>>::toBaseRef(struct_pointer->structs);
}
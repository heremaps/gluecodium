//
//
#include "cbridge/include/smoke/cbridge_ImmutableStructWithClash.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/Optional.h"
#include "smoke/ImmutableStructWithClash.h"
#include <cstdint>
#include <memory>
#include <new>
#include <string>
_baseRef
smoke_ImmutableStructWithClash_create_handle( _baseRef stringField, int32_t intField, bool boolField )
{
    auto _stringField = Conversion<::std::string>::toCpp( stringField );
    auto _intField = intField;
    auto _boolField = boolField;
    ::smoke::ImmutableStructWithClash* _struct = new ( ::std::nothrow ) ::smoke::ImmutableStructWithClash( _boolField, _intField, _stringField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_ImmutableStructWithClash_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::ImmutableStructWithClash>( handle );
}
_baseRef
smoke_ImmutableStructWithClash_create_optional_handle(_baseRef stringField, int32_t intField, bool boolField)
{
    auto _stringField = Conversion<::std::string>::toCpp( stringField );
    auto _intField = intField;
    auto _boolField = boolField;
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::ImmutableStructWithClash>( ::smoke::ImmutableStructWithClash( _boolField, _intField, _stringField ) );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_ImmutableStructWithClash_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::ImmutableStructWithClash>*>( handle ) );
}
void smoke_ImmutableStructWithClash_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::ImmutableStructWithClash>*>( handle );
}
_baseRef smoke_ImmutableStructWithClash_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::ImmutableStructWithClash>(handle);
    return Conversion<::std::string>::toBaseRef(struct_pointer->string_field);
}
int32_t smoke_ImmutableStructWithClash_intField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::ImmutableStructWithClash>(handle);
    return struct_pointer->int_field;
}
bool smoke_ImmutableStructWithClash_boolField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::ImmutableStructWithClash>(handle);
    return struct_pointer->bool_field;
}

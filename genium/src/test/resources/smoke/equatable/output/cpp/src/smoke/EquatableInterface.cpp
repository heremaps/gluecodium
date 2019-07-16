// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#include "smoke/EquatableInterface.h"
namespace smoke {
EquatableInterface::~EquatableInterface() = default;
bool
EquatableInterface::operator!=( const EquatableInterface& rhs ) {
    return !( *this == rhs );
}
EquatableInterface::EquatableStruct::EquatableStruct( )
    : int_field{ }, string_field{ }, nested_equatable_instance{ }, nested_pointer_equatable_instance{ }
{
}
EquatableInterface::EquatableStruct::EquatableStruct( const int32_t int_field, const ::std::string& string_field, const ::std::shared_ptr< ::smoke::EquatableInterface >& nested_equatable_instance, const ::std::shared_ptr< ::smoke::PointerEquatableInterface >& nested_pointer_equatable_instance )
    : int_field( int_field ), string_field( string_field ), nested_equatable_instance( nested_equatable_instance ), nested_pointer_equatable_instance( nested_pointer_equatable_instance )
{
}
bool EquatableInterface::EquatableStruct::operator==( const EquatableStruct& rhs ) const
{
    return int_field == rhs.int_field &&
        string_field == rhs.string_field &&
        ( ( nested_equatable_instance && rhs.nested_equatable_instance )
            ? ( *nested_equatable_instance == *rhs.nested_equatable_instance )
            : ( static_cast< bool >( nested_equatable_instance ) == static_cast< bool >( rhs.nested_equatable_instance ) ) ) &&
        nested_pointer_equatable_instance == rhs.nested_pointer_equatable_instance;
}
bool EquatableInterface::EquatableStruct::operator!=( const EquatableStruct& rhs ) const
{
    return !( *this == rhs );
}
}
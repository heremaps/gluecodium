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
EquatableInterface::EquatableInterface() {
}
EquatableInterface::~EquatableInterface() {
}
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
namespace genium {
std::size_t
EqualityHash< std::shared_ptr< ::smoke::EquatableInterface > >::operator( )( const std::shared_ptr< ::smoke::EquatableInterface >& t ) const
{
    if ( !t ) {
        return 43;
    }
    return 43 ^ ::genium::hash< ::smoke::EquatableInterface >( )( *t );
};
std::size_t
hash< ::smoke::EquatableInterface::EquatableStruct >::operator( )( const ::smoke::EquatableInterface::EquatableStruct& t ) const
{
    size_t hash_value = 43;
    hash_value = ( hash_value ^ ::genium::hash< decltype( ::smoke::EquatableInterface::EquatableStruct::int_field ) >( )( t.int_field ) ) << 1;
hash_value = ( hash_value ^ ::genium::hash< decltype( ::smoke::EquatableInterface::EquatableStruct::string_field ) >( )( t.string_field ) ) << 1;
hash_value = ( hash_value ^ ::genium::hash< decltype( ::smoke::EquatableInterface::EquatableStruct::nested_equatable_instance ) >( )( t.nested_equatable_instance ) ) << 1;
hash_value = ( hash_value ^ ::genium::hash< decltype( ::smoke::EquatableInterface::EquatableStruct::nested_pointer_equatable_instance ) >( )( t.nested_pointer_equatable_instance ) ) << 1;
    return hash_value;
}
}

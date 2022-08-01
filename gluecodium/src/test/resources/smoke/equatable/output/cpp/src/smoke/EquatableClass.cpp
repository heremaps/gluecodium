// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/EquatableClass.h"
#include "smoke/PointerEquatableClass.h"
#include <utility>
namespace smoke {
EquatableClass::EquatableClass() {
}
EquatableClass::~EquatableClass() {
}
bool
EquatableClass::operator!=( const EquatableClass& rhs ) {
    return !( *this == rhs );
}
EquatableClass::EquatableStruct::EquatableStruct( )
    : int_field{ }, string_field{ }, nested_equatable_instance{ }, nested_pointer_equatable_instance{ }
{
}
EquatableClass::EquatableStruct::EquatableStruct( int32_t int_field, ::std::string string_field, ::std::shared_ptr< ::smoke::EquatableClass > nested_equatable_instance, ::std::shared_ptr< ::smoke::PointerEquatableClass > nested_pointer_equatable_instance )
    : int_field( std::move( int_field ) ), string_field( std::move( string_field ) ), nested_equatable_instance( std::move( nested_equatable_instance ) ), nested_pointer_equatable_instance( std::move( nested_pointer_equatable_instance ) )
{
}
bool EquatableClass::EquatableStruct::operator==( const EquatableStruct& rhs ) const
{
    return int_field == rhs.int_field &&
        string_field == rhs.string_field &&
        ( ( nested_equatable_instance && rhs.nested_equatable_instance )
            ? ( *nested_equatable_instance == *rhs.nested_equatable_instance )
            : ( static_cast< bool >( nested_equatable_instance ) == static_cast< bool >( rhs.nested_equatable_instance ) ) ) &&
        nested_pointer_equatable_instance == rhs.nested_pointer_equatable_instance;
}
bool EquatableClass::EquatableStruct::operator!=( const EquatableStruct& rhs ) const
{
    return !( *this == rhs );
}
}
namespace gluecodium {
/**
 * Specialization of the hash-like function object for `std::shared_ptr`, comparing the contained
 * class instead of the pointer value.
 */
std::size_t
EqualityHash< std::shared_ptr< ::smoke::EquatableClass > >::operator( )( const std::shared_ptr< ::smoke::EquatableClass >& t ) const
{
    if ( !t ) {
        return 43;
    }
    return 43 ^ ::gluecodium::hash< ::smoke::EquatableClass >( )( *t );
};
std::size_t
hash< ::smoke::EquatableClass::EquatableStruct >::operator( )( const ::smoke::EquatableClass::EquatableStruct& t ) const
{
    size_t hash_value = 43;
    hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableClass::EquatableStruct::int_field ) >( )( t.int_field ) ) << 1;
    hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableClass::EquatableStruct::string_field ) >( )( t.string_field ) ) << 1;
    hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableClass::EquatableStruct::nested_equatable_instance ) >( )( t.nested_equatable_instance ) ) << 1;
    hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::EquatableClass::EquatableStruct::nested_pointer_equatable_instance ) >( )( t.nested_pointer_equatable_instance ) ) << 1;
    return hash_value;
}
}

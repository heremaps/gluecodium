// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/NonEquatableClass.h"
#include "smoke/NonEquatableInterface.h"
#include "smoke/SimpleEquatableStruct.h"
#include <utility>
namespace smoke {
SimpleEquatableStruct::SimpleEquatableStruct( )
    : class_field{ }, interface_field{ }, nullable_class_field{ }, nullable_interface_field{ }
{
}
SimpleEquatableStruct::SimpleEquatableStruct( ::std::shared_ptr< ::smoke::NonEquatableClass > class_field, ::std::shared_ptr< ::smoke::NonEquatableInterface > interface_field, ::std::shared_ptr< ::smoke::NonEquatableClass > nullable_class_field, ::std::shared_ptr< ::smoke::NonEquatableInterface > nullable_interface_field )
    : class_field( std::move( class_field ) ), interface_field( std::move( interface_field ) ), nullable_class_field( std::move( nullable_class_field ) ), nullable_interface_field( std::move( nullable_interface_field ) )
{
}
bool SimpleEquatableStruct::operator==( const SimpleEquatableStruct& rhs ) const
{
    return class_field == rhs.class_field &&
        interface_field == rhs.interface_field &&
        ( ( nullable_class_field && rhs.nullable_class_field )
            ? ( &*nullable_class_field == &*rhs.nullable_class_field )
            : ( static_cast< bool >( nullable_class_field ) == static_cast< bool >( rhs.nullable_class_field ) ) ) &&
        ( ( nullable_interface_field && rhs.nullable_interface_field )
            ? ( &*nullable_interface_field == &*rhs.nullable_interface_field )
            : ( static_cast< bool >( nullable_interface_field ) == static_cast< bool >( rhs.nullable_interface_field ) ) );
}
bool SimpleEquatableStruct::operator!=( const SimpleEquatableStruct& rhs ) const
{
    return !( *this == rhs );
}
}
namespace gluecodium {
std::size_t
hash< ::smoke::SimpleEquatableStruct >::operator( )( const ::smoke::SimpleEquatableStruct& t ) const
{
    size_t hash_value = 43;
    hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::SimpleEquatableStruct::class_field ) >( )( t.class_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::SimpleEquatableStruct::interface_field ) >( )( t.interface_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::SimpleEquatableStruct::nullable_class_field ) >( )( t.nullable_class_field ) ) << 1;
hash_value = ( hash_value ^ ::gluecodium::hash< decltype( ::smoke::SimpleEquatableStruct::nullable_interface_field ) >( )( t.nullable_interface_field ) ) << 1;
    return hash_value;
}
}

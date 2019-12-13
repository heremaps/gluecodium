// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/SimpleClass.h"
#include "smoke/StructWithClass.h"
namespace smoke {
StructWithClass::StructWithClass( )
    : class_instance{ }
{
}
StructWithClass::StructWithClass( const ::std::shared_ptr< ::smoke::SimpleClass >& class_instance )
    : class_instance( class_instance )
{
}
}

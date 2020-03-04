// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/SimpleClass.h"
#include "smoke/StructWithClass.h"
#include <utility>
namespace smoke {
StructWithClass::StructWithClass( )
    : class_instance{ }
{
}
StructWithClass::StructWithClass( ::std::shared_ptr< ::smoke::SimpleClass > class_instance )
    : class_instance( std::move( class_instance ) )
{
}
}

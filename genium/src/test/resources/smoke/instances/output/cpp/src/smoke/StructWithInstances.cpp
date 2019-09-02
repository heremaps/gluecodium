// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/StructWithInstances.h"

namespace smoke {
StructWithInstances::StructWithInstances( )
    : class_instance{ }, interface_instance{ }
{
}
StructWithInstances::StructWithInstances( const ::std::shared_ptr< ::smoke::SimpleClass >& class_instance, const ::std::shared_ptr< ::smoke::SimpleInterface >& interface_instance )
    : class_instance( class_instance ), interface_instance( interface_instance )
{
}
}
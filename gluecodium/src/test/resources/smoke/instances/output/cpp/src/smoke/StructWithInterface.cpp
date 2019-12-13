// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/SimpleInterface.h"
#include "smoke/StructWithInterface.h"
namespace smoke {
StructWithInterface::StructWithInterface( )
    : interface_instance{ }
{
}
StructWithInterface::StructWithInterface( const ::std::shared_ptr< ::smoke::SimpleInterface >& interface_instance )
    : interface_instance( interface_instance )
{
}
}

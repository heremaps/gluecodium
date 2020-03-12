// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/SimpleInterface.h"
#include "smoke/StructWithInterface.h"
#include <utility>
namespace smoke {
StructWithInterface::StructWithInterface( )
    : interface_instance{ }
{
}
StructWithInterface::StructWithInterface( ::std::shared_ptr< ::smoke::SimpleInterface > interface_instance )
    : interface_instance( std::move( interface_instance ) )
{
}
}

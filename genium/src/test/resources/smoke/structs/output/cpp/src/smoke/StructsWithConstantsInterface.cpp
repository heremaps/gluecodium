// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#include "smoke/StructsWithConstantsInterface.h"
namespace genium {
TypeRepository& get_type_repository(const ::smoke::StructsWithConstantsInterface*) {
    static TypeRepository s_repo;
    return s_repo;
}
}
namespace smoke {
StructsWithConstantsInterface::StructsWithConstantsInterface() {
}
StructsWithConstantsInterface::~StructsWithConstantsInterface() {
}
const ::std::string StructsWithConstantsInterface::MultiRoute::DEFAULT_DESCRIPTION = "Foo";
const ::smoke::RouteType StructsWithConstantsInterface::MultiRoute::DEFAULT_TYPE = ::smoke::RouteType::NONE;
StructsWithConstantsInterface::MultiRoute::MultiRoute( )
    : descriptions{ }, type{ }
{
}
StructsWithConstantsInterface::MultiRoute::MultiRoute( const ::std::vector< ::std::string >& descriptions, const ::smoke::RouteType type )
    : descriptions( descriptions ), type( type )
{
}
}
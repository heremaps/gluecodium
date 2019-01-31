// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#include "smoke/InstanceWithStruct.h"
namespace smoke {
InstanceWithStruct::~InstanceWithStruct() = default;
InstanceWithStruct::InnerStruct::InnerStruct( )
    : value{ }
{
}
InstanceWithStruct::InnerStruct::InnerStruct( const int8_t value )
    : value( value )
{
}
InstanceWithStruct::StructWithInstance::StructWithInstance( )
    : instance{ }, instance_with_comment{ }
{
}
InstanceWithStruct::StructWithInstance::StructWithInstance( const ::std::shared_ptr< ::smoke::SimpleInstantiable >& instance, const ::std::shared_ptr< ::smoke::SimpleInstantiable >& instance_with_comment )
    : instance( instance ), instance_with_comment( instance_with_comment )
{
}
}

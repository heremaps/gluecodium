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
    : instance{ }, instance_not_null{ }, instance_not_null_with_comment{ }
{
}

InstanceWithStruct::StructWithInstance::StructWithInstance( const ::std::shared_ptr< ::smoke::SimpleInstantiableOne >& instance, const ::std::shared_ptr< ::smoke::SimpleInstantiableOne >& instance_not_null, const ::std::shared_ptr< ::smoke::SimpleInstantiableOne >& instance_not_null_with_comment )
    : instance( instance ), instance_not_null( instance_not_null ), instance_not_null_with_comment( instance_not_null_with_comment )
{
}

}

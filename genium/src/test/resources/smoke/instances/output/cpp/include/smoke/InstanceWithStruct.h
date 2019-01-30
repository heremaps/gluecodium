// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "Export.h"
#include "smoke/SimpleInstantiable.h"
#include <cstdint>
#include <memory>

namespace smoke {
    class SimpleInstantiable;
}

namespace smoke {
class _GENIUM_CPP_EXPORT InstanceWithStruct {
public:
    virtual ~InstanceWithStruct() = 0;
public:
struct _GENIUM_CPP_EXPORT InnerStruct {
    int8_t value;
    InnerStruct( );
    InnerStruct( const int8_t value );
};
struct _GENIUM_CPP_EXPORT StructWithInstance {
    /// \warning @NotNull
    ::std::shared_ptr< ::smoke::SimpleInstantiable > instance;
    /**
     * This is some very useful field.
     * \warning @NotNull
     */
    ::std::shared_ptr< ::smoke::SimpleInstantiable > instance_with_comment;
    StructWithInstance( );
    StructWithInstance( const ::std::shared_ptr< ::smoke::SimpleInstantiable >& instance, const ::std::shared_ptr< ::smoke::SimpleInstantiable >& instance_with_comment );
};
public:
virtual ::smoke::InstanceWithStruct::InnerStruct inner_struct_method( const ::smoke::InstanceWithStruct::InnerStruct& input_struct ) = 0;
virtual ::smoke::InstanceWithStruct::StructWithInstance struct_with_instance_method( const ::smoke::InstanceWithStruct::StructWithInstance& input ) = 0;
};
}

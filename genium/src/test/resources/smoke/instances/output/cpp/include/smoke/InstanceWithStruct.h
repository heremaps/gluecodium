// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "smoke/SimpleInstantiableOne.h"
#include <cstdint>
#include <memory>

namespace smoke {
    class SimpleInstantiableOne;
}

namespace smoke {
class InstanceWithStruct {
public:
    virtual ~InstanceWithStruct() = 0;
public:
struct InnerStruct {
    int8_t value;
};
struct StructWithInstance {
    ::std::shared_ptr< ::smoke::SimpleInstantiableOne > instance;
    /// \warning @NotNull
    ::std::shared_ptr< ::smoke::SimpleInstantiableOne > instance_not_null;
    /**
     * This is some very useful field.
     * \warning @NotNull
     */
    ::std::shared_ptr< ::smoke::SimpleInstantiableOne > instance_not_null_with_comment;
};
public:
virtual ::smoke::InstanceWithStruct::InnerStruct inner_struct_method( const ::smoke::InstanceWithStruct::InnerStruct& input_struct ) = 0;
virtual ::smoke::InstanceWithStruct::StructWithInstance struct_with_instance_method( const ::smoke::InstanceWithStruct::StructWithInstance& input ) = 0;
};
}

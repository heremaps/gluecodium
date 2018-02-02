// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
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
};
public:
virtual ::smoke::InstanceWithStruct::InnerStruct inner_struct_method( const ::smoke::InstanceWithStruct::InnerStruct& input_struct ) = 0;
virtual ::smoke::InstanceWithStruct::StructWithInstance struct_with_instance_method( const ::smoke::InstanceWithStruct::StructWithInstance& input ) = 0;
};
}

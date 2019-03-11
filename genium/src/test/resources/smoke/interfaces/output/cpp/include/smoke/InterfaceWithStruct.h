// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <cstdint>

namespace smoke {

class InterfaceWithStruct {
public:
    virtual ~InterfaceWithStruct() = 0;

public:
struct InnerStruct {
    int8_t value;
};

public:
virtual ::smoke::InterfaceWithStruct::InnerStruct inner_struct_method( const ::smoke::InterfaceWithStruct::InnerStruct& input_struct ) = 0;

};

}

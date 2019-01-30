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
#include <cstdint>

namespace smoke {

class _GENIUM_CPP_EXPORT InterfaceWithStruct {
public:
    virtual ~InterfaceWithStruct() = 0;

public:
struct _GENIUM_CPP_EXPORT InnerStruct {
    int8_t value;
    InnerStruct( );
    InnerStruct( const int8_t value );
};

public:
virtual ::smoke::InterfaceWithStruct::InnerStruct inner_struct_method( const ::smoke::InterfaceWithStruct::InnerStruct& input_struct ) = 0;

};

}

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
#include "examples/InheritanceParent.h"
#include <cstdint>

namespace examples {

class _GENIUM_CPP_EXPORT InheritanceChild: public ::examples::InheritanceParent {
public:
    virtual ~InheritanceChild() = 0;

public:
virtual int16_t child_method( const uint8_t input ) = 0;
};

}

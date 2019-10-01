// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "examples/InheritanceParent.h"
#include "gluecodium/Export.h"
#include "gluecodium/TypeRepository.h"
#include <cstdint>
namespace examples {
class _GLUECODIUM_CPP_EXPORT InheritanceChild: public ::examples::InheritanceParent {
public:
    InheritanceChild();
    virtual ~InheritanceChild() = 0;
public:
    virtual int16_t child_method( const uint8_t input ) = 0;
};
}

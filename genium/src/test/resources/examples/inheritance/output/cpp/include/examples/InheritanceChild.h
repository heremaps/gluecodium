// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "examples/InheritanceParent.h"
#include "genium/Export.h"
#include "genium/TypeRepository.h"
#include <cstdint>
namespace examples {
class _GENIUM_CPP_EXPORT InheritanceChild: public ::examples::InheritanceParent {
public:
    InheritanceChild();
    virtual ~InheritanceChild() = 0;
public:
    virtual int16_t child_method( const uint8_t input ) = 0;
};
}

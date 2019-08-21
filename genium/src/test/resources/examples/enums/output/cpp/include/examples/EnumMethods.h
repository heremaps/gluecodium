// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "examples/Enums.h"
#include "genium/Export.h"
#include "genium/TypeRepository.h"
namespace examples {
class _GENIUM_CPP_EXPORT EnumMethods {
public:
    EnumMethods();
    virtual ~EnumMethods() = 0;
public:
static ::examples::ShoeSizes method_with_enumeration( const ::examples::ShoeSizes input );
};
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::examples::EnumMethods*);
}
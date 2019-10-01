// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/TypeRepository.h"
#include <cstdint>
namespace examples {
class _GLUECODIUM_CPP_EXPORT Properties {
public:
    Properties();
    virtual ~Properties() = 0;
public:
    virtual uint32_t get_built_in_type_property(  ) const = 0;
    virtual void set_built_in_type_property( const uint32_t value ) = 0;
    virtual float get_readonly_property(  ) const = 0;
};
}
namespace gluecodium {
_GLUECODIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::examples::Properties*);
}
// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "smoke/fooTypes.h"
#include <cstdint>
#include <memory>
#include <string>
namespace smoke {
    class fooInterface;
}
namespace smoke {
class _GENIUM_CPP_EXPORT fooInterface {
public:
    virtual ~fooInterface() = 0;
public:
virtual ::smoke::fooStruct FooMethod( const ::std::string& FooParameter ) = 0;
/**
 *
 * \param[in] makeParameter
 * \return @NotNull
 */
static ::std::shared_ptr< ::smoke::fooInterface > make( const ::std::string& makeParameter );
virtual uint32_t GET_FOO_ATTRIBUTE(  ) const = 0;
virtual void SET_FOO_ATTRIBUTE( const uint32_t value ) = 0;
};
}
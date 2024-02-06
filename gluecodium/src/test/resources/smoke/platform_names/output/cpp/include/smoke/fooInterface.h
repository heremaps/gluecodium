// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/fooTypes.h"
#include <cstdint>
#include <memory>
#include <string>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT fooInterface {
public:
    fooInterface();
    virtual ~fooInterface();


public:
    virtual ::smoke::fooTypes::fooStruct FooMethod( const ::std::string& FooParameter ) = 0;
    /**
     *
     * \param[in] makeParameter
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::fooInterface > make( const ::std::string& makeParameter );
    virtual uint32_t GET_FOO_PROPERTY(  ) const = 0;
    virtual void SET_FOO_PROPERTY( const uint32_t value ) = 0;

};


}

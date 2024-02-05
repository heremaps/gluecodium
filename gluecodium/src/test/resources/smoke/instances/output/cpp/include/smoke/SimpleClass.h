// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <memory>
#include <string>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT SimpleClass {
public:
    SimpleClass();
    virtual ~SimpleClass();


public:
    virtual ::std::string get_string_value(  ) = 0;
    /**
     *
     * \param[in] input @NotNull
     * \return @NotNull
     */
    virtual ::std::shared_ptr< ::smoke::SimpleClass > use_simple_class( const ::std::shared_ptr< ::smoke::SimpleClass >& input ) = 0;
};


}

// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TypeRepository.h"
#include <memory>
#include <string>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT SimpleInterface {
public:
    SimpleInterface();
    virtual ~SimpleInterface();


public:
    virtual ::std::string get_string_value(  ) = 0;
    /**
     *
     * \param[in] input @NotNull
     * \return @NotNull
     */
    virtual ::std::shared_ptr< ::smoke::SimpleInterface > use_simple_interface( const ::std::shared_ptr< ::smoke::SimpleInterface >& input ) = 0;
};


}

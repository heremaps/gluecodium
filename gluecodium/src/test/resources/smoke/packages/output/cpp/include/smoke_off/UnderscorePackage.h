// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>

namespace smoke_off {
class _GLUECODIUM_CPP_EXPORT UnderscorePackage {
public:
    UnderscorePackage();
    virtual ~UnderscorePackage();


public:
    static ::std::string basic_method( const ::std::string& input_string );
};


}

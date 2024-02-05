// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>

namespace root {
namespace space {
namespace smoke {
class _GLUECODIUM_CPP_EXPORT Basic {
public:
    Basic();
    virtual ~Basic();


public:
    static ::std::string basic_method( const ::std::string& input_string );
};


}
}
}

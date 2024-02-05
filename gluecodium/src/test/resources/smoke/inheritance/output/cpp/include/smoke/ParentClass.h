// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TypeRepository.h"
#include <string>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT ParentClass {
public:
    ParentClass();
    virtual ~ParentClass();


public:
    virtual void root_method(  ) = 0;
    virtual ::std::string get_root_property(  ) const = 0;
    virtual void set_root_property( const ::std::string& value ) = 0;

};


}

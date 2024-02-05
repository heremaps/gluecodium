// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TypeRepository.h"
#include <string>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT InterfaceWithStatic {
public:
    InterfaceWithStatic();
    virtual ~InterfaceWithStatic();


public:
    virtual ::std::string regular_function(  ) = 0;
    static ::std::string static_function(  );
    virtual ::std::string get_regular_property(  ) const = 0;
    virtual void set_regular_property( const ::std::string& value ) = 0;

    static ::std::string get_static_property(  );
    static void set_static_property( const ::std::string& value );

};


}

// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <string>
namespace smoke_off {
class _GLUECODIUM_CPP_EXPORT UnderscorePackage {
public:
    UnderscorePackage();
    virtual ~UnderscorePackage() = 0;
public:
    static ::std::string basic_method( const ::std::string& input_string );
};
}
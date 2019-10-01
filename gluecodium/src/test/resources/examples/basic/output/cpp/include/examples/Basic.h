// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <string>
namespace examples {
class _GLUECODIUM_CPP_EXPORT Basic {
public:
    Basic();
    virtual ~Basic() = 0;
public:
    static ::std::string basic_method( const ::std::string& input_string );
};
}
// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include <string>
namespace examples {
class _GENIUM_CPP_EXPORT Basic {
public:
    Basic();
    virtual ~Basic() = 0;
public:
    static ::std::string basic_method( const ::std::string& input_string );
};
}
// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT SimpleClass {
public:
    SimpleClass();
    virtual ~SimpleClass() = 0;
public:
    virtual ::std::string get_string_value(  ) = 0;
};
}
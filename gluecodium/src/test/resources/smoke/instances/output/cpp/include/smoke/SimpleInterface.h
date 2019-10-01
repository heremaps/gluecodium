// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/TypeRepository.h"
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT SimpleInterface {
public:
    SimpleInterface();
    virtual ~SimpleInterface() = 0;
public:
    virtual ::std::string get_string_value(  ) = 0;
};
}
namespace gluecodium {
_GLUECODIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::SimpleInterface*);
}
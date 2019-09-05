// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/TypeRepository.h"
#include <string>
namespace smoke {
class _GENIUM_CPP_EXPORT SimpleInterface {
public:
    SimpleInterface();
    virtual ~SimpleInterface() = 0;
public:
    virtual ::std::string get_string_value(  ) = 0;
};
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::SimpleInterface*);
}
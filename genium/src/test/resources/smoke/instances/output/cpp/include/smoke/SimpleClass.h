// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/TypeRepository.h"
#include <string>
namespace smoke {
class _GENIUM_CPP_EXPORT SimpleClass {
public:
    SimpleClass();
    virtual ~SimpleClass() = 0;
public:
virtual ::std::string get_string_value(  ) = 0;
};
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::SimpleClass*);
}
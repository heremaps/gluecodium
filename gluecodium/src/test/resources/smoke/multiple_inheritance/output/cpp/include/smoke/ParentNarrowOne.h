// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TypeRepository.h"
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT ParentNarrowOne {
public:
    ParentNarrowOne();
    virtual ~ParentNarrowOne() = 0;
public:
    virtual void parent_function_one(  ) = 0;
    virtual ::std::string get_parent_property_one(  ) const = 0;
    virtual void set_parent_property_one( const ::std::string& value ) = 0;
};
}

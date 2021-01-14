// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TypeRepository.h"
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT [[OnInterface]] AttributesInterface {
public:
    AttributesInterface();
    virtual ~AttributesInterface() = 0;
public:
    [[OnConstInInterface]]
    _GLUECODIUM_CPP_EXPORT static const bool PI;
public:
    [[OnFunctionInInterface]]
    virtual void very_fun( [[OnParameterInInterface]] const ::std::string& param ) = 0;
    [[OnPropertyInInterface]]
    virtual ::std::string get_prop(  ) const = 0;
    [[OnPropertyInInterface]]
    virtual void set_prop( const ::std::string& value ) = 0;
};
}

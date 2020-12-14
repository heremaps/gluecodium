// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT [[OnClass]] AttributesClass {
public:
    AttributesClass();
    virtual ~AttributesClass() = 0;
public:
    [[OnConstInClass]]
    _GLUECODIUM_CPP_EXPORT static const bool PI;
public:
    [[OnFunctionInClass]]
    virtual void very_fun( [[OnParameterInClass]] const ::std::string& param ) = 0;
    [[OnPropertyInClass]]
    virtual ::std::string get_prop(  ) const = 0;
    [[OnPropertyInClass]]
    virtual void set_prop( const ::std::string& value ) = 0;
};
}

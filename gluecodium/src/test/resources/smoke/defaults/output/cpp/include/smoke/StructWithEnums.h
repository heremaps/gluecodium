// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/SomethingEnum.h"
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT StructWithEnums {
    _GLUECODIUM_CPP_EXPORT static const ::smoke::SomethingEnum FIRST_CONSTANT;
    ::smoke::SomethingEnum first_field = ::smoke::SomethingEnum::REALLY_FIRST;
    ::smoke::SomethingEnum explicit_field = ::smoke::SomethingEnum::EXPLICIT;
    ::smoke::SomethingEnum last_field = ::smoke::SomethingEnum::LAST;
    StructWithEnums( );
    StructWithEnums( ::smoke::SomethingEnum first_field, ::smoke::SomethingEnum explicit_field, ::smoke::SomethingEnum last_field );
};
}

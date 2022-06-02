// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/VectorHash.h"
#include "smoke/FooBarEnum.h"
#include <vector>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT InternalEnumDefaults {
    ::smoke::FooBarEnum public_field = ::smoke::FooBarEnum::FOO;
    ::std::vector< ::smoke::FooBarEnum > public_list_field = {::smoke::FooBarEnum::FOO, ::smoke::FooBarEnum::BAR, ::smoke::FooBarEnum::BAZ};
    ::smoke::FooBarEnum internal_field = ::smoke::FooBarEnum::BAR;
    ::std::vector< ::smoke::FooBarEnum > internal_list_field = {::smoke::FooBarEnum::FOO, ::smoke::FooBarEnum::BAR, ::smoke::FooBarEnum::BAZ};
    InternalEnumDefaults( );
    InternalEnumDefaults( ::smoke::FooBarEnum public_field, ::std::vector< ::smoke::FooBarEnum > public_list_field, ::smoke::FooBarEnum internal_field, ::std::vector< ::smoke::FooBarEnum > internal_list_field );
};
}

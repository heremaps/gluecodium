// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <cstdint>
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT OrderInStruct {
    struct _GLUECODIUM_CPP_EXPORT NestedStruct {
        ::std::string some_field;
        NestedStruct( );
        NestedStruct( ::std::string some_field );
    };
    enum class SomeEnum {
        FOO,
        BAR = 7
    };
    ::smoke::OrderInStruct::NestedStruct struct_field;
    ::smoke::OrderInStruct::SomeEnum enum_field;
    OrderInStruct( );
    OrderInStruct( ::smoke::OrderInStruct::NestedStruct struct_field, ::smoke::OrderInStruct::SomeEnum enum_field );
};
}

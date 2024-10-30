// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>

namespace smoke {
struct _GLUECODIUM_CPP_EXPORT OrderInStruct {
    struct _GLUECODIUM_CPP_EXPORT NestedStruct {
        ::std::string some_field;

        NestedStruct( );
        explicit NestedStruct( ::std::string some_field );

    };

    enum class _GLUECODIUM_CPP_EXPORT SomeEnum {
        FOO,
        BAR = 7
    };


    ::smoke::OrderInStruct::NestedStruct struct_field;
    ::smoke::OrderInStruct::SomeEnum enum_field;

    OrderInStruct( );
    OrderInStruct( ::smoke::OrderInStruct::NestedStruct struct_field, ::smoke::OrderInStruct::SomeEnum enum_field );

};


}

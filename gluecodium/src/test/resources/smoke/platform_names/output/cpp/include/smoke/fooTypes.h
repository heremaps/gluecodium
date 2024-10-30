// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>

namespace smoke {
struct _GLUECODIUM_CPP_EXPORT fooTypes {
    struct _GLUECODIUM_CPP_EXPORT fooStruct {
        ::std::string FOO_FIELD;

        fooStruct( );
        explicit fooStruct( ::std::string FOO_FIELD );

        static ::smoke::fooTypes::fooStruct FooCreate( const ::std::string& FooParameter );

    };

    enum class _GLUECODIUM_CPP_EXPORT fooEnum {
        foo_item
    };


    using fooTypedef = double;

};


}

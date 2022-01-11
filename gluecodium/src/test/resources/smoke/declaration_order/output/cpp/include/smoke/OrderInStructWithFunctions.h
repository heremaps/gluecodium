// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <cstdint>
#include <string>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT OrderInStructWithFunctions {
    struct _GLUECODIUM_CPP_EXPORT NestedStruct {
        ::std::string some_field;
        NestedStruct( );
        explicit NestedStruct( ::std::string some_field );
    };
    enum class SomeEnum {
        FOO,
        BAR = 7
    };
    ::std::string some_field;
    OrderInStructWithFunctions( );
    explicit OrderInStructWithFunctions( ::std::string some_field );
    ::smoke::OrderInStructWithFunctions::SomeEnum do_stuff( const ::smoke::OrderInStructWithFunctions::NestedStruct& struct_foo ) const;
};
}

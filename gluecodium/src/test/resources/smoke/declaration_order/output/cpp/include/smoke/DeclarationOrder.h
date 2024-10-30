// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <string>
#include <unordered_map>
#include <vector>

namespace smoke {
struct _GLUECODIUM_CPP_EXPORT DeclarationOrder {
    struct _GLUECODIUM_CPP_EXPORT NestedStruct {
        ::std::string some_field;

        NestedStruct( );
        explicit NestedStruct( ::std::string some_field );

    };

    enum class _GLUECODIUM_CPP_EXPORT SomeEnum {
        FOO,
        BAR = 7
    };


    using SomeTypeDef = int32_t;

    using NestedStructArray = ::std::vector< ::smoke::DeclarationOrder::NestedStruct >;

    using ErrorCodeToMessageMap = ::std::unordered_map< int32_t, ::smoke::DeclarationOrder::NestedStructArray >;

    struct _GLUECODIUM_CPP_EXPORT MainStruct {
        ::smoke::DeclarationOrder::NestedStruct struct_field;
        ::smoke::DeclarationOrder::SomeTypeDef type_def_field;
        ::smoke::DeclarationOrder::NestedStructArray struct_array_field;
        ::smoke::DeclarationOrder::ErrorCodeToMessageMap map_field;
        ::smoke::DeclarationOrder::SomeEnum enum_field;

        MainStruct( );
        MainStruct( ::smoke::DeclarationOrder::NestedStruct struct_field, ::smoke::DeclarationOrder::SomeTypeDef type_def_field, ::smoke::DeclarationOrder::NestedStructArray struct_array_field, ::smoke::DeclarationOrder::ErrorCodeToMessageMap map_field, ::smoke::DeclarationOrder::SomeEnum enum_field );

    };

};


}

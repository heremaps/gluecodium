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
class _GLUECODIUM_CPP_EXPORT OrderInClass {
public:
    OrderInClass();
    virtual ~OrderInClass();


public:
    enum class SomeEnum {
        FOO,
        BAR = 7
    };


    using SomeTypeDef = int32_t;

    struct _GLUECODIUM_CPP_EXPORT NestedStruct {
        ::std::string some_field;

        NestedStruct( );
        explicit NestedStruct( ::std::string some_field );

    };

    using NestedStructArray = ::std::vector< ::smoke::OrderInClass::NestedStruct >;

    using ErrorCodeToMessageMap = ::std::unordered_map< int32_t, ::smoke::OrderInClass::NestedStructArray >;

    struct _GLUECODIUM_CPP_EXPORT MainStruct {
        ::smoke::OrderInClass::NestedStruct struct_field;
        ::smoke::OrderInClass::SomeTypeDef type_def_field;
        ::smoke::OrderInClass::NestedStructArray struct_array_field;
        ::smoke::OrderInClass::ErrorCodeToMessageMap map_field;
        ::smoke::OrderInClass::SomeEnum enum_field;

        MainStruct( );
        MainStruct( ::smoke::OrderInClass::NestedStruct struct_field, ::smoke::OrderInClass::SomeTypeDef type_def_field, ::smoke::OrderInClass::NestedStructArray struct_array_field, ::smoke::OrderInClass::ErrorCodeToMessageMap map_field, ::smoke::OrderInClass::SomeEnum enum_field );

    };

};


}

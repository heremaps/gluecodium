// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <cstdint>
#include <string>
#include <unordered_map>
#include <vector>

namespace smoke {

enum class SomeEnum {
    FOO,
    BAR = 7
};

struct NestedStruct {
    ::std::string some_field;
};

using SomeTypeDef = int32_t;
using NestedStructArray = ::std::vector< ::smoke::NestedStruct >;
using ErrorCodeToMessageMap = ::std::unordered_map< int32_t, ::std::string >;

struct MainStruct {
    ::smoke::NestedStruct struct_field;
    ::smoke::SomeTypeDef type_def_field;
    ::smoke::NestedStructArray struct_array_field;
    ::smoke::ErrorCodeToMessageMap map_field;
    ::smoke::SomeEnum enum_field;
};

}

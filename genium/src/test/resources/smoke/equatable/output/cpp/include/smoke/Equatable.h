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

struct NestedEquatableStruct {
    ::std::string foo_field;

    NestedEquatableStruct( );
    NestedEquatableStruct( const ::std::string& foo_field );

    bool operator==( const NestedEquatableStruct& rhs ) const;
    bool operator!=( const NestedEquatableStruct& rhs ) const;
};

enum class SomeEnum {
    FOO,
    BAR
};

using ErrorCodeToMessageMap = ::std::unordered_map< int32_t, ::std::string >;

struct EquatableStruct {
    bool bool_field;
    int32_t int_field;
    int64_t long_field;
    float float_field;
    double double_field;
    ::std::string string_field;
    ::smoke::NestedEquatableStruct struct_field;
    ::smoke::SomeEnum enum_field;
    ::std::vector< ::std::string > array_field;
    ::smoke::ErrorCodeToMessageMap map_field;

    EquatableStruct( );
    EquatableStruct( const bool bool_field, const int32_t int_field, const int64_t long_field, const float float_field, const double double_field, const ::std::string& string_field, const ::smoke::NestedEquatableStruct& struct_field, const ::smoke::SomeEnum enum_field, const ::std::vector< ::std::string >& array_field, const ::smoke::ErrorCodeToMessageMap& map_field );

    bool operator==( const EquatableStruct& rhs ) const;
    bool operator!=( const EquatableStruct& rhs ) const;
};

}

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

namespace examples {

struct NestedEquatableStruct {
    bool operator==( const NestedEquatableStruct& rhs ) const override;
    bool operator!=( const NestedEquatableStruct& rhs ) const override;

    ::std::string foo_field;
};

struct EquatableStruct {
    bool operator==( const EquatableStruct& rhs ) const override;
    bool operator!=( const EquatableStruct& rhs ) const override;

    int32_t int_field;
    ::std::string string_field;
    ::examples::NestedEquatableStruct struct_field;
};

}

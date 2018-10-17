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

namespace smoke {

class EquatableInterface {
public:
    virtual ~EquatableInterface() = 0;
public:
struct EquatableStruct {
    int32_t int_field;
    ::std::string string_field;
    EquatableStruct( );
    EquatableStruct( const int32_t int_field, const ::std::string& string_field );
    bool operator==( const EquatableStruct& rhs ) const;
    bool operator!=( const EquatableStruct& rhs ) const;
};

};

}

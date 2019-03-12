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
#include <vector>

namespace smoke {

class MethodOverloads {
public:
    virtual ~MethodOverloads() = 0;

public:
using StringArray = ::std::vector< ::std::string >;
using IntArray = ::std::vector< int8_t >;
struct Point {
    double x;
    double y;
};

public:
virtual bool is_boolean( const bool input ) = 0;
virtual bool is_boolean( const int8_t input ) = 0;
virtual bool is_boolean( const ::std::string& input ) = 0;
virtual bool is_boolean( const ::smoke::MethodOverloads::Point& input ) = 0;
virtual bool is_boolean( const bool input1, const int8_t input2, const ::std::string& input3, const ::smoke::MethodOverloads::Point& input4 ) = 0;
virtual bool is_boolean( const ::smoke::MethodOverloads::StringArray& input ) = 0;
virtual bool is_boolean( const ::smoke::MethodOverloads::IntArray& input ) = 0;
virtual bool is_boolean(  ) const = 0;
};

}

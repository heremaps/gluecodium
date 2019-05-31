// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/UnorderedMapHash.h"
#include "genium/VectorHash.h"
#include <chrono>
#include <string>
#include <unordered_map>
#include <vector>
namespace smoke {
class _GENIUM_CPP_EXPORT Dates {
public:
    virtual ~Dates() = 0;
public:
using DateTypeDef = ::std::chrono::system_clock::time_point;
using DateArray = ::std::vector< ::std::chrono::system_clock::time_point >;
using DateMap = ::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >;
struct _GENIUM_CPP_EXPORT DateStruct {
    ::std::chrono::system_clock::time_point date_field;
    DateStruct( );
    DateStruct( const ::std::chrono::system_clock::time_point& date_field );
};
public:
virtual ::std::chrono::system_clock::time_point date_method( const ::std::chrono::system_clock::time_point& input ) = 0;
virtual ::std::chrono::system_clock::time_point get_date_attribute(  ) const = 0;
virtual void set_date_attribute( const ::std::chrono::system_clock::time_point& value ) = 0;
};
}
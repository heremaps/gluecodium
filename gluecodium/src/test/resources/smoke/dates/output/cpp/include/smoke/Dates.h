// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TimePointHash.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <chrono>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT Dates {
public:
    Dates();
    virtual ~Dates() = 0;
public:
    using DateTypeDef = ::std::chrono::system_clock::time_point;
    using DateArray = ::std::vector< ::std::chrono::system_clock::time_point >;
    using DateMap = ::std::unordered_map< ::std::string, ::std::chrono::system_clock::time_point >;
    struct _GLUECODIUM_CPP_EXPORT DateStruct {
        ::std::chrono::system_clock::time_point date_field;
        ::gluecodium::optional< ::std::chrono::system_clock::time_point > nullable_date_field = ::gluecodium::optional< ::std::chrono::system_clock::time_point >();
        DateStruct( );
        explicit DateStruct( ::std::chrono::system_clock::time_point date_field );
        DateStruct( ::std::chrono::system_clock::time_point date_field, ::gluecodium::optional< ::std::chrono::system_clock::time_point > nullable_date_field );
    };
public:
    virtual ::std::chrono::system_clock::time_point date_method( const ::std::chrono::system_clock::time_point& input ) = 0;
    virtual ::gluecodium::optional< ::std::chrono::system_clock::time_point > nullable_date_method( const ::gluecodium::optional< ::std::chrono::system_clock::time_point >& input ) = 0;
    virtual ::std::chrono::system_clock::time_point get_date_property(  ) const = 0;
    virtual void set_date_property( const ::std::chrono::system_clock::time_point& value ) = 0;
    virtual ::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > > get_date_set(  ) const = 0;
    virtual void set_date_set( const ::std::unordered_set< ::std::chrono::system_clock::time_point, ::gluecodium::hash< ::std::chrono::system_clock::time_point > >& value ) = 0;
};
}

// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TimePointHash.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include <chrono>
#include <string>
#include <unordered_map>
#include <vector>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT DatesSteady {
public:
    DatesSteady();
    virtual ~DatesSteady() = 0;
public:
    using MonotonicDate = std::chrono::steady_clock::time_point;
    using DateList = ::std::vector< ::smoke::DatesSteady::MonotonicDate >;
    using DateMap = ::std::unordered_map< ::smoke::DatesSteady::MonotonicDate, ::std::string, ::gluecodium::hash< ::smoke::DatesSteady::MonotonicDate > >;
    struct _GLUECODIUM_CPP_EXPORT DateStruct {
        ::smoke::DatesSteady::MonotonicDate date_field;
        ::gluecodium::optional< ::smoke::DatesSteady::MonotonicDate > nullable_date_field;
        DateStruct( );
        DateStruct( ::smoke::DatesSteady::MonotonicDate date_field, ::gluecodium::optional< ::smoke::DatesSteady::MonotonicDate > nullable_date_field );
    };
public:
    virtual ::smoke::DatesSteady::MonotonicDate date_method( const ::smoke::DatesSteady::MonotonicDate& input ) = 0;
    virtual ::gluecodium::optional< ::smoke::DatesSteady::MonotonicDate > nullable_date_method( const ::gluecodium::optional< ::smoke::DatesSteady::MonotonicDate >& input ) = 0;
};
}

// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/DurationHash.h"
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <chrono>
#include <optional>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT DurationSeconds {
public:
    DurationSeconds();
    virtual ~DurationSeconds();


public:
    using DurationTypeAlias = ::std::chrono::seconds;

    using DurationList = ::std::vector< ::std::chrono::seconds >;

    using DurationSet = ::std::unordered_set< ::std::chrono::seconds, ::gluecodium::hash< ::std::chrono::seconds > >;

    using DurationMap = ::std::unordered_map< ::std::string, ::std::chrono::seconds >;

    using DurationKeyMap = ::std::unordered_map< ::std::chrono::seconds, ::std::string, ::gluecodium::hash< ::std::chrono::seconds > >;

    struct _GLUECODIUM_CPP_EXPORT DurationStruct {
        ::std::chrono::seconds duration_field;

        DurationStruct( );
        explicit DurationStruct( ::std::chrono::seconds duration_field );

    };

public:
    virtual ::std::chrono::seconds duration_function( const ::std::chrono::seconds input ) = 0;
    virtual std::optional< ::std::chrono::seconds > nullable_duration_function( const std::optional< ::std::chrono::seconds >& input ) = 0;
    virtual ::std::chrono::seconds get_duration_property(  ) const = 0;
    virtual void set_duration_property( const ::std::chrono::seconds value ) = 0;

};


}

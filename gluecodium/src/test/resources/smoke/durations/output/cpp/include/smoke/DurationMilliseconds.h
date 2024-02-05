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
class _GLUECODIUM_CPP_EXPORT DurationMilliseconds {
public:
    DurationMilliseconds();
    virtual ~DurationMilliseconds();


public:
    using DurationTypeAlias = std::chrono::milliseconds;

    using DurationList = ::std::vector< std::chrono::milliseconds >;

    using DurationSet = ::std::unordered_set< std::chrono::milliseconds, ::gluecodium::hash< std::chrono::milliseconds > >;

    using DurationMap = ::std::unordered_map< ::std::string, std::chrono::milliseconds >;

    using DurationKeyMap = ::std::unordered_map< std::chrono::milliseconds, ::std::string, ::gluecodium::hash< std::chrono::milliseconds > >;

    struct _GLUECODIUM_CPP_EXPORT DurationStruct {
        std::chrono::milliseconds duration_field;

        DurationStruct( );
        explicit DurationStruct( std::chrono::milliseconds duration_field );

    };

public:
    virtual std::chrono::milliseconds duration_function( const std::chrono::milliseconds input ) = 0;
    virtual std::optional< std::chrono::milliseconds > nullable_duration_function( const std::optional< std::chrono::milliseconds >& input ) = 0;
    virtual std::chrono::milliseconds get_duration_property(  ) const = 0;
    virtual void set_duration_property( const std::chrono::milliseconds value ) = 0;

};


}

// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/DurationHash.h"
#include "gluecodium/ExportGluecodiumCpp.h"
#include <chrono>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT DurationDefaults {
    ::std::chrono::seconds dayz = ::std::chrono::duration_cast<::std::chrono::seconds>(::std::chrono::hours(28 * 24));
    ::std::chrono::seconds hourz = ::std::chrono::duration_cast<::std::chrono::seconds>(::std::chrono::hours(22));
    ::std::chrono::seconds minutez = ::std::chrono::duration_cast<::std::chrono::seconds>(::std::chrono::minutes(45));
    std::chrono::seconds secondz = ::std::chrono::duration_cast<std::chrono::seconds>(::std::chrono::seconds(42));
    ::std::chrono::milliseconds milliz = ::std::chrono::duration_cast<::std::chrono::milliseconds>(::std::chrono::milliseconds(500));
    ::std::chrono::seconds microz = ::std::chrono::duration_cast<::std::chrono::seconds>(::std::chrono::microseconds(665));
    ::std::chrono::seconds nanoz = ::std::chrono::duration_cast<::std::chrono::seconds>(::std::chrono::nanoseconds(314635));
    DurationDefaults( );
    DurationDefaults( ::std::chrono::seconds dayz, ::std::chrono::seconds hourz, ::std::chrono::seconds minutez, std::chrono::seconds secondz, ::std::chrono::milliseconds milliz, ::std::chrono::seconds microz, ::std::chrono::seconds nanoz );
};
}

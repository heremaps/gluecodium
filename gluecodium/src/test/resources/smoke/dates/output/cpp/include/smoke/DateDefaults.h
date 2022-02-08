// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TimePointHash.h"
#include <chrono>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT DateDefaults {
    ::std::chrono::system_clock::time_point date_time = ::std::chrono::system_clock::from_time_t(1643966117);
    ::std::chrono::system_clock::time_point date_time_utc = ::std::chrono::system_clock::from_time_t(1643966117);
    ::std::chrono::system_clock::time_point before_epoch = ::std::chrono::system_clock::from_time_t(-1511793883);
    DateDefaults( );
    DateDefaults( ::std::chrono::system_clock::time_point date_time, ::std::chrono::system_clock::time_point date_time_utc, ::std::chrono::system_clock::time_point before_epoch );
};
}

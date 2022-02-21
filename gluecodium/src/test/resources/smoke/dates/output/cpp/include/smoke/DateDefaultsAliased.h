// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/DateAlias.h"
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT DateDefaultsAliased {
    ::smoke::DateAlias date_time = ::std::chrono::system_clock::from_time_t(1643966117);
    ::smoke::DateAlias date_time_utc = ::std::chrono::system_clock::from_time_t(1643966117);
    ::smoke::DateAlias before_epoch = ::std::chrono::system_clock::from_time_t(-1511793883);
    ::smoke::DateAlias exactly_epoch = ::std::chrono::system_clock::from_time_t(0);
    DateDefaultsAliased( );
    DateDefaultsAliased( ::smoke::DateAlias date_time, ::smoke::DateAlias date_time_utc, ::smoke::DateAlias before_epoch, ::smoke::DateAlias exactly_epoch );
};
}

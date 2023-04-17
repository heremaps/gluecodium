// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Locale.h"
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT LocaleDefaults {
    ::gluecodium::Locale english = ::gluecodium::Locale(std::string{"en"});
    ::gluecodium::Locale lat_am_spanish = ::gluecodium::Locale(std::string{"es-419"});
    ::gluecodium::Locale romansh_sursilvan = ::gluecodium::Locale(std::string{"rm-sursilv"});
    ::gluecodium::Locale serbian_cyrillic = ::gluecodium::Locale(std::string{"sr-Cyrl"});
    ::gluecodium::Locale traditional_chinese_taiwan = ::gluecodium::Locale(std::string{"nan-Hant-TW"});
    ::gluecodium::Locale zuerich_german = ::gluecodium::Locale(std::string{"gsw-u-sd-chzh"});
    LocaleDefaults( );
    LocaleDefaults( ::gluecodium::Locale english, ::gluecodium::Locale lat_am_spanish, ::gluecodium::Locale romansh_sursilvan, ::gluecodium::Locale serbian_cyrillic, ::gluecodium::Locale traditional_chinese_taiwan, ::gluecodium::Locale zuerich_german );
};
}
// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/Locale.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include <string>
#include <unordered_map>
#include <vector>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT Locales {
public:
    Locales();
    virtual ~Locales() = 0;
public:
    using LocaleTypeDef = ::gluecodium::Locale;
    using LocaleArray = ::std::vector< ::gluecodium::Locale >;
    using LocaleMap = ::std::unordered_map< ::std::string, ::gluecodium::Locale >;
    struct _GLUECODIUM_CPP_EXPORT LocaleStruct {
        ::gluecodium::Locale locale_field;
        LocaleStruct( );
        LocaleStruct( ::gluecodium::Locale locale_field );
    };
public:
    virtual ::gluecodium::Locale locale_method( const ::gluecodium::Locale& input ) = 0;
    virtual ::gluecodium::Locale get_locale_property(  ) const = 0;
    virtual void set_locale_property( const ::gluecodium::Locale& value ) = 0;
};
}

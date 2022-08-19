// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "fire/Enum1.h"
#include "fire/Enum2.h"
#include "fire/Enum3.h"
#include "fire/Enum4.h"
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Optional.h"
#include "smoke/EnumWrapper.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT EnumDefaults {
public:
    EnumDefaults();
    virtual ~EnumDefaults() = 0;
public:
    using EnumAlias = ::fire::Enum3;
    struct _GLUECODIUM_CPP_EXPORT SimpleEnum {
        ::fire::Enum1 enum_field = ::fire::Enum1::DISABLED;
        SimpleEnum( );
        explicit SimpleEnum( ::fire::Enum1 enum_field );
    };
    struct _GLUECODIUM_CPP_EXPORT NullableEnum {
        ::gluecodium::optional< ::fire::Enum2 > enum_field1 = ::gluecodium::optional< ::fire::Enum2 >();
        ::gluecodium::optional< ::fire::Enum2 > enum_field1 = ::fire::Enum2::DISABLED;
        NullableEnum( );
        NullableEnum( ::gluecodium::optional< ::fire::Enum2 > enum_field1, ::gluecodium::optional< ::fire::Enum2 > enum_field1 );
    };
    struct _GLUECODIUM_CPP_EXPORT AliasEnum {
        ::smoke::EnumDefaults::EnumAlias enum_field = ::fire::Enum3::DISABLED;
        AliasEnum( );
        explicit AliasEnum( ::smoke::EnumDefaults::EnumAlias enum_field );
    };
    struct _GLUECODIUM_CPP_EXPORT WrappedEnum {
        ::smoke::EnumWrapper struct_field = ::smoke::EnumWrapper{::fire::Enum4::DISABLED};
        WrappedEnum( );
        explicit WrappedEnum( ::smoke::EnumWrapper struct_field );
    };
};
}

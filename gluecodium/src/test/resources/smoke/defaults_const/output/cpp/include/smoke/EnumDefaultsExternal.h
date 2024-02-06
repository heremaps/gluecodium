// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "foo/AlienEnum1.h"
#include "foo/AlienEnum2.h"
#include "foo/AlienEnum3.h"
#include "foo/AlienEnum4.h"
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/EnumWrapper.h"
#include <optional>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT EnumDefaultsExternal {
public:
    EnumDefaultsExternal();
    virtual ~EnumDefaultsExternal();


public:
    using EnumAlias = foo::AlienEnum3;

    struct _GLUECODIUM_CPP_EXPORT SimpleEnum {
        foo::AlienEnum1 enum_field = foo::AlienEnum1::DISABLED;

        SimpleEnum( );
        explicit SimpleEnum( foo::AlienEnum1 enum_field );

    };

    struct _GLUECODIUM_CPP_EXPORT NullableEnum {
        std::optional< foo::AlienEnum2 > enum_field1 = std::optional< foo::AlienEnum2 >();
        std::optional< foo::AlienEnum2 > enum_field1 = foo::AlienEnum2::DISABLED;

        NullableEnum( );
        NullableEnum( std::optional< foo::AlienEnum2 > enum_field1, std::optional< foo::AlienEnum2 > enum_field1 );

    };

    struct _GLUECODIUM_CPP_EXPORT AliasEnum {
        ::smoke::EnumDefaultsExternal::EnumAlias enum_field = foo::AlienEnum3::DISABLED;

        AliasEnum( );
        explicit AliasEnum( ::smoke::EnumDefaultsExternal::EnumAlias enum_field );

    };

    struct _GLUECODIUM_CPP_EXPORT WrappedEnum {
        ::smoke::EnumWrapper struct_field = ::smoke::EnumWrapper{foo::AlienEnum4::DISABLED};

        WrappedEnum( );
        explicit WrappedEnum( ::smoke::EnumWrapper struct_field );

    };

};


}

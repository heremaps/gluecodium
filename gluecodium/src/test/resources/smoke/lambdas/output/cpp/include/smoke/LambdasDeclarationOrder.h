// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <functional>
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT LambdasDeclarationOrder {
public:
    LambdasDeclarationOrder();
    virtual ~LambdasDeclarationOrder() = 0;
public:
    struct _GLUECODIUM_CPP_EXPORT SomeStruct {
        ::std::string some_field;
        SomeStruct( );
        explicit SomeStruct( ::std::string some_field );
    };
    using SomeCallback = ::std::function<void(const ::smoke::LambdasDeclarationOrder::SomeStruct&)>;
};
}

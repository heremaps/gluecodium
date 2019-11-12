// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
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
        SomeStruct( const ::std::string& some_field );
    };
    using SomeCallback = ::std::function<void(const ::smoke::LambdasDeclarationOrder::SomeStruct&)>;
};
}

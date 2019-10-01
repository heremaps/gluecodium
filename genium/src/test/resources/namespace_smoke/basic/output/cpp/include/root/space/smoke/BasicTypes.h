// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <string>
namespace root {
namespace space {
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT SomeStruct {
    ::std::string some_field;
    SomeStruct( );
    SomeStruct( const ::std::string& some_field );
};
}
}
}
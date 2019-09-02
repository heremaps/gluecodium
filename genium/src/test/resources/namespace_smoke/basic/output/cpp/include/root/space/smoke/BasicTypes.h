// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include <string>
namespace root {
namespace space {
namespace smoke {
struct _GENIUM_CPP_EXPORT SomeStruct {
    ::std::string some_field;
    SomeStruct( );
    SomeStruct( const ::std::string& some_field );
};
}
}
}
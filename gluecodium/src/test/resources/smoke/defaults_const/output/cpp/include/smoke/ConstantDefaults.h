// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "fire/SomeStruct.h"
#include "fire/StructConstants.h"
#include "gluecodium/ExportGluecodiumCpp.h"
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT ConstantDefaults {
    ::fire::SomeStruct field1 = ::fire::StructConstants::DUMMY;
    ::fire::SomeStruct field2 = ::fire::StructConstants::DUMMY4;
    ConstantDefaults( );
    ConstantDefaults( ::fire::SomeStruct field1, ::fire::SomeStruct field2 );
};
}

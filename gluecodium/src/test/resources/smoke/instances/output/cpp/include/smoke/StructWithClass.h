// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <memory>
namespace smoke {
    class SimpleClass;
}
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT StructWithClass {
    /// \warning @NotNull
    ::std::shared_ptr< ::smoke::SimpleClass > class_instance;
    StructWithClass( );
    StructWithClass( ::std::shared_ptr< ::smoke::SimpleClass > class_instance );
};
}

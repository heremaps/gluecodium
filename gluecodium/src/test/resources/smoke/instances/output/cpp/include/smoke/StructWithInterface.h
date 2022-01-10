// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <memory>
namespace smoke {
    class SimpleInterface;
}
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT StructWithInterface {
    /// \warning @NotNull
    ::std::shared_ptr< ::smoke::SimpleInterface > interface_instance;
    StructWithInterface( );
    explicit StructWithInterface( ::std::shared_ptr< ::smoke::SimpleInterface > interface_instance );
};
}

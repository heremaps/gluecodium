// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <memory>
namespace smoke {
    class SimpleInterface;
}
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT StructWithInterface {
    /// \warning @NotNull
    ::std::shared_ptr< ::smoke::SimpleInterface > interface_instance;
    StructWithInterface( );
    StructWithInterface( ::std::shared_ptr< ::smoke::SimpleInterface > interface_instance );
};
}

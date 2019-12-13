// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <memory>
namespace smoke {
    class SimpleClass;
}
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT StructWithClass {
    /// \warning @NotNull
    ::std::shared_ptr< ::smoke::SimpleClass > class_instance;
    StructWithClass( );
    StructWithClass( const ::std::shared_ptr< ::smoke::SimpleClass >& class_instance );
};
}

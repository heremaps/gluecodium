// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "smoke/SimpleClass.h"
#include "smoke/SimpleInterface.h"
#include <memory>
namespace smoke {
    class SimpleClass;
}
namespace smoke {
    class SimpleInterface;
}
namespace smoke {
struct _GENIUM_CPP_EXPORT StructWithInstances {
    /// \warning @NotNull
    ::std::shared_ptr< ::smoke::SimpleClass > class_instance;
    /// \warning @NotNull
    ::std::shared_ptr< ::smoke::SimpleInterface > interface_instance;
    StructWithInstances( );
    StructWithInstances( const ::std::shared_ptr< ::smoke::SimpleClass >& class_instance, const ::std::shared_ptr< ::smoke::SimpleInterface >& interface_instance );
    /**
 *
 * \param[in] input @NotNull
 * \return @NotNull
 */
::std::shared_ptr< ::smoke::SimpleClass > use_simple_class( const ::std::shared_ptr< ::smoke::SimpleClass >& input ) const;
    /**
 *
 * \param[in] input @NotNull
 * \return @NotNull
 */
::std::shared_ptr< ::smoke::SimpleInterface > use_simple_interface( const ::std::shared_ptr< ::smoke::SimpleInterface >& input ) const;
};
}

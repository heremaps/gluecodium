// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "foo/Bar.h"
#include "smoke/SimpleInterface.h"
#include <memory>
namespace fire {
    class Baz;
}
namespace smoke {
    class ExternalInterface;
}
namespace smoke {
    class SimpleInterface;
}
namespace smoke {
class NestedInterface {
public:
    virtual ~NestedInterface() = 0;
public:
/**
 * \param[in] interface_one @NotNull
 * \param[in] interface_two @NotNull
 */
virtual void set_same_type_instances( const ::std::shared_ptr< ::smoke::SimpleInterface >& interface_one, const ::std::shared_ptr< ::smoke::SimpleInterface >& interface_two ) = 0;
/**
 * \return @NotNull
 */
virtual ::std::shared_ptr< ::smoke::SimpleInterface > get_instance_one(  ) = 0;
/**
 * \return @NotNull
 */
virtual ::std::shared_ptr< ::smoke::SimpleInterface > get_instance_two(  ) = 0;
/**
 * \param[in] input @NotNull
 * \return @NotNull
 */
virtual ::std::shared_ptr< ::fire::Baz > make_more_external( const ::std::shared_ptr< ::smoke::ExternalInterface >& input ) = 0;
virtual ::fire::Baz::some_Struct make_more_external( const ::smoke::ExternalInterface::some_Struct& input ) = 0;
virtual ::fire::Baz::some_Enum make_more_external( const ::smoke::ExternalInterface::some_Enum input ) = 0;
};
}

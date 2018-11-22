// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "smoke/SimpleInstantiable.h"
#include <memory>
namespace smoke {
    class SimpleInstantiable;
}
namespace smoke {
class NestedInstantiable {
public:
    virtual ~NestedInstantiable() = 0;
public:
virtual void set_same_type_instances( const ::std::shared_ptr< ::smoke::SimpleInstantiable >& instance_one, const ::std::shared_ptr< ::smoke::SimpleInstantiable >& instance_two ) = 0;
virtual ::std::shared_ptr< ::smoke::SimpleInstantiable > get_instance_one(  ) = 0;
/**
 *
 * \param[in] input @NotNull
 * \return @NotNull
 */
virtual ::std::shared_ptr< ::smoke::SimpleInstantiable > instance_not_null_method( const ::std::shared_ptr< ::smoke::SimpleInstantiable >& input ) = 0;

};
}

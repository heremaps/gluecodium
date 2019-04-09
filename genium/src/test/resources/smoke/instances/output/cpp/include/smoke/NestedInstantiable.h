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
#include "smoke/SimpleInstantiable.h"
#include <memory>
namespace smoke {
    class SimpleInstantiable;
}
namespace smoke {
class _GENIUM_CPP_EXPORT NestedInstantiable {
public:
    virtual ~NestedInstantiable() = 0;
public:
/**
 *
 * \param[in] instance_one @NotNull
 * \param[in] instance_two @NotNull
 */
virtual void set_same_type_instances( const ::std::shared_ptr< ::smoke::SimpleInstantiable >& instance_one, const ::std::shared_ptr< ::smoke::SimpleInstantiable >& instance_two ) = 0;
/**
 *
 * \return @NotNull
 */
virtual ::std::shared_ptr< ::smoke::SimpleInstantiable > get_instance_one(  ) = 0;
};
}

// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "smoke/SimpleInterface.h"
#include <memory>

namespace smoke {
    class SimpleInterface;
}

namespace smoke {

class NestedInterface {
public:
    virtual ~NestedInterface() = 0;

public:
virtual void set_same_type_instances( const ::std::shared_ptr< ::smoke::SimpleInterface >& interface_one, const ::std::shared_ptr< ::smoke::SimpleInterface >& interface_two ) = 0;
virtual ::std::shared_ptr< ::smoke::SimpleInterface > get_instance_one(  ) = 0;
virtual ::std::shared_ptr< ::smoke::SimpleInterface > get_instance_two(  ) = 0;

};

}

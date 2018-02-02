// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
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

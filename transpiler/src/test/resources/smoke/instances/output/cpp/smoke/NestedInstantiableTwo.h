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

#include "smoke/NestedInstantiableOne.h"
#include "smoke/SimpleInstantiableOne.h"
#include "smoke/SimpleInstantiableTwo.h"
#include <memory>

namespace smoke {

class NestedInstantiableTwo {
public:
    virtual ~NestedInstantiableTwo() = 0;

public:
virtual void set_multiple_type_instances( const ::std::shared_ptr< ::smoke::SimpleInstantiableOne >& instance_one, const ::std::shared_ptr< ::smoke::SimpleInstantiableTwo >& instance_two, const ::std::shared_ptr< ::smoke::NestedInstantiableOne >& nested_instantiable ) = 0;
virtual ::std::shared_ptr< ::smoke::SimpleInstantiableOne > get_instantiable_one(  ) = 0;
virtual ::std::shared_ptr< ::smoke::SimpleInstantiableTwo > get_instantiable_two(  ) = 0;
virtual ::std::shared_ptr< ::smoke::NestedInstantiableOne > get_nested_instantiable(  ) = 0;
virtual void set_self_instantiable( const ::std::shared_ptr< ::smoke::NestedInstantiableTwo >& self_instance ) = 0;
virtual ::std::shared_ptr< ::smoke::NestedInstantiableTwo > get_self_instantiable(  ) = 0;

};

}

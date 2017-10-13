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

#include "cpp/smoke/NestedInstantiableOne.h"
#include "cpp/smoke/SimpleInstantiableOne.h"
#include "cpp/smoke/SimpleInstantiableTwo.h"
#include <memory>

namespace smoke {

class NestedInstantiableTwo {
public:
    virtual ~NestedInstantiableTwo() = 0;

public:
virtual void setMultipleTypeInstances( const ::std::shared_ptr< ::smoke::SimpleInstantiableOne >& instanceOne, const ::std::shared_ptr< ::smoke::SimpleInstantiableTwo >& instanceTwo, const ::std::shared_ptr< ::smoke::NestedInstantiableOne >& nestedInstantiable ) = 0;
virtual ::std::shared_ptr< ::smoke::SimpleInstantiableOne > getInstantiableOne(  ) = 0;
virtual ::std::shared_ptr< ::smoke::SimpleInstantiableTwo > getInstantiableTwo(  ) = 0;
virtual ::std::shared_ptr< ::smoke::NestedInstantiableOne > getNestedInstantiable(  ) = 0;
virtual void setSelfInstantiable( const ::std::shared_ptr< ::smoke::NestedInstantiableTwo >& selfInstance ) = 0;
virtual ::std::shared_ptr< ::smoke::NestedInstantiableTwo > getSelfInstantiable(  ) = 0;

};

}

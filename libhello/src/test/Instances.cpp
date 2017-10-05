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

#include "Instances.h"
#include <memory>

namespace test
{

void
SimpleInstanceOne::setStringValue( const std::string& stringValue )
{
    m_value = stringValue;
}

std::string
SimpleInstanceOne::getStringValue(  )
{
    return m_value;
}

void
SimpleInstanceTwo::setStringValue( const std::string& stringValue )
{
    m_value = stringValue;
}

std::string
SimpleInstanceTwo::getStringValue(  )
{
    return m_value;
}

void
NestedInstanceOne::setSameTypeInstances( const std::shared_ptr< SimpleInstantiableOne >& instanceOne,
    const std::shared_ptr< SimpleInstantiableOne >& instanceTwo )
{
    m_instanceOne = instanceOne;
    m_instanceTwo = instanceTwo;
}

std::shared_ptr< SimpleInstantiableOne >
NestedInstanceOne::getInstanceOne(  )
{
    return m_instanceOne;
}

std::shared_ptr< SimpleInstantiableOne >
NestedInstanceOne::getInstanceTwo(  )
{
    return m_instanceTwo;
}

void
NestedInstanceTwo::setMultipleTypeInstances( const std::shared_ptr< SimpleInstantiableOne >& instanceOne,
    const std::shared_ptr< SimpleInstantiableTwo >& instanceTwo,
    const std::shared_ptr< NestedInstantiableOne >& nestedInstantiable )
{
    m_instanceOne = instanceOne;
    m_instanceTwo = instanceTwo;
    m_nestedInstance = nestedInstantiable;
}

void
NestedInstanceTwo::setSelfInstantiable( const std::shared_ptr< NestedInstantiableTwo >& instance )
{
    m_instanceSelf = instance;
}

std::shared_ptr< NestedInstantiableTwo >
NestedInstanceTwo::getSelfInstantiable(  )
{
    return m_instanceSelf;
}

std::shared_ptr< SimpleInstantiableOne >
NestedInstanceTwo::getInstantiableOne(  )
{
    return m_instanceOne;
}

std::shared_ptr< SimpleInstantiableTwo >
NestedInstanceTwo::getInstantiableTwo(  )
{
    return m_instanceTwo;
}

std::shared_ptr< NestedInstantiableOne >
NestedInstanceTwo::getNestedInstantiable(  )
{
    return m_nestedInstance;
}

}

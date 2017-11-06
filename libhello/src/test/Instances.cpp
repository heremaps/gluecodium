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
SimpleInstanceOne::set_string_value( const std::string& string_value )
{
    m_value = string_value;
}

std::string
SimpleInstanceOne::get_string_value(  )
{
    return m_value;
}

void
SimpleInstanceTwo::set_string_value( const std::string& string_value )
{
    m_value = string_value;
}

std::string
SimpleInstanceTwo::get_string_value(  )
{
    return m_value;
}

void
NestedInstanceOne::set_same_type_instances( 
    const std::shared_ptr< SimpleInstantiableOne >& instance_one,
    const std::shared_ptr< SimpleInstantiableOne >& instance_two )
{
    m_instance_one = instance_one;
    m_instance_two = instance_two;
}

std::shared_ptr< SimpleInstantiableOne >
NestedInstanceOne::get_instance_one(  )
{
    return m_instance_one;
}

std::shared_ptr< SimpleInstantiableOne >
NestedInstanceOne::get_instance_two(  )
{
    return m_instance_two;
}

void
NestedInstanceTwo::set_multiple_type_instances( 
    const std::shared_ptr< SimpleInstantiableOne >& instance_one,
    const std::shared_ptr< SimpleInstantiableTwo >& instance_two,
    const std::shared_ptr< NestedInstantiableOne >& nested_instantiable )
{
    m_instance_one = instance_one;
    m_instance_two = instance_two;
    m_nested_instance = nested_instantiable;
}

void
NestedInstanceTwo::set_self_instantiable( const std::shared_ptr< NestedInstantiableTwo >& instance )
{
    m_instance_self = instance;
}

std::shared_ptr< NestedInstantiableTwo >
NestedInstanceTwo::get_self_instantiable(  )
{
    return m_instance_self;
}

std::shared_ptr< SimpleInstantiableOne >
NestedInstanceTwo::get_instantiable_one(  )
{
    return m_instance_one;
}

std::shared_ptr< SimpleInstantiableTwo >
NestedInstanceTwo::get_instantiable_two(  )
{
    return m_instance_two;
}

std::shared_ptr< NestedInstantiableOne >
NestedInstanceTwo::get_nested_instantiable(  )
{
    return m_nested_instance;
}

}

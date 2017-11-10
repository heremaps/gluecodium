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

#include "Interfaces.h"
#include <memory>

namespace test
{

void
SimpleInterfaceOneImpl::set_string_value( const std::string& string_value )
{
    m_value = string_value;
}

std::string
SimpleInterfaceOneImpl::get_string_value(  )
{
    return m_value;
}

void
SimpleInterfaceTwoImpl::set_string_value( const std::string& string_value )
{
    m_value = string_value;
}

std::string
SimpleInterfaceTwoImpl::get_string_value(  )
{
    return m_value;
}

void
NestedInterfaceOneImpl::set_same_type_interfaces(
    const std::shared_ptr< SimpleInterfaceOne >& interface_one,
    const std::shared_ptr< SimpleInterfaceOne >& interface_two )
{
    m_interface_one = interface_one;
    m_interface_two = interface_two;
}

std::shared_ptr< SimpleInterfaceOne >
NestedInterfaceOneImpl::get_interface_one(  )
{
    return m_interface_one;
}

std::shared_ptr< SimpleInterfaceOne >
NestedInterfaceOneImpl::get_interface_two(  )
{
    return m_interface_two;
}

void
NestedInterfaceTwoImpl::set_multiple_type_interfaces(
    const std::shared_ptr< SimpleInterfaceOne >& interface_one,
    const std::shared_ptr< SimpleInterfaceTwo >& interface_two,
    const std::shared_ptr< NestedInterfaceOne >& nested_interface )
{
    m_interface_one = interface_one;
    m_interface_two = interface_two;
    m_nested_interface = nested_interface;
}

void
NestedInterfaceTwoImpl::set_self_interface( const std::shared_ptr< NestedInterfaceTwo >& interface )
{
    m_interface_self = interface;
}

std::shared_ptr< NestedInterfaceTwo >
NestedInterfaceTwoImpl::get_self_interface(  )
{
    return m_interface_self;
}

std::shared_ptr< SimpleInterfaceOne >
NestedInterfaceTwoImpl::get_interface_one(  )
{
    return m_interface_one;
}

std::shared_ptr< SimpleInterfaceTwo >
NestedInterfaceTwoImpl::get_interface_two(  )
{
    return m_interface_two;
}

std::shared_ptr< NestedInterfaceOne >
NestedInterfaceTwoImpl::get_nested_interface(  )
{
    return m_nested_interface;
}

}

// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
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
SimpleInterfaceOneImpl::get_string_value( )
{
    return m_value;
}

void
SimpleInterfaceTwoImpl::set_string_value( const std::string& string_value )
{
    m_value = string_value;
}

std::string
SimpleInterfaceTwoImpl::get_string_value( )
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
NestedInterfaceOneImpl::get_interface_one( )
{
    return m_interface_one;
}

std::shared_ptr< SimpleInterfaceOne >
NestedInterfaceOneImpl::get_interface_two( )
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
NestedInterfaceTwoImpl::get_self_interface( )
{
    return m_interface_self;
}

std::shared_ptr< SimpleInterfaceOne >
NestedInterfaceTwoImpl::get_interface_one( )
{
    return m_interface_one;
}

std::shared_ptr< SimpleInterfaceTwo >
NestedInterfaceTwoImpl::get_interface_two( )
{
    return m_interface_two;
}

std::shared_ptr< NestedInterfaceOne >
NestedInterfaceTwoImpl::get_nested_interface( )
{
    return m_nested_interface;
}

}  // namespace test

// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
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

#pragma once

#include "test/NestedInterfaceOne.h"
#include "test/NestedInterfaceTwo.h"
#include "test/SimpleInterfaceOne.h"
#include "test/SimpleInterfaceTwo.h"

namespace test
{
class SimpleInterfaceOneImpl : public SimpleInterfaceOne
{
public:
    void set_string_value( const std::string& string_value ) override;
    std::string get_string_value( ) override;

private:
    std::string m_value;
};

class SimpleInterfaceTwoImpl : public SimpleInterfaceTwo
{
public:
    void set_string_value( const std::string& string_value ) override;
    std::string get_string_value( ) override;

private:
    std::string m_value;
};

class NestedInterfaceOneImpl : public NestedInterfaceOne
{
public:
    void set_same_type_interfaces(
        const std::shared_ptr< SimpleInterfaceOne >& interface_one,
        const std::shared_ptr< SimpleInterfaceOne >& interface_two ) override;
    std::shared_ptr< SimpleInterfaceOne > get_interface_one( ) override;
    std::shared_ptr< SimpleInterfaceOne > get_interface_two( ) override;

private:
    std::shared_ptr< SimpleInterfaceOne > m_interface_one;
    std::shared_ptr< SimpleInterfaceOne > m_interface_two;
};

class NestedInterfaceTwoImpl : public NestedInterfaceTwo
{
public:
    void set_multiple_type_interfaces(
        const std::shared_ptr< SimpleInterfaceOne >& interface_one,
        const std::shared_ptr< SimpleInterfaceTwo >& interface_two,
        const std::shared_ptr< NestedInterfaceOne >& nested_interface ) override;
    void set_self_interface(
        const ::std::shared_ptr< NestedInterfaceTwo >& self_interface ) override;
    std::shared_ptr< NestedInterfaceTwo > get_self_interface( ) override;
    std::shared_ptr< SimpleInterfaceOne > get_interface_one( ) override;
    std::shared_ptr< SimpleInterfaceTwo > get_interface_two( ) override;
    std::shared_ptr< NestedInterfaceOne > get_nested_interface( ) override;

private:
    std::shared_ptr< NestedInterfaceTwo > m_interface_self;
    std::shared_ptr< SimpleInterfaceOne > m_interface_one;
    std::shared_ptr< SimpleInterfaceTwo > m_interface_two;
    std::shared_ptr< NestedInterfaceOne > m_nested_interface;
};

}  // namespace test

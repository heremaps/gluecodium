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

#pragma once

#include "test/NestedInstantiableOne.h"
#include "test/NestedInstantiableTwo.h"
#include "test/SimpleInstantiableOne.h"
#include "test/SimpleInstantiableTwo.h"

namespace test
{
class SimpleInstanceOne : public SimpleInstantiableOne
{
public:
    void set_string_value( const std::string& string_value ) override;
    std::string get_string_value( ) override;

private:
    std::string m_value;
};

class SimpleInstanceTwo : public SimpleInstantiableTwo
{
public:
    void set_string_value( const std::string& string_value ) override;
    std::string get_string_value( ) override;

private:
    std::string m_value;
};

class NestedInstanceOne : public NestedInstantiableOne
{
public:
    void set_same_type_instances(
        const std::shared_ptr< SimpleInstantiableOne >& instance_one,
        const std::shared_ptr< SimpleInstantiableOne >& instance_two ) override;
    std::shared_ptr< SimpleInstantiableOne > get_instance_one( ) override;
    std::shared_ptr< SimpleInstantiableOne > get_instance_two( ) override;

private:
    std::shared_ptr< SimpleInstantiableOne > m_instance_one;
    std::shared_ptr< SimpleInstantiableOne > m_instance_two;
};

class NestedInstanceTwo : public NestedInstantiableTwo
{
public:
    void set_multiple_type_instances(
        const std::shared_ptr< SimpleInstantiableOne >& instance_one,
        const std::shared_ptr< SimpleInstantiableTwo >& instance_two,
        const std::shared_ptr< NestedInstantiableOne >& nested_instantiable ) override;
    void set_self_instantiable(
        const ::std::shared_ptr< NestedInstantiableTwo >& self_instance ) override;
    std::shared_ptr< NestedInstantiableTwo > get_self_instantiable( ) override;
    std::shared_ptr< SimpleInstantiableOne > get_instantiable_one( ) override;
    std::shared_ptr< SimpleInstantiableTwo > get_instantiable_two( ) override;
    std::shared_ptr< NestedInstantiableOne > get_nested_instantiable( ) override;

private:
    std::shared_ptr< NestedInstantiableTwo > m_instance_self;
    std::shared_ptr< SimpleInstantiableOne > m_instance_one;
    std::shared_ptr< SimpleInstantiableTwo > m_instance_two;
    std::shared_ptr< NestedInstantiableOne > m_nested_instance;
};

}  // namespace test

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

#include "hello/NestedInstantiable.h"
#include "hello/SimpleInstantiable.h"

namespace hello
{
class HelloWorldSimpleInstantiable : public SimpleInstantiable
{
public:
    void set_string_value( const ::std::string& string_value ) override;
    ::std::string get_string_value( ) override;

private:
    ::std::string m_string_value = "";
};

class HelloWorldNestedInstantiable : public NestedInstantiable
{
public:
    HelloWorldNestedInstantiable( const ::std::shared_ptr<::hello::SimpleInstantiable >& instance );

    void set_instantiable(
        const ::std::shared_ptr<::hello::SimpleInstantiable >& instance ) override;
    ::std::shared_ptr<::hello::SimpleInstantiable > get_instantiable( ) override;

private:
    ::std::shared_ptr<::hello::SimpleInstantiable > m_instance = nullptr;
};
}  // namespace hello

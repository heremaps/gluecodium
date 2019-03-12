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

#include "AttributesInterfaceImpl.h"

namespace test
{

AttributesInterfaceImpl::~AttributesInterfaceImpl( ) = default;

uint32_t
AttributesInterfaceImpl::get_built_in_type_attribute( )
{
    return m_build_in_type_attribute;
}

void
AttributesInterfaceImpl::set_built_in_type_attribute( const uint32_t value )
{
    m_build_in_type_attribute = value;
}

::test::AttributesInterface::ExampleStruct
AttributesInterfaceImpl::get_struct_attribute( )
{
    return m_struct_attribute;
}

void
AttributesInterfaceImpl::set_struct_attribute(
    const ::test::AttributesInterface::ExampleStruct& value )
{
    m_struct_attribute = value;
}

}

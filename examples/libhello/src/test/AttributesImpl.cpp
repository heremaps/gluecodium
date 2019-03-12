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

#include "AttributesImpl.h"

namespace test
{
std::string s_static_attribute = "";

AttributesImpl::~AttributesImpl( ) = default;

uint32_t
AttributesImpl::get_built_in_type_attribute( ) const
{
    return m_build_in_type_attribute;
}

void
AttributesImpl::set_built_in_type_attribute( const uint32_t value )
{
    m_build_in_type_attribute = value;
}

float
AttributesImpl::get_readonly_attribute( ) const
{
    return 3.14f;
}

::test::Attributes::ExampleStruct
AttributesImpl::get_struct_attribute( ) const
{
    return m_struct_attribute;
}

void
AttributesImpl::set_struct_attribute( const ::test::Attributes::ExampleStruct& value )
{
    m_struct_attribute = value;
}

::test::Attributes::StringArray
AttributesImpl::get_array_attribute( ) const
{
    return m_array_attribute;
}

void
AttributesImpl::set_array_attribute( const ::test::Attributes::StringArray& value )
{
    m_array_attribute = value;
}

std::string
Attributes::get_static_attribute( )
{
    return s_static_attribute;
}

void
Attributes::set_static_attribute( const std::string& value )
{
    s_static_attribute = value;
}

::std::shared_ptr< Attributes >
Attributes::create( )
{
    return ::std::make_shared< AttributesImpl >( );
}
}  // namespace test

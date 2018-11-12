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

#include "HelloWorldAttributesImpl.h"

namespace hello
{

HelloWorldAttributesImpl::~HelloWorldAttributesImpl( ) = default;

uint32_t
HelloWorldAttributesImpl::get_built_in_type_attribute( ) const
{
    return m_build_in_type_attribute;
}

void
HelloWorldAttributesImpl::set_built_in_type_attribute( const uint32_t value )
{
    m_build_in_type_attribute = value;
}

float
HelloWorldAttributesImpl::get_readonly_attribute( ) const
{
    return m_read_only_attribute;
}

::hello::HelloWorldAttributes::ExampleStruct
HelloWorldAttributesImpl::get_struct_attribute( ) const
{
    return m_struct_attribute;
}

void
HelloWorldAttributesImpl::set_struct_attribute(
    const ::hello::HelloWorldAttributes::ExampleStruct& value )
{
    m_struct_attribute = value;
}
    
::hello::HelloWorldAttributes::StringArray
HelloWorldAttributesImpl::get_array_attribute(  ) const
{
    return m_array;
}

void
HelloWorldAttributesImpl::set_array_attribute( const ::hello::HelloWorldAttributes::StringArray& value )
{
    m_array = value;
}

}



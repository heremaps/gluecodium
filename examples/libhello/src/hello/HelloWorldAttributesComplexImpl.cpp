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

#include "HelloWorldAttributesComplexImpl.h"

namespace hello
{
HelloWorldAttributesComplexImpl::~HelloWorldAttributesComplexImpl( ) = default;

::std::vector<::std::string >
HelloWorldAttributesComplexImpl::get_array_attribute( ) const
{
    return m_array_attribute;
}

void
HelloWorldAttributesComplexImpl::set_array_attribute( const ::std::vector<::std::string >& value )
{
    m_array_attribute = value;
}

::hello::HelloWorldAttributesComplex::InternalError
HelloWorldAttributesComplexImpl::get_complex_type_attribute( ) const
{
    return m_complex_type_attribute;
}

void
HelloWorldAttributesComplexImpl::set_complex_type_attribute(
    const ::hello::HelloWorldAttributesComplex::InternalError value )
{
    m_complex_type_attribute = value;
}

}  // namespace hello

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

#include "hello/HelloWorldAttributesComplex.h"

namespace hello
{
class HelloWorldAttributesComplexImpl : public HelloWorldAttributesComplex
{
public:
    ~HelloWorldAttributesComplexImpl( ) override;

public:
    ::std::vector<::std::string > get_array_attribute( ) const override;
    void set_array_attribute( const ::std::vector<::std::string >& value ) override;
    ::hello::HelloWorldAttributesComplex::InternalError get_complex_type_attribute( )
        const override;
    void set_complex_type_attribute(
        const ::hello::HelloWorldAttributesComplex::InternalError value ) override;

private:
    ::std::vector<::std::string > m_array_attribute;
    ::hello::HelloWorldAttributesComplex::InternalError m_complex_type_attribute
        = ::hello::HelloWorldAttributesComplex::InternalError::ERROR_NONE;
};
}  // namespace hello

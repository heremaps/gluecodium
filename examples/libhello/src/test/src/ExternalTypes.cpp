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

#include "include/ExternalTypes.h"

namespace external
{
namespace even_more_external
{
std::error_code
make_error_code( AlienErrorCode value ) noexcept
{
    return std::error_code( static_cast< int >( value ), std::generic_category( ) );
}
}  // namespace even_more_external

std::string
ExternalStruct::get_some_string( ) const
{
    return m_some_string;
}

void
ExternalStruct::set_some_string( const std::string& value )
{
    m_some_string = value;
}

std::vector< int32_t >
ExternalStruct::getSomeArray( ) const
{
    return m_some_array;
}

void
ExternalStruct::setSomeArray( const std::vector< int32_t >& value )
{
    m_some_array = value;
}

even_more_external::AlienStructure
ExternalStruct::aStruct( ) const
{
    return m_some_struct;
}

void
ExternalStruct::_set_aStruct( const even_more_external::AlienStructure& value )
{
    m_some_struct = value;
}

const std::string&
ClassWithOverloads::StructWithOverloads::overloadedMethod( )
{
    return {};
}

std::string
ClassWithOverloads::StructWithOverloads::overloadedMethod( const std::string& input )
{
    return input;
}

void
ClassWithOverloads::StructWithOverloads::overloadedAccessors( int32_t value ) {
    m_someField = value;
}

const int32_t&
ClassWithOverloads::StructWithOverloads::overloadedAccessors( ) const
{
    return m_someField;
}

}  // namespace external

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

#include "Nullable.h"

namespace test
{
std::shared_ptr< Nullable >
Nullable::create( )
{
    return std::make_shared< NullableImpl >( );
}

::std::shared_ptr< ::std::string >
NullableImpl::method_with_string( const ::std::shared_ptr< ::std::string >& input )
{
    return input;
}

::std::shared_ptr< bool >
NullableImpl::method_with_boolean( const ::std::shared_ptr< bool >& input )
{
    return input;
}

::std::shared_ptr< double >
NullableImpl::method_with_double( const ::std::shared_ptr< double >& input )
{
    return input;
}

::std::shared_ptr< int64_t >
NullableImpl::method_with_int( const ::std::shared_ptr< int64_t >& input )
{
    return input;
}

::std::shared_ptr< Nullable::SomeStruct >
NullableImpl::method_with_some_struct( const ::std::shared_ptr< Nullable::SomeStruct >& input )
{
    return input;
}

::std::shared_ptr< Nullable::SomeEnum >
NullableImpl::method_with_some_enum( const ::std::shared_ptr< Nullable::SomeEnum >& input )
{
    return input;
}

::std::shared_ptr< Nullable::SomeArray >
NullableImpl::method_with_some_array(
  const ::std::shared_ptr< Nullable::SomeArray >& input )
{
    return input;
}

::std::shared_ptr< ::std::vector< ::std::string > >
NullableImpl::method_with_inline_array(
    const ::std::shared_ptr< ::std::vector< ::std::string > >& input )
{
    return input;
}

::std::shared_ptr< Nullable::SomeMap >
NullableImpl::method_with_some_map( const ::std::shared_ptr< Nullable::SomeMap >& input )
{
    return input;
}

::std::shared_ptr< ::std::string >
NullableImpl::get_string_attribute(  ) const
{
    return m_string_value;
}

void
NullableImpl::set_string_attribute( const ::std::shared_ptr< ::std::string >& value )
{
    m_string_value = value;
}

::std::shared_ptr< bool >
NullableImpl::is_bool_attribute(  ) const
{
    return m_bool_value;
}

void
NullableImpl::set_bool_attribute( const ::std::shared_ptr< bool >& value )
{
    m_bool_value = value;
}

::std::shared_ptr< double >
NullableImpl::get_double_attribute(  ) const
{
    return m_double_value;
}

void
NullableImpl::set_double_attribute( const ::std::shared_ptr< double >& value )
{
    m_double_value = value;
}

::std::shared_ptr< int64_t >
NullableImpl::get_int_attribute(  ) const
{
    return m_int_value;
}

void
NullableImpl::set_int_attribute( const ::std::shared_ptr< int64_t >& value )
{
    m_int_value = value;
}

::std::shared_ptr< Nullable::SomeStruct >
NullableImpl::get_struct_attribute(  ) const
{
    return m_struct_value;
}

void
NullableImpl::set_struct_attribute( const ::std::shared_ptr< Nullable::SomeStruct >& value )
{
    m_struct_value = value;
}

::std::shared_ptr< Nullable::SomeEnum >
NullableImpl::get_enum_attribute(  ) const
{
    return m_enum_value;
}

void
NullableImpl::set_enum_attribute( const ::std::shared_ptr< Nullable::SomeEnum >& value )
{
    m_enum_value = value;
}

::std::shared_ptr< Nullable::SomeArray >
NullableImpl::get_array_attribute(  ) const
{
    return m_array_value;
}

void
NullableImpl::set_array_attribute( const ::std::shared_ptr< Nullable::SomeArray >& value )
{
    m_array_value = value;
}

::std::shared_ptr< ::std::vector< ::std::string > >
NullableImpl::get_inline_array_attribute(  ) const
{
    return m_array_value;
}

void
NullableImpl::set_inline_array_attribute(
    const ::std::shared_ptr< ::std::vector< ::std::string > >& value )
{
    m_array_value = value;
}

::std::shared_ptr< Nullable::SomeMap >
NullableImpl::get_map_attribute(  ) const
{
    return m_map_value;
}

void
NullableImpl::set_map_attribute( const ::std::shared_ptr< Nullable::SomeMap >& value )
{
    m_map_value = value;
}

}  // namespace test

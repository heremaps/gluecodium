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

#include "NullableInterfaceImpl.h"
#include "test/NullableListener.h"

namespace test
{
using namespace lorem_ipsum::test;

std::shared_ptr< NullableInterface >
NullableInterface::create( )
{
    return std::make_shared< NullableInterfaceImpl >( );
}

NullableInterface::NullableStruct
NullableInterfaceImpl::method_with_nullable_struct( const NullableStruct& input )
{
    return input;
}

NullableInterface::NullableIntsStruct
NullableInterfaceImpl::method_with_nullable_ints_struct( const NullableIntsStruct& input )
{
    return input;
}

optional< ::std::string >
NullableInterfaceImpl::method_with_string( const optional< ::std::string >& input )
{
    return input;
}

optional< bool >
NullableInterfaceImpl::method_with_boolean( const optional< bool >& input )
{
    return input;
}

optional< double >
NullableInterfaceImpl::method_with_double( const optional< double >& input )
{
    return input;
}

optional< int64_t >
NullableInterfaceImpl::method_with_int( const optional< int64_t >& input )
{
    return input;
}

optional<uint32_t>
NullableInterfaceImpl::method_with_uint(const optional<uint32_t>& input) { return input; }

optional< NullableInterface::SomeStruct >
NullableInterfaceImpl::method_with_some_struct( const optional< NullableInterface::SomeStruct >& input )
{
    return input;
}

optional< NullableInterface::SomeEnum >
NullableInterfaceImpl::method_with_some_enum( const optional< NullableInterface::SomeEnum >& input )
{
    return input;
}

optional< NullableInterface::SomeArray >
NullableInterfaceImpl::method_with_some_array(
  const optional< NullableInterface::SomeArray >& input )
{
    return input;
}

optional< ::std::vector< ::std::string > >
NullableInterfaceImpl::method_with_inline_array(
    const optional< ::std::vector< ::std::string > >& input )
{
    return input;
}

optional< NullableInterface::SomeMap >
NullableInterfaceImpl::method_with_some_map( const optional< NullableInterface::SomeMap >& input )
{
    return input;
}

optional< ::std::string >
NullableInterfaceImpl::get_string_attribute(  ) const
{
    return m_string_value;
}

void
NullableInterfaceImpl::set_string_attribute( const optional< ::std::string >& value )
{
    m_string_value = value;
}

optional< bool >
NullableInterfaceImpl::is_bool_attribute(  ) const
{
    return m_bool_value;
}

void
NullableInterfaceImpl::set_bool_attribute( const optional< bool >& value )
{
    m_bool_value = value;
}

optional< double >
NullableInterfaceImpl::get_double_attribute(  ) const
{
    return m_double_value;
}

void
NullableInterfaceImpl::set_double_attribute( const optional< double >& value )
{
    m_double_value = value;
}

optional< int64_t >
NullableInterfaceImpl::get_int_attribute(  ) const
{
    return m_int_value;
}

void
NullableInterfaceImpl::set_int_attribute( const optional< int64_t >& value )
{
    m_int_value = value;
}

optional< NullableInterface::SomeStruct >
NullableInterfaceImpl::get_struct_attribute(  ) const
{
    return m_struct_value;
}

void
NullableInterfaceImpl::set_struct_attribute( const optional< NullableInterface::SomeStruct >& value )
{
    m_struct_value = value;
}

optional< NullableInterface::SomeEnum >
NullableInterfaceImpl::get_enum_attribute(  ) const
{
    return m_enum_value;
}

void
NullableInterfaceImpl::set_enum_attribute( const optional< NullableInterface::SomeEnum >& value )
{
    m_enum_value = value;
}

optional< NullableInterface::SomeArray >
NullableInterfaceImpl::get_array_attribute(  ) const
{
    return m_array_value;
}

void
NullableInterfaceImpl::set_array_attribute( const optional< NullableInterface::SomeArray >& value )
{
    m_array_value = value;
}

optional< ::std::vector< ::std::string > >
NullableInterfaceImpl::get_inline_array_attribute(  ) const
{
    return m_array_value;
}

void
NullableInterfaceImpl::set_inline_array_attribute(
    const optional< ::std::vector< ::std::string > >& value )
{
    m_array_value = value;
}

optional< NullableInterface::SomeMap >
NullableInterfaceImpl::get_map_attribute(  ) const
{
    return m_map_value;
}

void
NullableInterfaceImpl::set_map_attribute( const optional< NullableInterface::SomeMap >& value )
{
    m_map_value = value;
}

optional< double >
NullableInterface::nullable_listener_method_round_trip(
    const std::shared_ptr< ::test::NullableListener >& listener,
    const optional< double >& input )
{
    return listener->method_with_double( input );
}

optional< std::vector< ::std::string > >
NullableInterface::nullable_listener_attribute_round_trip(
    const std::shared_ptr< ::test::NullableListener >& listener,
    const optional< ::std::vector< ::std::string > >& input )
{
    listener->set_array_attribute( input );
    return listener->get_array_attribute( );
}

}  // namespace test

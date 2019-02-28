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

#include "NullableInterface.h"

namespace test
{
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

::std::shared_ptr< ::std::string >
NullableInterfaceImpl::method_with_string( const ::std::shared_ptr< ::std::string >& input )
{
    return input;
}

::std::shared_ptr< bool >
NullableInterfaceImpl::method_with_boolean( const ::std::shared_ptr< bool >& input )
{
    return input;
}

::std::shared_ptr< double >
NullableInterfaceImpl::method_with_double( const ::std::shared_ptr< double >& input )
{
    return input;
}

::std::shared_ptr< int64_t >
NullableInterfaceImpl::method_with_int( const ::std::shared_ptr< int64_t >& input )
{
    return input;
}

::std::shared_ptr< NullableInterface::SomeStruct >
NullableInterfaceImpl::method_with_some_struct( const ::std::shared_ptr< NullableInterface::SomeStruct >& input )
{
    return input;
}

::std::shared_ptr< NullableInterface::SomeEnum >
NullableInterfaceImpl::method_with_some_enum( const ::std::shared_ptr< NullableInterface::SomeEnum >& input )
{
    return input;
}

::std::shared_ptr< NullableInterface::SomeArray >
NullableInterfaceImpl::method_with_some_array(
  const ::std::shared_ptr< NullableInterface::SomeArray >& input )
{
    return input;
}

::std::shared_ptr< ::std::vector< ::std::string > >
NullableInterfaceImpl::method_with_inline_array(
    const ::std::shared_ptr< ::std::vector< ::std::string > >& input )
{
    return input;
}

::std::shared_ptr< NullableInterface::SomeMap >
NullableInterfaceImpl::method_with_some_map( const ::std::shared_ptr< NullableInterface::SomeMap >& input )
{
    return input;
}

::std::shared_ptr< ::std::string >
NullableInterfaceImpl::get_string_attribute(  ) const
{
    return m_string_value;
}

void
NullableInterfaceImpl::set_string_attribute( const ::std::shared_ptr< ::std::string >& value )
{
    m_string_value = value;
}

::std::shared_ptr< bool >
NullableInterfaceImpl::is_bool_attribute(  ) const
{
    return m_bool_value;
}

void
NullableInterfaceImpl::set_bool_attribute( const ::std::shared_ptr< bool >& value )
{
    m_bool_value = value;
}

::std::shared_ptr< double >
NullableInterfaceImpl::get_double_attribute(  ) const
{
    return m_double_value;
}

void
NullableInterfaceImpl::set_double_attribute( const ::std::shared_ptr< double >& value )
{
    m_double_value = value;
}

::std::shared_ptr< int64_t >
NullableInterfaceImpl::get_int_attribute(  ) const
{
    return m_int_value;
}

void
NullableInterfaceImpl::set_int_attribute( const ::std::shared_ptr< int64_t >& value )
{
    m_int_value = value;
}

::std::shared_ptr< NullableInterface::SomeStruct >
NullableInterfaceImpl::get_struct_attribute(  ) const
{
    return m_struct_value;
}

void
NullableInterfaceImpl::set_struct_attribute( const ::std::shared_ptr< NullableInterface::SomeStruct >& value )
{
    m_struct_value = value;
}

::std::shared_ptr< NullableInterface::SomeEnum >
NullableInterfaceImpl::get_enum_attribute(  ) const
{
    return m_enum_value;
}

void
NullableInterfaceImpl::set_enum_attribute( const ::std::shared_ptr< NullableInterface::SomeEnum >& value )
{
    m_enum_value = value;
}

::std::shared_ptr< NullableInterface::SomeArray >
NullableInterfaceImpl::get_array_attribute(  ) const
{
    return m_array_value;
}

void
NullableInterfaceImpl::set_array_attribute( const ::std::shared_ptr< NullableInterface::SomeArray >& value )
{
    m_array_value = value;
}

::std::shared_ptr< ::std::vector< ::std::string > >
NullableInterfaceImpl::get_inline_array_attribute(  ) const
{
    return m_array_value;
}

void
NullableInterfaceImpl::set_inline_array_attribute(
    const ::std::shared_ptr< ::std::vector< ::std::string > >& value )
{
    m_array_value = value;
}

::std::shared_ptr< NullableInterface::SomeMap >
NullableInterfaceImpl::get_map_attribute(  ) const
{
    return m_map_value;
}

void
NullableInterfaceImpl::set_map_attribute( const ::std::shared_ptr< NullableInterface::SomeMap >& value )
{
    m_map_value = value;
}

std::shared_ptr< double >
NullableInterface::nullable_listener_method_round_trip(
    const ::std::shared_ptr< ::test::NullableListener >& listener,
    const ::std::shared_ptr< double >& input )
{
    return listener->method_with_double( input );
}

std::shared_ptr< std::vector< ::std::string > >
NullableInterface::nullable_listener_attribute_round_trip(
    const ::std::shared_ptr< ::test::NullableListener >& listener,
    const ::std::shared_ptr< ::std::vector< ::std::string > >& input )
{
    listener->set_array_attribute( input );
    return listener->get_array_attribute( );
}

}  // namespace test

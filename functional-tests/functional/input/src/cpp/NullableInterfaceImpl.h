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

#pragma once

#include <test/NullableInterface.h>

namespace test
{

template< typename T >
using Optional = lorem_ipsum::test::optional< T >;

class NullableInterfaceImpl : public NullableInterface
{
public:
    NullableStruct method_with_nullable_struct( const NullableStruct& input ) override;
    NullableIntsStruct method_with_nullable_ints_struct( const NullableIntsStruct& input ) override;
    Optional< ::std::string > method_with_string(
        const Optional< ::std::string >& input ) override;
    Optional< bool > method_with_boolean(
        const Optional< bool >& input ) override;
    Optional< double > method_with_double(
        const Optional< double >& input ) override;
    Optional< int64_t > method_with_int(
        const Optional< int64_t >& input ) override;
    Optional< SomeStruct > method_with_some_struct(
        const Optional< SomeStruct >& input ) override;
    Optional< SomeEnum > method_with_some_enum(
        const Optional< SomeEnum >& input ) override;
    Optional< SomeArray > method_with_some_array(
        const Optional< SomeArray >& input ) override;
    Optional< ::std::vector< ::std::string > > method_with_inline_array(
        const Optional< ::std::vector< ::std::string > >& input ) override;
    Optional< SomeMap > method_with_some_map(
        const Optional< SomeMap >& input ) override;

    Optional< ::std::string > get_string_attribute(  ) const override;
    void set_string_attribute( const Optional< ::std::string >& value ) override;
    Optional< bool > is_bool_attribute(  ) const override;
    void set_bool_attribute( const Optional< bool >& value ) override;
    Optional< double > get_double_attribute(  ) const override;
    void set_double_attribute( const Optional< double >& value ) override;
    Optional< int64_t > get_int_attribute(  ) const override;
    void set_int_attribute( const Optional< int64_t >& value ) override;
    Optional< SomeStruct > get_struct_attribute(  ) const override;
    void set_struct_attribute( const Optional< SomeStruct >& value ) override;
    Optional< SomeEnum > get_enum_attribute(  ) const override;
    void set_enum_attribute( const Optional< SomeEnum >& value ) override;
    Optional< SomeArray > get_array_attribute(  ) const override;
    void set_array_attribute( const Optional< SomeArray >& value ) override;
    Optional< ::std::vector< ::std::string > >
        get_inline_array_attribute(  ) const override;
    void set_inline_array_attribute( const Optional< ::std::vector< ::std::string > >& value ) override;
    Optional< SomeMap > get_map_attribute(  ) const override;
    void set_map_attribute( const Optional< SomeMap >& value ) override;

private:
    Optional< ::std::string > m_string_value;
    Optional< bool > m_bool_value;
    Optional< double > m_double_value;
    Optional< int64_t > m_int_value;
    Optional< SomeStruct > m_struct_value;
    Optional< SomeEnum > m_enum_value;
    Optional< SomeArray > m_array_value;
    Optional< SomeMap > m_map_value;
};

}  // namespace test

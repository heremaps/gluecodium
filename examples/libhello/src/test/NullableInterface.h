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

#include "test/NullableInterface.h"

namespace test
{
class NullableInterfaceImpl : public NullableInterface
{
public:
    NullableStruct method_with_nullable_struct( const NullableStruct& input ) override;
    ::std::shared_ptr< ::std::string > method_with_string(
        const ::std::shared_ptr< ::std::string >& input ) override;
    ::std::shared_ptr< bool > method_with_boolean(
        const ::std::shared_ptr< bool >& input ) override;
    ::std::shared_ptr< double > method_with_double(
        const ::std::shared_ptr< double >& input ) override;
    ::std::shared_ptr< int64_t > method_with_int(
        const ::std::shared_ptr< int64_t >& input ) override;
    ::std::shared_ptr< SomeStruct > method_with_some_struct(
        const ::std::shared_ptr< SomeStruct >& input ) override;
    ::std::shared_ptr< SomeEnum > method_with_some_enum(
        const ::std::shared_ptr< SomeEnum >& input ) override;
    ::std::shared_ptr< SomeArray > method_with_some_array(
        const ::std::shared_ptr< SomeArray >& input ) override;
    ::std::shared_ptr< ::std::vector< ::std::string > > method_with_inline_array(
        const ::std::shared_ptr< ::std::vector< ::std::string > >& input ) override;
    ::std::shared_ptr< SomeMap > method_with_some_map(
        const ::std::shared_ptr< SomeMap >& input ) override;

    ::std::shared_ptr< ::std::string > get_string_attribute(  ) const override;
    void set_string_attribute( const ::std::shared_ptr< ::std::string >& value ) override;
    ::std::shared_ptr< bool > is_bool_attribute(  ) const override;
    void set_bool_attribute( const ::std::shared_ptr< bool >& value ) override;
    ::std::shared_ptr< double > get_double_attribute(  ) const override;
    void set_double_attribute( const ::std::shared_ptr< double >& value ) override;
    ::std::shared_ptr< int64_t > get_int_attribute(  ) const override;
    void set_int_attribute( const ::std::shared_ptr< int64_t >& value ) override;
    ::std::shared_ptr< SomeStruct > get_struct_attribute(  ) const override;
    void set_struct_attribute( const ::std::shared_ptr< SomeStruct >& value ) override;
    ::std::shared_ptr< SomeEnum > get_enum_attribute(  ) const override;
    void set_enum_attribute( const ::std::shared_ptr< SomeEnum >& value ) override;
    ::std::shared_ptr< SomeArray > get_array_attribute(  ) const override;
    void set_array_attribute( const ::std::shared_ptr< SomeArray >& value ) override;
    ::std::shared_ptr< ::std::vector< ::std::string > >
        get_inline_array_attribute(  ) const override;
    void set_inline_array_attribute( const ::std::shared_ptr< ::std::vector< ::std::string > >& value ) override;
    ::std::shared_ptr< SomeMap > get_map_attribute(  ) const override;
    void set_map_attribute( const ::std::shared_ptr< SomeMap >& value ) override;

private:
    ::std::shared_ptr< ::std::string > m_string_value;
    ::std::shared_ptr< bool > m_bool_value;
    ::std::shared_ptr< double > m_double_value;
    ::std::shared_ptr< int64_t > m_int_value;
    ::std::shared_ptr< SomeStruct > m_struct_value;
    ::std::shared_ptr< SomeEnum > m_enum_value;
    ::std::shared_ptr< SomeArray > m_array_value;
    ::std::shared_ptr< SomeMap > m_map_value;
};

}  // namespace test

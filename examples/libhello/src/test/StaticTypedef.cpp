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

#include "test/StaticTypedef.h"
#include "test/TypeCollection.h"

namespace test
{
StaticTypedef::IntTypedef
StaticTypedef::return_int_typedef( const ::test::StaticTypedef::IntTypedef input )
{
    return input + 1;
}

StaticTypedef::NestedIntTypedef
StaticTypedef::return_nested_int_typedef( const ::test::StaticTypedef::NestedIntTypedef input )
{
    return input + 1;
}

StaticTypedef::StringTypedef
StaticTypedef::return_string_typedef( const ::test::StaticTypedef::StringTypedef& input )
{
    return "Hello " + input;
}

StaticTypedef::ByteArrayTypedef
StaticTypedef::return_byte_buffer_typedef( const ::test::StaticTypedef::ByteArrayTypedef& input )
{
    return std::make_shared< std::vector< uint8_t > >( input->rbegin( ), input->rend( ) );
}

StaticTypedef::ExampleStructTypedef
StaticTypedef::return_example_struct_typedef(
    const ::test::StaticTypedef::ExampleStructTypedef& input )
{
    StaticTypedef::ExampleStructTypedef result;
    result.example_string = "Hello " + input.example_string;
    return result;
}

::test::PointTypedef
StaticTypedef::return_typedef_point_from_type_collection( const ::test::PointTypedef& input )
{
    return input;
}

StaticTypedef::NestedStructTypedef
StaticTypedef::return_nested_struct_typedef(
    const ::test::StaticTypedef::NestedStructTypedef& input )
{
    StaticTypedef::NestedStructTypedef result;
    result.example_string = "Hello " + input.example_string;
    return result;
}

}  // namespace test

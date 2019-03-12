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

#include "hello/HelloWorldArrays.h"

namespace hello
{
HelloWorldArrays::StringArray
HelloWorldArrays::method_with_array( const HelloWorldArrays::StringArray& input )
{
    return {input.rbegin( ), input.rend( )};
}

std::vector< int64_t >
HelloWorldArrays::method_with_simple_array( const HelloWorldArrays::Int64Array& input )
{
    return {input.rbegin( ), input.rend( )};
}

std::vector< uint32_t >
HelloWorldArrays::method_with_array_inline( const std::vector< uint32_t >& input )
{
    return {input.rbegin( ), input.rend( )};
}

std::vector< HelloWorldArrays::ExampleStruct >
HelloWorldArrays::method_with_struct_array(
    const std::vector< HelloWorldArrays::ExampleStruct >& input )
{
    return {input.rbegin( ), input.rend( )};
}

std::vector< HelloWorldArrays::Int64Array >
HelloWorldArrays::method_with_nested_arrays_inline(
    const std::vector< HelloWorldArrays::Int64Array >& input )
{
    std::vector< HelloWorldArrays::Int64Array > output;
    auto reverseIterator = input.rbegin( );
    while ( reverseIterator != input.rend( ) )
    {
        output.push_back( {reverseIterator->rbegin( ), reverseIterator->rend( )} );
        reverseIterator++;
    }
    return output;
}

}  // namespace hello

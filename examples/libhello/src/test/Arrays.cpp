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

#include <cstdint>
#include <string>
#include <vector>
#include <sstream>
#include "test/Arrays.h"

namespace test {

Arrays::StringArray
Arrays::reverse_string_array( const Arrays::StringArray& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< int16_t >
Arrays::reverse_array_inline( const std::vector< int16_t >& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::Int8Array
Arrays::reverse_int8_array( const Arrays::Int8Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::Int16Array
Arrays::reverse_int16_array( const Arrays::Int16Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::Int32Array
Arrays::reverse_int32_array( const Arrays::Int32Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::Int64Array
Arrays::reverse_int64_array( const Arrays::Int64Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::UInt8Array
Arrays::reverse_uint8_array( const Arrays::UInt8Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::UInt16Array
Arrays::reverse_uint16_array( const Arrays::UInt16Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::UInt32Array
Arrays::reverse_uint32_array( const Arrays::UInt32Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::UInt64Array
Arrays::reverse_uint64_array( const Arrays::UInt64Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::FloatArray
Arrays::reverse_float_array( const Arrays::FloatArray& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::DoubleArray
Arrays::reverse_double_array( const Arrays::DoubleArray& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::BoolArray
Arrays::reverse_bool_array( const Arrays::BoolArray& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::StructArray
Arrays::reverse_struct_array( const Arrays::StructArray& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::InstancesArray
Arrays::reverse_explicit_instances_array( const Arrays::InstancesArray& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< std::shared_ptr< SimpleInstantiableOne > >
Arrays::reverse_implicit_instances_array(
    const std::vector< std::shared_ptr< SimpleInstantiableOne > >& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::NestedPrimitiveArray
Arrays::reverse_nested_primitive_array( const Arrays::NestedPrimitiveArray& input )
{
    std::vector< std::vector< double > > output;
    auto reverse_iterator = input.rbegin( );
    while ( reverse_iterator != input.rend( ) )
    {
        output.push_back( { reverse_iterator->rbegin(), reverse_iterator->rend() } );
        reverse_iterator++;
    }
    return output;
}

Arrays::NestedStructArray
Arrays::reverse_nested_struct_array( const Arrays::NestedStructArray& input )
{
    std::vector< std::vector< Arrays::BasicStruct > > output;
    auto reverse_iterator = input.rbegin( );
    while ( reverse_iterator != input.rend( ) )
    {
        output.push_back( { reverse_iterator->rbegin(), reverse_iterator->rend() } );
        reverse_iterator++;
    }
    return output;
}

std::vector< Arrays::Int64Array >
Arrays::reverse_nested_arrays_inline( const std::vector< Arrays::Int64Array >& input )
{
    std::vector< std::vector< int64_t > > output;
    auto reverse_iterator = input.rbegin( );
    while ( reverse_iterator != input.rend( ) )
    {
        output.push_back( { reverse_iterator->rbegin(), reverse_iterator->rend() } );
        reverse_iterator++;
    }
    return output;
}

Arrays::FancyArray
Arrays::merge_arrays_of_structs_with_arrays(
    const std::vector< Arrays::FancyStruct >& inline_fancy_array,
    const std::vector< Arrays::FancyStruct >& fancyArray )
{
    std::vector< Arrays::FancyStruct > output;
    output.insert( output.begin(), fancyArray.rbegin(), fancyArray.rend() );
    output.insert( output.end(), inline_fancy_array.rbegin(), inline_fancy_array.rend() );
    return output;
}

Arrays::ProfileIdList
Arrays::reverse_array_of_aliases( const Arrays::ProfileIdList& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::ArrayEnumArray
Arrays::reverse_enums_array( const Arrays::ArrayEnumArray& input )
{
    return { input.rbegin( ), input.rend( ) };
}

Arrays::ArrayOfMaps
Arrays::reverse_maps_array( const Arrays::ArrayOfMaps& input )
{
    return { input.rbegin( ), input.rend( ) };
}

Arrays::FancyStruct
Arrays::create_fancy_struct()
{
    return Arrays::FancyStruct{ {"Hello", "World"}, {1, 2, 3}, {} };
}

}

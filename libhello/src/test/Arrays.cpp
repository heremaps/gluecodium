// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#include <cstdint>
#include <string>
#include <vector>
#include <sstream>
#include "test/Arrays.h"

namespace test {

Arrays::StringArray
Arrays::method_with_string_array( const Arrays::StringArray& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< int16_t >
Arrays::method_with_array_inline( const std::vector< int16_t >& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::Int8Array
Arrays::method_with_int8_array( const Arrays::Int8Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::Int16Array
Arrays::method_with_int16_array( const Arrays::Int16Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::Int32Array
Arrays::method_with_int32_array( const Arrays::Int32Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::Int64Array
Arrays::method_with_int64_array( const Arrays::Int64Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::UInt8Array
Arrays::method_with_uint8_array( const Arrays::UInt8Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::UInt16Array
Arrays::method_with_uint16_array( const Arrays::UInt16Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::UInt32Array
Arrays::method_with_uint32_array( const Arrays::UInt32Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::UInt64Array
Arrays::method_with_uint64_array( const Arrays::UInt64Array& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::FloatArray
Arrays::method_with_float_array( const Arrays::FloatArray& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::DoubleArray
Arrays::method_with_double_array( const Arrays::DoubleArray& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::BoolArray
Arrays::method_with_bool_array( const Arrays::BoolArray& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::StructArray
Arrays::method_with_struct_array( const Arrays::StructArray& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< std::shared_ptr< SimpleInstantiableOne > >
Arrays::method_with_instances_array( const Arrays::InstancesArray& input )
{
    return { input.rbegin(), input.rend() };
}

Arrays::NestedPrimitiveArray
Arrays::method_with_nested_primitive_array( const Arrays::NestedPrimitiveArray& input )
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
Arrays::method_with_nested_struct_array( const Arrays::NestedStructArray& input )
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
Arrays::method_with_nested_arrays_inline( const std::vector< Arrays::Int64Array >& input )
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
Arrays::method_with_array_of_aliases( const Arrays::ProfileIdList& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< ::test::Arrays::ArrayEnum >
Arrays::method_with_enums_array( const std::vector< ::test::Arrays::ArrayEnum >& input )
{
    return { input.rbegin( ), input.rend( ) };
}

Arrays::FancyStruct
Arrays::create_fancy_struct()
{
    return Arrays::FancyStruct{ {"Hello", "World"}, {1, 2, 3}, {} };
}

}

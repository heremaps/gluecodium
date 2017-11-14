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

std::vector< std::string >
Arrays::method_with_string_array( const std::vector< std::string >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< int16_t >
Arrays::method_with_array_inline( const std::vector< int16_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< int8_t >
Arrays::method_with_int8_array( const std::vector< int8_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< int16_t >
Arrays::method_with_int16_array( const std::vector< int16_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< int32_t >
Arrays::method_with_int32_array( const std::vector< int32_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< int64_t >
Arrays::method_with_int64_array( const std::vector< int64_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< uint8_t >
Arrays::method_with_uint8_array( const std::vector< uint8_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< uint16_t >
Arrays::method_with_uint16_array( const std::vector< uint16_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< uint32_t >
Arrays::method_with_uint32_array( const std::vector< uint32_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< uint64_t >
Arrays::method_with_uint64_array( const std::vector< uint64_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< float >
Arrays::method_with_float_array( const std::vector< float >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< double >
Arrays::method_with_double_array( const std::vector< double >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< bool >
Arrays::method_with_bool_array( const std::vector< bool >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< test::Arrays::BasicStruct >
Arrays::method_with_struct_array( const std::vector< test::Arrays::BasicStruct >& input )
{
    return { input.rbegin(), input.rend() };
}

::std::vector< ::std::shared_ptr< ::test::SimpleInstantiableOne > >
Arrays::method_with_instances_array(
    const ::std::vector< ::std::shared_ptr< ::test::SimpleInstantiableOne > >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< std::vector< double > >
Arrays::method_with_nested_primitive_array( const std::vector< std::vector< double > >& input )
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

std::vector< std::vector< test::Arrays::BasicStruct > >
Arrays::method_with_nested_struct_array(
    const std::vector< std::vector< test::Arrays::BasicStruct > >& input )
{
    std::vector< std::vector< test::Arrays::BasicStruct > > output;
    auto reverse_iterator = input.rbegin( );
    while ( reverse_iterator != input.rend( ) )
    {
        output.push_back( { reverse_iterator->rbegin(), reverse_iterator->rend() } );
        reverse_iterator++;
    }
    return output;
}

std::vector< std::vector< int64_t > >
Arrays::method_with_nested_arrays_inline( const std::vector< std::vector< int64_t > >& input )
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

std::vector< test::Arrays::FancyStruct >
Arrays::merge_arrays_of_structs_with_arrays( 
    const std::vector< test::Arrays::FancyStruct >& inline_fancy_array,
    const std::vector< test::Arrays::FancyStruct >& fancyArray )
{
    std::vector< test::Arrays::FancyStruct > output;
    output.insert( output.begin(), fancyArray.rbegin(), fancyArray.rend() );
    output.insert( output.end(), inline_fancy_array.rbegin(), inline_fancy_array.rend() );
    return output;
}

Arrays::ProfileIdList
Arrays::method_with_array_of_aliases( const Arrays::ProfileIdList& input )
{
    return { input.rbegin(), input.rend() };
}

}

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
Arrays::methodWithStringArray( const std::vector< std::string >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< int16_t >
Arrays::methodWithArrayInline( const std::vector< int16_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< int8_t >
Arrays::methodWithInt8Array( const std::vector< int8_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< int16_t >
Arrays::methodWithInt16Array( const std::vector< int16_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< int32_t >
Arrays::methodWithInt32Array( const std::vector< int32_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< int64_t >
Arrays::methodWithInt64Array( const std::vector< int64_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< uint8_t >
Arrays::methodWithUint8Array( const std::vector< uint8_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< uint16_t >
Arrays::methodWithUint16Array( const std::vector< uint16_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< uint32_t >
Arrays::methodWithUint32Array( const std::vector< uint32_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< uint64_t >
Arrays::methodWithUint64Array( const std::vector< uint64_t >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< float >
Arrays::methodWithFloatArray( const std::vector< float >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< double >
Arrays::methodWithDoubleArray( const std::vector< double >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< bool >
Arrays::methodWithBoolArray( const std::vector< bool >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< test::Arrays::BasicStruct >
Arrays::methodWithStructArray( const std::vector< test::Arrays::BasicStruct >& input )
{
    return { input.rbegin(), input.rend() };
}

::std::vector< ::std::shared_ptr< ::test::SimpleInstantiableOne > >
Arrays::methodWithInstancesArray( const ::std::vector< ::std::shared_ptr< ::test::SimpleInstantiableOne > >& input )
{
    return { input.rbegin(), input.rend() };
}

std::vector< std::vector< double > >
Arrays::methodWithNestedPrimitiveArray( const std::vector< std::vector< double > >& input )
{
    std::vector< std::vector< double > > output;
    auto reverseIterator = input.rbegin( );
    while ( reverseIterator != input.rend( ) )
    {
        output.push_back( { reverseIterator->rbegin(), reverseIterator->rend() } );
        reverseIterator++;
    }
    return output;
}

std::vector< std::vector< test::Arrays::BasicStruct > >
Arrays::methodWithNestedStructArray( const std::vector< std::vector< test::Arrays::BasicStruct > >& input )
{
    std::vector< std::vector< test::Arrays::BasicStruct > > output;
    auto reverseIterator = input.rbegin( );
    while ( reverseIterator != input.rend( ) )
    {
        output.push_back( { reverseIterator->rbegin(), reverseIterator->rend() } );
        reverseIterator++;
    }
    return output;
}

std::vector< std::vector< int64_t > >
Arrays::methodWithNestedArraysInline( const std::vector< std::vector< int64_t > >& input )
{
    std::vector< std::vector< int64_t > > output;
    auto reverseIterator = input.rbegin( );
    while ( reverseIterator != input.rend( ) )
    {
        output.push_back( { reverseIterator->rbegin(), reverseIterator->rend() } );
        reverseIterator++;
    }
    return output;
}

std::vector< test::Arrays::FancyStruct >
Arrays::mergeArraysOfStructsWithArrays( const std::vector< test::Arrays::FancyStruct >& inlineFancyArray,
    const std::vector< test::Arrays::FancyStruct >& fancyArray )
{
    std::vector< test::Arrays::FancyStruct > output;
    output.insert( output.begin(), fancyArray.rbegin(), fancyArray.rend() );
    output.insert( output.end(), inlineFancyArray.rbegin(), inlineFancyArray.rend() );
    return output;
}

}

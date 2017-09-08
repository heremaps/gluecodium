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

#include "hello/HelloWorldComplexTypes.h"
#include <algorithm>

namespace hello
{

HelloWorldComplexTypes::InternalError
methodWithEnumeration( const HelloWorldComplexTypes::InternalError input )
{
    if ( input == HelloWorldComplexTypes::InternalError::ERROR_NONE )
    {
        return HelloWorldComplexTypes::InternalError::ERROR_FATAL;
    }

    return HelloWorldComplexTypes::InternalError::ERROR_NONE;
}

::std::vector< HelloWorldComplexTypes::InternalError >
HelloWorldComplexTypes::methodWithArray(
    const ::std::vector< HelloWorldComplexTypes::InternalError >& errors )
{
    return { errors.rbegin( ), errors.rend( ) };
}

::std::vector< HelloWorldComplexTypes::InternalError >
HelloWorldComplexTypes::methodWithArrayInline(
    const ::std::vector< HelloWorldComplexTypes::InternalError >& errors )
{
    return { errors.rbegin( ), errors.rend( ) };
}

::std::vector< HelloWorldComplexTypes::ExampleStruct >
methodWithStructArray( const ::std::vector< HelloWorldComplexTypes::ExampleStruct >& input )
{
    return { input.rbegin( ), input.rend( ) };
}

HelloWorldComplexTypes::Errors
methodWithTypeDef( const HelloWorldComplexTypes::Errors& input )
{
    return { input.rbegin( ), input.rend( ) };
}

HelloWorldComplexTypes::ErrorCodeToMessageMap
methodWithMap( const HelloWorldComplexTypes::ErrorCodeToMessageMap& input )
{
    HelloWorldComplexTypes::ErrorCodeToMessageMap result;
    for ( const auto& entry : input )
    {
        std::string uppercaseString;
        std::transform( entry.second.begin( ),
                        entry.second.end( ),
                        uppercaseString.begin( ),
                            ::toupper );
        result.emplace( std::make_pair( entry.first, uppercaseString ) );
    }

    return result;
}
} // namespace hello

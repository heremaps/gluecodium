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

#include "test/Errors.h"
#include "another/AdditionalErrors.h"
#include "another/TypeCollectionWithEnums.h"

namespace test
{
hf::Error
Errors::method_with_error( const bool error_flag )
{
    return error_flag
        ? hf::Error( static_cast< hf::ErrorCode::Code >( Errors::InternalErrors::CRASHED ) )
        : hf::Error( );
}

hf::Return< std::string, hf::Error >
Errors::method_with_error_and_string( const bool error_flag )
{
    if ( error_flag )
    {
        return hf::Return< std::string, hf::Error >( hf::Error( static_cast< hf::ErrorCode::Code >(
            another::AdditionalErrors::ExternalErrors::FAILED ) ) );
    }
    else
    {
        return hf::Return< std::string, hf::Error >( "SUCCEEDED" );
    }
}

hf::Return< std::vector< uint8_t >, hf::Error >
Errors::method_that_explodes( const bool error_flag )
{
    if ( error_flag )
    {
        return hf::Return< std::vector< uint8_t >, hf::Error >(
            hf::Error( static_cast< hf::ErrorCode::Code >(
                another::ExplosiveErrors::EXPLODED ) ) );
    }
    else
    {
        return hf::Return< std::vector< uint8_t >, hf::Error >(
            std::vector< uint8_t >{0x00, 0x01, 0x02} );
    }
}

hf::Return< another::SomeEnum, hf::Error >
Errors::method_with_good_and_bad( const bool error_flag )
{
    if ( error_flag )
    {
        return hf::Return< another::SomeEnum, hf::Error >( hf::Error(
            static_cast< hf::ErrorCode::Code >( another::YetAnotherErrors::BAD ) ) );
    }
    else
    {
        return hf::Return< another::SomeEnum, hf::Error >(
            another::SomeEnum::ANOTHER_RESULT );
    }
}
}

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

namespace
{
template <typename T>
hf::ErrorCode make_error_code(const T& error)
{
   return static_cast< hf::ErrorCode >( error );
}
}

namespace test
{
hf::ErrorCode
Errors::method_with_error( const bool error_flag )
{
    return error_flag
           ? make_error_code( Errors::InternalErrors::CRASHED )
           : hf::errors::NONE;
}

hf::Return< std::string, hf::ErrorCode >
Errors::method_with_error_and_string( const bool error_flag )
{
    if ( error_flag )
    {
        return make_error_code( another::AdditionalErrors::ExternalErrors::FAILED );
    }
    else
    {
        return std::string{"SUCCEEDED"};
    }
}

hf::Return< std::vector< uint8_t >, hf::ErrorCode >
Errors::method_that_explodes( const bool error_flag )
{
    if ( error_flag )
    {
        return make_error_code( another::ExplosiveErrors::EXPLODED );
    }
    else
    {
        return std::vector< uint8_t >{0x00, 0x01, 0x02};
    }
}

hf::Return< another::SomeEnum, hf::ErrorCode >
Errors::method_with_good_and_bad( const bool error_flag )
{
    if ( error_flag )
    {
        return make_error_code( another::YetAnotherErrors::BAD );
    }
    else
    {
        return another::SomeEnum::ANOTHER_RESULT;
    }
}
}


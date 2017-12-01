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

#include "hello/HelloWorldErrors.h"

namespace hello
{
    hf::Error
    HelloWorldErrors::hello_world_method_with_error( const bool error_flag )
    {
        HelloWorldErrors::InternalErrors error_code = error_flag ?
            HelloWorldErrors::InternalErrors::CRASHED : HelloWorldErrors::InternalErrors::NONE;
        return hf::Error( static_cast< hf::ErrorCode::Code >( error_code ) );
    }

    hf::Return< std::string, hf::Error >
    HelloWorldErrors::hello_world_method_with_error_and_string( const bool error_flag )
    {
        if ( error_flag )
        {
            return hf::Return< std::string, hf::Error >(
                hf::Error( static_cast< hf::ErrorCode::Code >(
                    HelloWorldErrors::InternalErrors::CRASHED ) ) );
        }
        else
        {
            return hf::Return< std::string, hf::Error >( "Hello!" );
        }
    }
}

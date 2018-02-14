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

namespace
{
template <typename T>
hf::ErrorCode make_error_code(const T& error)
{
   return static_cast< hf::ErrorCode >( error );
}
}

namespace hello
{
    hf::ErrorCode
    HelloWorldErrors::hello_world_method_with_error( const bool error_flag )
    {
        return error_flag
               ? make_error_code( HelloWorldErrors::InternalErrors::CRASHED )
               : hf::errors::NONE;
    }

    hf::Return< std::string, hf::ErrorCode >
    HelloWorldErrors::hello_world_method_with_error_and_string( const bool error_flag )
    {
        if ( error_flag )
        {
            return make_error_code( HelloWorldErrors::InternalErrors::CRASHED );
        }
        else
        {
            return std::string{"Hello!"};
        }
    }
}


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

#include <stdint.h>

#include "test/StaticByteArrayMethods.h"

namespace test {

std::vector< uint8_t >
StaticByteArrayMethods::return_input_byte_buffer( const std::vector< uint8_t >& input_buffer )
{
    return input_buffer;
}

std::vector< uint8_t >
StaticByteArrayMethods::return_reverse_byte_buffer( const std::vector< uint8_t >& input_buffer )
{
    return {input_buffer.rbegin(), input_buffer.rend()};
}

std::vector< uint8_t >
StaticByteArrayMethods::concatenate_byte_buffers( const std::vector< uint8_t >& input1,
                                                  const std::vector< uint8_t >& input2 )
{
    std::vector< uint8_t > output( input1 );
    output.insert( output.end(), input2.begin(), input2.end() );
    return output;
}

}

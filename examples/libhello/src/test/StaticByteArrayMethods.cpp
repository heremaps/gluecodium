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

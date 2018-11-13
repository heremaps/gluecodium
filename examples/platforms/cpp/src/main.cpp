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

#include <hello/HelloWorld.h>
#include <hello/HelloWorldBuiltinTypes.h>

#include <cstdint>
#include <iostream>
#include <string>

using namespace hello;

int
main( )
{
    std::string string_buffer;

    std::cout << "Write your name: ";
    std::getline( std::cin, string_buffer );

    std::cout << HelloWorld::hello_world_method( string_buffer ) << std::endl;

    std::cout << "Write the loan amount (NNNN.NN): ";
    std::getline( std::cin, string_buffer );
    float amount = std::stof( string_buffer );

    std::cout << "Write the interest rate (percentage): ";
    std::getline( std::cin, string_buffer );
    int8_t percentage = (int8_t)std::stoi( string_buffer );

    std::cout << "Repayment due in 1 year: "
              << amount
                     + HelloWorldBuiltinTypes::method_with_float_and_integer( amount, percentage )
              << std::endl;
}

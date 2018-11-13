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

#include "test/StaticFloatDoubleMethods.h"

namespace test
{
float
StaticFloatDoubleMethods::return_float( const float input_number )
{
    return input_number;
}

float
StaticFloatDoubleMethods::return_incremented_float( const float input_number )
{
    return input_number + 1.0f;
}

float
StaticFloatDoubleMethods::sum_two_floats( const float input_number1, const float input_number2 )
{
    return input_number1 + input_number2;
}

double
StaticFloatDoubleMethods::return_double( const double input_number )
{
    return input_number;
}

double
StaticFloatDoubleMethods::return_incremented_double( const double input_number )
{
    return input_number + 1.0;
}

double
StaticFloatDoubleMethods::sum_two_doubles( const double input_number1, const double input_number2 )
{
    return input_number1 + input_number2;
}

}  // namespace test

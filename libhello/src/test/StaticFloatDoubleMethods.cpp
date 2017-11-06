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

#include "test/StaticFloatDoubleMethods.h"

namespace test {

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

}



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

#include "test/Defaults.h"

namespace test
{

Defaults::StructWithDefaults
Defaults::get_default( )
{
    return Defaults::StructWithDefaults{ };
}

bool
Defaults::check_default( const Defaults::StructWithDefaults& input )
{
    Defaults::StructWithDefaults default_struct{ };
    return input.int_field == default_struct.int_field
        && input.float_field == default_struct.float_field
        && input.bool_field == default_struct.bool_field
        && input.string_field == default_struct.string_field
        && input.enum_field == default_struct.enum_field;
}

}

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

#include "test/Enums.h"

namespace
{
::test::Enums::InternalError
flip_enum( const ::test::Enums::InternalError val )
{
    return val == ::test::Enums::InternalError::ERROR_NONE
               ? ::test::Enums::InternalError::ERROR_FATAL
               : ::test::Enums::InternalError::ERROR_NONE;
}
}

namespace test
{
::test::Enums::InternalError
Enums::flip_enum_value( const ::test::Enums::InternalError input )
{
    return flip_enum( input );
}

::test::Enums::InternalError
Enums::extract_enum_from_struct( const ::test::Enums::ErrorStruct& input )
{
    return flip_enum( input.type );
}

::test::Enums::ErrorStruct
Enums::create_struct_with_enum_inside( const ::test::Enums::InternalError type,
                                       const ::std::string& message )
{
    return {flip_enum( type ), message};
}
}

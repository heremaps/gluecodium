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
flipEnum(::test::Enums::InternalError val )
{
    return val == ::test::Enums::InternalError::ERROR_NONE
               ? ::test::Enums::InternalError::ERROR_FATAL
               : ::test::Enums::InternalError::ERROR_NONE;
}
}

namespace test
{
::test::Enums::InternalError
Enums::flipEnumValue( const ::test::Enums::InternalError input )
{
    return flipEnum( input );
}

::test::Enums::InternalError
Enums::extractEnumFromStruct( const ::test::Enums::ErrorStruct& input )
{
    return flipEnum( input.type );
}

::test::Enums::ErrorStruct
Enums::createStructWithEnumInside( const ::test::Enums::InternalError type,
                                   const ::std::string& message )
{
    return {flipEnum( type ), message};
}
}

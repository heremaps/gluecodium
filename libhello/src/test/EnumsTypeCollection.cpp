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

#include "test/EnumsTypeCollectionMethods.h"

namespace
{
::test::InternalErrorTypeCollection
flip_enum( const ::test::InternalErrorTypeCollection val )
{
    return val == ::test::InternalErrorTypeCollection::ERROR_NONE
               ? ::test::InternalErrorTypeCollection::ERROR_FATAL
               : ::test::InternalErrorTypeCollection::ERROR_NONE;
}
}

namespace test
{
::test::InternalErrorTypeCollection
EnumsTypeCollectionMethods::flip_enum_value( const ::test::InternalErrorTypeCollection input )
{
    return flip_enum( input );
}

::test::InternalErrorTypeCollection
EnumsTypeCollectionMethods::extract_enum_from_struct( const ::test::ErrorStructTypeCollection& input )
{
    return flip_enum( input.type );
}

::test::ErrorStructTypeCollection
EnumsTypeCollectionMethods::create_struct_with_enum_inside(
    const ::test::InternalErrorTypeCollection type, const ::std::string& message )
{
   return {flip_enum( type ), message};
}

}
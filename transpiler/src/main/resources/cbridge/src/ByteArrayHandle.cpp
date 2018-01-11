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

#include "cbridge/include/ByteArrayHandle.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include <vector>

void
byteArray_release( _baseRef handle )
{
    delete get_pointer< std::vector< uint8_t > >( handle );
}

const uint8_t*
byteArray_data_get( _baseRef handle )
{
    return get_pointer< std::vector< uint8_t > >( handle )->data( );
}

int64_t
byteArray_size_get( _baseRef handle )
{
    return get_pointer< std::vector< uint8_t > >( handle )->size( );
}

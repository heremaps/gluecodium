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

#include "test/ArraysByteBuffer.h"

namespace test {

::std::vector< uint8_t >
ArraysByteBuffer::method_with_byte_buffer( const ::std::vector< uint8_t >& input )
{
    return { input.rbegin(), input.rend() };
}

::std::vector< uint8_t >
ArraysByteBuffer::method_with_implicit_array( const ::std::vector< uint8_t >& input )
{
    return { input.rbegin(), input.rend() };
}

ArraysByteBuffer::Blob
ArraysByteBuffer::method_with_explicit_array( const ArraysByteBuffer::Blob& input )
{
    return { input.rbegin(), input.rend() };
}

ArraysByteBuffer::StructWithByteBuffer
ArraysByteBuffer::method_with_byte_buffer_in_struct(
    const ArraysByteBuffer::StructWithByteBuffer& input )
{
    ArraysByteBuffer::StructWithByteBuffer result;
    result.image = { input.image.rbegin(), input.image.rend() };
    return result;
}

ArraysByteBuffer::StructWithImplicitArray
ArraysByteBuffer::method_with_implicit_array_in_struct(
    const ArraysByteBuffer::StructWithImplicitArray& input )
{
    ArraysByteBuffer::StructWithImplicitArray result;
    result.image = { input.image.rbegin(), input.image.rend() };
    return result;
}

ArraysByteBuffer::StructWithExplicitArray
ArraysByteBuffer::method_with_explicit_array_in_struct(
    const ArraysByteBuffer::StructWithExplicitArray& input )
{
    ArraysByteBuffer::StructWithExplicitArray result;
    result.image = { input.image.rbegin(), input.image.rend() };
    return result;
}

}

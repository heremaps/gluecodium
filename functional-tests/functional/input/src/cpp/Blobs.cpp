// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
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

#include "test/ArraysByteBuffer.h"
#include "test/BlobNulls.h"
#include "another/TypeCollectionWithEnums.h"

namespace test
{
std::shared_ptr< std::vector< uint8_t > >
ArraysByteBuffer::method_with_byte_buffer( const std::shared_ptr< std::vector< uint8_t > >& input )
{
    return std::make_shared< std::vector< uint8_t > >( input->rbegin( ), input->rend( ) );
}

::std::vector< uint8_t >
ArraysByteBuffer::method_with_implicit_array( const ::std::vector< uint8_t >& input )
{
    return {input.rbegin( ), input.rend( )};
}

ArraysByteBuffer::BlobArray
ArraysByteBuffer::method_with_explicit_array( const ArraysByteBuffer::BlobArray& input )
{
    return {input.rbegin( ), input.rend( )};
}

ArraysByteBuffer::StructWithByteBuffer
ArraysByteBuffer::method_with_byte_buffer_in_struct(
    const ArraysByteBuffer::StructWithByteBuffer& input )
{
    ArraysByteBuffer::StructWithByteBuffer result;
    result.image = std::make_shared< std::vector< uint8_t > >( input.image->rbegin( ),
                                                               input.image->rend( ) );
    return result;
}

ArraysByteBuffer::StructWithImplicitArray
ArraysByteBuffer::method_with_implicit_array_in_struct(
    const ArraysByteBuffer::StructWithImplicitArray& input )
{
    ArraysByteBuffer::StructWithImplicitArray result;
    result.image = {input.image.rbegin( ), input.image.rend( )};
    return result;
}

ArraysByteBuffer::StructWithExplicitArray
ArraysByteBuffer::method_with_explicit_array_in_struct(
    const ArraysByteBuffer::StructWithExplicitArray& input )
{
    ArraysByteBuffer::StructWithExplicitArray result;
    result.image = {input.image.rbegin( ), input.image.rend( )};
    return result;
}


lorem_ipsum::test::Return< std::shared_ptr< std::vector< uint8_t > >, std::error_code >
ArraysByteBuffer::method_that_explodes( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( another::TypeCollectionWithEnums::ExplosiveErrorCode::EXPLODED );
    }
    else
    {
        return std::make_shared< std::vector< uint8_t > >(
            std::vector< uint8_t >{0x00, 0x01, 0x02} );
    }
}

std::shared_ptr<std::vector<uint8_t>>
BlobNulls::get_breaking_null() {
    return {};
}

lorem_ipsum::test::optional<std::shared_ptr<std::vector<uint8_t>>>
BlobNulls::get_valid_null() {
    return {};
}

}

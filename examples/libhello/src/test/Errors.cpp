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

#include "test/Errors.h"

#include "another/AdditionalErrors.h"
#include "another/TypeCollectionWithEnums.h"
#include "include/ExternalTypes.h"
#include "test/OtherErrors.h"

namespace test
{
std::error_code
Errors::method_with_error( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( Errors::InternalErrorCode::CRASHED );
    }
    else
    {
        return {};
    }
}

std::error_code
OtherErrors::method_with_error( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( OtherErrors::InternalErrorCode::CRASHED );
    }
    else
    {
        return {};
    }
}

lorem_ipsum::test::Return< std::string, std::error_code >
Errors::method_with_error_and_string( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( another::AdditionalErrors::ExternalErrorCode::FAILED );
    }
    else
    {
        return std::string{"SUCCEEDED"};
    }
}

lorem_ipsum::test::Return< std::shared_ptr< std::vector< uint8_t > >, std::error_code >
Errors::method_that_explodes( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( another::ExplosiveErrorCode::EXPLODED );
    }
    else
    {
        return std::make_shared< std::vector< uint8_t > >(
            std::vector< uint8_t >{0x00, 0x01, 0x02} );
    }
}

lorem_ipsum::test::Return< another::SomeEnum, std::error_code >
Errors::method_with_good_and_bad( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( another::YetAnotherErrorCode::BAD );
    }
    else
    {
        return another::SomeEnum::ANOTHER_RESULT;
    }
}

std::error_code
Errors::method_with_external_error( const bool error_flag )
{
    if ( error_flag )
    {
        return external::even_more_external::AlienErrorCode::BOOM;
    }
    else
    {
        return {};
    }
}

lorem_ipsum::test::Return< Errors::NonDefaultConstructor, std::error_code >
Errors::method_with_error_and_non_default_struct( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( OtherErrors::InternalErrorCode::CRASHED );
    }
    else
    {
        return Errors::NonDefaultConstructor(1);
    }
}

std::string
Errors::get_error_category_message( const Errors::InternalErrorCode value )
{
    auto error_code = std::error_code{value};
    return error_code.category( ).message( error_code.value( ) );
}

lorem_ipsum::test::Return<void, Payload>
Errors::method_with_payload_error(const bool error_flag)
{
    if (error_flag)
    {
        return Payload{42, "foo error"};
    }
    else
    {
        return {true};
    }
}

lorem_ipsum::test::Return<std::string, Payload>
Errors::method_with_payload_error_and_return_value(const bool error_flag)
{
    if (error_flag)
    {
        return Payload{42, "foo error"};
    }
    else
    {
        return std::string("bar value");
    }
}

}  // namespace test

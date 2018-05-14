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

#include "test/Errors.h"
#include "test/OtherErrors.h"
#include "another/AdditionalErrors.h"
#include "another/TypeCollectionWithEnums.h"

namespace test
{
std::error_code
Errors::method_with_error( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( Errors::InternalErrors::CRASHED );
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
        return std::error_code( OtherErrors::InternalErrors::CRASHED );
    }
    else
    {
        return {};
    }
}

lorem_ipsum::Return< std::string, std::error_code >
Errors::method_with_error_and_string( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( another::AdditionalErrors::ExternalErrors::FAILED );
    }
    else
    {
        return std::string{"SUCCEEDED"};
    }
}

lorem_ipsum::Return< std::shared_ptr< std::vector< uint8_t > >, std::error_code >
Errors::method_that_explodes( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( another::ExplosiveErrors::EXPLODED );
    }
    else
    {
        return std::make_shared< std::vector< uint8_t > >(
            std::vector< uint8_t >{0x00, 0x01, 0x02} );
    }
}

lorem_ipsum::Return< another::SomeEnum, std::error_code >
Errors::method_with_good_and_bad( const bool error_flag )
{
    if ( error_flag )
    {
        return std::error_code( another::YetAnotherErrors::BAD );
    }
    else
    {
        return another::SomeEnum::ANOTHER_RESULT;
    }
}
}


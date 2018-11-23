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

#include "NotNullPayloadImpl.h"
#include "test/NotNullStatic.h"

namespace test
{
std::shared_ptr< NotNullPayload >
NotNullStatic::not_null_top_down_round_trip( const std::shared_ptr< NotNullPayload >& input )
{
    return input;
}

bool
NotNullStatic::not_null_bottom_up_round_trip( const std::shared_ptr< NotNullListener >& listener )
{
    auto payload = std::make_shared< NotNullPayloadImpl >( );
    return listener->not_null_bottom_up_round_trip( payload )->poke( );
}

bool
NotNullPayloadImpl::poke( )
{
    return true;
}

std::shared_ptr< NotNullPayload >
NotNullPayload::create( )
{
    return std::make_shared< NotNullPayloadImpl >( );
}
}  // namespace test

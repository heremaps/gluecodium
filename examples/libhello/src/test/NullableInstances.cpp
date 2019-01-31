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

#include "NullablePayloadImpl.h"
#include "test/NullableStatic.h"

namespace test
{
std::shared_ptr< NullablePayload >
NullableStatic::nullable_top_down_round_trip( const std::shared_ptr< NullablePayload >& input )
{
    return input;
}

bool
NullableStatic::nullable_bottom_up_round_trip(
    const std::shared_ptr< NullableInstanceListener >& listener )
{
    auto payload = std::make_shared< NullablePayloadImpl >( );
    return listener->nullable_bottom_up_round_trip( payload )->poke( );
}

bool
NullableStatic::nullable_bottom_up_null_round_trip(
    const std::shared_ptr< NullableInstanceListener >& listener )
{
    return !listener->nullable_bottom_up_round_trip( {} );
}

bool
NullableStatic::nullable_bottom_up_attribute_round_trip(
    const std::shared_ptr< NullableInstanceListener >& listener )
{
    auto payload = std::make_shared< NullablePayloadImpl >( );
    listener->set_nullable_attribute( payload );
    return listener->get_nullable_attribute( )->poke( );
}

bool
NullableStatic::nullable_bottom_up_attribute_null_round_trip(
    const std::shared_ptr< NullableInstanceListener >& listener )
{
    listener->set_nullable_attribute( {} );
    return !listener->get_nullable_attribute( );
}

bool
NullablePayloadImpl::poke( )
{
    return true;
}

std::shared_ptr< NullablePayload >
NullablePayload::create( )
{
    return std::make_shared< NullablePayloadImpl >( );
}
}  // namespace test

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

#include "ListenersReturnValues.h"
#include <memory>

namespace test
{
std::string
MessageDeliveryImpl::get_message( const std::shared_ptr< ListenerWithReturn >& envelope )
{
    return envelope->get_message( );
}

std::string
MessageDeliveryImpl::get_packed_message( const std::shared_ptr< ListenerWithReturn >& envelope )
{
    return envelope->get_packed_message( )->unpack_message( );
}

std::string
MessageDeliveryImpl::get_attributed_message( const std::shared_ptr< ListenerWithReturn >& envelope )
{
    return envelope->get_attributed_message( );
}

std::string
MessageDeliveryImpl::get_structured_message( const std::shared_ptr< ListenerWithReturn >& envelope )
{
    return envelope->get_structured_message( ).message;
}

std::string
MessageDeliveryImpl::get_enumerated_message( const std::shared_ptr< ListenerWithReturn >& envelope )
{
    return envelope->get_enumerated_message( ) == ListenerWithReturn::MessageEnum::YES
        ? "YES" : "NO";
}

std::string
MessageDeliveryImpl::get_arrayed_message( const std::shared_ptr< ListenerWithReturn >& envelope )
{
    return envelope->get_arrayed_message( )[0];
}

std::string
MessageDeliveryImpl::get_mapped_message( const std::shared_ptr< ListenerWithReturn >& envelope )
{
    return envelope->get_mapped_message( )[0];
}

std::string
MessageDeliveryImpl::get_buffered_message( const std::shared_ptr< ListenerWithReturn >& envelope )
{
    return std::string(
        reinterpret_cast< char const* >( envelope->get_buffered_message( )->data( ) ) );
}

std::shared_ptr< MessageDelivery >
MessageDelivery::create_me( )
{
    return std::make_shared< MessageDeliveryImpl >( );
}

}  // namespace test

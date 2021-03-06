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

#include "ListenersReturnValues.h"
#include "test/ListenerWithReturn.h"
#include "test/MessagePackage.h"
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
MessageDeliveryImpl::get_boxed_message( const std::shared_ptr< ListenerWithReturn >& envelope )
{
    return envelope->get_boxed_message( )->unpack_message( );
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
    auto char_vector = envelope->get_buffered_message( );
    return std::string( char_vector->cbegin( ), char_vector->cend( ) );
}

std::shared_ptr< MessageDelivery >
MessageDelivery::create_me( )
{
    return std::make_shared< MessageDeliveryImpl >( );
}

std::string
MessageBoxImpl::unpack_message( )
{
    return "Works";
}

std::shared_ptr< MessageBox >
MessageBox::create( )
{
    return std::make_shared< MessageBoxImpl >( );
}

}  // namespace test

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

#include "ListenerWithAttributes.h"
#include "test/ListenerWithAttributes.h"
#include "test/MessageBox.h"
#include "test/MessagePackage.h"

namespace
{
const std::string NONSENSE = "Nonsense";

struct TestMessagePackage: test::MessagePackage
{
    std::string unpack_message( ) override;
};

std::string
TestMessagePackage::unpack_message( )
{
    return NONSENSE;
}

struct TestMessageBox: test::MessageBox
{
    std::string unpack_message( ) override;
};

std::string
TestMessageBox::unpack_message( )
{
    return NONSENSE;
}
}

namespace test
{
bool
AttributedMessageDeliveryImpl::check_message_round_trip(
    const std::shared_ptr< ListenerWithAttributes >& envelope )
{
    envelope->set_message( NONSENSE );
    return envelope->get_message( ) == NONSENSE;
}

bool
AttributedMessageDeliveryImpl::check_packed_message_round_trip(
    const std::shared_ptr< ListenerWithAttributes >& envelope )
{
    envelope->set_packed_message( std::make_shared< TestMessagePackage >( ) );
    return envelope->get_packed_message( )->unpack_message( ) == NONSENSE;
}

bool
AttributedMessageDeliveryImpl::check_boxed_message_round_trip(
    const std::shared_ptr< ListenerWithAttributes >& envelope )
{
    envelope->set_boxed_message( std::make_shared< TestMessageBox >( ) );
    return envelope->get_boxed_message( )->unpack_message( ) == NONSENSE;
}

bool
AttributedMessageDeliveryImpl::check_structured_message_round_trip(
    const std::shared_ptr< ListenerWithAttributes >& envelope )
{
    envelope->set_structured_message( ListenerWithReturn::MessageStruct( NONSENSE ) );
    return envelope->get_structured_message( ).message == NONSENSE;
}

bool
AttributedMessageDeliveryImpl::check_enumerated_message_round_trip(
    const std::shared_ptr< ListenerWithAttributes >& envelope )
{
    envelope->set_enumerated_message( ListenerWithReturn::MessageEnum::YES );
    return envelope->get_enumerated_message( ) == ListenerWithReturn::MessageEnum::YES;
}

bool
AttributedMessageDeliveryImpl::check_arrayed_message_round_trip(
    const std::shared_ptr< ListenerWithAttributes >& envelope )
{
    envelope->set_arrayed_message( {NONSENSE} );
    return envelope->get_arrayed_message( )[0] == NONSENSE;
}

bool
AttributedMessageDeliveryImpl::check_mapped_message_round_trip(
    const std::shared_ptr< ListenerWithAttributes >& envelope )
{
    envelope->set_mapped_message(
        {std::make_pair< int8_t, std::string >( 0, std::string(NONSENSE) )} );
    return envelope->get_mapped_message( )[0] == NONSENSE;
}

bool
AttributedMessageDeliveryImpl::check_buffered_message_round_trip(
    const std::shared_ptr< ListenerWithAttributes >& envelope )
{
    auto buffered_message
        = std::make_shared< std::vector<uint8_t> >( NONSENSE.begin( ), NONSENSE.end( ) );
    buffered_message->push_back( 0 );
    envelope->set_buffered_message( buffered_message );
    return std::string(
        reinterpret_cast< char const* >( envelope->get_buffered_message( )->data( ) ) ) == NONSENSE;
}

std::shared_ptr< AttributedMessageDelivery >
AttributedMessageDelivery::create( )
{
    return std::make_shared< AttributedMessageDeliveryImpl >( );
}

}  // namespace test

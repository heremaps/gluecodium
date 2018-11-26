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

#pragma once

#include "test/AttributedMessageDelivery.h"

namespace test
{
class AttributedMessageDeliveryImpl : public AttributedMessageDelivery
{
public:
    virtual bool check_message_round_trip(
        const std::shared_ptr< ListenerWithAttributes >& envelope ) override;
    virtual bool check_packed_message_round_trip(
        const std::shared_ptr< ListenerWithAttributes >& envelope ) override;
    virtual bool check_boxed_message_round_trip(
        const std::shared_ptr< ListenerWithAttributes >& envelope ) override;
    virtual bool check_structured_message_round_trip(
        const std::shared_ptr< ListenerWithAttributes >& envelope ) override;
    virtual bool check_enumerated_message_round_trip(
        const std::shared_ptr< ListenerWithAttributes >& envelope ) override;
    virtual bool check_arrayed_message_round_trip(
        const std::shared_ptr< ListenerWithAttributes >& envelope ) override;
    virtual bool check_mapped_message_round_trip(
        const std::shared_ptr< ListenerWithAttributes >& envelope ) override;
    virtual bool check_buffered_message_round_trip(
        const std::shared_ptr< ListenerWithAttributes >& envelope ) override;

};

}  // namespace test

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

#include "test/MessageDelivery.h"

namespace test
{
class MessageDeliveryImpl : public MessageDelivery
{
public:
    virtual std::string get_message(
        const std::shared_ptr< ListenerWithReturn >& envelope ) override;
    virtual std::string get_packed_message(
        const std::shared_ptr< ListenerWithReturn >& envelope ) override;
    virtual std::string get_structured_message(
        const std::shared_ptr< ListenerWithReturn >& envelope ) override;
    virtual std::string get_enumerated_message(
        const std::shared_ptr< ListenerWithReturn >& envelope ) override;
    virtual std::string get_arrayed_message(
        const std::shared_ptr< ListenerWithReturn >& envelope ) override;
    virtual std::string get_mapped_message(
        const std::shared_ptr< ListenerWithReturn >& envelope ) override;
    virtual std::string get_buffered_message(
        const std::shared_ptr< ListenerWithReturn >& envelope ) override;

};

}  // namespace test

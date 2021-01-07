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

#pragma once

#include "test/ErrorMessenger.h"

namespace test
{
class ErrorMessengerImpl : public ErrorMessenger
{
public:
    virtual ::lorem_ipsum::test::Return< ::std::string, ::std::error_code > get_message(
        const std::shared_ptr< ErrorsInInterface >& listener ) override;
    virtual ::std::error_code set_message( const std::shared_ptr< ErrorsInInterface >& listener,
                                           const std::string& message ) override;
    virtual ::lorem_ipsum::test::Return< ::std::string, Payload >
        get_message_with_payload(const std::shared_ptr< ErrorsInInterface >& listener ) override;
    virtual ::lorem_ipsum::test::Return< void, Payload > set_message_with_payload(
        const std::shared_ptr< ErrorsInInterface >& listener, const std::string& message ) override;
};

}  // namespace test

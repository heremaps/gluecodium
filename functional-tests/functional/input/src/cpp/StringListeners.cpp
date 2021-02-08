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

#include "test/DummyLogger.h"
#include "test/PersistingLogger.h"
#include "test/StringListener.h"

#include <algorithm>
#include <memory>
#include <mutex>
#include <string>
#include <vector>

namespace test
{
void
DummyLogger::relay_message( const ::std::shared_ptr<::test::StringListener >& listener,
                            const ::std::string& message )
{
    listener->on_message( message );
}

void
DummyLogger::relay_message_as_struct( const ::std::shared_ptr<::test::StringListener >& listener,
                                      const ::std::string& message )
{
    listener->on_struct_message( {message} );
}

void
DummyLogger::relay_const_message( const ::std::shared_ptr<::test::StringListener >& listener,
                                  const ::std::string& message )
{
    listener->on_const_message( message );
}

namespace
{
std::vector<std::shared_ptr<::test::StringListener>> s_listeners{};
}

void
PersistingLogger::add_listener(const std::shared_ptr<test::StringListener>& listener) {
    s_listeners.push_back(listener);
}

bool
PersistingLogger::remove_listener(const std::shared_ptr<test::StringListener>& listener) {
    auto iter = std::find(s_listeners.begin(), s_listeners.end(), listener);
    if (iter == s_listeners.end()) return false;

    s_listeners.erase(iter);
    return true;
}

void
PersistingLogger::remove_all_listeners() {
    s_listeners.clear();
}

void
PersistingLogger::message_all(const std::string& message) {
    for (const auto& listener: s_listeners) {
        listener->on_message(message);
    }
}

}

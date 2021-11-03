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

#include "test/ChildListener.h"
#include "test/ParentListener.h"
#include "test/Broadcaster.h"
#include "test/Talker.h"
#include <unordered_set>

namespace test
{
namespace {
class BroadcasterImpl : public Broadcaster {
public:
    void add_parent_listener(const std::shared_ptr<ParentListener>& listener) override {
        m_listeners.insert(listener);
    }

    void add_child_listener(const std::shared_ptr<ChildListener>& listener) override {
        m_listeners.insert(listener);
    }

    bool remove_listener(const std::shared_ptr<ParentListener>& listener) override {
        return m_listeners.erase(listener) == 1;
    }

private:
    std::unordered_set<std::shared_ptr<ParentListener>> m_listeners;
};
}

void
Talker::talk_to_parent( const std::shared_ptr< ParentListener >& listener )
{
    listener->listen( );
}

void
Talker::talk_to_child( const std::shared_ptr< ChildListener >& listener )
{
    listener->listen( );
}

std::shared_ptr<Broadcaster>
Broadcaster::create() {
    return std::make_shared<BroadcasterImpl>();
}

}

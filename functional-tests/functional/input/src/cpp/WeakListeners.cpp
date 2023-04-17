// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2020 HERE Europe B.V.
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

#include "test/ListenerInterface.h"
#include "test/Weakling.h"
#include "test/WeaklingNotifier.h"

namespace test
{
class WeaklingImpl : public Weakling {
public:
    std::shared_ptr<ListenerInterface> get_weak_listener() const override {
        return m_weak_listener;
    }

    void set_weak_listener(const std::shared_ptr<ListenerInterface>& value) override {
        m_weak_listener = value;
    }

    std::shared_ptr<ListenerInterface> get_strong_listener() const override {
        return m_strong_listener;
    }

    void set_strong_listener(const std::shared_ptr<ListenerInterface>& value) override {
        m_strong_listener = value;
    }

private:
    std::shared_ptr<ListenerInterface> m_weak_listener;
    std::shared_ptr<ListenerInterface> m_strong_listener;
};

std::shared_ptr<Weakling>
WeaklingNotifier::create_weakling() {
    return std::make_shared<WeaklingImpl>();
}

void
WeaklingNotifier::push_notifications(const std::shared_ptr<test::Weakling>& whom) {
    auto weak_listener = whom->get_weak_listener();
    if (weak_listener) {
        weak_listener->notify();
    }

    auto strong_listener = whom->get_strong_listener();
    if (strong_listener) {
        strong_listener->notify();
    }
}

std::optional<bool>
WeaklingNotifier::push_notification_maybe(const std::shared_ptr<test::Weakling>& whom) {
    return whom->get_weak_listener()->notify_maybe();
}
}

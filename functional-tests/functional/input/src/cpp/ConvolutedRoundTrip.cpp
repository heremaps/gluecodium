// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2021 HERE Europe B.V.
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

#include "test/RealBase.h"
#include "test/SomeIndicator.h"
#include <memory>

namespace test
{
namespace {

void* s_stored = nullptr;

class SomeIndicatorImpl: public SomeIndicator {
public:
    void on_attach(const std::shared_ptr<SomeBase>& some) override {
        m_weak = some;
    }

    void on_detach(const std::shared_ptr<SomeBase>& some) override {
        m_weak.reset();
    }

    bool is_weak_ptr_alive() override { return !m_weak.expired(); }

private:
    std::weak_ptr<SomeBase> m_weak;
};

class RealBaseImpl: public RealBase, public std::enable_shared_from_this<RealBaseImpl> {
public:
    void add_lifecycle_listener(const std::shared_ptr<SomeLifecycleListener>& lifecycle_listener) override {
        lifecycle_listener->on_attach(shared_from_this());
    }

    void remove_lifecycle_listener(const std::shared_ptr<SomeLifecycleListener>& lifecycle_listener) override {
        lifecycle_listener->on_detach(shared_from_this());
    }
};

}

std::shared_ptr<SomeIndicator>
SomeIndicator::create() {
    auto result = std::make_shared<SomeIndicatorImpl>();
    s_stored = result.get();
    return result;
}

std::shared_ptr<RealBase>
RealBase::create() { return std::make_shared<RealBaseImpl>(); }

bool
RealBase::compare_listener_to_initial(const std::shared_ptr<SomeLifecycleListener>& lifecycle_listener) {
    return lifecycle_listener.get() == s_stored;
}

}

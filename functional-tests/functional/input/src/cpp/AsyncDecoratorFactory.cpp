// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2026 HERE Europe B.V.
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

#include "test/AsyncDecoratorFactory.h"
#include "test/AsyncDecoratorTaskHandle.h"

#include <atomic>
#include <chrono>
#include <memory>
#include <optional>
#include <string>
#include <thread>

namespace test
{
namespace
{
bool s_stop_called = false;

class AsyncDecoratorTaskHandleImpl final : public AsyncDecoratorTaskHandle {
public:
    void stop() override
    {
        m_stopped.store(true);
        s_stop_called = true;
    }

    bool is_stopped() const
    {
        return m_stopped.load();
    }

private:
    std::atomic<bool> m_stopped{ false };
};

class AsyncDecoratorFactoryImpl final : public AsyncDecoratorFactory {
public:
    std::shared_ptr<AsyncDecoratorTaskHandle> fetch_value(
        const bool should_fail,
        const DecoratedValueCallback& callback
    ) override
    {
        auto handle = std::make_shared<AsyncDecoratorTaskHandleImpl>();

        if (should_fail) {
            callback(AsyncDecoratorErrorCode::FAILED, std::nullopt);
        } else {
            callback(std::nullopt, std::string("async-value"));
        }

        return handle;
    }

    std::shared_ptr<AsyncDecoratorTaskHandle>
    start_ticks(const DecoratedTickCallback& callback) override
    {
        auto handle = std::make_shared<AsyncDecoratorTaskHandleImpl>();

        // Emit asynchronously so callback registration on the managed side is fully established.
        std::thread([
            callback,
            handle
        ]() {
            for (int value = 1; value <= 3; ++value) {
                if (handle->is_stopped()) {
                    return;
                }
                callback(value);
                std::this_thread::sleep_for(std::chrono::milliseconds(5));
            }
        }).detach();

        return handle;
    }
};
}  // namespace

std::shared_ptr<AsyncDecoratorFactory>
AsyncDecoratorFactory::create()
{
    return std::make_shared<AsyncDecoratorFactoryImpl>();
}

bool
AsyncDecoratorFactory::was_stop_called()
{
    return s_stop_called;
}

void
AsyncDecoratorFactory::reset_stop_called()
{
    s_stop_called = false;
}

}  // namespace test

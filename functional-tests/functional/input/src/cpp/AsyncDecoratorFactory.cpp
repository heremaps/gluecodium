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
#include "test/FetchOptions.h"

#include <atomic>
#include <chrono>
#include <memory>
#include <mutex>
#include <string>
#include <thread>
#include <utility>

namespace test
{
namespace
{
// Read by the test thread while the worker thread writes it.
std::atomic_bool s_stop_called{ false };

constexpr auto k_completion_delay = std::chrono::milliseconds(50);
constexpr auto k_slow_completion_delay = std::chrono::milliseconds(300);

// Shared with the worker instead of the handle itself, so the worker never keeps alive the object
// that joins it.
struct TaskState final {
    std::atomic_bool stopped{ false };
};

class AsyncDecoratorTaskHandleImpl final : public AsyncDecoratorTaskHandle {
public:
    AsyncDecoratorTaskHandleImpl(std::shared_ptr<TaskState> state, std::thread worker)
        : m_state(std::move(state))
        , m_worker(std::move(worker))
    {
    }

    ~AsyncDecoratorTaskHandleImpl() override
    {
        m_state->stopped.store(true);
        join_worker();
    }

    void stop() override
    {
        m_state->stopped.store(true);
        s_stop_called.store(true);
        join_worker();
    }

private:
    // stop() and the destructor can race, so the joinable/join check-then-act has to be atomic.
    void join_worker()
    {
        const std::lock_guard<std::mutex> lock(m_worker_mutex);
        if (m_worker.joinable()) {
            m_worker.join();
        }
    }

    const std::shared_ptr<TaskState> m_state;
    std::mutex m_worker_mutex;
    std::thread m_worker;
};

class AsyncDecoratorFactoryImpl final : public AsyncDecoratorFactory {
public:
    std::shared_ptr<AsyncDecoratorTaskHandle> fetch_value(
        const bool should_fail,
        const DecoratedValueCallback& callback
    ) override
    {
        auto state = std::make_shared<TaskState>();

        // Completes off the calling thread, so the coroutine must actually suspend and resume.
        std::thread worker([state, callback, should_fail]() {
            std::this_thread::sleep_for(k_completion_delay);
            if (state->stopped.load()) {
                return;
            }
            if (should_fail) {
                callback(AsyncDecoratorErrorCode::FAILED, std::nullopt);
            } else {
                callback(std::nullopt, std::string("async-value"));
            }
        });

        return std::make_shared<AsyncDecoratorTaskHandleImpl>(state, std::move(worker));
    }

    std::shared_ptr<AsyncDecoratorTaskHandle> fetch_value_slow(
        const DecoratedSlowCallback& callback
    ) override
    {
        auto state = std::make_shared<TaskState>();

        std::thread worker([state, callback]() {
            std::this_thread::sleep_for(k_slow_completion_delay);
            if (state->stopped.load()) {
                return;
            }
            callback(std::string("slow-value"));
        });

        return std::make_shared<AsyncDecoratorTaskHandleImpl>(state, std::move(worker));
    }

    std::shared_ptr<AsyncDecoratorTaskHandle> fetch_with_options(
        const FetchOptions& options,
        const DecoratedValueCallback& callback
    ) override
    {
        auto state = std::make_shared<TaskState>();
        const auto retry_count = options.retry_count;

        // Echoes the value back so the test can prove which `FetchOptions` reached native code.
        std::thread worker([state, callback, retry_count]() {
            std::this_thread::sleep_for(k_completion_delay);
            if (state->stopped.load()) {
                return;
            }
            callback(std::nullopt, "retries-" + std::to_string(retry_count));
        });

        return std::make_shared<AsyncDecoratorTaskHandleImpl>(state, std::move(worker));
    }

    std::shared_ptr<AsyncDecoratorTaskHandle> fetch_with_progress(
        const DecoratedValueCallback& on_complete,
        const ProgressCallback& on_progress
    ) override
    {
        auto state = std::make_shared<TaskState>();

        std::thread worker([state, on_complete, on_progress]() {
            on_progress(1);
            std::this_thread::sleep_for(k_completion_delay);
            if (state->stopped.load()) {
                return;
            }
            on_complete(std::nullopt, std::string("progress-value"));
        });

        return std::make_shared<AsyncDecoratorTaskHandleImpl>(state, std::move(worker));
    }
};
class NestedProcessorImpl final : public AsyncDecoratorFactory::NestedProcessor {
public:
    std::shared_ptr<AsyncDecoratorTaskHandle> process(
        const std::string& input,
        const DecoratedValueCallback& callback
    ) override
    {
        auto state = std::make_shared<TaskState>();

        std::thread worker([state, callback, input]() {
            std::this_thread::sleep_for(k_completion_delay);
            if (state->stopped.load()) {
                return;
            }
            if (input == "fail") {
                callback(AsyncDecoratorErrorCode::FAILED, std::nullopt);
            } else {
                callback(std::nullopt, "processed-" + input);
            }
        });

        return std::make_shared<AsyncDecoratorTaskHandleImpl>(state, std::move(worker));
    }
};
}  // namespace

std::shared_ptr<AsyncDecoratorFactory::NestedProcessor>
AsyncDecoratorFactory::NestedProcessor::create()
{
    return std::make_shared<NestedProcessorImpl>();
}

std::shared_ptr<AsyncDecoratorFactory>
AsyncDecoratorFactory::create()
{
    return std::make_shared<AsyncDecoratorFactoryImpl>();
}

bool
AsyncDecoratorFactory::was_stop_called()
{
    return s_stop_called.load();
}

void
AsyncDecoratorFactory::reset_stop_called()
{
    s_stop_called.store(false);
}

}  // namespace test

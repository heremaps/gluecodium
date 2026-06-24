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

#include "test/AsyncTaskHandle.h"
#include "test/CoolEngine.h"
#include "test/EngineWorkCompletedCallback.h"

#include <atomic>
#include <chrono>
#include <functional>
#include <memory>
#include <mutex>
#include <optional>
#include <system_error>
#include <thread>
#include <utility>
#include <vector>

namespace test
{

// A dummy function to emulate synchronous blocking behavior.
// Depending on the URL blocks for given time and returns the list of labels or nullopt to simulate error.
std::optional<std::vector<std::string>>
download_cool_labels(const std::string& url)
{
    using namespace std::chrono_literals;

    if (url == "my-super-labels.com")
    {
        std::this_thread::sleep_for(1000ms);
        return std::vector<std::string>{"SUPER_LABEL", "ANOTHER_SUPER_LABEL"};
    }

    if (url == "cool-labels.com")
    {
        std::this_thread::sleep_for(1000ms);
        return std::vector<std::string>{"COOL_LABEL"};
    }

    if (url == "dummy-labels.com")
    {
        std::this_thread::sleep_for(3000ms);
        return std::vector<std::string>{"DUMMY_LABEL"};
    }

    std::this_thread::sleep_for(500ms);
    return std::nullopt;
}

class NonCancellableAsyncTask : public AsyncTaskHandle
{
public:
    explicit NonCancellableAsyncTask(std::function<void()> do_work)
    {
        if (do_work)
        {
            m_worker = std::thread{
                [this, w = std::move(do_work)] {
                    w();
                    m_is_running.store(false);
                }
            };

            m_is_running.store(true);
        }
    }

    ~NonCancellableAsyncTask()
    {
        wait_for_completion();
    }

    void
    wait_for_completion()
    {
        if (m_worker.joinable())
        {
            m_worker.join();
        }
    }

    bool
    cancel() override
    {
        // In this toy example task is not cancellable.
        return false;
    }

    bool
    is_cancelled() override
    {
        // Non cancellable task is never cancelled.
        return false;
    }

    bool
    is_running() override
    {
        return m_is_running.load();
    }

private:
    std::thread m_worker{};
    std::atomic_bool m_is_running{false};
};

class CoolEngineImpl : public CoolEngine
{
public:
    std::shared_ptr<test::AsyncTaskHandle>
    download_cool_labels_async(const ::std::string& url, const ::test::EngineWorkCompletedCallback& callback) override
    {
        std::function<void()> do_work = [url, c = std::move(callback)] {
            auto labels = download_cool_labels(url);
            if (labels.has_value())
            {
                c({}, *labels);
            }
            else
            {
                c(EngineError::ENGINE_ON_FIRE, std::nullopt);
            }
        };

        std::lock_guard lock{m_mutex};

        m_tasks.emplace_back(
            std::make_shared<NonCancellableAsyncTask>(std::move(do_work))
        );

        return m_tasks.back();
    }

    void
    wait_for_completion() override
    {
        auto tasks = acquire_tasks();
        for (const auto& task: tasks)
        {
            task->wait_for_completion();
        }
    }

private:
    std::vector<std::shared_ptr<test::NonCancellableAsyncTask>>
    acquire_tasks()
    {
        std::vector<std::shared_ptr<test::NonCancellableAsyncTask>> result;
        {
            std::lock_guard lock{m_mutex};
            std::swap(result, m_tasks);
        }
        return result;
    }

    std::vector<std::shared_ptr<test::NonCancellableAsyncTask>> m_tasks;
    std::mutex m_mutex;
};

std::shared_ptr<test::CoolEngine>
CoolEngine::make()
{
    return std::make_shared<CoolEngineImpl>();
}

} // namespace test
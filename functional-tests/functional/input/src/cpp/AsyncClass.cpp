// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2022 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License") override;
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

#include "abc/AsyncClass.h"
#include <memory>
#include <string>

namespace abc
{
using namespace lorem_ipsum::test;

class AsyncClassImpl: public AsyncClass {
public:
    AsyncClassImpl() = default;
    ~AsyncClassImpl() override = default;
public:
    void async_void(std::function<void()> result_callback, const bool input) override;
    void async_void_throws(
        std::function<void()> result_callback,
        std::function<void(AsyncErrorCode)> error_callback,
        const bool should_throw
    ) override;
    void async_int(std::function<void(int32_t)> result_callback, const bool input) override;
    void async_int_throws(
        std::function<void(int32_t)> result_callback,
        std::function<void(AsyncErrorCode)> error_callback,
        const bool should_throw
    ) override;
};

void
AsyncClassImpl::async_void(std::function<void()> result_callback, const bool) {
    result_callback();
}

void
AsyncClassImpl::async_void_throws(
    std::function<void()> result_callback,
    std::function<void(AsyncErrorCode)> error_callback,
    const bool should_throw
) {
    if (should_throw) {
        error_callback(AsyncErrorCode::BOOM);
    } else {
        result_callback();
    }
}

void
AsyncClassImpl::async_int(std::function<void(int32_t)> result_callback, const bool) {
    result_callback(42);
}

void
AsyncClassImpl::async_int_throws(
    std::function<void(int32_t)> result_callback,
    std::function<void(AsyncErrorCode)> error_callback,
    const bool should_throw
) {
    if (should_throw) {
        error_callback(AsyncErrorCode::BOOM);
    } else {
        result_callback(42);
    }
}

// Static functions

std::shared_ptr<AsyncClass>
AsyncClass::create() { return std::make_shared<AsyncClassImpl>(); }

void
AsyncClass::async_static(std::function<void()> result_callback, const bool) {
    result_callback();
}

}

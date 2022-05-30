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

#include "test/AsyncClass.h"
#include "test/AsyncStruct.h"
#include <memory>
#include <string>

namespace test
{
using namespace lorem_ipsum::test;

// AsyncClass

class AsyncClassImpl: public AsyncClass {
public:
    AsyncClassImpl() = default;
    ~AsyncClassImpl() override = default;
public:
    void async_void(std::function<void()> completer_callback, const bool input) override;
    void async_void(const bool input) override;
    void async_void_throws(
        std::function<void(bool, std::string)> completer_callback,
        const bool should_throw
    ) override;
    Return<void, std::string> async_void_throws(const bool input) override;
    void async_int(std::function<void(int32_t)> completer_callback, const bool input) override;
    int32_t async_int(const bool input) override;
    void async_int_throws(
        std::function<void(bool, int32_t, std::string)> completer_callback,
        const bool should_throw
    ) override;
    Return<int32_t, std::string> async_int_throws(const bool input) override;
};

void
AsyncClassImpl::async_void(std::function<void()> completer_callback, const bool) {
    completer_callback();
}

void
AsyncClassImpl::async_void(const bool) {}

void
AsyncClassImpl::async_void_throws(
    std::function<void(bool, std::string)> completer_callback,
    const bool should_throw
) {
    if (should_throw) {
        completer_callback(false, "boom");
    } else {
        completer_callback(true, "");
    }
}

Return<void, std::string>
AsyncClassImpl::async_void_throws(const bool) { return Return<void, std::string>(false); }

void
AsyncClassImpl::async_int(std::function<void(int32_t)> completer_callback, const bool) {
    completer_callback(42);
}

int32_t
AsyncClassImpl::async_int(const bool) { return 0; }

void
AsyncClassImpl::async_int_throws(
    std::function<void(bool, int32_t, std::string)> completer_callback,
    const bool should_throw
) {
    if (should_throw) {
        completer_callback(false, 0, "boom");
    } else {
        completer_callback(true, 42, "");
    }
}

Return<int32_t, std::string>
AsyncClassImpl::async_int_throws(const bool) { return Return<int32_t, std::string>(0); }

// AsyncClass static functions

std::shared_ptr<AsyncClass>
AsyncClass::create() { return std::make_shared<AsyncClassImpl>(); }

void
AsyncClass::async_static(std::function<void()> completer_callback, const bool) {
    completer_callback();
}

void
AsyncClass::async_static(const bool) {}

// AsyncStruct

void
AsyncStruct::async_void(std::function<void()> completer_callback, const bool) const {
    completer_callback();
}

void
AsyncStruct::async_void(const bool) const {}

void
AsyncStruct::async_void_throws(
    std::function<void(bool, std::string)> completer_callback,
    const bool should_throw
) const {
    if (should_throw) {
        completer_callback(false, "boom");
    } else {
        completer_callback(true, "");
    }
}

Return<void, std::string>
AsyncStruct::async_void_throws(const bool) const { return Return<void, std::string>(false); }

void
AsyncStruct::async_int(std::function<void(int32_t)> completer_callback, const bool) const {
    completer_callback(42);
}

int32_t
AsyncStruct::async_int(const bool) const { return 0; }

void
AsyncStruct::async_int_throws(
    std::function<void(bool, int32_t, std::string)> completer_callback,
    const bool should_throw
) const {
    if (should_throw) {
        completer_callback(false, 0, "boom");
    } else {
        completer_callback(true, 42, "");
    }
}

Return<int32_t, std::string>
AsyncStruct::async_int_throws(const bool) const { return Return<int32_t, std::string>(0); }

// AsyncStruct static functions

void
AsyncStruct::async_static(std::function<void()> completer_callback, const bool) {
    completer_callback();
}

void
AsyncStruct::async_static(const bool) {}

}

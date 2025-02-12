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

#include "abc/AsyncStruct.h"
#include <memory>
#include <string>

namespace abc
{
using namespace lorem_ipsum::test;

void
AsyncStruct::async_void(std::function<void()> result_callback, const bool) const {
    result_callback();
}

void
AsyncStruct::async_void_throws(
    std::function<void()> result_callback,
    std::function<void(std::string)> error_callback,
    const bool should_throw
) const {
    if (should_throw) {
        error_callback("boom");
    } else {
        result_callback();
    }
}

void
AsyncStruct::async_int(std::function<void(int32_t)> result_callback, const bool) const {
    result_callback(42);
}

void
AsyncStruct::async_int_throws(
    std::function<void(int32_t)> result_callback,
    std::function<void(std::string)> error_callback,
    const bool should_throw
) const {
    if (should_throw) {
        error_callback("boom");
    } else {
        result_callback(42);
    }
}

// Static functions

void
AsyncStruct::async_static(std::function<void()> result_callback, const bool) {
    result_callback();
}

}

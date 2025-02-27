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

#include "abc/AsyncWithSkips.h"
#include <memory>
#include <string>

namespace abc
{

void
AsyncWithSkips::make_shared_instance(std::function<void()> result_callback) {
    result_callback();
}

void
AsyncWithSkips::make_shared_instance() {}

void
AsyncWithSkips::make_shared_instance(const std::string& android_context) {}

}

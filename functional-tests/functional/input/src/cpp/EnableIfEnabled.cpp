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

#include "test/EnableIfEnabled.h"
#include "test/EnableIfSkipped.h"

namespace test
{
void
EnableIfEnabled::enable_unquoted() {}

std::string
EnableIfEnabled::get_enable_quoted() { return {}; }

void
EnableIfEnabled::set_enable_quoted(const std::string& value) {}

// Should fail if such type is already defined.
struct SkippedMe {};

// Should fail if such type is already defined.
enum SkipedMeToo {};
}

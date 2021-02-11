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

#include "test/NullableCollections.h"
#include "test/UseNullableCollections.h"

namespace test
{
using namespace lorem_ipsum::test;

Optional<std::vector<std::string>>
UseNullableCollections::nullable_list_round_trip(const Optional<std::vector<std::string>>& input) {
    return input;
}

Optional<std::unordered_set<std::string>>
UseNullableCollections::nullable_set_round_trip(const Optional<std::unordered_set<std::string>>& input) {
    return input;
}

Optional<std::unordered_map<std::string, std::string>>
UseNullableCollections::nullable_map_round_trip(const Optional<std::unordered_map<std::string, std::string>>& input) {
    return input;
}

NullableCollections
UseNullableCollections::nullable_collections_round_trip(const NullableCollections& input) {
    return input;
}
}

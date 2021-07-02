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

#include "test/DurationMilliseconds.h"
#include "test/DurationSeconds.h"

namespace test
{
using namespace std::chrono;

seconds
DurationSeconds::increase_duration(const seconds input) {
    return input + seconds(1);
}

lorem_ipsum::test::optional<seconds>
DurationSeconds::increase_duration_maybe(const lorem_ipsum::test::optional<seconds>& input) {
    return input ? *input + seconds(1) : input;
}

DurationSeconds::DurationStruct
DurationSeconds::duration_struct_round_trip(const DurationSeconds::DurationStruct& input) {
    return input;
}

milliseconds
DurationMilliseconds::increase_duration(const milliseconds input) {
    return input + seconds(1);
}

lorem_ipsum::test::optional<milliseconds>
DurationMilliseconds::increase_duration_maybe(const lorem_ipsum::test::optional<milliseconds>& input) {
    return input ? *input + seconds(1) : input;
}

DurationMilliseconds::DurationStruct
DurationMilliseconds::duration_struct_round_trip(const DurationMilliseconds::DurationStruct& input) {
    return input;
}

}

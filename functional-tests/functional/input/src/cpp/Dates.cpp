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

#include "test/Dates.h"

namespace test
{
using namespace std::chrono;

system_clock::time_point s_date;

system_clock::time_point
Dates::increase_date( const system_clock::time_point& input )
{
    return input + hours(24) + hours(1) + minutes(1) + seconds(1);
}

lorem_ipsum::test::optional< system_clock::time_point >
Dates::increase_date_maybe( const lorem_ipsum::test::optional< system_clock::time_point >& input )
{
    return input ? *input + hours(24) + hours(1) + minutes(1) + seconds(1) : input;
}

system_clock::time_point
Dates::get_date_attribute( )
{
    return s_date;
}

void
Dates::set_date_attribute( const system_clock::time_point& value )
{
    s_date = value;
}
}  // namespace test

// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2020 HERE Europe B.V.
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

#include "test/JavaExternalTypesStruct.h"
#include "test/UseJavaExternalTypes.h"
#include "test/VeryBoolean.h"

namespace test
{
Currency
UseJavaExternalTypes::currency_round_trip(const Currency& input) {
    return input;
}

TimeZone
UseJavaExternalTypes::time_zone_round_trip(const TimeZone& input) {
    return input;
}

Month
UseJavaExternalTypes::month_round_trip(const Month input) {
    return input;
}

SystemColor
UseJavaExternalTypes::color_round_trip(const SystemColor& input) {
    return input;
}

Season
UseJavaExternalTypes::season_round_trip(const Season input) {
    return input;
}

JavaExternalTypesStruct
UseJavaExternalTypes::struct_round_trip(const JavaExternalTypesStruct& input) {
    return input;
}

bool
UseJavaExternalTypes::very_boolean_unbox(const VeryBoolean& input) { return input.value; }

}
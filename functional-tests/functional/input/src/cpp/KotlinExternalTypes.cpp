// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2025 HERE Europe B.V.
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

#include "test/KotlinExternalTypesStruct.h"
#include "test/UseKotlinExternalTypes.h"
#include "test/VeryBoolean.h"

namespace test
{
Currency
UseKotlinExternalTypes::currency_round_trip(const Currency& input) {
    return input;
}

TimeZone
UseKotlinExternalTypes::time_zone_round_trip(const TimeZone& input) {
    return input;
}

Month
UseKotlinExternalTypes::month_round_trip(const Month input) {
    return input;
}

SystemColor
UseKotlinExternalTypes::color_round_trip(const SystemColor& input) {
    return input;
}

Season
UseKotlinExternalTypes::season_round_trip(const Season input) {
    return input;
}

KotlinExternalTypesStruct
UseKotlinExternalTypes::struct_round_trip(const KotlinExternalTypesStruct& input) {
    return input;
}

bool
UseKotlinExternalTypes::very_boolean_unbox(const VeryBoolean& input) { return input.value; }

VeryBoolean
VeryBoolean::make(const bool value) { return VeryBoolean{value}; }
}

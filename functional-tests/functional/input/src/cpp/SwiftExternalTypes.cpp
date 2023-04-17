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

#include "test/SwiftExternalTypesStruct.h"
#include "test/UseSwiftExternalTypes.h"
#include "test/VeryBoolean.h"

namespace test
{
DateInterval
UseSwiftExternalTypes::date_interval_round_trip(const DateInterval& input) {
    return input;
}

Persistence
UseSwiftExternalTypes::persistence_round_trip(const Persistence input) {
    return input;
}

SystemColor
UseSwiftExternalTypes::color_round_trip(const SystemColor& input) {
    return input;
}

Season
UseSwiftExternalTypes::season_round_trip(const Season input) {
    return input;
}

SwiftExternalTypesStruct
UseSwiftExternalTypes::struct_round_trip(const SwiftExternalTypesStruct& input) {
    return input;
}

bool
UseSwiftExternalTypes::very_boolean_unbox(const VeryBoolean& input) { return input.value; }

VeryBoolean
VeryBoolean::make(const bool value) { return VeryBoolean{value}; }
}

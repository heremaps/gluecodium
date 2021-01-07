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

#include "test/PlainDataStructuresImmutable.h"

namespace test
{
PlainDataStructuresImmutable::AllTypesImmutableStruct
PlainDataStructuresImmutable::immutable_struct_round_trip(
    const PlainDataStructuresImmutable::AllTypesImmutableStruct& input )
{
    return input;
}

PlainDataStructuresImmutable::NestingImmutableStruct
PlainDataStructuresImmutable::nesting_immutable_struct_round_trip(
    const PlainDataStructuresImmutable::NestingImmutableStruct& input )
{
    return input;
}

PlainDataStructuresImmutable::ImmutableStructWithCppAccessors
PlainDataStructuresImmutable::immutable_struct_with_accessors_round_trip(
    const PlainDataStructuresImmutable::ImmutableStructWithCppAccessors& input )
{
    return input;
}

PlainDataStructuresImmutable::MapToImmutableStruct
PlainDataStructuresImmutable::map_of_immutables_round_trip(
    const PlainDataStructuresImmutable::MapToImmutableStruct& input)
{
    return input;
}
}  // namespace test

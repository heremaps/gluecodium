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

#include "test/StructsWithMethods.h"
#include "test/StructsWithMethodsInterface.h"

#include <cmath>

namespace test
{
double
Vector::distance_to( const Vector& other ) const
{
    double dx = x - other.x;
    double dy = y - other.y;
    return std::sqrt( dx * dx + dy * dy );
}

Vector
Vector::add( const Vector& other ) const
{
    return {x + other.x, y + other.y};
}

double
StructsWithMethodsInterface::Vector3::distance_to(
    const StructsWithMethodsInterface::Vector3& other ) const
{
    double dx = x - other.x;
    double dy = y - other.y;
    double dz = z - other.z;
    return std::sqrt( dx * dx + dy * dy + dz * dz );
}

StructsWithMethodsInterface::Vector3
StructsWithMethodsInterface::Vector3::add( const StructsWithMethodsInterface::Vector3& other ) const
{
    return {x + other.x, y + other.y, z + other.z};
}

}  // namespace test

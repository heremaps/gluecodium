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

#include "test/StructWithConstMethod.h"
#include "test/StructsWithMethodsInterface.h"
#include "test/ValidationUtils.h"
#include "test/Vector.h"

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

bool
Vector::validate( const double x, const double y )
{
    return !std::isnan( x ) && !std::isnan( y );
}

Vector
Vector::create( const double x, const double y )
{
    return {x, y};
}

lorem_ipsum::test::Return< Vector, std::error_code >
Vector::create( const Vector& other )
{
    return validate( other.x, other.y ) ?
        lorem_ipsum::test::Return< Vector, std::error_code >( Vector( other.x, other.y ) ) :
        lorem_ipsum::test::Return< Vector, std::error_code >(
            ValidationUtils::ValidationErrorCode::VALIDATION_FAILED
        );
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

bool
StructsWithMethodsInterface::Vector3::validate( const double x, const double y, const double z )
{
    return !std::isnan( x ) && !std::isnan( y ) && !std::isnan( z );
}

StructsWithMethodsInterface::Vector3
StructsWithMethodsInterface::Vector3::create( const double x, const double y, const double z )
{
    return {x, y, z};
}

lorem_ipsum::test::Return< StructsWithMethodsInterface::Vector3, std::error_code >
StructsWithMethodsInterface::Vector3::create( const StructsWithMethodsInterface::Vector3& other )
{
    return validate( other.x, other.y, other.z ) ?
        lorem_ipsum::test::Return< StructsWithMethodsInterface::Vector3, std::error_code >(
            StructsWithMethodsInterface::Vector3( other.x, other.y, other.z ) ) :
        lorem_ipsum::test::Return< StructsWithMethodsInterface::Vector3, std::error_code >(
            ValidationUtils::ValidationErrorCode::VALIDATION_FAILED
         );
}

void
StructsWithMethodsInterface::StructWithStaticMethodsOnly::do_stuff( )
{
}

double
StructWithConstMethod::double_const( ) const
{
    return 0;
}

}

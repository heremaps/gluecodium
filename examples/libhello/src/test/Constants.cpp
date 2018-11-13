// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
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

#include "test/Constants.h"
#include "test/ConstantsInterface.h"
#include "test/UseInterfaceConstants.h"
#include "test/UseTypeCollectionConstants.h"

namespace test
{
// UseTypeCollectionConstants

int32_t
UseTypeCollectionConstants::get_int_constant( )
{
    return test::INT_CONSTANT;
}

uint32_t
UseTypeCollectionConstants::get_uint_constant( )
{
    return test::UINT_CONSTANT;
}

float
UseTypeCollectionConstants::get_float_constant( )
{
    return test::FLOAT_CONSTANT;
}

double
UseTypeCollectionConstants::get_double_constant( )
{
    return test::DOUBLE_CONSTANT;
}

std::string
UseTypeCollectionConstants::get_string_constant( )
{
    return test::STRING_CONSTANT;
}

test::StateEnum
UseTypeCollectionConstants::get_enum_constant( )
{
    return test::ENUM_CONSTANT;
}

// UseInterfaceConstants

int32_t
UseInterfaceConstants::get_int_constant( )
{
    return ConstantsInterface::INT_CONSTANT;
}

uint32_t
UseInterfaceConstants::get_uint_constant( )
{
    return ConstantsInterface::UINT_CONSTANT;
}

float
UseInterfaceConstants::get_float_constant( )
{
    return ConstantsInterface::FLOAT_CONSTANT;
}

double
UseInterfaceConstants::get_double_constant( )
{
    return ConstantsInterface::DOUBLE_CONSTANT;
}

std::string
UseInterfaceConstants::get_string_constant( )
{
    return ConstantsInterface::STRING_CONSTANT;
}

ConstantsInterface::StateEnum
UseInterfaceConstants::get_enum_constant( )
{
    return ConstantsInterface::ENUM_CONSTANT;
}

}  // namespace test

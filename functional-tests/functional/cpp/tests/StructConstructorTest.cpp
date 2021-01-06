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

#include "test/TypeCollection.h"
#include <gmock/gmock.h>

namespace test
{
using namespace ::testing;

class StructConstructorTest : public ::testing::Test
{
public:
    void
    SetUp( ) override
    {
        point_memory = new Point{-1, -1};
    }

    void
    TearDown( ) override
    {
        delete point_memory;
    }

    // memory to construct tested points into, explicitly initialized non-zero
    Point* point_memory;
};

TEST_F( StructConstructorTest, default_constructor )
{
    auto point = new ( point_memory ) Point( );

    EXPECT_EQ( point->x, 0.0 );
    EXPECT_EQ( point->y, 0.0 );
}

TEST_F( StructConstructorTest, value_construction )
{
    auto point = new ( point_memory ) Point;

    EXPECT_EQ( point->x, 0.0 );
    EXPECT_EQ( point->y, 0.0 );
}

TEST_F( StructConstructorTest, brace_initialization )
{
    auto point = new ( point_memory ) Point{};

    EXPECT_EQ( point->x, 0.0 );
    EXPECT_EQ( point->y, 0.0 );
}

}  // test

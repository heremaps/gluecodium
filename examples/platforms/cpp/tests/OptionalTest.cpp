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

#include "lorem_ipsum/test/Optional.h"

#include "optional_types/NonTrivial.h"
#include "optional_types/ThrowableNonTrivial.h"
#include "optional_types/ThrowableTrivial.h"
#include "optional_types/TypeWithAddressOf.h"

#include <gmock/gmock.h>

namespace test
{
using namespace ::testing;
using ::lorem_ipsum::test::optional;
using ::lorem_ipsum::test::nullopt;
using ::lorem_ipsum::test::in_place;
using ::lorem_ipsum::test::bad_optional_access;

#define APPEND( A, B ) APPEND_( A, B )
#define APPEND_( A, B ) A##B
#define TEST_NAME APPEND( OptionalTest, HELLO_TEST_CPP_VERSION )

TEST( TEST_NAME, trivial_constructor_trivially_destructable_type )
{
    optional< int > optional_null;
    EXPECT_FALSE( optional_null );
    EXPECT_FALSE( optional_null.has_value( ) );

    constexpr optional< int > optional_null_constexpr;
    static_assert( !optional_null_constexpr, "constexpr operator bool" );
    static_assert( !optional_null_constexpr.has_value( ), "constexpr has_value" );
}

TEST( TEST_NAME, trivial_constructor_non_trivially_destructable_type )
{
    optional< NonTrivial > optional_non_trivial_null;
    EXPECT_FALSE( optional_non_trivial_null );
    EXPECT_FALSE( optional_non_trivial_null.has_value( ) );
}

TEST( TEST_NAME, trivial_constructor_throwable_type )
{
    optional< ThrowableTrivial > optional_throwable_trivial_null;
    EXPECT_FALSE( optional_throwable_trivial_null );
    EXPECT_FALSE( optional_throwable_trivial_null.has_value( ) );

    optional< ThrowableNonTrivial > optional_throwable_non_trivial_null;
    EXPECT_FALSE( optional_throwable_non_trivial_null );
    EXPECT_FALSE( optional_throwable_non_trivial_null.has_value( ) );
}

TEST( TEST_NAME, nulloptional_constructor_trivially_destructable_type )
{
    optional< int > optional_null( nullopt );
    EXPECT_FALSE( optional_null );
    EXPECT_FALSE( optional_null.has_value( ) );

    constexpr optional< int > optional_null_constexpr( nullopt );
    static_assert( !optional_null_constexpr, "constexpr operator bool" );
    static_assert( !optional_null_constexpr.has_value( ), "constexpr has_value" );
}

TEST( TEST_NAME, nulloptional_constructor_non_trivially_destructable_type )
{
    optional< NonTrivial > optional_non_trivial_null( nullopt );
    EXPECT_FALSE( optional_non_trivial_null );
    EXPECT_FALSE( optional_non_trivial_null.has_value( ) );
}

TEST( TEST_NAME, nulloptional_constructor_throwable_type )
{
    optional< ThrowableTrivial > optional_throwable_trivial_null( nullopt );
    EXPECT_FALSE( optional_throwable_trivial_null );
    EXPECT_FALSE( optional_throwable_trivial_null.has_value( ) );

    optional< ThrowableNonTrivial > optional_throwable_non_trivial_null( nullopt );
    EXPECT_FALSE( optional_throwable_non_trivial_null );
    EXPECT_FALSE( optional_throwable_non_trivial_null.has_value( ) );
}

TEST( TEST_NAME, copy_value_constructor_trivially_destructable_type )
{
    int expected_value = 1;
    optional< int > optional_int( expected_value );
    EXPECT_TRUE( optional_int );
    EXPECT_TRUE( optional_int.has_value( ) );
    EXPECT_EQ( 1, optional_int.value( ) );

    constexpr int expected_value_constexpr = 1;
    constexpr optional< int > optional_int_constexpr( expected_value_constexpr );
    static_assert( optional_int_constexpr, "constexpr operator bool" );
    static_assert( optional_int_constexpr.has_value( ), "constexpr has_value" );
}

TEST( TEST_NAME, copy_value_constructor_non_trivially_destructable_type )
{
    const NonTrivial non_trivial( 100, "test 100" );
    bool is_destructed = false;
    {
        optional< NonTrivial > optional_non_trivial( non_trivial );
        EXPECT_TRUE( optional_non_trivial );
        EXPECT_TRUE( optional_non_trivial.has_value( ) );
        EXPECT_EQ( 100, optional_non_trivial.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial.value( ).string_field );
        optional_non_trivial.value( ).is_destructed = &is_destructed;
        EXPECT_THAT( optional_non_trivial.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedWithCopyCtor ) );
    }
    EXPECT_TRUE( is_destructed );
}

TEST( TEST_NAME, copy_value_constructor_throwable_type )
{
    const ThrowableTrivial throwable_trivial( false );
    EXPECT_THROW( new optional< ThrowableTrivial >( throwable_trivial ),
                  ThrowableTrivial::Exception );

    const ThrowableNonTrivial throwable_non_trivial( false );
    EXPECT_THROW( new optional< ThrowableNonTrivial >( throwable_non_trivial ),
                  ThrowableNonTrivial::Exception );
}

TEST( TEST_NAME, move_value_constructor_trivially_destructable_type )
{
    optional< int > optional_int( 1 );
    EXPECT_TRUE( optional_int );
    EXPECT_TRUE( optional_int.has_value( ) );
    EXPECT_EQ( 1, optional_int.value( ) );

    constexpr optional< int > optional_int_constexpr( 1 );
    static_assert( optional_int_constexpr, "constexpr operator bool" );
    static_assert( optional_int_constexpr.has_value( ), "constexpr has_value" );
}

TEST( TEST_NAME, move_value_constructor_non_trivially_destructable_type )
{
    bool is_destructed = false;
    {
        optional< NonTrivial > optional_non_trivial( NonTrivial( 100, "test 100" ) );
        EXPECT_TRUE( optional_non_trivial );
        EXPECT_TRUE( optional_non_trivial.has_value( ) );
        EXPECT_EQ( 100, optional_non_trivial.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial.value( ).string_field );
        optional_non_trivial.value( ).is_destructed = &is_destructed;
        EXPECT_THAT( optional_non_trivial.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedWithMoveCtor ) );
    }
    EXPECT_TRUE( is_destructed );
}

TEST( TEST_NAME, move_value_constructor_throwable_type )
{
    EXPECT_THROW( new optional< ThrowableTrivial >( ThrowableTrivial( false ) ),
                  ThrowableTrivial::Exception );
    EXPECT_THROW( new optional< ThrowableNonTrivial >( ThrowableNonTrivial( false ) ),
                  ThrowableNonTrivial::Exception );
}

TEST( TEST_NAME, in_place_constructor_trivially_destructable_type )
{
    optional< int > optional_int( in_place, 1 );
    EXPECT_TRUE( optional_int );
    EXPECT_TRUE( optional_int.has_value( ) );
    EXPECT_EQ( 1, optional_int.value( ) );

    constexpr optional< int > optional_int_constexpr( in_place, 1 );
    static_assert( optional_int_constexpr, "constexpr operator bool" );
    static_assert( optional_int_constexpr.has_value( ), "constexpr has_value" );
}

TEST( TEST_NAME, in_place_constructor_non_trivially_destructable_type )
{
    bool is_destructed = false;
    {
        optional< NonTrivial > optional_non_trivial( in_place, 100, "test 100" );
        EXPECT_TRUE( optional_non_trivial );
        EXPECT_TRUE( optional_non_trivial.has_value( ) );
        EXPECT_EQ( 100, optional_non_trivial.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial.value( ).string_field );
        optional_non_trivial.value( ).is_destructed = &is_destructed;
        EXPECT_THAT( optional_non_trivial.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedInPlace ) );
    }
    EXPECT_TRUE( is_destructed );
}

TEST( TEST_NAME, in_place_constructor_throwable_type )
{
    EXPECT_THROW( new optional< ThrowableTrivial >( in_place, true ), ThrowableTrivial::Exception );
    EXPECT_THROW( new optional< ThrowableNonTrivial >( in_place, true ),
                  ThrowableNonTrivial::Exception );
}

TEST( TEST_NAME, optional_copy_constructor_trivially_destructable_type )
{
    optional< int > optional_int_src( in_place, 1 );
    optional< int > optional_int_dst( optional_int_src );
    EXPECT_TRUE( optional_int_src );
    EXPECT_TRUE( optional_int_src.has_value( ) );
    EXPECT_EQ( 1, optional_int_src.value( ) );
    EXPECT_TRUE( optional_int_dst );
    EXPECT_TRUE( optional_int_dst.has_value( ) );
    EXPECT_EQ( 1, optional_int_dst.value( ) );
}

TEST( TEST_NAME, optional_copy_constructor_non_trivially_destructable_type )
{
    bool is_destructed_src = false;
    bool is_destructed_dst = false;
    {
        optional< NonTrivial > optional_non_trivial_src( in_place, 100, "test 100" );
        optional< NonTrivial > optional_non_trivial_dst( optional_non_trivial_src );
        EXPECT_TRUE( optional_non_trivial_src );
        EXPECT_TRUE( optional_non_trivial_src.has_value( ) );
        EXPECT_EQ( 100, optional_non_trivial_src.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial_src.value( ).string_field );
        optional_non_trivial_src.value( ).is_destructed = &is_destructed_src;
        EXPECT_THAT( optional_non_trivial_src.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedInPlace ) );
        EXPECT_TRUE( optional_non_trivial_dst );
        EXPECT_TRUE( optional_non_trivial_dst.has_value( ) );
        EXPECT_EQ( 100, optional_non_trivial_dst.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial_dst.value( ).string_field );
        optional_non_trivial_dst.value( ).is_destructed = &is_destructed_dst;
        EXPECT_THAT( optional_non_trivial_dst.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedWithCopyCtor ) );
    }
    EXPECT_TRUE( is_destructed_src );
    EXPECT_TRUE( is_destructed_dst );
}

TEST( TEST_NAME, optional_copy_constructor_throwable_type )
{
    optional< ThrowableTrivial > optional_throwable_trivial_src( in_place, false );
    EXPECT_THROW( new optional< ThrowableTrivial >( optional_throwable_trivial_src ),
                  ThrowableTrivial::Exception );

    optional< ThrowableNonTrivial > optional_throwable_non_trivial_src( in_place, false );
    EXPECT_THROW( new optional< ThrowableNonTrivial >( optional_throwable_non_trivial_src ),
                  ThrowableNonTrivial::Exception );
}

TEST( TEST_NAME, optional_copy_constructor_trivially_destructable_type_from_empty )
{
    optional< int > optional_int_src;
    optional< int > optional_int_dst( optional_int_src );
    EXPECT_FALSE( optional_int_src );
    EXPECT_FALSE( optional_int_dst );
}

TEST( TEST_NAME, optional_copy_constructor_non_trivially_destructable_type_from_empty )
{
    optional< NonTrivial > optional_non_trivial_src;
    optional< NonTrivial > optional_non_trivial_dst( optional_non_trivial_src );
    EXPECT_FALSE( optional_non_trivial_src );
    EXPECT_FALSE( optional_non_trivial_dst );
}

TEST( TEST_NAME, optional_move_constructor_trivially_destructable_type )
{
    optional< int > optional_int_src( in_place, 1 );
    optional< int > optional_int_dst( std::move( optional_int_src ) );
    EXPECT_TRUE( optional_int_src );
    EXPECT_TRUE( optional_int_src.has_value( ) );
    EXPECT_EQ( 1, optional_int_src.value( ) );
    EXPECT_TRUE( optional_int_dst );
    EXPECT_TRUE( optional_int_dst.has_value( ) );
    EXPECT_EQ( 1, optional_int_dst.value( ) );
}

TEST( TEST_NAME, optional_move_constructor_non_trivially_destructable_type )
{
    bool is_destructed_src = false;
    bool is_destructed_dst = false;
    {
        optional< NonTrivial > optional_non_trivial_src( in_place, 100, "test 100" );
        optional< NonTrivial > optional_non_trivial_dst( std::move( optional_non_trivial_src ) );
        // Important. Move constructor DO NOT erase src optional, it moves value instead without
        // its destruction
        EXPECT_TRUE( optional_non_trivial_src );
        EXPECT_TRUE( optional_non_trivial_src.has_value( ) );
        EXPECT_EQ( 100, optional_non_trivial_src.value( ).int_field );
        EXPECT_TRUE( optional_non_trivial_src.value( ).string_field.empty( ) );
        optional_non_trivial_src.value( ).is_destructed = &is_destructed_src;
        EXPECT_THAT( optional_non_trivial_src.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedInPlace ) );
        EXPECT_TRUE( optional_non_trivial_dst );
        EXPECT_TRUE( optional_non_trivial_dst.has_value( ) );
        EXPECT_EQ( 100, optional_non_trivial_dst.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial_dst.value( ).string_field );
        optional_non_trivial_dst.value( ).is_destructed = &is_destructed_dst;
        EXPECT_THAT( optional_non_trivial_dst.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedWithMoveCtor ) );
    }
    EXPECT_TRUE( is_destructed_src );
    EXPECT_TRUE( is_destructed_dst );
}

TEST( TEST_NAME, optional_move_constructor_throwable_type )
{
    optional< ThrowableTrivial > optional_throwable_trivial_src( in_place, false );
    EXPECT_THROW( new optional< ThrowableTrivial >( std::move( optional_throwable_trivial_src ) ),
                  ThrowableTrivial::Exception );

    optional< ThrowableNonTrivial > optional_throwable_non_trivial_src( in_place, false );
    EXPECT_THROW(
        new optional< ThrowableNonTrivial >( std::move( optional_throwable_non_trivial_src ) ),
        ThrowableNonTrivial::Exception );
}

TEST( TEST_NAME, optional_move_constructor_trivially_destructable_type_from_empty )
{
    optional< int > optional_int_src;
    optional< int > optional_int_dst( std::move( optional_int_src ) );
    EXPECT_FALSE( optional_int_src );
    EXPECT_FALSE( optional_int_dst );
}

TEST( TEST_NAME, optional_move_constructor_non_trivially_destructable_type_from_empty )
{
    optional< NonTrivial > optional_non_trivial_src;
    optional< NonTrivial > optional_non_trivial_dst( std::move( optional_non_trivial_src ) );
    EXPECT_FALSE( optional_non_trivial_src );
    EXPECT_FALSE( optional_non_trivial_dst );
}

TEST( TEST_NAME, operator_eq_copy_value_trivially_destructable_type_to_empty )
{
    optional< int > optional_int;
    optional_int = 1;
    EXPECT_TRUE( optional_int );
    EXPECT_EQ( 1, optional_int.value( ) );
}

TEST( TEST_NAME, operator_eq_copy_value_trivially_destructable_type_to_engaged )
{
    optional< int > optional_int( 1 );
    optional_int = 2;
    EXPECT_TRUE( optional_int );
    EXPECT_EQ( 2, optional_int.value( ) );
}

TEST( TEST_NAME, operator_eq_copy_value_non_trivially_destructable_type_to_empty )
{
    bool is_destructed = false;
    {
        optional< NonTrivial > optional_non_trivial;
        optional_non_trivial = std::move( NonTrivial( 100, "test 100" ) );
        EXPECT_TRUE( optional_non_trivial );
        EXPECT_EQ( 100, optional_non_trivial.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial.value( ).string_field );
        optional_non_trivial.value( ).is_destructed = &is_destructed;
        EXPECT_THAT( optional_non_trivial.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedWithMoveCtor ) );
    }
    EXPECT_TRUE( is_destructed );
}

TEST( TEST_NAME, operator_eq_copy_value_non_trivially_destructable_type_to_engaged )
{
    bool is_destructed = false;
    {
        const NonTrivial non_trivial( 200, "test 200" );
        optional< NonTrivial > optional_non_trivial( NonTrivial( 100, "test 100" ) );
        optional_non_trivial = non_trivial;
        EXPECT_TRUE( optional_non_trivial );
        EXPECT_EQ( 200, optional_non_trivial.value( ).int_field );
        EXPECT_EQ( "test 200", optional_non_trivial.value( ).string_field );
        optional_non_trivial.value( ).is_destructed = &is_destructed;
    }
    EXPECT_TRUE( is_destructed );
}

TEST( TEST_NAME, operator_eq_copy_value_throwable_type_to_empty )
{
    const ThrowableTrivial throwable_trivial( false );
    optional< ThrowableTrivial > optional_throwable_trivial;
    EXPECT_THROW( optional_throwable_trivial = throwable_trivial, ThrowableTrivial::Exception );
    EXPECT_FALSE( optional_throwable_trivial );

    const ThrowableNonTrivial throwable_non_trivial( false );
    optional< ThrowableNonTrivial > optional_throwable_non_trivial;
    EXPECT_THROW( optional_throwable_non_trivial = throwable_non_trivial,
                  ThrowableNonTrivial::Exception );
    EXPECT_FALSE( optional_throwable_non_trivial );
}

TEST( TEST_NAME, operator_eq_move_value_trivially_destructable_type )
{
    optional< int > optional_int;
    optional_int = std::move( 1 );
    EXPECT_TRUE( optional_int );
    EXPECT_EQ( 1, optional_int.value( ) );
}

TEST( TEST_NAME, operator_eq_move_value_non_trivially_destructable_type )
{
    bool is_destructed = false;
    {
        optional< NonTrivial > optional_non_trivial;
        optional_non_trivial = NonTrivial( 100, "test 100" );
        // Important. Move constructor DO NOT erase src optional, it moves value instead without
        // its destruction
        EXPECT_TRUE( optional_non_trivial );
        EXPECT_EQ( 100, optional_non_trivial.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial.value( ).string_field );
        optional_non_trivial.value( ).is_destructed = &is_destructed;
        EXPECT_THAT( optional_non_trivial.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedWithMoveCtor ) );
    }
    EXPECT_TRUE( is_destructed );
}

TEST( TEST_NAME, operator_eq_move_value_throwable_type )
{
    optional< ThrowableTrivial > optional_throwable_trivial;
    EXPECT_THROW( optional_throwable_trivial = ThrowableTrivial( false ),
                  ThrowableTrivial::Exception );
    EXPECT_FALSE( optional_throwable_trivial );

    optional< ThrowableNonTrivial > optional_throwable_non_trivial;
    EXPECT_THROW( optional_throwable_non_trivial = ThrowableNonTrivial( false ),
                  ThrowableNonTrivial::Exception );
    EXPECT_FALSE( optional_throwable_non_trivial );
}

TEST( TEST_NAME, operator_eq_copy_optional_trivially_destructable_type_engaged_to_empty )
{
    optional< int > optional_int_src( in_place, 1 );
    optional< int > optional_int_dst;
    optional_int_dst = optional_int_src;
    EXPECT_TRUE( optional_int_src );
    EXPECT_EQ( 1, optional_int_src.value( ) );
    EXPECT_TRUE( optional_int_dst );
    EXPECT_EQ( 1, optional_int_dst.value( ) );
}

TEST( TEST_NAME, operator_eq_copy_optional_trivially_destructable_type_engaged_to_engaged )
{
    optional< int > optional_int_src( in_place, 1 );
    optional< int > optional_int_dst( in_place, 2 );
    optional_int_dst = optional_int_src;
    EXPECT_TRUE( optional_int_src );
    EXPECT_EQ( 1, optional_int_src.value( ) );
    EXPECT_TRUE( optional_int_dst );
    EXPECT_EQ( 1, optional_int_dst.value( ) );
}

TEST( TEST_NAME, operator_eq_copy_optional_trivially_destructable_type_empty_to_engaged )
{
    optional< int > optional_int_src;
    optional< int > optional_int_dst( in_place, 2 );
    optional_int_dst = optional_int_src;
    EXPECT_FALSE( optional_int_src );
    EXPECT_FALSE( optional_int_dst );
}

TEST( TEST_NAME, operator_eq_copy_optional_trivially_destructable_type_empty_to_empty )
{
    optional< int > optional_int_src;
    optional< int > optional_int_dst;
    optional_int_dst = optional_int_src;
    EXPECT_FALSE( optional_int_src );
    EXPECT_FALSE( optional_int_dst );
}

TEST( TEST_NAME, operator_eq_copy_optional_non_trivially_destructable_type_engaged_to_empty )
{
    bool is_destructed_src = false;
    bool is_destructed_dst = false;
    {
        optional< NonTrivial > optional_non_trivial_src( in_place, 100, "test 100" );
        optional< NonTrivial > optional_non_trivial_dst;
        optional_non_trivial_dst = optional_non_trivial_src;
        EXPECT_TRUE( optional_non_trivial_src );
        EXPECT_EQ( 100, optional_non_trivial_src.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial_src.value( ).string_field );
        optional_non_trivial_src.value( ).is_destructed = &is_destructed_src;
        EXPECT_THAT( optional_non_trivial_src.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedInPlace ) );
        EXPECT_TRUE( optional_non_trivial_dst );
        EXPECT_EQ( 100, optional_non_trivial_dst.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial_dst.value( ).string_field );
        optional_non_trivial_dst.value( ).is_destructed = &is_destructed_dst;
        EXPECT_THAT( optional_non_trivial_dst.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedWithCopyCtor ) );
    }
    EXPECT_TRUE( is_destructed_src );
    EXPECT_TRUE( is_destructed_dst );
}

TEST( TEST_NAME, operator_eq_copy_optional_non_trivially_destructable_type_engaged_to_engaged )
{
    bool is_destructed_dst = false;
    {
        optional< NonTrivial > optional_non_trivial_src( in_place, 100, "test 100" );
        optional< NonTrivial > optional_non_trivial_dst( in_place, 200, "test 200" );

        optional_non_trivial_dst.value( ).is_destructed = &is_destructed_dst;
        optional_non_trivial_dst = optional_non_trivial_src;
        EXPECT_FALSE( is_destructed_dst );
        EXPECT_TRUE( optional_non_trivial_dst );
        EXPECT_EQ( 100, optional_non_trivial_dst.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial_dst.value( ).string_field );
        optional_non_trivial_dst.value( ).is_destructed = &is_destructed_dst;
        EXPECT_THAT( optional_non_trivial_dst.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedInPlace,
                                  NonTrivial::AssignAction::CopiedWithOperatorEq ) );
    }
    EXPECT_TRUE( is_destructed_dst );
}

TEST( TEST_NAME, operator_eq_copy_optional_non_trivially_destructable_type_empty_to_engaged )
{
    bool is_destructed_dst = false;

    optional< NonTrivial > optional_non_trivial_src;
    optional< NonTrivial > optional_non_trivial_dst( in_place, 200, "test 200" );

    optional_non_trivial_dst.value( ).is_destructed = &is_destructed_dst;
    optional_non_trivial_dst = optional_non_trivial_src;
    EXPECT_TRUE( is_destructed_dst );
    EXPECT_FALSE( optional_non_trivial_dst );
}

TEST( TEST_NAME, operator_eq_copy_optional_non_trivially_destructable_type_empty_to_empty )
{
    optional< NonTrivial > optional_non_trivial_src;
    optional< NonTrivial > optional_non_trivial_dst;
    optional_non_trivial_dst = optional_non_trivial_src;
    EXPECT_FALSE( optional_non_trivial_dst );
}

TEST( TEST_NAME, operator_eq_move_optional_trivially_destructable_type )
{
    optional< int > optional_int_src( in_place, 1 );
    optional< int > optional_int_dst;
    optional_int_dst = std::move( optional_int_src );
    EXPECT_TRUE( optional_int_src );
    EXPECT_EQ( 1, optional_int_src.value( ) );
    EXPECT_TRUE( optional_int_dst );
    EXPECT_EQ( 1, optional_int_dst.value( ) );
}

TEST( TEST_NAME, operator_eq_move_optional_trivially_destructable_type_engaged_to_empty )
{
    optional< int > optional_int_src( in_place, 1 );
    optional< int > optional_int_dst;
    optional_int_dst = std::move( optional_int_src );
    EXPECT_TRUE( optional_int_src );
    EXPECT_EQ( 1, optional_int_src.value( ) );
    EXPECT_TRUE( optional_int_dst );
    EXPECT_EQ( 1, optional_int_dst.value( ) );
}

TEST( TEST_NAME, operator_eq_move_optional_trivially_destructable_type_engaged_to_engaged )
{
    optional< int > optional_int_src( in_place, 1 );
    optional< int > optional_int_dst( in_place, 2 );
    optional_int_dst = std::move( optional_int_src );
    EXPECT_TRUE( optional_int_src );
    EXPECT_EQ( 1, optional_int_src.value( ) );
    EXPECT_TRUE( optional_int_dst );
    EXPECT_EQ( 1, optional_int_dst.value( ) );
}

TEST( TEST_NAME, operator_eq_move_optional_trivially_destructable_type_empty_to_engaged )
{
    optional< int > optional_int_src;
    optional< int > optional_int_dst( in_place, 2 );
    optional_int_dst = std::move( optional_int_src );
    EXPECT_FALSE( optional_int_src );
    EXPECT_FALSE( optional_int_dst );
}

TEST( TEST_NAME, operator_eq_move_optional_trivially_destructable_type_empty_to_empty )
{
    optional< int > optional_int_src;
    optional< int > optional_int_dst;
    optional_int_dst = std::move( optional_int_src );
    EXPECT_FALSE( optional_int_src );
    EXPECT_FALSE( optional_int_dst );
}

TEST( TEST_NAME, operator_eq_move_optional_non_trivially_destructable_type_engaged_to_empty )
{
    bool is_destructed_src = false;
    bool is_destructed_dst = false;
    {
        optional< NonTrivial > optional_non_trivial_src( in_place, 100, "test 100" );
        optional< NonTrivial > optional_non_trivial_dst;
        optional_non_trivial_dst = std::move( optional_non_trivial_src );
        // Important. Move constructor DO NOT erase src optional, it moves value instead without
        // its destruction
        EXPECT_TRUE( optional_non_trivial_src );
        EXPECT_EQ( 100, optional_non_trivial_src.value( ).int_field );
        EXPECT_TRUE( optional_non_trivial_src.value( ).string_field.empty( ) );
        optional_non_trivial_src.value( ).is_destructed = &is_destructed_src;
        EXPECT_THAT( optional_non_trivial_src.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedInPlace ) );
        EXPECT_TRUE( optional_non_trivial_dst );
        EXPECT_EQ( 100, optional_non_trivial_dst.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial_dst.value( ).string_field );
        optional_non_trivial_dst.value( ).is_destructed = &is_destructed_dst;
        EXPECT_THAT( optional_non_trivial_dst.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedWithMoveCtor ) );
    }
    EXPECT_TRUE( is_destructed_src );
    EXPECT_TRUE( is_destructed_dst );
}

TEST( TEST_NAME, operator_eq_move_optional_non_trivially_destructable_type_engaged_to_engaged )
{
    bool is_destructed_src = false;
    bool is_destructed_dst = false;
    {
        optional< NonTrivial > optional_non_trivial_src( in_place, 100, "test 100" );
        optional< NonTrivial > optional_non_trivial_dst( in_place, 200, "test 200" );
        optional_non_trivial_dst = std::move( optional_non_trivial_src );
        // Important. Move constructor DO NOT erase src optional, it moves value instead without
        // its destruction
        EXPECT_TRUE( optional_non_trivial_src );
        EXPECT_EQ( 100, optional_non_trivial_src.value( ).int_field );
        EXPECT_TRUE( optional_non_trivial_src.value( ).string_field.empty( ) );
        optional_non_trivial_src.value( ).is_destructed = &is_destructed_src;
        EXPECT_THAT( optional_non_trivial_src.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedInPlace ) );
        EXPECT_TRUE( optional_non_trivial_dst );
        EXPECT_EQ( 100, optional_non_trivial_dst.value( ).int_field );
        EXPECT_EQ( "test 100", optional_non_trivial_dst.value( ).string_field );
        optional_non_trivial_dst.value( ).is_destructed = &is_destructed_dst;
        EXPECT_THAT( optional_non_trivial_dst.value( ).assign_actions,
                     ElementsAre( NonTrivial::AssignAction::CreatedInPlace,
                                  NonTrivial::AssignAction::CopiedWithMoveOperatorEq ) );
    }
    EXPECT_TRUE( is_destructed_src );
    EXPECT_TRUE( is_destructed_dst );
}

TEST( TEST_NAME, operator_eq_move_optional_non_trivially_destructable_type_empty_to_engaged )
{
    optional< NonTrivial > optional_non_trivial_src;
    optional< NonTrivial > optional_non_trivial_dst( in_place, 200, "test 200" );

    bool is_destructed_dst = false;
    optional_non_trivial_dst.value( ).is_destructed = &is_destructed_dst;
    optional_non_trivial_dst = std::move( optional_non_trivial_src );
    EXPECT_TRUE( is_destructed_dst );

    EXPECT_FALSE( optional_non_trivial_src );
    EXPECT_FALSE( optional_non_trivial_dst );
}

TEST( TEST_NAME, operator_eq_move_optional_non_trivially_destructable_type_empty_to_empty )
{
    optional< NonTrivial > optional_non_trivial_src;
    optional< NonTrivial > optional_non_trivial_dst;

    optional_non_trivial_dst = std::move( optional_non_trivial_src );

    EXPECT_FALSE( optional_non_trivial_src );
    EXPECT_FALSE( optional_non_trivial_dst );
}

TEST( TEST_NAME, operator_eq_nulloptional_trivially_destructable_type )
{
    optional< int > optional_int_null;
    optional_int_null = nullopt;
    EXPECT_FALSE( optional_int_null );

    optional< int > optional_int( 1 );
    optional_int = nullopt;
    EXPECT_FALSE( optional_int );
}

TEST( TEST_NAME, operator_eq_nulloptional_non_trivially_destructable_type )
{
    optional< NonTrivial > optional_non_trivial_null;
    optional_non_trivial_null = nullopt;
    EXPECT_FALSE( optional_non_trivial_null );

    bool is_destructed = false;
    optional< NonTrivial > optional_non_trivial( in_place, 100, "test 100" );
    optional_non_trivial.value( ).is_destructed = &is_destructed;
    optional_non_trivial = nullopt;
    EXPECT_TRUE( is_destructed );

    EXPECT_FALSE( optional_non_trivial );
}

TEST( TEST_NAME, value_or )
{
    // value_or(ReturnType&& return_value) const&
    optional< int > optional_int_null;
    EXPECT_EQ( 2, optional_int_null.value_or( 2 ) );

    optional< int > optional_int( 1 );
    EXPECT_EQ( 1, optional_int.value_or( 2 ) );

    optional< NonTrivial > optional_non_trivial_null;
    EXPECT_THAT( optional_non_trivial_null.value_or( NonTrivial( 200, "test 200" ) ),
                 AllOf( Field( &NonTrivial::int_field, Eq( 200 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 200" ) ) ) );

    optional< NonTrivial > optional_non_trivial( in_place, 100, "test 100" );
    EXPECT_THAT( optional_non_trivial.value_or( NonTrivial( 200, "test 200" ) ),
                 AllOf( Field( &NonTrivial::int_field, Eq( 100 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 100" ) ) ) );

    EXPECT_THAT( optional_non_trivial.value_or( NonTrivial( 200, "test 200" ) ).assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithCopyCtor ) );
    EXPECT_THAT( optional_non_trivial_null.value_or( NonTrivial( 200, "test 200" ) ).assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithMoveCtor ) );

    // value_or(ReturnType&& return_value) &&
    EXPECT_EQ( 2, optional< int >( ).value_or( 2 ) );
    EXPECT_EQ( 1, optional< int >( 1 ).value_or( 2 ) );
    EXPECT_THAT( optional< NonTrivial >( ).value_or( NonTrivial( 200, "test 200" ) ),
                 AllOf( Field( &NonTrivial::int_field, Eq( 200 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 200" ) ) ) );
    EXPECT_THAT( optional< NonTrivial >( in_place, 100, "test 100" )
                     .value_or( NonTrivial( 200, "test 200" ) ),
                 AllOf( Field( &NonTrivial::int_field, Eq( 100 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 100" ) ) ) );
    EXPECT_THAT( optional< NonTrivial >( ).value_or( NonTrivial( 200, "test 200" ) ).assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithMoveCtor ) );
    EXPECT_THAT( optional< NonTrivial >( in_place, 100, "test 100" )
                     .value_or( NonTrivial( 200, "test 200" ) )
                     .assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithMoveCtor ) );
}

TEST( TEST_NAME, value )
{
    // value_type const& value() const &
    const optional< int > optional_int_null_const;
    EXPECT_THROW( optional_int_null_const.value( ), bad_optional_access );

    const optional< int > optional_int_const( 1 );
    EXPECT_EQ( 1, optional_int_const.value( ) );

    const optional< NonTrivial > optional_non_trivial_null_const;
    EXPECT_THROW( optional_non_trivial_null_const.value( ), bad_optional_access );

    const optional< NonTrivial > optional_non_trivial_const( in_place, 100, "test 100" );
    EXPECT_THAT( optional_non_trivial_const.value( ),
                 AllOf( Field( &NonTrivial::int_field, Eq( 100 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 100" ) ) ) );

    NonTrivial non_trivial_created_copy_const = optional_non_trivial_const.value( );
    EXPECT_THAT( non_trivial_created_copy_const.assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithCopyCtor ) );

    // value_type& value() &
    optional< int > optional_int_null;
    EXPECT_THROW( optional_int_null.value( ), bad_optional_access );

    optional< int > optional_int( 1 );
    EXPECT_EQ( 1, optional_int.value( ) );

    optional< NonTrivial > optional_non_trivial_null;
    EXPECT_THROW( optional_non_trivial_null.value( ), bad_optional_access );

    optional< NonTrivial > optional_non_trivial( in_place, 100, "test 100" );
    EXPECT_THAT( optional_non_trivial.value( ),
                 AllOf( Field( &NonTrivial::int_field, Eq( 100 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 100" ) ) ) );

    NonTrivial non_trivial_created_copy = optional_non_trivial.value( );
    EXPECT_THAT( non_trivial_created_copy.assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithCopyCtor ) );

    // value_type const&& value() const &&
    EXPECT_THROW( static_cast< const optional< int > >( optional< int >( ) ).value( ),
                  bad_optional_access );

    EXPECT_EQ( 1, static_cast< const optional< int > >( optional< int >( 1 ) ).value( ) );

    EXPECT_THROW( static_cast< const optional< NonTrivial > >( optional< NonTrivial >( ) ).value( ),
                  bad_optional_access );

    EXPECT_THAT( static_cast< const optional< NonTrivial > >(
                     optional< NonTrivial >( in_place, 100, "test 100" ) )
                     .value( ),
                 AllOf( Field( &NonTrivial::int_field, Eq( 100 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 100" ) ) ) );
    NonTrivial non_trivial_created_rval_constref
        = static_cast< const optional< NonTrivial > >(
              optional< NonTrivial >( in_place, 100, "test 100" ) )
              .value( );
    EXPECT_THAT( non_trivial_created_rval_constref.assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithConstRValueRefCtor ) );

    // value_type && value() &&
    EXPECT_THROW( optional< int >( ).value( ), bad_optional_access );

    EXPECT_THROW( optional< NonTrivial >( ).value( ), bad_optional_access );

    EXPECT_EQ( 1, optional< int >( 1 ).value( ) );

    EXPECT_THAT( optional< NonTrivial >( in_place, 100, "test 100" ).value( ),
                 AllOf( Field( &NonTrivial::int_field, Eq( 100 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 100" ) ) ) );
    NonTrivial non_trivial_moved_rval_ref
        = optional< NonTrivial >( in_place, 100, "test 100" ).value( );
    EXPECT_THAT( non_trivial_moved_rval_ref.assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithMoveCtor ) );
}

TEST( TEST_NAME, dereference )
{
    // const value_type& operator*() const &
    const optional< int > optional_int_const( 1 );
    EXPECT_EQ( 1, *optional_int_const );

    const optional< NonTrivial > optional_non_trivial_const( in_place, 100, "test 100" );
    EXPECT_THAT( *optional_non_trivial_const,
                 AllOf( Field( &NonTrivial::int_field, Eq( 100 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 100" ) ) ) );

    NonTrivial non_trivial_created_copy_const = *optional_non_trivial_const;
    EXPECT_THAT( non_trivial_created_copy_const.assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithCopyCtor ) );
    constexpr const optional< int > optional_int_const_constexpr( 1 );
    static_assert( 1 == *optional_int_const_constexpr, "const value_type& operator*() const &" );

    // value_type& operator*() &
    optional< int > optional_int( 1 );
    EXPECT_EQ( 1, *optional_int );

    optional< NonTrivial > optional_non_trivial( in_place, 100, "test 100" );
    EXPECT_THAT( *optional_non_trivial,
                 AllOf( Field( &NonTrivial::int_field, Eq( 100 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 100" ) ) ) );

    NonTrivial non_trivial_created_copy = *optional_non_trivial;
    EXPECT_THAT( non_trivial_created_copy.assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithCopyCtor ) );

    constexpr optional< int > optional_int_constexpr( 1 );
    static_assert( 1 == *optional_int_constexpr, "constexpr value_type& operator*() &" );

    // const value_type&& operator*() const &&
    EXPECT_EQ( 1, *static_cast< const optional< int > >( optional< int >( 1 ) ) );

    EXPECT_THAT( *static_cast< const optional< NonTrivial > >(
                     optional< NonTrivial >( in_place, 100, "test 100" ) ),
                 AllOf( Field( &NonTrivial::int_field, Eq( 100 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 100" ) ) ) );
    NonTrivial non_trivial_created_rval_constref = *static_cast< const optional< NonTrivial > >(
        optional< NonTrivial >( in_place, 100, "test 100" ) );
    EXPECT_THAT( non_trivial_created_rval_constref.assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithConstRValueRefCtor ) );

    // value_type&& operator*() &&
    EXPECT_EQ( 1, *optional< int >( 1 ) );

    EXPECT_THAT( *optional< NonTrivial >( in_place, 100, "test 100" ),
                 AllOf( Field( &NonTrivial::int_field, Eq( 100 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 100" ) ) ) );
    NonTrivial non_trivial_moved_rval_ref = *optional< NonTrivial >( in_place, 100, "test 100" );
    EXPECT_THAT( non_trivial_moved_rval_ref.assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithMoveCtor ) );
}

TEST( TEST_NAME, arrow )
{
    const optional< NonTrivial > optional_non_trivial_const( in_place, 100, "test 100" );
    EXPECT_EQ( 100, optional_non_trivial_const->int_field );
    EXPECT_EQ( "test 100", optional_non_trivial_const->string_field );

    optional< NonTrivial > optional_non_trivial( in_place, 100, "test 100" );
    optional_non_trivial->int_field = 1;
    optional_non_trivial->string_field = "test 1";
    EXPECT_THAT( *optional_non_trivial,
                 AllOf( Field( &NonTrivial::int_field, Eq( 1 ) ),
                        Field( &NonTrivial::string_field, Eq( "test 1" ) ) ) );

    const optional< TypeWithAddressOf > optional_type_with_address_of_const( in_place );
    EXPECT_EQ( 100, optional_type_with_address_of_const->int_field );
    EXPECT_EQ( "test 100", optional_type_with_address_of_const->string_field );

    optional< TypeWithAddressOf > optional_type_with_address_of( in_place );
    optional_type_with_address_of->int_field = 1;
    optional_type_with_address_of->string_field = "test 1";
    EXPECT_EQ( 1, optional_type_with_address_of->int_field );
    EXPECT_EQ( "test 1", optional_type_with_address_of->string_field );
}

TEST( TEST_NAME, swap_trivially_trivial_destructable_empty_with_engaged )
{
    optional< int > optional_null;
    optional< int > optional_int = 1;

    swap( optional_null, optional_int );

    EXPECT_TRUE( optional_null );
    EXPECT_TRUE( *optional_null == 1 );
    EXPECT_TRUE( !optional_int );
}

TEST( TEST_NAME, swap_trivially_trivial_destructable_engaged_with_engaged )
{
    optional< int > optional_int_1 = 1;
    optional< int > optional_int_2 = 2;

    swap( optional_int_1, optional_int_2 );

    EXPECT_TRUE( *optional_int_2 == 1 );
    EXPECT_TRUE( *optional_int_1 == 2 );
}

TEST( TEST_NAME, swap_trivially_trivial_destructable_engaged_with_empty )
{
    optional< int > optional_int = 1;
    optional< int > optional_null;

    swap( optional_int, optional_null );

    EXPECT_TRUE( *optional_null == 1 );
    EXPECT_TRUE( !optional_int );
}

TEST( TEST_NAME, swap_trivially_trivial_destructable_empty_with_empty )
{
    optional< int > optional_null_1;
    optional< int > optional_null_2;

    swap( optional_null_1, optional_null_2 );

    EXPECT_TRUE( !optional_null_1 );
    EXPECT_TRUE( !optional_null_2 );
}

TEST( TEST_NAME, swap_non_trivially_trivial_destructable_empty_with_engaged )
{
    optional< NonTrivial > optional_null;
    optional< NonTrivial > optional_non_trivial( in_place, 100, "test 100" );

    swap( optional_null, optional_non_trivial );

    ASSERT_TRUE( optional_null );
    EXPECT_TRUE( *optional_null == NonTrivial( 100, "test 100" ) );
    EXPECT_TRUE( !optional_non_trivial );

    EXPECT_THAT( optional_null->assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithMoveCtor ) );
}

TEST( TEST_NAME, swap_non_trivially_trivial_destructable_engaged_with_engaged )
{
    optional< NonTrivial > optional_non_trivial( in_place, 100, "test 100" );
    optional< NonTrivial > optional_null;

    swap( optional_non_trivial, optional_null );

    ASSERT_TRUE( optional_null );
    EXPECT_TRUE( *optional_null == NonTrivial( 100, "test 100" ) );
    EXPECT_TRUE( !optional_non_trivial );

    EXPECT_THAT( optional_null->assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedWithMoveCtor ) );
}

TEST( TEST_NAME, swap_non_trivially_trivial_destructable_engaged_with_empty )
{
    optional< NonTrivial > optional_non_trivial_100( in_place, 100, "test 100" );
    optional< NonTrivial > optional_non_trivial_200( in_place, 200, "test 200" );

    swap( optional_non_trivial_100, optional_non_trivial_200 );

    EXPECT_TRUE( *optional_non_trivial_200 == NonTrivial( 100, "test 100" ) );
    EXPECT_TRUE( *optional_non_trivial_100 == NonTrivial( 200, "test 200" ) );

    EXPECT_THAT( optional_non_trivial_100->assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedInPlace,
                              NonTrivial::AssignAction::CopiedWithMoveOperatorEq ) );
    EXPECT_THAT( optional_non_trivial_200->assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedInPlace,
                              NonTrivial::AssignAction::CopiedWithMoveOperatorEq ) );
}

TEST( TEST_NAME, swap_non_trivially_trivial_destructable_empty_with_empty )
{
    optional< NonTrivial > optional_null_1;
    optional< NonTrivial > optional_null_2;

    swap( optional_null_1, optional_null_2 );

    EXPECT_TRUE( !optional_null_1 );
    EXPECT_TRUE( !optional_null_2 );
}

TEST( TEST_NAME, emplace )
{
    optional< int > optional_int;
    optional_int.emplace( 1 );
    EXPECT_EQ( 1, optional_int.value( ) );

    optional< NonTrivial > optional_non_trivial;
    optional_non_trivial.emplace( 100, "test 100" );
    EXPECT_EQ( 100, optional_non_trivial.value( ).int_field );
    EXPECT_EQ( "test 100", optional_non_trivial.value( ).string_field );
    EXPECT_THAT( optional_non_trivial.value( ).assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedInPlace ) );
    bool is_destructed = false;
    optional_non_trivial.value( ).is_destructed = &is_destructed;

    optional_non_trivial.emplace( 200, "test 200" );
    EXPECT_TRUE( is_destructed );
    EXPECT_EQ( 200, optional_non_trivial.value( ).int_field );
    EXPECT_EQ( "test 200", optional_non_trivial.value( ).string_field );
    EXPECT_THAT( optional_non_trivial.value( ).assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedInPlace ) );
    is_destructed = false;
    optional_non_trivial.value( ).is_destructed = &is_destructed;

    optional_non_trivial.emplace( {1, 10, 100}, "test 111" );
    EXPECT_TRUE( is_destructed );
    EXPECT_EQ( 111, optional_non_trivial.value( ).int_field );
    EXPECT_EQ( "test 111", optional_non_trivial.value( ).string_field );
    EXPECT_THAT( optional_non_trivial.value( ).assign_actions,
                 ElementsAre( NonTrivial::AssignAction::CreatedInPlace ) );
    is_destructed = false;
    optional_non_trivial.value( ).is_destructed = &is_destructed;

    optional_non_trivial = nullopt;
    EXPECT_TRUE( is_destructed );

    optional< ThrowableTrivial > optional_throwable_trivial;
    EXPECT_THROW( optional_throwable_trivial.emplace( true ), ThrowableTrivial::Exception );
    EXPECT_FALSE( optional_throwable_trivial );

    EXPECT_THROW( optional_throwable_trivial.emplace( {1, 10, 100}, "" ),
                  ThrowableTrivial::Exception );
    EXPECT_FALSE( optional_throwable_trivial );

    optional_throwable_trivial.emplace( false );
    EXPECT_THROW( optional_throwable_trivial.emplace( true ), ThrowableTrivial::Exception );
    EXPECT_FALSE( optional_throwable_trivial );

    optional_throwable_trivial.emplace( false );
    EXPECT_THROW( optional_throwable_trivial.emplace( {1, 10, 100}, "" ),
                  ThrowableTrivial::Exception );
    EXPECT_FALSE( optional_throwable_trivial );

    optional< ThrowableNonTrivial > optional_throwable_non_trivial;
    EXPECT_THROW( optional_throwable_non_trivial.emplace( true ), ThrowableNonTrivial::Exception );
    EXPECT_FALSE( optional_throwable_non_trivial );

    EXPECT_THROW( optional_throwable_non_trivial.emplace( {1, 10, 100}, "" ),
                  ThrowableNonTrivial::Exception );
    EXPECT_FALSE( optional_throwable_non_trivial );

    optional_throwable_non_trivial.emplace( false );
    EXPECT_THROW( optional_throwable_non_trivial.emplace( true ), ThrowableNonTrivial::Exception );
    EXPECT_FALSE( optional_throwable_non_trivial );

    optional_throwable_non_trivial.emplace( false );
    EXPECT_THROW( optional_throwable_non_trivial.emplace( {1, 10, 100}, "" ),
                  ThrowableNonTrivial::Exception );
    EXPECT_FALSE( optional_throwable_non_trivial );
}

TEST( TEST_NAME, hash )
{
    lorem_ipsum::test::hash< std::string > string_hash;
    lorem_ipsum::test::hash< optional< std::string > > optional_hash;
    EXPECT_EQ( string_hash( "test" ), optional_hash( optional< std::string >( "test" ) ) );
    EXPECT_NE( string_hash( "" ), optional_hash( optional< std::string >( nullopt ) ) );
}

}  // test

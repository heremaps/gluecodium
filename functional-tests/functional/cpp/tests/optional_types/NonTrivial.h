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

#pragma once

#include <ostream>
#include <numeric>
#include <set>
#include <string>

namespace test
{
struct NonTrivial
{
    enum class AssignAction
    {
        TriviallyCreated,
        CreatedInPlace,
        CreatedWithCopyCtor,
        CreatedWithConstRValueRefCtor,
        CreatedWithMoveCtor,
        CopiedWithOperatorEq,
        CopiedWithMoveOperatorEq,
        CopiedWithConstRValueRefOperatorEq
    };

    NonTrivial( ) noexcept
    {
        assign_actions.insert( AssignAction::TriviallyCreated );
    }

    NonTrivial( std::initializer_list< int > ints, std::string string_field ) noexcept
        : int_field( std::accumulate( ints.begin( ), ints.end( ), 0 ) )
        , string_field( string_field )
    {
        assign_actions.insert( AssignAction::CreatedInPlace );
    }

    NonTrivial( int int_field, std::string string_field ) noexcept
        : int_field( int_field )
        , string_field( string_field )
    {
        assign_actions.insert( AssignAction::CreatedInPlace );
    }

    NonTrivial( const NonTrivial& other ) noexcept
        : int_field( other.int_field )
        , string_field( other.string_field )
    {
        assign_actions.insert( AssignAction::CreatedWithCopyCtor );
    }

    NonTrivial( NonTrivial&& other ) noexcept
        : int_field( other.int_field )
        , string_field( std::move( other.string_field ) )
    {
        assign_actions.insert( AssignAction::CreatedWithMoveCtor );
    }

    NonTrivial( const NonTrivial&& other ) noexcept
        : int_field( other.int_field )
        , string_field( other.string_field )
    {
        int_field = other.int_field;
        string_field = other.string_field;
        assign_actions.insert( AssignAction::CreatedWithConstRValueRefCtor );
    }

    NonTrivial&
    operator=( const NonTrivial& other ) noexcept
    {
        int_field = other.int_field;
        string_field = other.string_field;
        assign_actions.insert( AssignAction::CopiedWithOperatorEq );
        return *this;
    }

    NonTrivial&
    operator=( NonTrivial&& other ) noexcept
    {
        int_field = other.int_field;
        string_field = std::move( other.string_field );
        assign_actions.insert( AssignAction::CopiedWithMoveOperatorEq );
        return *this;
    }

    NonTrivial&
    operator=( const NonTrivial&& other ) noexcept
    {
        int_field = other.int_field;
        string_field = other.string_field;
        assign_actions.insert( AssignAction::CopiedWithConstRValueRefOperatorEq );
        return *this;
    }

    ~NonTrivial( ) noexcept
    {
        if ( is_destructed )
        {
            *is_destructed = true;
        }
    }

    bool
    operator<( const NonTrivial& other ) const noexcept
    {
        return int_field != other.int_field ? int_field < other.int_field
                                            : string_field < other.string_field;
    }

    bool
    operator==( const NonTrivial& other ) const noexcept
    {
        return int_field == other.int_field && string_field == other.string_field;
    }

    std::set< AssignAction > assign_actions;
    bool* is_destructed = nullptr;

    int int_field = 0;
    std::string string_field;
};

inline void
PrintTo( const NonTrivial::AssignAction& assign_action, std::ostream* out )
{
    switch ( assign_action )
    {
    case NonTrivial::AssignAction::TriviallyCreated:
        *out << "TriviallyCreated";
        break;
    case NonTrivial::AssignAction::CreatedInPlace:
        *out << "CreatedInPlace";
        break;
    case NonTrivial::AssignAction::CreatedWithCopyCtor:
        *out << "CreatedWithCopyCtor";
        break;
    case NonTrivial::AssignAction::CreatedWithConstRValueRefCtor:
        *out << "CreatedWithConstRValueRefCtor";
        break;
    case NonTrivial::AssignAction::CreatedWithMoveCtor:
        *out << "CreatedWithMoveCtor";
        break;
    case NonTrivial::AssignAction::CopiedWithOperatorEq:
        *out << "CopiedWithOperatorEq";
        break;
    case NonTrivial::AssignAction::CopiedWithMoveOperatorEq:
        *out << "CopiedWithMoveOperatorEq";
        break;
    case NonTrivial::AssignAction::CopiedWithConstRValueRefOperatorEq:
        *out << "CopiedWithConstRValueRefOperatorEq";
        break;
    }
}

inline void
PrintTo( const NonTrivial& foo, std::ostream* out )
{
    *out << "int_field=" << foo.int_field << ",string_field=" << foo.string_field
         << ",assign_actions=";

    const char* comma = "";
    for ( auto assign_action : foo.assign_actions )
    {
        *out << comma;
        comma = ",";
        PrintTo( assign_action, out );
    }
}
}
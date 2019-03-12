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

#include "GrandchildClassImpl.h"

namespace test
{
std::shared_ptr< GrandchildClass >
GrandchildClass::create_grandchild_class( )
{
    return std::make_shared< GrandchildClassImpl >( );
}

GrandchildClassImpl::GrandchildClassImpl( )
{
    set_lucky_number( 42 );
}

std::shared_ptr< ParentInterface >
GrandchildClassImpl::cast_to_parent( )
{
    return ChildClassImpl::cast_to_parent( );
}

std::string
GrandchildClassImpl::get_name( )
{
    return "John F. Kimberly";
}

int32_t
GrandchildClassImpl::get_lucky_number( ) const
{
    return ChildClassImpl::get_lucky_number( );
}

void
GrandchildClassImpl::set_lucky_number( const int32_t number )
{
    ChildClassImpl::set_lucky_number( number );
}

void
GrandchildClassImpl::do_something( const std::string& value )
{
    // Do nothing
}

void
GrandchildClassImpl::do_something_to_child_class(
    const ::std::shared_ptr<::test::ChildClass >& input )
{
    // Do nothing
}

}  // namespace test

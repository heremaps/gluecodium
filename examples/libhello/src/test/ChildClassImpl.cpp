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

#include "ChildClassImpl.h"

namespace test
{
std::shared_ptr< ChildClass >
ChildClass::create_child_class( )
{
    return std::make_shared< ChildClassImpl >( );
}

ChildClassImpl::ChildClassImpl( )
    : m_lucky_number( 7 )
{
}

std::shared_ptr< ParentInterface >
ChildClassImpl::cast_to_parent( )
{
    return shared_from_this( );
}

std::string
ChildClassImpl::get_name( )
{
    return "Johnny";
}

int32_t
ChildClassImpl::get_lucky_number( ) const
{
    return m_lucky_number;
}

void
ChildClassImpl::set_lucky_number( const int32_t number )
{
    m_lucky_number = number;
}

void
ChildClassImpl::do_something_to_child_class( const ::std::shared_ptr<::test::ChildClass >& input )
{
    // Do nothing
}

}  // namespace test

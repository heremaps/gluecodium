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

#pragma once

#include "test/ChildClass.h"

namespace test
{
class ChildClassImpl : public ChildClass, public ::std::enable_shared_from_this< ChildClassImpl >
{
public:
    ChildClassImpl( );
    ~ChildClassImpl( ) = default;
    ::std::shared_ptr< ParentInterface > cast_to_parent( ) override;
    ::std::string get_name( ) override;
    int32_t get_lucky_number( ) const override;
    void set_lucky_number( const int32_t number ) override;
    void do_something_to_child_class(
        const ::std::shared_ptr<::test::ChildClass >& input ) override;

private:
    int32_t m_lucky_number;
};

}  // namespace test

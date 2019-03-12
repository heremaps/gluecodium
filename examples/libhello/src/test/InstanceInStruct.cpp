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

#include "test/InstanceInStruct.h"
#include <memory>

namespace test
{
class InstanceInStructImpl : public InstanceInStruct
{
public:
    ~InstanceInStructImpl( ) = default;

    virtual void
    set_string_value( const ::std::string& string_value )
    {
        m_value = string_value;
    }

    virtual ::std::string
    get_string_value( )
    {
        return m_value;
    }

private:
    std::string m_value;
};

std::shared_ptr< InstanceInStruct >
InstanceInStruct::create( )
{
    return std::make_shared< InstanceInStructImpl >( );
}

InstanceInStruct::SelfHolder
InstanceInStruct::create_in_struct( )
{
    return {std::make_shared< InstanceInStructImpl >( )};
}

InstanceInStruct::SelfHolder
InstanceInStruct::create_null_in_struct( )
{
    return {std::shared_ptr< InstanceInStructImpl >( )};
}

InstanceInStruct::NotNullSelfHolder
InstanceInStruct::create_in_not_null_struct( )
{
    return {std::make_shared< InstanceInStructImpl >( )};
}

InstanceInStruct::NotNullSelfHolder
InstanceInStruct::create_in_empty_not_null_struct( )
{
    return {std::shared_ptr< InstanceInStructImpl >( )};
}

}  // namespace test

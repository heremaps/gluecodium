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

#include "test/fooInterface.h"
#include "test/fooTypes.h"

namespace test
{

class SomeFooInterfaceImpl : public fooInterface {
public:
    SomeFooInterfaceImpl() = default;
    ~SomeFooInterfaceImpl() override = default;

    uint32_t GET_FOO_ATTRIBUTE(  ) const override {
        return m_foo_attribute;
    }

    void SET_FOO_ATTRIBUTE( const uint32_t value ) override {
        m_foo_attribute = value;
    }
private:
    uint32_t m_foo_attribute{};
};

fooTypes::fooStruct
fooInterface::FooMethod( const std::string& FooParameter )
{
    return fooTypes::fooStruct{FooParameter};
}

std::shared_ptr< fooInterface >
fooInterface::make( const std::string& makeParameter )
{
    return std::make_shared<SomeFooInterfaceImpl>();
}

fooTypes::fooStruct
fooTypes::fooStruct::create( const std::string& FooParameter )
{
    return {};
}

}

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

#include "test/EquatableInterface.h"
#include "test/PointerEquatableInterface.h"

namespace test
{
namespace {
class EquatableInterfaceImpl: public EquatableInterface {
public:
    EquatableInterfaceImpl(const std::string& name)
        : m_name(name)
    {}

    ~EquatableInterfaceImpl() = default;

    std::string get_name() const override {
        return m_name;
    }
private:
    std::string m_name;
};

class PointerEquatableInterfaceImpl: public PointerEquatableInterface {
public:
    ~PointerEquatableInterfaceImpl() = default;
};

static std::shared_ptr<PointerEquatableInterface> s_pointer_equal_instance;
}

std::shared_ptr<EquatableInterface>
EquatableInterface::create(const std::string& name) {
    return std::make_shared<EquatableInterfaceImpl>(name);
}

std::shared_ptr<PointerEquatableInterface>
PointerEquatableInterface::create_new() {
    s_pointer_equal_instance = std::make_shared<PointerEquatableInterfaceImpl>();
    return s_pointer_equal_instance;
}

std::shared_ptr<PointerEquatableInterface>
PointerEquatableInterface::return_last() {
    return s_pointer_equal_instance;
}

bool
EquatableInterface::are_equal( const EquatableInterface::AnotherEquatableStruct& lhs,
                               const EquatableInterface::AnotherEquatableStruct& rhs )
{
    return lhs == rhs;
}

bool
EquatableInterface::are_equal( const EquatableStruct& lhs, const EquatableStruct& rhs )
{
    return lhs == rhs;
}

bool
EquatableInterface::are_equal( const EquatableNullableStruct& lhs,
                               const EquatableNullableStruct& rhs )
{
    return lhs == rhs;
}

bool
PointerEquatableInterface::are_equal( const PointerEquatableInterface::EquatableStruct& lhs,
                                      const PointerEquatableInterface::EquatableStruct& rhs )
{
    return lhs == rhs;
}

bool
EquatableInterface::operator == ( const EquatableInterface& rhs ) {
    return get_name( ) == rhs.get_name( );
}

}  // namespace test

namespace std {
std::size_t
hash <::test::EquatableInterface>::operator( )( const ::test::EquatableInterface& t ) const {
    return 11 ^ std::hash<std::string>( )( t.get_name( ) );
}
}

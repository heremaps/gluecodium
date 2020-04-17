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

#include "test/EquatableClass.h"
#include "test/EquatableInterface.h"
#include "test/EquatableInterfaceFactory.h"
#include "test/PointerEquatableClass.h"

namespace test
{
namespace {
class EquatableClassImpl: public EquatableClass {
public:
    EquatableClassImpl(const std::string& name)
        : m_name(name)
    {}

    ~EquatableClassImpl() = default;

    std::string get_name() const override {
        return m_name;
    }
private:
    std::string m_name;
};

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

class PointerEquatableClassImpl: public PointerEquatableClass {
public:
    ~PointerEquatableClassImpl() = default;
};

static std::shared_ptr<PointerEquatableClass> s_pointer_equal_instance;
}

std::shared_ptr<EquatableClass>
EquatableClass::create(const std::string& name) {
    return std::make_shared<EquatableClassImpl>(name);
}

std::shared_ptr<PointerEquatableClass>
PointerEquatableClass::create_new() {
    s_pointer_equal_instance = std::make_shared<PointerEquatableClassImpl>();
    return s_pointer_equal_instance;
}

std::shared_ptr<PointerEquatableClass>
PointerEquatableClass::return_last() {
    return s_pointer_equal_instance;
}

bool
EquatableClass::are_equal( const EquatableClass::AnotherEquatableStruct& lhs,
                               const EquatableClass::AnotherEquatableStruct& rhs )
{
    return lhs == rhs;
}

bool
EquatableClass::are_equal( const EquatableStruct& lhs, const EquatableStruct& rhs )
{
    return lhs == rhs;
}

bool
EquatableClass::are_equal( const EquatableNullableStruct& lhs,
                               const EquatableNullableStruct& rhs )
{
    return lhs == rhs;
}

bool
PointerEquatableClass::are_equal( const PointerEquatableClass::EquatableStruct& lhs,
                                      const PointerEquatableClass::EquatableStruct& rhs )
{
    return lhs == rhs;
}

bool
PointerEquatableClass::are_equal( const PointerEquatableClass::OptionalEquatableStruct& lhs,
                                      const PointerEquatableClass::OptionalEquatableStruct& rhs )
{
    return lhs == rhs;
}

bool
EquatableClass::have_same_hash( const EquatableClass::AnotherEquatableStruct& lhs,
                                    const EquatableClass::AnotherEquatableStruct& rhs )
{
    auto hasher = lorem_ipsum::test::hash< EquatableClass::AnotherEquatableStruct >( );
    return hasher( lhs ) == hasher( rhs );
}

bool
EquatableClass::have_same_hash( const EquatableStruct& lhs, const EquatableStruct& rhs )
{
    auto hasher = lorem_ipsum::test::hash< EquatableStruct >( );
    return hasher( lhs ) == hasher( rhs );
}

bool
EquatableClass::have_same_hash( const EquatableNullableStruct& lhs,
                                    const EquatableNullableStruct& rhs )
{
    auto hasher = lorem_ipsum::test::hash< EquatableNullableStruct >( );
    return hasher( lhs ) == hasher( rhs );
}

bool
PointerEquatableClass::have_same_hash( const PointerEquatableClass::EquatableStruct& lhs,
                                           const PointerEquatableClass::EquatableStruct& rhs )
{
    auto hasher = lorem_ipsum::test::hash< PointerEquatableClass::EquatableStruct >( );
    return hasher( lhs ) == hasher( rhs );
}

bool
PointerEquatableClass::have_same_hash( const PointerEquatableClass::OptionalEquatableStruct& lhs,
                                           const PointerEquatableClass::OptionalEquatableStruct& rhs )
{
    auto hasher = lorem_ipsum::test::hash< PointerEquatableClass::OptionalEquatableStruct >( );
    return hasher( lhs ) == hasher( rhs );
}

bool
EquatableClass::operator == ( const EquatableClass& rhs ) {
    return get_name( ) == rhs.get_name( );
}

bool
EquatableInterface::operator==(const EquatableInterface& rhs) {
    return get_name() == rhs.get_name();
}

std::shared_ptr<EquatableInterface>
EquatableInterfaceFactory::create_equatable_interface(const std::string& name) {
    return std::make_shared<EquatableInterfaceImpl>(name);
}

}  // namespace test

std::size_t
lorem_ipsum::test::hash <::test::EquatableClass>::operator( )( const ::test::EquatableClass& t ) const {
    return 11 ^ std::hash<std::string>( )( t.get_name( ) );
}

std::size_t
lorem_ipsum::test::hash<::test::EquatableInterface>::operator()(const ::test::EquatableInterface& t) const {
    return 11 ^ std::hash<std::string>()(t.get_name());
}

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

#include "test/SomeEquatableClass.h"
#include "test/SomePointerEquatableClass.h"
#include "test/SimpleInterfaceOne.h"
#include "test/SetType.h"

namespace {
class SomeEquatableClassImpl: public test::SomeEquatableClass
{
public:
    SomeEquatableClassImpl(const std::string& id)
        : m_id(id)
    {
    }

    std::string get_id() const override {
        return m_id;
    }
private:
    std::string m_id;
};

class SomePointerEquatableClassImpl: public test::SomePointerEquatableClass
{
public:
    SomePointerEquatableClassImpl(const std::string& id)
        : m_id(id)
    {
    }

    std::string get_id() const override {
        return m_id;
    }
private:
    std::string m_id;
};

}

namespace test
{
bool
SomeEquatableClass::operator==( const SomeEquatableClass& other)
{
    return get_id() == other.get_id();
}

std::shared_ptr<SomePointerEquatableClass>
SomePointerEquatableClass::create(const std::string& id) {
    return std::make_shared<SomePointerEquatableClassImpl>(id);
}

std::shared_ptr<SomeEquatableClass>
SomeEquatableClass::create(const std::string& id) {
    return std::make_shared<SomeEquatableClassImpl>(id);
}

SetType::StringSet
SetType::string_set_round_trip( const SetType::StringSet& input )
{
    return input;
}

SetType::EnumSet
SetType::enum_set_round_trip( const SetType::EnumSet& input )
{
    return input;
}

std::optional< SetType::IntSet >
SetType::nullable_int_set_round_trip( const std::optional< SetType::IntSet >& input )
{
    return input;
}

std::unordered_set< test::SetType::EquatableStruct, lorem_ipsum::test::hash<test::SetType::EquatableStruct > >
SetType::struct_set_round_trip( std::unordered_set< test::SetType::EquatableStruct, lorem_ipsum::test::hash< test::SetType::EquatableStruct > > const & input )
{
    return input;
}

SetType::ClassSet
SetType::class_set_round_trip(const SetType::ClassSet& input)
{
    return input;
}

SetType::PointerEquatableSet
SetType::pointer_equatable_set_round_trip(const SetType::PointerEquatableSet& input)
{
    return input;
}
}  // namespace test

size_t
lorem_ipsum::test::hash<::test::SomeEquatableClass>::operator()(const ::test::SomeEquatableClass& t) const {
    return std::hash<std::string>()(t.get_id());
}

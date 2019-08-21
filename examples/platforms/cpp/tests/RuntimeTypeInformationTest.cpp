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

#include "test/InheritanceTestHelper.h"
#include "test/ChildClass.h"
#include <gmock/gmock.h>

namespace test
{
using namespace ::testing;

template<class T>
lorem_ipsum::test::TypeId get_type_id(const T* instance) {
    return lorem_ipsum::test::get_type_repository(instance).get_id(instance);
}
/*
 The base class does not need to register itself since it's always the fallback.
 This is done to have less overhead in the more common no inheritance use case.
*/
TEST( RuntimeTypeInformationTest, base_class_is_not_registered )
{
    const auto root = InheritanceTestHelper::create_root();
    EXPECT_EQ("", get_type_id(root.get()));
}

TEST( RuntimeTypeInformationTest, subclass_is_registered_and_unregistered )
{
    auto child = InheritanceTestHelper::create_child();
    const ChildInterface* child_ptr = child.get();

    EXPECT_NE("", get_type_id(child_ptr));

    child.reset();

    EXPECT_EQ("", get_type_id(child_ptr));
}

TEST( RuntimeTypeInformationTest, class_ids_are_same_for_same_subclasses )
{
    const auto child = InheritanceTestHelper::create_concrete_child();
    const auto another_child = InheritanceTestHelper::create_concrete_child();
    EXPECT_EQ(get_type_id(child.get()), get_type_id(another_child.get()));
}

TEST( RuntimeTypeInformationTest, class_ids_are_different_for_child_and_parent )
{
    const auto child = InheritanceTestHelper::create_concrete_child();
    const auto grandchild = InheritanceTestHelper::create_concrete_grand_child();
    EXPECT_NE(get_type_id(child.get()), get_type_id(grandchild.get()));
}

TEST( RuntimeTypeInformationTest, type_repositories_are_disjunct )
{
    std::shared_ptr<ChildInterface> child = InheritanceTestHelper::create_child();

    EXPECT_NE("", get_type_id(child.get()));
    EXPECT_EQ("", get_type_id((ChildClass*)child.get()));
}

}
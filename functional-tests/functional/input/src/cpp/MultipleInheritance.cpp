// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2021 HERE Europe B.V.
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

#include "test/ParentInterfaceOne.h"
#include "test/ParentInterfaceOne.h"
#include "test/ParentClass.h"
#include "test/ClassWithMixedParents.h"
#include "test/ClassWithInterfaceParents.h"
#include "test/ClassWithAllParents.h"
#include "test/InterfaceWithAllParents.h"
#include "test/MultipleInheritanceFactory.h"

#include <memory>

namespace
{
class ClassWithMixedParentsImpl: public test::ClassWithMixedParents
{
public:
    ClassWithMixedParentsImpl( ) = default;
    ~ClassWithMixedParentsImpl( ) = default;

    void child_function() override {}
    std::string get_child_property() const override { return {}; }
    void set_child_property(const std::string& value) override {}
    void parent_function() override {}
    std::string get_parent_property() const override { return {}; }
    void set_parent_property(const std::string& value) override {}
    void parent_function_one() override {}
    std::string get_parent_property_one() const override { return {}; }
    void set_parent_property_one(const std::string& value) override {}
};

class ClassWithInterfaceParentsImpl: public test::ClassWithInterfaceParents
{
public:
    ClassWithInterfaceParentsImpl( ) = default;
    ~ClassWithInterfaceParentsImpl( ) = default;

    void child_function() override {}
    std::string get_child_property() const override { return {}; }
    void set_child_property(const std::string& value) override {}
    void parent_function_one() override {}
    std::string get_parent_property_one() const override { return {}; }
    void set_parent_property_one(const std::string& value) override {}
    void parent_function_two() override {}
    std::string get_parent_property_two() const override { return {}; }
    void set_parent_property_two(const std::string& value) override {}
};

class ClassWithAllParentsImpl: public test::ClassWithAllParents
{
public:
    ClassWithAllParentsImpl( ) = default;
    ~ClassWithAllParentsImpl( ) = default;

    void child_function() override {}
    std::string get_child_property() const override { return {}; }
    void set_child_property(const std::string& value) override {}
    void parent_function() override {}
    std::string get_parent_property() const override { return {}; }
    void set_parent_property(const std::string& value) override {}
    void parent_function_one() override {}
    std::string get_parent_property_one() const override { return {}; }
    void set_parent_property_one(const std::string& value) override {}
    void parent_function_two() override {}
    std::string get_parent_property_two() const override { return {}; }
    void set_parent_property_two(const std::string& value) override {}
};

class InterfaceWithAllParentsImpl: public test::InterfaceWithAllParents
{
public:
    InterfaceWithAllParentsImpl( ) = default;
    ~InterfaceWithAllParentsImpl( ) = default;

    void child_function() override {}
    std::string get_child_property() const override { return {}; }
    void set_child_property(const std::string& value) override {}
    void parent_function_one() override {}
    std::string get_parent_property_one() const override { return {}; }
    void set_parent_property_one(const std::string& value) override {}
    void parent_function_two() override {}
    std::string get_parent_property_two() const override { return {}; }
    void set_parent_property_two(const std::string& value) override {}
};

}

namespace test
{
std::shared_ptr<ClassWithMixedParents>
MultipleInheritanceFactory::get_class_with_mixed_parents() {
    return std::make_shared<ClassWithMixedParentsImpl>();
}

std::shared_ptr<ClassWithInterfaceParents>
MultipleInheritanceFactory::get_class_with_interface_parents() {
    return std::make_shared<ClassWithInterfaceParentsImpl>();
}

std::shared_ptr<ClassWithAllParents>
MultipleInheritanceFactory::get_class_with_all_parents() {
    return std::make_shared<ClassWithAllParentsImpl>();
}

std::shared_ptr<InterfaceWithAllParents>
MultipleInheritanceFactory::get_interface_with_all_parents() {
    return std::make_shared<InterfaceWithAllParentsImpl>();
}

}

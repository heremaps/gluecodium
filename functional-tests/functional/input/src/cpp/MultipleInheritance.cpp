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

#include "test/NarrowInterface.h"
#include "test/MultiClass.h"
#include "test/MultiInterface.h"
#include "test/MultipleInheritanceChecker.h"
#include "test/MultipleInheritanceFactory.h"
#include "test/OpenClass.h"
#include "test/RegularInterface.h"

#include <memory>

namespace
{
class MultiClassImpl: public test::MultiClass
{
public:
    MultiClassImpl( ) = default;
    ~MultiClassImpl( ) = default;

    void child_function() override {}
    std::string get_child_property() const override { return {}; }
    void set_child_property(const std::string& value) override {}
    void parent_function() override {}
    std::string get_parent_property() const override { return {}; }
    void set_parent_property(const std::string& value) override {}
    std::string parent_function_light() override { return "foo class"; }
    std::string get_parent_property_light() const override { return {}; }
    void set_parent_property_light(const std::string& value) override {}
};

class MultiInterfaceImpl: public test::MultiInterface
{
public:
    MultiInterfaceImpl( ) = default;
    ~MultiInterfaceImpl( ) = default;

    void child_function() override {}
    std::string get_child_property() const override { return {}; }
    void set_child_property(const std::string& value) override {}
    void parent_function() override {}
    std::string get_parent_property() const override { return {}; }
    void set_parent_property(const std::string& value) override {}
    std::string parent_function_light() override { return "foo interface"; }
    std::string get_parent_property_light() const override { return {}; }
    void set_parent_property_light(const std::string& value) override {}
};

std::shared_ptr<MultiClassImpl> s_multi_class = std::make_shared<MultiClassImpl>();

}

namespace test
{
std::shared_ptr<MultiClass>
MultipleInheritanceFactory::get_multi_class() {
    return std::make_shared<MultiClassImpl>();
}

std::shared_ptr<MultiInterface>
MultipleInheritanceFactory::get_multi_interface() {
    return std::make_shared<MultiInterfaceImpl>();
}

std::shared_ptr<NarrowInterface>
MultipleInheritanceFactory::get_multi_class_as_narrow() {
    return std::make_shared<MultiClassImpl>();
}

std::shared_ptr<NarrowInterface>
MultipleInheritanceFactory::get_multi_class_singleton() {
    return s_multi_class;
}

std::shared_ptr<NarrowInterface>
MultipleInheritanceFactory::upcast_multi_interface_to_narrow(const std::shared_ptr<MultiInterface>& instance) {
    return instance;
}

bool
MultipleInheritanceChecker::check_singleton_equality(const std::shared_ptr<NarrowInterface>& instance) {
    return instance == s_multi_class;
}

bool
MultipleInheritanceChecker::check_is_narrow(const std::shared_ptr<MultiInterface>& instance) {
    return std::dynamic_pointer_cast<NarrowInterface>(instance).get() != nullptr;
}

bool
MultipleInheritanceChecker::check_is_multi_interface(const std::shared_ptr<NarrowInterface>& instance) {
    return std::dynamic_pointer_cast<MultiInterface>(instance).get() != nullptr;
}

bool
MultipleInheritanceChecker::check_narrow_equality(
    const std::shared_ptr<NarrowInterface>& instance1,
    const std::shared_ptr<NarrowInterface>& instance2
) {
    return instance1.get() == instance2.get();
}

std::shared_ptr<NarrowInterface>
MultipleInheritanceChecker::narrow_round_trip(const std::shared_ptr<NarrowInterface>& instance) {
    return instance;
}

}

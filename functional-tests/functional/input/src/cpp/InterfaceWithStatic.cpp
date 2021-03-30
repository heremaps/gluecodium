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

#include "test/InterfaceWithStatic.h"
#include "test/UseInterfaceWithStatic.h"

namespace {
class InterfaceWithStaticImpl : public test::InterfaceWithStatic {
public:
    std::string regular_function() override {
        return "foo1";
    }

    std::string get_regular_property() const override {
        return m_foo;
    }

    void set_regular_property(const std::string& value) override {
        m_foo = value;
    }

private:
    std::string m_foo = "foo2";
};

std::string s_foo = "bar2";
}

namespace test {

std::string
InterfaceWithStatic::static_function() {
    return "bar1";
}

std::string
InterfaceWithStatic::get_static_property() {
    return s_foo;
}

void
InterfaceWithStatic::set_static_property(const std::string& value) {
    s_foo = value;
}

std::shared_ptr<test::InterfaceWithStatic>
UseInterfaceWithStatic::create_interface_with_static() {
    return std::make_shared<InterfaceWithStaticImpl>();
}

std::string
UseInterfaceWithStatic::invoke_static_function(const std::shared_ptr<InterfaceWithStatic>& instance) {
    return instance->static_function();
}

std::string
UseInterfaceWithStatic::invoke_static_getter(const std::shared_ptr<InterfaceWithStatic>& instance) {
    return instance->get_static_property();
}

void
UseInterfaceWithStatic::invoke_static_setter(
    const std::shared_ptr<InterfaceWithStatic>& instance, const std::string& value) {
    return instance->set_static_property(value);
}

std::string
UseInterfaceWithStatic::invoke_static_getter() {
    return InterfaceWithStatic::get_static_property();
}

void
UseInterfaceWithStatic::invoke_static_setter(const std::string& value) {
    return InterfaceWithStatic::set_static_property(value);
}

void
UseInterfaceWithStatic::reset_static_value() {
    s_foo = "bar2";
}

}

// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2026 HERE Europe B.V.
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

#include "test/InternalClassWithNestedElements.h"

#include <cstdint>
#include <memory>

namespace test
{

////////////// Implementation of type derived from nested interface type -->  'InternalClassWithNestedElements.NestedInterface'
class SomeImplOfNestedInterface : public InternalClassWithNestedElements::NestedInterface {
public:
    SomeImplOfNestedInterface() = default;
    ~SomeImplOfNestedInterface() override = default;

    int32_t nested_interface_function() override {
        return 909;
    }

    int64_t get_nested_interface_property() const override {
        return m_prop;
    }

    void set_nested_interface_property( const int64_t value ) override {
        m_prop = value;
    }

private:
    int64_t m_prop{77};
};

////////////// Top level internal class: 'InternalClassWithNestedElements'
static int64_t g_some_static_property_of_internal_class = 11;

class SomeImplOfInternalClassWithNestedElements : public InternalClassWithNestedElements {
public:
    SomeImplOfInternalClassWithNestedElements(int32_t x, int32_t y)
     : m_x{x}, m_y{y}
    {}

    ~SomeImplOfInternalClassWithNestedElements() override = default;

    int32_t some_function() override {
        return m_x + m_y;
    }

    int64_t get_some_property() const override {
        return m_some_property;
    }

    void set_some_property(const int64_t value) override {
        m_some_property = value;
    }

private:
    int32_t m_x;
    int32_t m_y;
    int64_t m_some_property{2202};
};

std::string
InternalClassWithNestedElements::some_static_function() {
    return "SOME_STATIC_FUNCTION";
}

::std::error_code
InternalClassWithNestedElements::throw_nested_exception() {
    return make_error_code(InternalClassWithNestedElements::NestedEnum::OPTION_1);
}

InternalClassWithNestedElements::NestedLambda
InternalClassWithNestedElements::produce_nested_lambda() {
    return [] (const std::string& p1, const int64_t p2) {
        return "CONTENT_FROM_NESTED_LAMBDA_FROM_CPP: '" + p1 + std::to_string(p2) + "'";
    };
}

std::shared_ptr<InternalClassWithNestedElements::NestedInterface>
InternalClassWithNestedElements::produce_nested_interface_implementation() {
    return std::make_shared<SomeImplOfNestedInterface>();
}

int64_t
InternalClassWithNestedElements::get_some_static_property() {
    return g_some_static_property_of_internal_class;
}

void
InternalClassWithNestedElements::set_some_static_property(const int64_t value) {
    g_some_static_property_of_internal_class = value;
}

std::shared_ptr<InternalClassWithNestedElements>
InternalClassWithNestedElements::some_constructor(int32_t x, int32_t y) {
    return std::make_shared<SomeImplOfInternalClassWithNestedElements>(x, y);
}

////////////// A class nested in internal class: 'InternalClassWithNestedElements.NestedClassLevelOne'
static int64_t g_some_static_property_of_nested_level_1_class = 77;

class SomeImplOfNestedClassLevelOne : public InternalClassWithNestedElements::NestedClassLevelOne {
public:
    SomeImplOfNestedClassLevelOne(int32_t x, int32_t y)
     : m_x{x}, m_y{y}
    {}

    ~SomeImplOfNestedClassLevelOne() override = default;

    int32_t some_nested_function() override {
        return m_x * m_y;
    }

    int64_t get_some_nested_property() const override {
        return m_some_nested_property;
    }

    void set_some_nested_property(const int64_t value) override {
        m_some_nested_property = value;
    }

private:
    int32_t m_x;
    int32_t m_y;
    int64_t m_some_nested_property{333};
};

std::string
InternalClassWithNestedElements::NestedClassLevelOne::some_nested_static_function() {
    return "LEVEL_1_NESTING";
}

int64_t
InternalClassWithNestedElements::NestedClassLevelOne::get_some_nested_static_property() {
    return g_some_static_property_of_nested_level_1_class;
}

void
InternalClassWithNestedElements::NestedClassLevelOne::set_some_nested_static_property(const int64_t value) {
    g_some_static_property_of_nested_level_1_class = value;
}

std::shared_ptr<InternalClassWithNestedElements::NestedClassLevelOne>
InternalClassWithNestedElements::NestedClassLevelOne::some_nested_constructor(int32_t x, int32_t y) {
    return std::make_shared<SomeImplOfNestedClassLevelOne>(x, y);
}

////////////// A class nested in internal class: 'InternalClassWithNestedElements.NestedClassLevelOne.NestedClassLevelTwo'
static int64_t g_some_static_property_of_nested_level_2_class = 123;

class SomeImplOfNestedClassLevelTwo : public InternalClassWithNestedElements::NestedClassLevelOne::NestedClassLevelTwo {
public:
    SomeImplOfNestedClassLevelTwo(int32_t x, int32_t y)
     : m_x{x}, m_y{y}
    {}

    ~SomeImplOfNestedClassLevelTwo() override = default;

    int32_t double_nested_function() override {
        return m_x * m_y;
    }

    int64_t get_double_nested_property() const override {
        return m_double_nested_property;
    }

    void set_double_nested_property(const int64_t value) override {
        m_double_nested_property = value;
    }

private:
    int32_t m_x;
    int32_t m_y;
    int64_t m_double_nested_property{17};
};

std::string
InternalClassWithNestedElements::NestedClassLevelOne::NestedClassLevelTwo::double_nested_static_function() {
    return "LEVEL_2_NESTING";
}

int64_t
InternalClassWithNestedElements::NestedClassLevelOne::NestedClassLevelTwo::get_double_nested_static_property() {
    return g_some_static_property_of_nested_level_2_class;
}

void
InternalClassWithNestedElements::NestedClassLevelOne::NestedClassLevelTwo::set_double_nested_static_property(const int64_t value) {
    g_some_static_property_of_nested_level_2_class = value;
}

std::shared_ptr<InternalClassWithNestedElements::NestedClassLevelOne::NestedClassLevelTwo>
InternalClassWithNestedElements::NestedClassLevelOne::NestedClassLevelTwo::double_nested_constructor(int32_t x, int32_t y) {
    return std::make_shared<SomeImplOfNestedClassLevelTwo>(x, y);
}

////////////// A struct nested in internal class: 'InternalClassWithNestedElements.NestedStruct'
InternalClassWithNestedElements::NestedStruct
InternalClassWithNestedElements::NestedStruct::constructor_of_struct(int32_t x, int32_t y) {
    return InternalClassWithNestedElements::NestedStruct{x, std::to_string(y)};
}

int32_t
InternalClassWithNestedElements::NestedStruct::nested_struct_function() const {
    return 2 * first_field;
}

std::string
InternalClassWithNestedElements::NestedStruct::nested_struct_static_function() {
    return "NESTED_STRUCT_STATIC_FUN";
}

////////////// A struct nested in internal class: 'InternalClassWithNestedElements.NestedInterface'
static int64_t g_nested_interface_static_property = 572;

std::string
InternalClassWithNestedElements::NestedInterface::nested_interface_static_function() {
    return "NESTED_ITF_STATIC_FUN";
}

int64_t
InternalClassWithNestedElements::NestedInterface::get_nested_interface_static_property() {
    return g_nested_interface_static_property;
}

void
InternalClassWithNestedElements::NestedInterface::set_nested_interface_static_property(const int64_t value) {
    g_nested_interface_static_property = value;
}

} // namespace test
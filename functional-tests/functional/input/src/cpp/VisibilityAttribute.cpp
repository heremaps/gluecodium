// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2022 HERE Europe B.V.
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

#include "test/InternalAttributeClassWithFunctions.h"
#include "test/InternalAttributeClassWithStaticProperty.h"
#include "test/InternalAttributeInterfaceParent.h"
#include "test/SomeClassWithInternalMembers.h"
#include "test/SomeDerivedInternalClass.h"
#include "test/SomeInternalClassWithMembers.h"
#include "test/SomeInternalEnum.h"
#include "test/SomeInternalInterface.h"
#include "test/SomeInternalStructWithMembers.h"
#include "test/SomeStructWithInternalMembers.h"

namespace test
{

class SomeClassWithInternalMembersImpl : public SomeClassWithInternalMembers {
public:
    SomeClassWithInternalMembersImpl() = default;
    ~SomeClassWithInternalMembersImpl() override = default;

    int some_internal_function() override {
        return 567;
    }

    ::std::string get_some_internal_property() const override {
      return m_internalProperty;
    }

    void set_some_internal_property(const ::std::string& value) override {
      m_internalProperty = value;
    }

private:
    std::string m_internalProperty{"DEFAULT"};
};

std::shared_ptr<SomeClassWithInternalMembers> SomeClassWithInternalMembers::create() {
    return std::make_shared<SomeClassWithInternalMembersImpl>();
}

std::shared_ptr<SomeClassWithInternalMembers> SomeClassWithInternalMembers::some_internal_ctor() {
    return SomeClassWithInternalMembers::create();
}

int SomeClassWithInternalMembers::some_static_internal_function() {
    return 123;
}

::std::error_code SomeClassWithInternalMembers::some_static_internal_function_that_may_throw(const bool should_throw) {
    if (should_throw) {
        return SomeInternalEnum::ONE;
    } else {
        return {};
    }
}

class CppInternalInterfaceImpl : public SomeInternalInterface {
public:
    CppInternalInterfaceImpl() = default;
    ~CppInternalInterfaceImpl() override = default;

    int32_t foo() override {
        return 333;
    }

    int64_t bar() override {
        return 777;
    }
};

class SomeInternalClassWithMembersImpl : public SomeInternalClassWithMembers {
public:
    SomeInternalClassWithMembersImpl() = default;
    ~SomeInternalClassWithMembersImpl() override = default;

    int some_function() override {
        return 987;
    }
};

std::shared_ptr<SomeInternalClassWithMembers> SomeInternalClassWithMembers::create() {
    return std::make_shared<SomeInternalClassWithMembersImpl>();
}

int SomeInternalClassWithMembers::some_static_function() {
    return 765;
}

class SomeNestedInternalClassImpl : public ::test::SomeInternalClassWithMembers::SomeNestedInternalClass {
public:
    SomeNestedInternalClassImpl() = default;
    ~SomeNestedInternalClassImpl() override = default;

    int32_t do_something() override {
        return 1;
    }

    int32_t do_something_else() override {
        return 2;
    }
};

::std::shared_ptr< ::test::SomeInternalClassWithMembers::SomeNestedInternalClass > SomeInternalClassWithMembers::SomeNestedInternalClass::create() {
    return std::make_shared<SomeNestedInternalClassImpl>();
}

int32_t SomeInternalStructWithMembers::some_function() const {
    return 32;
}

::test::SomeInternalStructWithMembers SomeInternalStructWithMembers::create() {
    return SomeInternalStructWithMembers{123, 456};
}

int32_t SomeStructWithInternalMembers::some_internal_function() const {
    return 888;
}

int32_t SomeStructWithInternalMembers::some_internal_function_but_only_for_android() const {
    return 999;
}

int32_t SomeStructWithInternalMembers::some_static_internal_function() {
    return 777;
}

::test::SomeStructWithInternalMembers SomeStructWithInternalMembers::some_internal_ctor(const int32_t x) {
    return SomeStructWithInternalMembers{x, 444, "ABCDEF"};
}

int32_t SomeStructWithInternalMembers::call_some_lambda(const ::test::SomeInternalLambda& some_lambda) const {
    return some_lambda();
}

int32_t SomeStructWithInternalMembers::call_method_of_some_interface( const ::std::shared_ptr< ::test::SomeInternalInterface >& some_interface ) const {
    return some_interface->foo();
}

::std::shared_ptr<::test::SomeInternalInterface> SomeStructWithInternalMembers::get_some_cpp_impl_of_internal_interface() const {
    return std::make_shared<CppInternalInterfaceImpl>();
}

::test::SomeInternalLambda SomeStructWithInternalMembers::get_some_cpp_lambda() const {
    return [] { return 909; };
}

class SomeImplOfDerivedInternalClass : public SomeDerivedInternalClass {
public:
    SomeImplOfDerivedInternalClass() = default;
    ~SomeImplOfDerivedInternalClass() override = default;

    int32_t some_function_from_derived_class() override {
        return 111;
    }

    int32_t foo() override {
        return 222;
    }

    int64_t bar() override {
        return 333;
    }

    int32_t some_internal_function() override {
        return 444;
    }
};

std::shared_ptr<SomeDerivedInternalClass> SomeDerivedInternalClass::create() {
    return std::make_shared<SomeImplOfDerivedInternalClass>();
}

std::shared_ptr<InternalAttributeClassWithFunctions>
InternalAttributeClassWithFunctions::make() {
    return {};
}

std::shared_ptr<InternalAttributeClassWithFunctions>
InternalAttributeClassWithFunctions::make(const std::string& foo) {
    return {};
}

std::string
InternalAttributeClassWithStaticProperty::get_foo_bar() {
    return "foo";
}

void
InternalAttributeClassWithStaticProperty::set_foo_bar(const std::string& value) {
}

}

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
#include "test/SomeClassWithInternalMembers.h"
#include "test/SomeInternalClassWithMembers.h"

namespace test
{

class SomeClassWithInternalMembersImpl : public SomeClassWithInternalMembers {
public:
    SomeClassWithInternalMembersImpl() = default;
    ~SomeClassWithInternalMembersImpl() override = default;

    int some_internal_function() override {
        return 567;
    }
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

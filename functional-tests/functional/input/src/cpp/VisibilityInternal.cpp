// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2020 HERE Europe B.V.
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

#include "test/DartInternalClassWithInternalTypedef.h"
#include "test/DartInternalElements.h"
#include "test/DartInternalElementsRev.h"
#include "test/DartPublicElements.h"
#include "test/InternalClassWithFunctions.h"
#include "test/InternalClassWithStaticProperty.h"

namespace test
{

class SomeImplOfDartInternalClassWithInternalTypedef : public DartInternalClassWithInternalTypedef {
public:
    SomeImplOfDartInternalClassWithInternalTypedef() = default;
    ~SomeImplOfDartInternalClassWithInternalTypedef() override = default;

public:
    ::test::DartInternalClassWithInternalTypedef::SomeStringToIntMap get_numbers() const override {
        return m_numbers;
    }

    void set_numbers(const ::test::DartInternalClassWithInternalTypedef::SomeStringToIntMap& value) override {
        m_numbers = value;
    }

    ::test::DartInternalClassWithInternalTypedef::SomeStringArray get_labels() const override {
        return m_labels;
    }

    void set_labels(const ::test::DartInternalClassWithInternalTypedef::SomeStringArray& value) override {
        m_labels = value;
    }

private:
    ::test::DartInternalClassWithInternalTypedef::SomeStringToIntMap m_numbers{};
    ::test::DartInternalClassWithInternalTypedef::SomeStringArray m_labels{};
};

std::shared_ptr<InternalClassWithFunctions>
InternalClassWithFunctions::make() {
    return {};
}

std::shared_ptr<InternalClassWithFunctions>
InternalClassWithFunctions::make(const std::string& foo) {
    return {};
}

std::string
InternalClassWithStaticProperty::get_foo_bar() {
    return "foo";
}

void
InternalClassWithStaticProperty::set_foo_bar(const std::string& value) {
}

void DartPublicElements::foo() {}
void DartInternalElements::foo() {}
void DartInternalElementsRev::foo() {}

}

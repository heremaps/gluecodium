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

#include "test/DummyClass.h"
#include "test/DummyFactory.h"
#include "test/DummyInterface.h"

namespace test
{
namespace {
class DummyClassImpl : public DummyClass {
public:
    ~DummyClassImpl() = default;
};

class DummyInterfaceImpl : public DummyInterface {
public:
    ~DummyInterfaceImpl() = default;
};

std::shared_ptr<DummyClass> s_dummy_class = std::make_shared<DummyClassImpl>();
std::shared_ptr<DummyInterface> s_dummy_interface = std::make_shared<DummyInterfaceImpl>();
}

std::shared_ptr<DummyClass>
DummyClass::create() {
    return std::make_shared<DummyClassImpl>();
}

std::shared_ptr<DummyClass>
DummyClass::dummy_class_round_trip(const std::shared_ptr<DummyClass>& input) {
    return input;
}

std::vector<std::shared_ptr<DummyClass>>
DummyClass::dummy_class_list_round_trip(const std::vector<std::shared_ptr<DummyClass>>& input) {
    return input;
}

std::shared_ptr<DummyClass>
DummyFactory::get_dummy_class_singleton() {
    return s_dummy_class;
}

std::shared_ptr<DummyClass>
DummyFactory::create_dummy_class() {
    return std::make_shared<DummyClassImpl>();
}

std::shared_ptr<DummyInterface>
DummyFactory::get_dummy_interface_singleton() {
    return s_dummy_interface;
}

std::shared_ptr<DummyInterface>
DummyFactory::create_dummy_interface() {
    return std::make_shared<DummyInterfaceImpl>();
}

}
